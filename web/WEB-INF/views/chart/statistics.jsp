
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../lib/jquery-3.3.1.min.js"></script>


    <style type="text/css">
        canvas {
            border: 1px solid black;
        }
    </style>

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"
            integrity="sha256-MZo5XY1Ah7Z2Aui4/alkfeiq3CopMdV/bbkc/Sh41+s="
            crossorigin="anonymous">
    </script><!--도넛츠 차트-->
    <script src="resources/scripts/util.js"></script><!--도넛츠 차트-->
    <style>
        .bg1 {
            width: 400px;
            height: 200px;
        }
    </style><!--도넛츠 차트-->
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
            ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
            ctx.fillRect(30, 30, 50, 50);

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
                    }]
                },
                options: {

                    maintainAspectRatio: false,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                    },
                    legend: {
                        display: false
                    },
                    cutoutPercentage: 80,
                },
            });
        }
    </script><!--도넛츠 차트-->

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>


    <script>
        var data = [
            [
                "이대로",
                "System Architect",
                "Edinburgh",
                "5421",
                "2011/04/25",
                "$3,120"
                , "313"
            ]

        ]

        $(document).ready(function () {
            $('#example').DataTable({
                data: data

            });
        });
    </script><!--표-->

</head>
<body <%--onload="draw();"--%>>

<table border="1">
    <tr>
        <td rowspan="2">게임정보</td>
        <td>레벨</td>
        <td>

        </td>
        <td>

        </td>
    </tr>
    <tr>
        <td colspan="3">최근내역</td>
    </tr>
    <tr>
        <td>개인정보</td>

        <!-- 도넛츠 차트 시작-->
        <td colspan="2" id="doughnut">
            <p>학생 아이디 : <input type="text" id="studentId2"></p>
            <p><input type="button" value="검색" id="reserchChart"></p>

            <div class="bg1">
                <canvas id="myAreaChart2" aria-label="Hello ARIA World"></canvas>
                <canvas id="my-house" width="30" height="30"></canvas>
            </div>
        </td>
        <!-- 도넛츠 차트 끝-->

        <!-- 표 시작-->
        <td>
            <table id="example" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>최종종료날짜</th>
                    <th>숫자 이해</th>
                    <th>덧셈/뺄셈</th>
                    <th>도형</th>
                    <th>무게</th>
                    <th>시계</th>
                    <th>총합</th>
                </tr>
                </thead>

            </table>
        </td>
        <!--표끝-->
    </tr>

</table>
</body>
</html>
