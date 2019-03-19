<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>

<!--
Template 2024 Vertiwood
http://www.tooplate.com/view/2024-vertiwood
-->
<title>Verti Wood Template</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="resources/css/coda-slider.css" type="text/css" charset="utf-8"/>

<script src="resources/js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="resources/js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="resources/js/jquery.localscroll-1.2.5.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.serialScroll-1.2.1.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/coda-slider.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>

<script src="resources/jquery-3.3.1.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"
        integrity="sha256-MZo5XY1Ah7Z2Aui4/alkfeiq3CopMdV/bbkc/Sh41+s="
        crossorigin="anonymous"></script>
<script src="resources/scripts/util.js"></script>

<style>
    .bg1 {
        width: 500px;
        height: 500px;
    }

</style>

<script>
    $(function () {

        $("#reserchChart").on('click', reserchchart);
    })


    function reserchchart() {

        var studentId = $("#studentId2").val();
        var Data = {
            'student_id': studentId
        }

        $.ajax({
            method: 'GET',
            url: 'reserch',
            data: Data,
            success: output,
            error: function () {
                alert("실패ㅋㅋ");
            }
        })
    }

    function output(resp) {


        var temp = [];

        if (resp != null) {

            for (var i = 1; i <= 10; i++) {
                temp.push(eval('resp.game' + i))
            }

        }

        var num_temp1 = 0;
        var num_temp2 = 0;

        for (var i = 0; i < temp.length; i++) {
            if (temp[i] > 0) {
                num_temp1 += 1;

            } else {
                num_temp2 += 1;
            }
        }


        console.log(num_temp1);
        console.log(num_temp2);


        var ctx = document.getElementById("myAreaChart2").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ["Red", "Blue"],
                datasets: [{
                    label: '# of Votes',
                    data: [num_temp2, num_temp1],
                    backgroundColor: ['rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)'],
                    borderColor: ['rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)'],
                    borderWidth: 0.05
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

    }
</script>
</head>
<body>

<div id="slider">
    <div id="tooplate_wrapper">

        <div id="tooplate_sidebar">

            <div id="header">
                <h1><a href="#">유아 수학 게임</a></h1>
            </div>

            <div id="menu">
                <ul class="navigation">
                    <li><a href="#home" class="selected">회원가입</a></li>
                    <li><a href="#about">로그인</a></li>
                    <li><a href="#services">게임시작</a></li>
                    <li><a href="#gallery">저장된게임불러오기</a></li>
                    <li><a href="#contact" class="last">통계</a></li>

                </ul>
            </div>

        </div> <!-- end of sidebar -->

        <div id="content">
            <div class="scroll">
                <div class="scrollContainer">
                    <div class="panel" id="home">


                    </div> <!-- end of home -->

                    <div class="panel" id="about">

                    </div> <!-- end of about us -->

                    <div class="panel" id="services">

                    </div> <!-- end of services -->

                    <div class="panel" id="gallery">

                    </div> <!-- end of gallery -->

                    <div class="panel" id="contact">

                        <p>학생 아이디를 입력하여 게임진행도 검색</p>
                        <table>
                            <tr>
                                <td>학생 아이디 : <input type="text" id="studentId2"></td>
                                <td><input type="button" value="검색" id="reserchChart"></td>
                            </tr>
                        </table>

                        <div class="bg1">
                            <canvas id="myAreaChart2" aria-label="Hello ARIA World"></canvas>
                        </div>

                    </div>
                </div> <!-- end of scroll -->
            </div>

            <div class="cleaner"></div>
        </div>
    </div> <!-- end of content -->


</div>
</body>
</html>