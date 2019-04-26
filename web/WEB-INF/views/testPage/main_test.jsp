<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>


<head>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes"/>

    <!-- Page Title -->
    <title>New Template — Slides 4.0.5 Template Generator</title>

    <!-- Compressed Styles -->
    <link href="/resources/templet/css/slides.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery 3.4.0 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <!-- Compressed Scripts -->
    <script src="/resources/templet/js/slides.min.js" type="text/javascript"></script>

    <!-- Fonts and Material Icons -->
    <link rel="stylesheet" as="font"
          href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,600,700|Material+Icons"/>


    <!--googlechart-->
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://www.google.com/jsapi"></script>

    <!--chart.js-->
    <script src="/resources/js/chart3.js"></script>

    <%--구글 일본어 폰트--%>
    <link href="https://fonts.googleapis.com/css?family=Kosugi+Maru" rel="stylesheet">

    <!--icon-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">



    <style>
        .chart-table tr {
            color: #090104;
            border-color: #0f0f0f;
            border: 1px;

            /* background-color: #00d131;*/
            margin: 10px;
        }
       /* *{
                border: 1px solid #000000;
            }
*/


        .dropdownMenu {

            display: inline-block;
            margin-top: 20px;
            padding: 0;
            height: 50px;
            width: 100%;
        }

        .dropbtn {
            background-color: #97cbd3;
            margin: 0;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }



        #dropdownMenu-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        #dropdownMenu-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdownMenu-content a:hover {background-color: #f1a7d6
        }

        .dropdownMenu:hover #dropdownMenu-content {
            display: block;
        }

        .dropdownMenu:hover .dropbtn {
            background-color: #8e795a;
        }
        .bigTable{
            height: 780px;
            width: 1425px;
            padding: 5px;

        }
        /*.smallTable{
            border: 1px solid #000000;
        }*/
        #smallTable1 {
            height: 440px;
            width: 500px;
            font-size: 20px;
        }

        #smallTable2  {
            height: 440px;
            width: 900px;
            font-size: 20px;
        }
        #smallTable3{
            height: 330px;
            width: 500px;
            font-size: 20px;
        }
        #smallTable4{
            height: 330px;
            width: 900px;
            font-size: 20px;
        }
    </style>

    <script>
        $(document).ready(function(){


            $("#dropdownMenu-content2").hide();
            $("#dropdownMenu-content3").hide();
            $("#dropdownMenu-content4").hide();
            document.getElementById("edu_menu").src =  "/number";

            $("#numberStd").click(function(){
                $("#dropdownMenu-content1").show(500);
                $("#dropdownMenu-content2").hide();
                $("#dropdownMenu-content3").hide();
                $("#dropdownMenu-content4").hide();
                document.getElementById("edu_menu").src =  "/number";

            });
            $("#pluminStd").click(function(){
                $("#dropdownMenu-content2").show(500);
                $("#dropdownMenu-content1").hide();
                $("#dropdownMenu-content3").hide();
                $("#dropdownMenu-content4").hide();
                document.getElementById("edu_menu").src =  "/calculation";
            });
            $("#figureStd").click(function(){
                $("#dropdownMenu-content3").show(500);
                $("#dropdownMenu-content1").hide();
                $("#dropdownMenu-content2").hide();
                $("#dropdownMenu-content4").hide();
                document.getElementById("edu_menu").src =  "/shape";
            });
            $("#lifeStd").click(function(){
                $("#dropdownMenu-content4").show(500);
                $("#dropdownMenu-content1").hide();
                $("#dropdownMenu-content2").hide();
                $("#dropdownMenu-content3").hide();
                document.getElementById("edu_menu").src =  "/clock";
            });

            $("#number").click(function(){
                document.getElementById("edu_menu").src =  "/number";

            });
            $("#calculation").click(function(){
                document.getElementById("edu_menu").src =  "/calculation";
            });
            $("#calculation2").click(function(){
                document.getElementById("edu_menu").src =  "/calculation2";
            });
            $("#shape").click(function(){
                document.getElementById("edu_menu").src =  "/shape";
            });
            $("#clock").click(function(){
                document.getElementById("edu_menu").src =  "/clock";
            });
            $("#money").click(function(){
                document.getElementById("edu_menu").src =  "/money";
            });
        });


    </script>





</head>

<body class="slides horizontal simplifiedMobile animated">


<!-- Panel Top #051111 -->
<nav class="panel top" style="background-color:#88fff969;">
    <div class="sections desktop">

        <div class="center" style="height: 70px;">
            <ul class="menu"
                style="color: black; font-family: 'Kosugi Maru'; font: bold; font-size: 35px;  margin-top: 15px;">
                <li><a href="#section1"><img src="/resources/images/homeUI/nav_menu1.png"></a></li>
                <li><a href="#section2"><img src="/resources/images/homeUI/nav_menu2.png"></a></li>
                <li><a href="#section3"><img src="/resources/images/homeUI/nav_menu3.png"></a></li>
                <li><a href="#section4"><img src="/resources/images/homeUI/nav_menu4.png"></a></li>
                <li><a href="#section5"><img src="/resources/images/homeUI/nav_menu5.png"></a></li>
            </ul>
        </div>
    </div>


    <div class="sections compact hidden">
        <div class="left"><a href="#" title="Slides Framework">
            <svg style="width:82px;height:24px">
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#logo"></use>
            </svg>
        </a></div>

        <div class="right">
            <span class="button actionButton sidebarTrigger" data-sidebar-id="mobile_side">

            </span>
        </div>
    </div>


</nav>

<!-- HomePage Sidebar -->


<!-- Mobile Sidebar -->
<nav class="sidebar" data-sidebar-id="mobile_side">
    <div class="close">
        <svg>
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#close"></use>
        </svg>
    </div>
    <div class="content">
        <a href="#" class="logo">
            <svg width="37" height="30">
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#logo-icon"></use>
            </svg>
        </a>
        <ul class="mainMenu margin-top-3">
            <li><a href="#section1">ホーム</a></li>
            <li><a href="#section2">マニュアル</a></li>
            <li><a href="#section3">ゲーム</a></li>
            <li><a href="#section4">かくしゅう⁺しんど</a></li>
            <li><a href="#section5">作った人</a></li>
        </ul>

    </div>
</nav>

<!-- Slide 1 (#34) -->
<section id="section1" class="slide fade-6 kenBurns">
    <div class="content">
        <div class="container">
            <div class="wrap" style="color: #0f0f0f">
                <h1 class="ae-2 fromLeft" style=" font-family: 'Kosugi Maru'; font: bold; font-size: 35px;">
                    ようこそ！! プルンプルン　すうがくへ
                </h1>
                <br>
                <br>

                <div class="fix-12-12">
                    <ul class="flex verticalCenter">
                        <li class="col-5-12 cell-27">
                            <div class="fix-6-12">
                                <img src="/resources/images/bg/mainBack.png">

                            </div>
                        </li>
                        <%--<li class="col-7-12 left">
                            <h1 class="ae-2 fromRight">Be creative</h1>
                            <div class="ae-3 fromRight">
                                <p class="opacity-8">When we feel less secure, with less control over our daily lives,
                                    we reach out to brands to connect with a time when things seemed&nbsp;better.</p>
                            </div>

                        </li>--%>
                    </ul>
                </div>


            </div>
        </div>
    </div>
    <div class="background" style="background-image:url(/resources/images/homeUI/back1.png)"></div>
</section>

<!-- Slide 2 (#60) -->
<section id="section2" class="slide fade-6 kenBurns">
    <div class="content">
        <div class="container">
            <div class="wrap">
                <div class="fix-12-12">
                    <ul class="grid">

                        <li class="col-3-12 left" style="background-color: #cbd1cc;height: 700px; border-radius: 15px;">
                            <h2 style="text-align: center; background-color: #ccb7d3; ">数学教室</h2>

                            <ul class="dropdownMenu"  style="background-color:  #cbd1cc;">
                                <a href="javascript:void(0)" class="dropbtn" style="text-align: center;  margin-left: 30px;  ">授業を選んでください。</a>

                                <ul class="tabs controller uppercase bold ae-4 fromCenter" id ="dropdownMenu-content" <%-- data-slider-id="60-1"--%> style="background-color: #ccb7d3; padding-left: 0; margin-top: 20px;margin-left: 50px; " >
                                    <li class="selected" style="text-align: center" id="numberStd">数字カウント</li>
                                    <li style="text-align: center;" id="pluminStd">足し算と引き算</li>
                                    <li style="text-align: center;" id="figureStd">図形学習</li>
                                    <li style="text-align: center;" id="lifeStd" >生活数学</li>
                                </ul>
                            </ul>

                            <ul class="tabs controller uppercase bold ae-4 fromCenter" id ="dropdownMenu-content1" data-slider-id="60-1" style="background-color: #ccb7d3; padding-left: 0; margin-top: 20px;margin-left: 10px; " >
                                <li id="number" class="selected" style="text-align: center; font-size: 30px"  >数字カウント</li>
                            </ul>
                            <ul class="tabs controller uppercase bold ae-4 fromCenter" id ="dropdownMenu-content2" data-slider-id="70-1" style="background-color: #ccb7d3; padding-left: 0; margin-top: 20px;margin-left: 10px; " >
                                <li id="calculation" class="selected" style="text-align: center; font-size: 30px" >数字演算</li>
                            </ul>
                            <ul class="tabs controller uppercase bold ae-4 fromCenter" id ="dropdownMenu-content3" data-slider-id="80-1" style="background-color: #ccb7d3; padding-left: 0; margin-top: 20px;margin-left: 10px; " >
                                <li id="shape" class="selected" style="text-align: center; font-size: 30px" >基礎図形</li>
                            </ul>
                            <ul class="tabs controller uppercase bold ae-4 fromCenter" id ="dropdownMenu-content4" data-slider-id="90-1" style="background-color: #ccb7d3; padding-left: 0; margin-top: 20px;margin-left: 10px; " >
                                <li id="clock" class="selected" style="text-align: center; font-size: 30px" >時計</li>
                                <li id="money" style="text-align: center; font-size: 30px" >金</li>
                            </ul>
                        </li>

                        <li class="col-8-12 " style="background-color: #f5b5ff; height: 700px; border-radius: 15px;">
                            <embed frameborder=0 framespacing=0 marginheight=0
                                   marginwidth=0 scrolling=no vspace=0
                                   width="100%" height="700px"
                                   id="edu_menu"
                                   class="page_content"
                                   type="text/html"
                                   src="/number">

                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div class="background" style="background-image:url(/resources/images/homeUI/back2.png)"></div>
</section>


<!-- Slide 3 (#27) -->
<section id="section3" class="slide fade-6 kenBurns">
    <div class="content">
        <div class="container">
            <div class="wrap">

                <div class="fix-12-12">
                    <ul class="flex verticalCenter">
                        <li class="col-5-12 cell-27">
                            <div class="fix-4-12">


                                <a href="https://wizardly-wing-6a8007.netlify.com/" target="_blank">
                                <img src="/resources/images/bg/home_button1.png"
                                     onmouseover="this.src='/resources/images/bg/home_button2.png';"
                                     onmouseout="this.src='/resources/images/bg/home_button1.png';"
                                     alt="start"/>
                                </a>

                            </div>
                        </li>
                        <%--<li class="col-7-12 left">
                            <h1 class="ae-2 fromRight">Be creative</h1>
                           <div class="ae-3 fromRight">
                                <p class="opacity-8">When we feel less secure, with less control over our daily lives,
                                    we reach out to brands to connect with a time when things seemed&nbsp;better.</p>
                            </div>
                            <div class="relative">
                                <img src="/resources/templet/assets/img/icon-2.png" class="ae-3 fromCenter app-26"
                                     alt="app"/>
                                <div class="text-26">
                                    <h3 class="ae-3 fromRight">Ember for Apple Watch</h3>
                                    <div class="ae-5 fromRight">
                                        <p class="tiny opacity-6">People don&rsquo;t use a product<br>because of the
                                            great&nbsp;design.</p>
                                    </div>
                                </div>
                            </div>
                        </li>--%>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div class="background" style="background-image:url(/resources/images/homeUI/back3.png)"></div>
</section>


<!-- Slide 4 (#26) -->
<%--통계 페이지--%>
<section id="section4" class="slide fade-6 kenBurns">
    <div class="content">
        <div class="container">
            <div class="wrap">
                <div class="fix-12-12" style="width: 100%;  margin: 0; ">

                    <%--학생그래프 생성--%>
                    <c:if test="${sessionScope.type =='student'}">
                        <ul class="grid grid-83 noSpaces equal ae-2 fadeIn"
                            style="width: 100%; height:100%;  ">
                            <li class="col-12-12 ae-3"
                                style="background: #FFFFFF; width: 1410px; height: 800px;  padding: 0px;  border-radius: 15px ">

                                <table class="bigTable"> <%--전체테이블--%>
                                    <tr>
                                        <td>
                                            <table class="smallTable" id="smallTable1"> <%--유저정보 부분 테이블--%>
                                                <tr>
                                                    <td rowspan="5">
                                                        <img src="#" id="cha_image">
                                                    </td>
                                                    <td style="width: 180px; height: 60px; border-radius: 5px; background-color: #d3d07c; font-size: 30px; ">
                                                        ユーザ情報
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ID
                                                    </td>
                                                </tr>
                                                <tr style="border-bottom: 1px solid #000000;">
                                                    <td id="logid" value="id">name</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        ニックネーム
                                                    </td>
                                                </tr>
                                                <tr >
                                                    <td id="nickname" value="nickname"></td>
                                                </tr>


                                            </table>
                                        </td>
                                        <td>
                                            <table class="smallTable"  id="smallTable2" style="margin-top:-2px "> <%--학습상세 정보 부분 테이블--%>
                                                <tr>
                                                    <td colspan="3" style="height: 60px; border-radius: 5px;  background-color: #76d2d3; font-size: 30px;">
                                                        学習詳細情報
                                                    </td>
                                                </tr>
                                                <tr >
                                                    <td style="width: 20%">数字理解</td>
                                                    <td  style="width: 20%">演算理解</td>
                                                    <td rowspan="4" id="donutchart" style="width: 100px; height: 110px;  background-color: #ffffff; ">
                                                    </td><!-- 학생 로그인시 챕터 점수 테이블-->
                                                </tr>
                                                <tr >
                                                    <td id="num1" style="text-align: center; "></td>
                                                    <td id="num2" style="text-align: center; "></td>
                                                </tr>
                                                <tr >
                                                    <td>図形理解</td>
                                                    <td>生活活用</td>
                                                </tr>
                                                <tr >
                                                    <td id="num3" style="text-align: center; "></td>
                                                    <td id="num4" style="text-align: center; "></td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="smallTable" id="smallTable3"><%--학습 진행 정도 부분 테이블--%>
                                                <tr >
                                                    <td colspan="3" style=" height: 60px; border-radius: 5px; background-color: #f5b5ff; font-size: 30px;">
                                                        学習進行程度
                                                    </td>
                                                </tr>
                                                <tr style="height: 9%; ">
                                                    <td style="width: 40%;">勉強時間</td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                                    <td>
                                                        <i class="far fa-clock"></i>
                                                    </td>
                                                    <td></td>
                                                    <td id="playtime"></td>
                                                </tr>
                                                <tr style="height: 9%; ">
                                                    <td>獲得した星の個数</td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                                    <td>
                                                        <i class="fas fa-splotch"></i>
                                                    </td>
                                                    <td id="bluestar"></td>
                                                    <td id="yellowstar"></td>
                                                </tr>
                                                <tr style="height: 9%; ">
                                                    <td>現在 Chapter</td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                                    <td>
                                                        <i class="fas fa-chess-king"></i>
                                                    </td>
                                                    <td></td>
                                                    <td id="nowChapter"></td>
                                                </tr>
                                                <tr style="height: 9%; ">
                                                    <td>現在 Stage</td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr style="height: 13.5%;">
                                                    <td>
                                                        <i class="fas fa-chess-pawn"></i>
                                                    </td>
                                                    <td></td>
                                                    <td id="nowStage"></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table class="smallTable" id="smallTable4"><%--방명록 부분 테이블--%>
                                                <tr>
                                                    <td style=" height: 60px; border-radius: 10px; background-color: #9ed3a8; font-size: 30px;">
                                                        芳名録
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <embed frameborder=0 framespacing=0 marginheight=0
                                                               marginwidth=0 scrolling=no vspace=0
                                                               width="100%" height="250px"
                                                               id="edu_menu"
                                                               class="page_content"
                                                               type="text/html"
                                                               src="/boardform">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                               <%-- <table class="japanfont" style="width: 100%; height: 100%; margin: 0;">
                                    <tr style="background-color: #00c6fb; height: 10%">
                                        <td colspan="2" style="font-weight: bold; font-size: 20px; padding-top: 10px">ユージャじょうほ</td>
                                    </tr>
                                    <tr style="height: 9%;">
                                        <td>아이디</td>
                                        <td>닉네임</td>
                                    </tr>
                                    <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                        <td id="logid" value="id">name</td>
                                        <td id="nickname" value="nickname"></td>
                                    </tr>
                                    <tr style="height: 77.5%">
                                        <td colspan="2" style="text-align: center;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <img src="#" id="cha_image">

                                        </td>
                                    </tr>

                                </table>
                            </li>
                            <li class="col-12-12 ae-3"
                                style="background: #FFFFFF; width: 350px; height: 600px;margin-right:20px; border-radius: 15px; padding: 0px;">
                                    &lt;%&ndash; <div id="table_div" style="width: 100%; height:  60px; "></div>&ndash;%&gt;

                                <table class="japanfont" style="width: 100%; height: 100%; ">
                                    <tr style="background-color: #fb8228; height: 10% ; ">
                                        <td colspan="3" style="font-weight: bold; font-size: 20px; padding-top: 10px;"> 학습 진행 정도</td>
                                    </tr>
                                    <tr style="height: 9%; ">
                                        <td style="width: 40%;">공부 시간</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                        <td>
                                            <i class="far fa-clock"></i>
                                        </td>
                                        <td></td>
                                        <td id="playtime"></td>
                                    </tr>
                                    <tr style="height: 9%; ">
                                        <td>획득한 별의 개수</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                        <td>
                                            <i class="fas fa-splotch"></i>
                                        </td>
                                        <td id="bluestar"></td>
                                        <td id="yellowstar"></td>
                                    </tr>
                                    <tr style="height: 9%; ">
                                        <td>현재 챕터</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                        <td>
                                            <i class="fas fa-chess-king"></i>
                                        </td>
                                        <td></td>
                                        <td id="nowChapter"></td>
                                    </tr>
                                    <tr style="height: 9%; ">
                                        <td>현재 스테이지</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr style="height: 13.5%; border-bottom: 1px solid #000000;">
                                        <td>
                                            <i class="fas fa-chess-pawn"></i>
                                        </td>
                                        <td></td>
                                        <td id="nowStage"></td>
                                    </tr>

                                </table>

                            </li>
                            <li class="col-12-12 ae-3"
                                style="background: #FFFFFF; width: 350px; height: 600px; border-radius: 15px; padding: 0px;">
                                    &lt;%&ndash; <div id="table_div" style="width: 100%; height:  60px; "></div>&ndash;%&gt;
                                <table class="japanfont" style="width: 100%; height: 100%; margin: 0; ">
                                    <tr style="background-color: #74fb6b; height: 10%; padding-top: 10px;">
                                        <td colspan="3" style="font-weight: bold; font-size: 20px; padding-top: 10px">학습 상세 정보</td>
                                    </tr>
                                    <tr style="height: 9%;">
                                        <td colspan="2"> chapter 점수</td>
                                    </tr>
                                    <tr style="height: 8%">
                                        <td style="">숫자 이해</td>
                                        <td>연산 이해</td>
                                    </tr>
                                    <tr style="height: 10%">
                                        <td id="num1" style="text-align: center; "></td>
                                        <td id="num2" style="text-align: center; "></td>
                                    </tr>
                                    <tr style="height: 8%; ">
                                        <td>도형 이해</td>
                                        <td>생활 활용</td>
                                    </tr>
                                    <tr style="height: 10%;  border-bottom: 1px solid #000000;">
                                        <td id="num3" style="text-align: center; "></td>
                                        <td id="num4" style="text-align: center; "></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" id="now_playing"></td>

                                    </tr>

                                    <!-- 학생 로그인시 챕터 점수 테이블-->
                                    <tr style="height: 40%; ">
                                        <td id="donutchart" style="width: 100%;  transform: scale(1.2); margin: 0;"
                                            colspan="2"></td>
                                    </tr>
                                </table>
                            </li>
                        </ul>--%>
                    </c:if>

                    <%--선생 그래프 생성--%>
                    <c:if test="${sessionScope.type =='teacher'}">
                        <ul class="grid grid-83 noSpaces equal ae-2 fadeIn" style="width: 100%;">
                            <li class="col-12-12 ae-3"
                                style="background: #FFFFFF; width: 45%; height: 600px; margin-right:20px; border-radius: 15px; padding: 0px;">
                                <table class="japanfont" style="width: 100%; height: 100%; ">
                                    <tr style="background-color: #00c6fb; height: 50px">
                                        <td>全体成績</td>
                                    </tr>
                                    <tr>
                                        <td id="table_div" style="width: 100%; height:  400px; "></td>
                                    </tr>
                                </table>
                                <!--선생님(kkk) 로그인시 전체 점수 테이블 -->
                            </li>
                            <li class="col-12-12 ae-3"
                                style="background: #FFFFFF; width: 45%; height: 600px; border-radius: 15px; padding: 0px;">
                                <table class="japanfont" style="width: 100%; height: 100%;  margin: 0">
                                    <tr style="background-color: #fb8228; height: 50px">
                                        <td>半平均と生徒の点数の比較</td>
                                    </tr>
                                    <tr style="width: 100%; height:  400px;">
                                        <td id="box_chart" style="background: #FFFFFF; "></td>
                                        <!--선생님 로그인시 반평균과 학생의 점수 비교 막대그래프-->
                                    </tr>
                                </table>
                            </li>
                                <%--<li class="col-12-12 ae-3" style="background: #FFFFFF; width: 15%; height: 600px; border-radius: 15px; padding: 0px;">
                                    <table class="japanfont" style="width: 100%; height: 10%; margin: 0">
                                        <tr style="background-color: #74fb6b; height: 70px">
                                            <td >전체 성적222222222</td>
                                        </tr>
                                        <tr>
                                            <td id="table_div2" style="width: 100%; height:  400px; "></td>
                                        </tr>
                                    </table>

                                </li>--%>
                        </ul>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
    <div class="background" style="background-image:url(/resources/images/homeUI/back4.png)"></div>
</section>

<!-- Slide 5 (#91) -->
<section id="section5" class="slide fade-6 kenBurns">
    <div class="content">
        <div class="container">
            <div class="wrap">
                <div class="fix-12-12 toCenter">
                    <div class="fix-7-12">


                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="background" style="background-image:url(/resources/images/homeUI/back5.png)"></div>
</section>

<!-- Panel Bottom #01 -->
<nav class="panel bottom forceMobileView">
    <div class="sections desktop">

        <div class="center"><span class="nextSlide"><svg><use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                              xlink:href="#arrow-down"></use></svg></span></div>

    </div>
    <div class="sections compact hidden">
        <div class="right">
            <span data-dropdown-id="2" class="button actionButton dropdownTrigger"><svg><use
                    xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#share"></use></svg></span>
        </div>
    </div>
</nav>

<!-- Share Window -->
<div class="dropdown share bottom right" data-dropdown-id="2" data-text="Take a look at this"
     data-url="https://designmodo.com"
     data-pinterest-image="https://designmodo.com/wp-content/uploads/2015/10/Presentation.jpg">
    <div class="center padding-2">
        <div class="title">Share</div>
        <a href="#">Contact us</a>
    </div>
    <ul>
        <li class="social-facebook">
            <svg>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#fb-like"></use>
            </svg>
        </li>
        <li class="social-twitter">
            <svg>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#twitter"></use>
            </svg>
        </li>
        <li class="social-googlePlus">
            <svg>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#googlePlus"></use>
            </svg>
        </li>
        <li class="social-linkedin">
            <svg>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#linkedin"></use>
            </svg>
        </li>
        <li class="mail" data-subject="Subject" data-body="Body">share by email</li>
    </ul>
</div>

<!-- Loading Progress Bar -->
<div class="progress-bar blue"></div>

</body>
</html>
