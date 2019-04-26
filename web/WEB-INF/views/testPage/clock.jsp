<%--
  Created by IntelliJ IDEA.
  User: SCIT
  Date: 2019-04-22
  Time: 오전 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

        #clock {
            position: relative;
            width: 420px;
            height: 340px;
        }

        #clock img {
            position: absolute;

        }

        #digital {
            width: 300px;
            height: 50px;
            text-align: center;
        }
        .clockinput{
            width: 100px;
            height: 50px;
            font-size: 40px;
        }
        .aa{
            height: 30px;
            font-size: 25px;
        }
        /**{
            border: 1px  solid #000000;
        }*/
    </style>
    <script>

        function digital() {
            // var d = new Date(); /* d = 현재 시간 */

            var h = document.getElementById("getHours").value; /* h = 시간 */
            var m = document.getElementById("getMinutes").value; /* m = 분 */
            var s = document.getElementById("getSeconds").value; /* s = 초 */

            /* 시간을 12시간 단위로 하기 위해 12보다 큰 경우 12를 빼줌 */
            if (h > 12 && h<= 24) h = h - 12;
            else if( h<0 || h>24) {
                alert("0~24 間の時刻を入力してください");
                document.getElementById("getHours").value=0;
                document.getElementById("getMinutes").value=0;
                document.getElementById("getSeconds").value=0;
                return;
            }
            if (m<0 || m>60) {
                alert("0~59 間の分を入力してください")
                document.getElementById("getHours").value=0;
                document.getElementById("getMinutes").value=0;
                document.getElementById("getSeconds").value=0;
                return;
            }
            if (s<0 || s>60) {
                alert("0~59 間の秒を入力してください")
                document.getElementById("getHours").value=0;
                document.getElementById("getMinutes").value=0;
                document.getElementById("getSeconds").value=0;
                return;
            }

            var dh = (h * 30) + (m / 2); /* dh = 시침의 각도 */
            dh = parseInt(dh); /* 시침의 각도를 정수형으로 변환 */
            var dm = m * 6; /* 분침의 각도 */
            var ds = s * 6; /* 초침의 각도 */

            /* 시침, 분침, 초침의 각도를 계산한 값으로 변경 */
            /* IE 10+, Firefox */
            document.getElementById("hour").style.transform = "rotate(" + dh + "deg)";
            document.getElementById("munite").style.transform = "rotate(" + dm + "deg)";
            document.getElementById("second").style.transform = "rotate(" + ds + "deg)";

            /* IE 9 */
            document.getElementById("hour").style.MsTransform = "rotate(" + dh + "deg)";
            document.getElementById("munite").style.MsTransform = "rotate(" + dm + "deg)";
            document.getElementById("second").style.MsTransform = "rotate(" + ds + "deg)";

            /* Opera, Chrome, Safari */
            document.getElementById("hour").style.WebkitTransform = "rotate(" + dh + "deg)";
            document.getElementById("munite").style.WebkitTransform = "rotate(" + dm + "deg)";
            document.getElementById("second").style.WebkitTransform = "rotate(" + ds + "deg)";

            document.getElementById("digital").innerHTML = h + ":" + m + ":" + s;

        }

        //매 1초마다 함수 digital()을 호출하도록 타이머 생성
        // var timer = setInterval( function(){ digital(); }, 1000);
    </script>
</head>
<body>


        <div class="  shadow rounded" style="height: 400px; padding-top: 40px;">
            <div class="clock" >
                <table style="margin-left: 20px; margin-top: 20px;">
                    <tr>
                        <td >
                            <div id="clock">
                                <img src="/resources/images/clock/clock.png">
                                <img id="hour" src="/resources/images/clock/h.png">
                                <img id="munite" src="/resources/images/clock/m.png">
                                <img id="second" src="/resources/images/clock/s.png">

                            </div>
                        </td>

                        <td colspan="2">
                            <div id="digital" style="padding-top: 30px; margin-left: 30px; font-size: 60px" ></div>
                        </td>
                    </tr>


                    <tr>
                        <td style="color:#090104;" class="aa">
                            0~24 間の時刻を入力してください。
                        </td>
                        <td>
                            <input id="getHours" type="text" class="clockinput">
                        </td>
                    </tr>
                    <tr>
                        <td style="color:#090104;" class="aa" >
                            0~59 間の分を入力してください
                        </td>
                        <td>
                            <input id="getMinutes" type="text" class="clockinput">
                        </td>
                    </tr>
                    <tr>
                        <td style="color:#090104; " class="aa">
                            0~59 間の秒を入力してください。
                        </td>
                        <td>
                            <input id="getSeconds" type="text" class="clockinput">

                        </td>
                        <td>
                            <input id="clockbutton" type="button" onclick="digital();" style="font-size: 40px" value="入力">
                        </td>
                    </tr>


                </table>


            </div>
        </div>


</body>
</html>
