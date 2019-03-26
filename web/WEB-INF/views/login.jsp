<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="341184560724-2888vrea7csuq3s4c79tedsre9cpm7kj.apps.googleusercontent.com">
<title>NaverLogin</title>

<style>
    p#message {
	    color :red;
    }
</style>

<script src="https://apis.google.com/js/platform.js" async defer></script>

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
		alert("비밀번호를 입력하세요");
		userpw.select();
		
		return;
	}
	var form = document.getElementById("login");
	form.submit();
}
</script>


<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<link rel="stylesheet" href="resources/css/style.css"  type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Germania+One" rel="stylesheet">
<link href="https://github.com/miniMAC/magic.git">
<style>
    .login-box h1{
        font-size: 45px;
        font-family: 'Germania One', cursive;
        background-color: #0f0f0f;
        align-content: center;
     }
    .login-box h1:hover{
    transform:
                scale(1.5);
        transition: all 1s;
    }
</style>

<script>
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

        location.href="googleLogin";
    };
</script>

<script>
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
        });
    }
</script>

<script>
    function disconnect() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.disconnect().then(function () {
            console.log('User disconnected.');
        });
    }
</script>
</head>


<body>
<c:if test="${sessionScope.loginId == null }">

    <div class="login-box">

        <p id="message">${message }</p>

        <form id="login" action="login" method="POST">
            <h1><i class="fas fa-dragon"></i>수학 게임</h1>
            <h2> 로그인</h2>

            <div class="textbox">
            <i class="fas fa-user"></i>
            <input type="text" id="userid" name="userid" placeholder="Username" name="">
            </div>

            <div class="textbox">
            <i class="fas fa-lock"></i>
            <input type="password" id="userpw" name="userpw" placeholder="Password" name="">
            </div>

            <input type="button" class="btn" onclick="login();" value="로그인">
            <a href="joinForm"><input type="button" class="btn" value="회원가입"></a>
    </form>

    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
    <div id="naverIdLogin"></div>
    <!-- //네이버아이디로로그인 버튼 노출 영역 -->

    <!-- 네이버아디디로로그인 초기화 Script -->
    <script type="text/javascript">
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "Jlvd_25T11OhtTa_xAOP",
            callbackUrl: "http://localhost:8085/callback",
            isPopup: false, /* 팝업을 통한 연동처리 여부 */
            loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
        });

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

    <%--<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">dfd</div>--%>
    <a href="#" onclick="signOut();">Sign out</a>
    <a href="#" onclick="disconnect();">Disconnect</a>
    <%--</div>--%>
</c:if>

<c:if test="${sessionScope.loginId != null}">
    로그아웃 하시겠습니까?
    <a href ="logout">로그아웃</a>
    <a href = "index">되돌아가기</a>
</c:if>

</body>
</html>