<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복확인</title>
<script>
function validate(){
	var userid=document.getElementById("userid");
	if(userid.value.trim().length == 0){
		alert("아이디를 입력하세요");
		userid.focus();
		return false;
	} else if(!(userid.value.trim().length >= 3 && userid.value.trim().length <= 10)){
		alert("공백을 제외한 아이디 길이는 3~10자리여야 합니다")
		userid.focus();
		return false;
	}
	return true;
}

function selectId(userid){
	opener.document.getElementById("id").value = userid;
	this.close();
}
</script>
</head>
<body>
<h2>[ ID 중복 확인 ]</h2>

<!-- 검색 폼 -->
<form action="idCheck" method="POST" >
	<input type="text" name="userid" id="userid" value="" placeholder="검색할 ID 입력">
	<input type="submit" value="검색" onclick="return validate();">
</form>
<br />

<c:if test="${result eq 'success'}">
 	${userid } 는 이미 사용중인 ID입니다.<br>
</c:if>

<c:if test="${result eq 'fail'}">
 	${userid } 는 사용할 수 있는 ID입니다.<br>
 	<input type="submit" value="ID 사용하기" onclick="selectId('${userid}');"/>
</c:if>

</body> 
</html>