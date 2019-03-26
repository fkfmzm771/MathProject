<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <title>Insert title here</title>

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
                        alert("��ϼ���");

                    } else {
                        alert("��Ͻ���");
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
                    alert("���Ф���");
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
<p>���� �Է��ϼ���</p>

<table border="1">
    <tr>
        <th>�л����̵�: <input type="text" id="studentId"></th>
        <td>���� ����: <input type="text" id="numberKnow"></td>
        <td>���� ����: <input type="text" id="numberPlus"></td>
        <td>���� ����: <input type="text" id="shapesKnow"></td>
        <td>��Ȱ Ȱ��: <input type="text" id="lifeAbility"></td>
        <td><input type="button" id="chartRegist" value="Ȯ��">
    </tr>
</table>
<p>�л� ���̵� �Է��Ͽ� ��Ʈ �˻�</p>


<table>
    <tr>
        <td>�л� ���̵� : <input type="text" id="studentId2"></td>
        <td><input type="button" value="�˻�" id="reserchChart"></td>
    </tr>
</table>

<div class="bg1">
    <canvas id="myAreaChart2"
            aria-label="Hello ARIA World"></canvas>
</div>


</body>
</html>