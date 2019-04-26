<%--
  Created by IntelliJ IDEA.
  User: SCIT
  Date: 2019-04-23
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <!-- jQuery 3.4.0 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <style>

        .table0{
            height: 400px;
            width: 800px;
            font-size: 20px;
            text-align: center;

        }
    </style>

    <script>


        $(document).ready(function() {


            $("#humanTable").hide();
            $("#bookTable").hide();
            $("#carTable").hide();
            $("#cupTable").hide();
            $("#pencilTable").hide();


            $("#human").click(function () {
                $("#humanTable").show(800);
                $("#bookTable").hide();
                $("#carTable").hide();
                $("#cupTable").hide();
                $("#pencilTable").hide();

            });
            $("#book").click(function () {
                $("#humanTable").hide();
                $("#bookTable").show(800);
                $("#carTable").hide();
                $("#cupTable").hide();
                $("#pencilTable").hide();

            });
            $("#car").click(function () {
                $("#humanTable").hide();
                $("#bookTable").hide();
                $("#carTable").show(800);
                $("#cupTable").hide();
                $("#pencilTable").hide();

            });
            $("#cup").click(function () {
                $("#humanTable").hide();
                $("#bookTable").hide();
                $("#carTable").hide();
                $("#cupTable").show(800);
                $("#pencilTable").hide();

            });
            $("#pencil").click(function () {
                $("#humanTable").hide();
                $("#bookTable").hide();
                $("#carTable").hide();
                $("#cupTable").hide();
                $("#pencilTable").show(800);

            });
        });


    </script>
</head>


<body>
<table id="selectTable">
    <div style="font-size: 50px">カウント</div>
    <tr >
        <td>
            <button type="button" id="human" style="font-size: 30px">人</button>
        </td>
        <td>
            <button type="button" id="book" style="font-size: 30px">本</button>
        </td>
        <td>
            <button type="button" id="car" style="font-size: 30px">自動車</button>
        </td>
        <td>
            <button type="button" id="cup" style="font-size: 30px">グラス</button>
        </td>
        <td>
            <button type="button" id="pencil" style="font-size: 30px">鉛筆</button>
        </td>

    </tr>
</table>

<table class="table0" id="humanTable">
    <tr>
        <td rowspan="4">
            <img src="/resources/images/object/human.jpg">
        </td>
        <td>
            1
        </td>
        <td>
            2
        </td>
        <td>
            3
        </td>
        <td>
           4
        </td>
        <td>
            5
        </td>
    </tr>
    <tr>
        <td>
            ひとり
        </td>
        <td>
            ふたり
        </td>
        <td>
            さんにん
        </td>
        <td>
            よにん
        </td>
        <td>
            ごにん
        </td>
    </tr>
    <tr>
        <td>
            6
        </td>
        <td>
            7
        </td>
        <td>
            8
        </td>
        <td>
            9
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td>
            ろくにん
        </td>
        <td>
            しち/ななにん
        </td>
        <td>
            はちにん
        </td>
        <td>
            きゅうにん
        </td>
        <td>
            じゅうにん
        </td>
    </tr>
</table>
<table class="table0" id="bookTable">
    <tr>
        <td rowspan="4">
            <img src="/resources/images/object/book.jpg">
        </td>
        <td>
            1
        </td>
        <td>
            2
        </td>
        <td>
            3
        </td>
        <td>
            4
        </td>
        <td>
            5
        </td>
    </tr>
    <tr>
        <td>
            いっさつ
        </td>
        <td>
            にさつ
        </td>
        <td>
            さんさつ
        </td>
        <td>
            よんさつ
        </td>
        <td>
            ごさつ
        </td>
    </tr>
    <tr>
        <td>
            6
        </td>
        <td>
            7
        </td>
        <td>
            8
        </td>
        <td>
            9
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td>
            ろくさつ
        </td>
        <td>
            ななさつ
        </td>
        <td>
            はっさつ
        </td>
        <td>
            きゅうさつ
        </td>
        <td>
            じゅっさつ
        </td>
    </tr>
</table>


<table class="table0" id="carTable">
    <tr>
        <td rowspan="4">
            <img src="/resources/images/object/car.jpg">
        </td>
        <td>
            1
        </td>
        <td>
            2
        </td>
        <td>
            3
        </td>
        <td>
            4
        </td>
        <td>
            5
        </td>
    </tr>
    <tr>
        <td>
            いちだい
        </td>
        <td>
            にだい
        </td>
        <td>
            さんだい
        </td>
        <td>
            よんだい
        </td>
        <td>
            ごだい
        </td>
    </tr>
    <tr>
        <td>
            6
        </td>
        <td>
            7
        </td>
        <td>
            8
        </td>
        <td>
            9
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td>
            ろくだい
        </td>
        <td>
            ななだい
        </td>
        <td>
            はちだい
        </td>
        <td>
            きゅうだい
        </td>
        <td>
            じゅうだい
        </td>
    </tr>
</table>

<table class="table0" id="cupTable">
    <tr>
        <td rowspan="4">
            <img src="/resources/images/object/cup.jpg">
        </td>
        <td>
            1
        </td>
        <td>
            2
        </td>
        <td>
            3
        </td>
        <td>
            4
        </td>
        <td>
            5
        </td>
    </tr>
    <tr>
        <td>
            いっぱい
        </td>
        <td>
            にはい
        </td>
        <td>
            さんばい
        </td>
        <td>
            よんはい
        </td>
        <td>
            ごはい
        </td>
    </tr>
    <tr>
        <td>
            6
        </td>
        <td>
            7
        </td>
        <td>
            8
        </td>
        <td>
            9
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td>
            ろっぱい
        </td>
        <td>
            ななはい
        </td>
        <td>
            はっぱい
        </td>
        <td>
            きゅうはい
        </td>
        <td>
            じゅっぱい
        </td>
    </tr>
</table>

<table class="table0" id="pencilTable">
    <tr>
        <td rowspan="4">
            <img src="/resources/images/object/pencil.jpg">
        </td>
        <td>
            1
        </td>
        <td>
            2
        </td>
        <td>
            3
        </td>
        <td>
            4
        </td>
        <td>
            5
        </td>
    </tr>
    <tr>
        <td>
            いっぽん
        </td>
        <td>
            にほん
        </td>
        <td>
            さんぼん
        </td>
        <td>
            よんほん
        </td>
        <td>
            ごほん
        </td>
    </tr>
    <tr>
        <td>
            6
        </td>
        <td>
            7
        </td>
        <td>
            8
        </td>
        <td>
            9
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td>
            ろっぽん
        </td>
        <td>
            ななほん
        </td>
        <td>
            はっぽん
        </td>
        <td>
            きゅうほん
        </td>
        <td>
            じゅっぽん
        </td>
    </tr>
</table>

<%--<table class="table0" id="">
    <tr>
    <td rowspan="4">
            <img src="/resources/images/object/">
        </td>
        <td>
            1
        </td>
        <td>
            2
        </td>
        <td>
            3
        </td>
        <td>
            4
        </td>
        <td>
            5
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>

        </td>
        <td>

        </td>
        <td>

        </td>
        <td>

        </td>
    </tr>
    <tr>
        <td>
            6
        </td>
        <td>
            7
        </td>
        <td>
            8
        </td>
        <td>
            9
        </td>
        <td>
            10
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>

        </td>
        <td>

        </td>
        <td>

        </td>
        <td>

        </td>
    </tr>
</table>--%>
</body>
</html>