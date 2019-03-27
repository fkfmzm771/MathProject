<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Transparent Login Form</title>

    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Germania+One" rel="stylesheet">
    <link href="https://github.com/miniMAC/magic.git">
    <style>
        .login-box h1 {
            font-size: 45px;
            font-family: 'Germania One', cursive;
            background-color: #0f0f0f;
            align-content: center;

        }

        .login-box h1:hover {
            transform: scale(1.5);
            transition: all 1s;
        }
    </style>

</head>
<body>
<form action="" method="">
    <div class="login-box">
        <h1><i class="fas fa-dragon"></i>수학 게임</h1>
        <h2> 로그인</h2>
        <div class="textbox">
            <i class="fas fa-user"></i>
            <input type="text" placeholder="Username" name="">
        </div>
        <div class="textbox">
            <i class="fas fa-lock"></i>
            <input type="password" placeholder="Password" name="">
        </div>
        <input class="btn" type="button" name="" value="로그인">
        <input class="btn" type="button" name="" value="회원가입">
    </div>
</form>
</body>
</html>
