<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <title>Insert title here</title>

    <script src="../../lib/jquery-3.3.1.min.js"></script>
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
            $("#chartRegist").on('click', chartregist);
            $("#reserchChart").on('click', reserchchart);
        })

        function chartregist() {
            var studentId = $("#studentId").val();
            var numberKnow = $("#numberKnow").val();
            var numberPlus = $("#numberPlus").val();
            var shapesKnow = $("#shapesKnow").val();
            var lifeAbility = $("#lifeAbility").val();

            var Data = {
                'studentId': studentId,
                'numberKnow': numberKnow,
                'numberPlus': numberPlus,
                'shapesKnow': shapesKnow,
                'lifeAbility': lifeAbility
            }
            $.ajax({
                method: 'GET',
                url: 'chartregist',
                data: Data,
                success: function (resp) {
                    if (resp == "T") {
                        alert("등록성공");

                    } else {
                        alert("등록실패");
                    }
                    $("#studentId").val("");
                    $("#numberKnow").val("");
                    $("#numberPlus").val("");
                    $("#shapesKnow").val("");
                    $("#lifeAbility").val("");
                }
            });
        }

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
<p>값을 입력하세요</p>

<table border="1">
    <tr>
        <th>학생아이디: <input type="text" id="studentId"></th>
        <td>숫자 이해: <input type="text" id="numberKnow"></td>
        <td>덧셈 뺄셈: <input type="text" id="numberPlus"></td>
        <td>도형 이해: <input type="text" id="shapesKnow"></td>
        <td>생활 활용: <input type="text" id="lifeAbility"></td>
        <td><input type="button" id="chartRegist" value="확인">
    </tr>
</table>
<p>학생 아이디를 입력하여 차트 검색</p>


<table>
    <tr>
        <td>학생 아이디 : <input type="text" id="studentId2"></td>
        <td><input type="button" value="검색" id="reserchChart"></td>
    </tr>
</table>

<div class="bg1">
    <canvas id="myAreaChart2"
            aria-label="Hello ARIA World"></canvas>
</div>


</body>
</html>