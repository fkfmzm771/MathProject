<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>プルンプルンすいがく</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
          content="341184560724-2888vrea7csuq3s4c79tedsre9cpm7kj.apps.googleusercontent.com">


    <link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <%--구글 일본어 폰트--%>
    <link href="https://fonts.googleapis.com/css?family=Kosugi+Maru" rel="stylesheet">
    <%--글자 애니메이션--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/popper.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/vendor/select2/select2.min.js"></script>
    <script src="/resources/js/main.js"></script>

    <%--<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>--%>

    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            $.ajax({
                url: "googleLogin"
                , type: "POST"
                , data: {
                    id: profile.getId()
                    , name: profile.getName()
                    , email: profile.getEmail()
                }
                , success: function () {
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut().then(function () {
                        console.log('User signed out.');
                    });
                    auth2.disconnect();
                    location.href = "/testPage/sidebar";
                }
            })
        }

        function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
            });
            auth2.disconnect();
        }
    </script>
    <%--<style>
        *{
            border: 1px solid #000000;
        }
    </style>--%>

    <style>
        .nekoImage {
            text-align: center;
        }


    </style>

</head>
<body>
<div class="limiter">

    <div class="container-login100" style="background-color: rgb(255,205,126);">
        <div class="wrap-login100 p-t-100 p-b-50">
            <div class="animated infinite bounce delay-2s">
                <h1 class="login100-form-title p-t-20 p-b-45" style="font: bold">プルンプルン<br>すうがく</h1>
            </div>
            <img class="nekoImage" src="/resources/images/homeUI/neko.png" width="200px">
            <form class="login100-form validate-form" action="login" method="POST">


                <div class="wrap-input100 validate-input m-b-10" data-validate="Username is required">
                    <input class="input100" type="text" name="username" id="username" placeholder="ID">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-user"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input m-b-10" data-validate="Password is required">
                    <input class="input100" type="password" name="pass" id="pass" placeholder="PASSWORD">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
                </div>

                <div class="container-login100-form-btn p-t-10">
                    <button class="login100-form-btn" style="font-family: 'Kosugi Maru', sans-serif">ログイン</button>
                </div>

                <div class="container-login100-form-btn2 p-t-10">
                    <a href="joinform" class="login100-form-btn2"
                       style="font-family: 'Kosugi Maru', sans-serif">会員登録</a>
                </div>


                <%--<div class="container-login100-form-btn2 p-t-10" style="padding-top: 30px;">--%>
                    <%--<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"--%>
                         <%--style="width: 350px; height: 50px; font-family: 'Roboto', sans-serif;"></div>--%>
                <%--</div>--%>
                <%--<div class="container-login100-form-btn2 p-t-10" style="padding-top: 20px;">--%>
                    <%--<a href="#" onclick="signOut();">Sign out</a>--%>
                <%--</div>--%>
            </form>
        </div>
    </div>
</div>

</body>
</html>
