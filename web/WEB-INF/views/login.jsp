<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<title>NaverLogin</title>

<style>
p#message {
	color :red;
}
</style>

<script>
function login(){
	var userid = document.getElementById("userid");
	var userpw = document.getElementById("userpw");
	
	if(userid.value.trim().length == 0){
		alert("아이디를 입력하세요");
		userid.focus();
		
		return;
	}
	
	if(userpw.value.trim().length == 0){
		alert("아이디를 입력하세요");
		userpw.select();
		
		return;
	}
	var form = document.getElementById("login");
	form.submit();
}
</script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>

<c:if test="${sessionScope.loginId == null }">
	<h2>[ 로그인 ]</h2>
	
	<p id="message">${message }</p>
	<form id="login" action="login" method="POST">
	<table>
	<tr>
		<td>ID</td>
		<td><input type="text" id="userid" name="userid" placeholder="3~10 자리 ID 입력" />
		</td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" id="userpw" name="userpw" placeholder="3~10자리 비밀번호 입력"></td>
		<td>
			<a href="javascript:login()">Login</a>
			<a href="joinForm">회원가입</a>
		</td>
	</table>
	</form>
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin"></div>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->


	<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "Jlvd_25T11OhtTa_xAOP",
				callbackUrl: "http://localhost:8085/callback",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		naverLogin.getLoginStatus(function (status) {
	        if (status) {
	            var name = naverLogin.user.getName();
	            var email = naverLogin.user.getEmail();
	            var nickname = naverLogin.user.getNickName();
	            var profileImage = naverLogin.user.getProfileImage();
	            var birthday = naverLogin.user.getBirthday();			
	            var uniqId = naverLogin.user.getId();
	            var age = naverLogin.user.getAge();
	        } else {
	            console.log("AccessToken이 올바르지 않습니다.");
	        }
	    });
		
	</script>
	<!-- // 네이버아이디로로그인 초기화 Script -->
	<div>
	
	</div>
</c:if>

<c:if test="${sessionScope.loginId != null}">
	로그아웃 하시겠습니까?
	<a href ="logout">로그아웃</a>
	<a href = "index">되돌아가기</a>
</c:if>

</body>
</html>