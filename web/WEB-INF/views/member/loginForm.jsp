<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>로그인</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../../../resources/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/main.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="341184560724-2888vrea7csuq3s4c79tedsre9cpm7kj.apps.googleusercontent.com">

    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
        }

        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
            });
            auth2.disconnect();
        }
    </script>

</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('../../../resources/images/bg/bg_04.jpg');">
        <div class="wrap-login100 p-t-100 p-b-50">
            <i class="fas fa-dragon" id="drangon"  ></i>
            <form class="login100-form validate-form" action="login" method="POST">
                <%--  <div class="login100-form-avatar">--%>
                    <%--<img src="../../resources/images/" alt="AVATAR">--%>

                <%--</div>--%>

                <h1 class="login100-form-title p-t-20 p-b-45">
                     유치원 수학 게임
                </h1>

                <div class="wrap-input100 validate-input m-b-10" data-validate = "Username is required">
                    <input class="input100" type="text" name="username" id="username" placeholder="아이디">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-user"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
                    <input class="input100" type="password" name="pass" id="pass" placeholder="비밀번호">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
                </div>

                <div class="container-login100-form-btn p-t-10">
                    <button class="login100-form-btn">
                        Login
                    </button>
                </div>
                <div class="rounded" >
                    <a href="#" class="rounded-btn" id="rounded-btn-google"></a>
                    <a href="#" class="rounded-btn" id="rounded-btn-naver"></a>

                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                    <a href="#" onclick="signOut();">Sign out</a>

                    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
                    <div id="naverIdLogin"></div>
                    <!-- //네이버아이디로로그인 버튼 노출 영역 -->
                </div>

                <div class="container-login100-form-btn2 p-t-10">
                    <a href="joinform" class="login100-form-btn2">회원가입</a>
                </div>
            </form>

        </div>
    </div>
</div>




<!--===============================================================================================-->
<script src="../../../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="../../../resources/vendor/bootstrap/js/popper.js"></script>
<script src="../../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="../../../resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="../../../resources/js/main.js"></script>

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

</body>
</html>
