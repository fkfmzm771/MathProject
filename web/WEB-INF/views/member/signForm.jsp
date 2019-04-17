<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원가입</title>
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
    <style>

    </style>

    <script>
        function cancle() {
            document.joinform.reset();
        }
    </script>

    <script>
    function idCheck(){
    window.open("idCheck", "newwin", "top=200, left=300, height=400, width=400")
    }
    </script>
</head>
<body>

<div class="limiter">
    <div class="container-login100" style= "background-image:url('../../../resources/images/bg/bg_05.jpg');">
        <div class="wrap-login100 p-t-80 p-b-30">
            <form class="login100-form validate-form" name="joinform" action="joinform" method="POST">

                <span class="login100-form-title p-t-20 p-b-45">
						<i class="fas fa-horse-head" id="horse"></i>회원 가입
                </span>

                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-secondary active" style="width: 70px;">
                            <input type="radio" name="usertype" value="student" id="student" autocomplete="off" checked> 학생
                        </label>
                        <label class="btn btn-secondary" style="width: 90px;">
                            <input type="radio" name="usertype" value="parents" id="parents" autocomplete="off"> 학부모
                        </label>
                        <label class="btn btn-secondary" style="width: 90px;">
                            <input type="radio" name="usertype" value="teacher" id="teacher" autocomplete="off"> 선생님
                        </label>
                    </div>


                <div class="wrap-input100 validate-input m-b-10" data-validate = "Username is required" style="width: 290px; margin-top: 20px">
                    <input class="input100" id="id" value="" type="text" name="username" placeholder="우측버튼을 이용해주세요"  readonly="readonly" style="float: left">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="button" class="btn btn-primary" value="ID중복확인" onclick="idCheck();" style="float: right; width:100px; height: 50px; margin-top: 20px " >

                <div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
                <input class="input100" type="password" name="pass" placeholder="비밀번호">
                <span class="focus-input100"></span>
                <span class="symbol-input100">
                        <i class="fa fa-lock"></i>
                </span>
                </div>

                <div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
                    <input class="input100" type="password" name="passCheck" placeholder="비밀번호 확인">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fa fa-lock"></i>
                    </span>
                </div>

                <div class="wrap-input100 validate-input m-b-10" data-validate = "name is required">
                    <input class="input100" type="text" name="name" placeholder="이름">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fas fa-file-signature"></i>
                    </span>
                </div>

                <div class="wrap-input100 validate-input m-b-10" data-validate = "e-mail is required">
                    <input class="input100" type="email" name="email" placeholder="이메일">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                        <i class="fas fa-envelope"></i>
                    </span>
                </div>

                <div class="container-login100-form-btn p-t-10">
                    <button class="login100-form-btn">
                        회원가입
                    </button>
                </div>

                 <div class="container-login100-form-btn2 p-t-10">
                     <a href="javascript:cancle();" class="login100-form-btn2">취소</a>
                 </div>

                <div class="container-login100-form-btn p-t-10">
                    <a href="/" class="login100-form-btn">되돌아가기</a>
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

</body>
</html>