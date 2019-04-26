<%--
  Created by IntelliJ IDEA.
  User: SCIT
  Date: 2019-04-22
  Time: 오전 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>산수를 풀어봅시다</title>
    <style>
        td
        {
            padding-left : 13px;
            padding-right : 13px;
        }
    </style>

    <script >
        var show=null, count;

        function ontime()	//시간 카운트
        {
            document.getElementById("grade").innerHTML = 0;
            var time = document.getElementById("time");
            count = 20;
            if(show != null)
                clearTimeout(show);
            outtime(time);
        }
        function outtime(cls)	//점점 시간이 줄어드는 함수
        {
            count--;
            cls.innerHTML = count;
            if(count != 0)
                show = setTimeout("outtime(time)", 1000);
            else
                correct();	// 0이 되면 채점을 하는 함수
        }
        function make()	//문제 만들기 함수
        {

            var one = document.getElementsByClassName("one");
            var two = document.getElementsByClassName("two");
            for(i=0; i<one.length; i++)
            {
                var num1 = Math.floor(Math.random()*10);	//첫 번째 랜덤 넘버
                var num2 = Math.floor(Math.random()*10);	//두 번째 랜던 넘버
                var op = Math.floor(Math.random()*2);		// 연산자를 랜덤으로 하기 위해서 상수화를 하고 switch를 써서 연산자를 정한다.
                var operation;

                switch(op)
                {
                    case 0 : operation = "+";
                        break;
                    case 1 : operation = "-";
                        break;
                    /*case 2 : operation = "*";
                        break;
                    case 3 : operation = "/";
                        break;*/
                }
                two[i].value="";
                one[i].style.textDecoration = "none";
                one[i].innerHTML =(num1+ num2) + operation + num2;	// 문제 출력

            }
        }


        function correct()	//채점 함수
        {
            var countgrade = 0;	// 채점 개수
            var one = document.getElementsByClassName("one");
            var two = document.getElementsByClassName("two");
            for(i=0; i<one.length; i++)
            {
                var question = one[i].innerHTML;
                var answer = two[i].value;
                var correct = Math.floor(eval(question));
                if(parseInt(answer) == correct)	//정답이면 개수 +1
                    countgrade += 1;
                else if(answer=="")	//비어 있으면 틀림
                    one[i].style.textDecoration = "line-through";
                else if(isNaN(answer))// 숫자가 아니면 틀림
                    one[i].style.textDecoration = "line-through";
                else// 정답이 틀리면 틀림
                    one[i].style.textDecoration = "line-through";
            }
            document.getElementById("grade").innerHTML = "正解数"+countgrade;	// 정답 개수 출력

        }
    </script>

</head>
<body onload="ontime(), make()">
<h1>数学問題を解いてみましょう</h1>
<h2>>問題は自動的に生成され、20秒が過ぎれば自動採点されます。</h2>
<div style="font-size: 30px">
    残った時間 <span id="time">0</span>
</div>
<hr>
<form>
    <table style="font-size: 30px; height: 200px; width: 150px;">
        <tr>
            <td class="one" style="width: 20px"></td>
            <td><input class="two" type="text" size="20" style="height: 30px"></td>
        </tr>
        <tr>
            <td class="one" style="width: 100px"></td>
            <td><input class="two" type="text" size="20" style="height: 30px"></td>
        </tr>
        <tr>
            <td class="one"></td>
            <td><input class="two" type="text" size="20" style="height: 30px"></td>
        </tr>
        <tr>
            <td class="one"></td>
            <td><input class="two" type="text" size="20" style="height: 30px"></td>
        </tr>
        <tr>
            <td><button type="button" onclick="ontime(), make(), clear()" style="width: 200px;height: 80px; font-size: 30px">もう一度</button></td>
            <td><span id="grade">0</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
</form>
</body>
</html>
