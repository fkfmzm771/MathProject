<%--
  Created by IntelliJ IDEA.
  User: SCIT
  Date: 2019-04-22
  Time: 오전 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BLUEB</title>
    <style>
        img {
            transform: scale(0.7);
        }

        /**{
            border: 1px solid #000000;
        }*/
    </style>
</head>

<body onload="init();">
<script language="JavaScript">
    <!--
    var sell_price;
    var amount;

    function init() {
        sell_price1000 = document.form.sell_price1000.value;
        sell_price5000 = document.form.sell_price5000.value;
        sell_price10000 = document.form.sell_price10000.value;
        amount1000 = document.form.amount1000.value;
        amount5000 = document.form.amount5000.value;
        amount10000 = document.form.amount10000.value;

        document.form.sum.value = sell_price;
        change();
    }

    function add1000() {
        hm100 = document.form.amount1000;
        sum = document.form.sum;
        hm100.value++;

        change();
    }

    function del1000() {
        hm1000 = document.form.amount1000;
        sum = document.form.sum;
        if (hm1000.value > 0) {
            hm1000.value--;
            change();
        }
    }

    function add5000() {
        hm5000 = document.form.amount5000;
        sum = document.form.sum;
        hm5000.value++;

        change();
    }

    function del5000() {
        hm5000 = document.form.amount5000;
        sum = document.form.sum;
        if (hm5000.value > 0) {
            hm5000.value--;
            change();
        }
    }

    function add10000() {
        hm10000 = document.form.amount10000;
        sum = document.form.sum;
        hm10000.value++;

        change();
    }

    function del10000() {
        hm10000 = document.form.amount10000;
        sum = document.form.sum;
        if (hm10000.value > 0) {
            hm10000.value--;
            change();
        }
    }

    function change() {
        hm1000 = document.form.amount1000;
        hm5000 = document.form.amount5000;
        hm10000 = document.form.amount10000;
        sum = document.form.sum;

        if (hm1000.value < 0) {
            hm1000.value = 0;
        }
        if (hm5000.value < 0) {
            hm5000.value = 0;
        }
        if (hm10000.value < 0) {
            hm10000.value = 0;
        }
        document.getElementById("sum1000").innerHTML = (parseInt(hm1000.value) * sell_price1000) + "円 ";
        document.getElementById("sum5000").innerHTML = (parseInt(hm5000.value) * sell_price5000) + "円 ";
        document.getElementById("sum10000").innerHTML = (parseInt(hm10000.value) * sell_price10000) + "円 ";
        document.getElementById("moneysum").innerHTML = (sell_price1000 + "X" + parseInt(hm1000.value)) + "+" + (sell_price5000 + "X" + parseInt(hm5000.value)) + "+" + (sell_price10000 + "X" + parseInt(hm10000.value)) + "=";
        document.getElementById("moneysum2").innerHTML = (parseInt(hm1000.value) * sell_price1000) + "+" + (parseInt(hm5000.value) * sell_price5000) + "+" + (parseInt(hm10000.value) * sell_price10000) + "=";
        sum.value = (parseInt(hm1000.value) * sell_price1000) + (parseInt(hm5000.value) * sell_price5000) + (parseInt(hm10000.value) * sell_price10000);

    }

    //-->
</script>

<form name="form" method="get">
    <table>
        <tr>
            <td>
                <img src="/resources/images/money/1000.jpg">
            </td>
            <td>
                1000円 X <input type=hidden name="sell_price1000" value="1000">
                <input type="text" name="amount1000" value="1" size="3" onchange="change();">
                <input type="button" value=" + " onclick="add1000();"><input type="button" value=" - "
                                                                             onclick="del1000();">
                <div>=
                    <div id="sum1000"></div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <img src="/resources/images/money/5000.jpg">
            </td>
            <td>
                5000円 X <input type=hidden name="sell_price5000" value="5000">
                <input type="text" name="amount5000" value="1" size="3" onchange="change();">
                <input type="button" value=" + " onclick="add5000();"><input type="button" value=" - "
                                                                             onclick="del5000();">
                <div>=
                    <div id="sum5000"></div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <img src="/resources/images/money/10000.jpg">
            </td>
            <td>
                10000円 X <input type=hidden name="sell_price10000" value="10000">
                <input type="text" name="amount10000" value="1" size="3" onchange="change();">
                <input type="button" value=" + " onclick="add10000();"><input type="button" value=" - "
                                                                              onclick="del10000();">
                <div>=
                    <div id="sum10000"></div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <p id="moneysum" style="font-size: 20px; margin-left: 70px; width: 60%; "></p>
                <p id="moneysum2" style="font-size: 20px; margin-left: 70px; width: 60%; "></p>
            </td>
            <td>
                総額 <input type="text" name="sum" size="11" readonly
                          style="font-size: 30px; margin-left: 30px; width: 130px; ">円
            </td>

        </tr>

    </table>


</form>
