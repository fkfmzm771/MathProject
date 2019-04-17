<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>닉네임입력</title>
	<script>
		function validate(){
			var usernickname=document.getElementById("usernickname");
			if(usernickname.value.trim().length == 0){
				alert("닉네임 입력하세요");
				usernickname.focus();
				return false;
			} else if(!(usernickname.value.trim().length >= 3 && usernickname.value.trim().length <= 10)){
				alert("공백을 제외한 아이디 길이는 3~10자리여야 합니다")
				usernickname.focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<h2>[ ID 중복 확인 ]</h2>

<!-- 검색 폼 -->
<form action="nicknameCheck" method="POST" >
	<input type="text" name="usernickname" id="usernickname" value="" placeholder="검색할 ID 입력">
	<input type="submit" value="검색" onclick="return validate();">
</form>
<br />

<c:if test="${result eq 'success'}">
	${usernickname } 는 이미 사용중인 닉네임입니다.<br>
</c:if>

<c:if test="${result eq 'fail'}">
	${usernickname } 는 사용할 수 있는 닉네임입니다.<br>

	<a href="start"><input type="submit" value="닉네임 사용하기" onclick="selectId('${usernickname}');"/></a>
</c:if>

</body>
</html>