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


            $("#wonTable").hide();
            $("#semoTable").hide();
            $("#nemoTable").hide();


            $("#won").click(function () {
                $("#wonTable").show(800);
                $("#semoTable").hide();
                $("#nemoTable").hide();

            });
            $("#semo").click(function () {
                $("#wonTable").hide();
                $("#semoTable").show(800);
                $("#nemoTable").hide();


            });
            $("#nemo").click(function () {
                $("#wonTable").hide();
                $("#semoTable").hide();
                $("#nemoTable").show(800);

            });

        });


    </script>
</head>


<body>
<table id="selectTable">
    <div style="font-size: 50px">基礎図形</div>
    <tr >
        <td>
            <button type="button" id="won" style="font-size: 30px">円</button>
        </td>
        <td>
            <button type="button" id="semo" style="font-size: 30px">三角形</button>
        </td>
        <td>
            <button type="button" id="nemo" style="font-size: 30px">四角形</button>
        </td>


    </tr>
</table>

<table class="table0" id="wonTable">
    <tr>
        <td colspan="2" style="font-size: 30px;">
            多様な円について調べよう
        </td>
    </tr>
    <tr>

        <td>
           <img src="/resources/images/shape/won1.png">
        </td>
        <td>
            <img src="/resources/images/shape/won2.jpg">
        </td>
    </tr>
    <tr>
        <td>
            <img src="/resources/images/shape/won3.jpg">
        </td>
        <td>
            <img src="/resources/images/shape/won4.jpg">
        </td>

    </tr>

</table>
<table class="table0" id="semoTable">
    <tr>
        <td colspan="2" style="font-size: 30px;">
            多様な三角形について調べよう
        </td>
    </tr>
    <tr>
        <td>
            <img src="/resources/images/shape/semo1.png">
        </td>
        <td>
            <img src="/resources/images/shape/semo2.jpg">
        </td>
    </tr>
    <tr>
        <td>
            <img src="/resources/images/shape/semo3.jpg">
        </td>
        <td>
            <img src="/resources/images/shape/semo4.png">
        </td>

    </tr>
</table>


<table class="table0" id="nemoTable">
    <tr>
        <td colspan="2" style="font-size: 30px;">
            多様な四角形について調べよう
        </td>
    </tr>
    <tr>
        <td>
            <img src="/resources/images/shape/nemo1.png">
        </td>
        <td>
            <img src="/resources/images/shape/nemo2.jpg">
        </td>
    </tr>
    <tr>
        <td>
            <img src="/resources/images/shape/nemo3.jpg">
        </td>
        <td>
            <img src="/resources/images/shape/nemo4.jpg">
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