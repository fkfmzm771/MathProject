<%--
  Created by IntelliJ IDEA.
  User: fkfmz
  Date: 2019-03-20
  Time: 오전 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게임 테스트 페이지</title>


    <style>
        canvas {
            display: block;
            background: blue;
        }


    </style>

</head>
<body>


<h1>게임테스트 페이지</h1>

</body>

<canvas id="gstage"></canvas>




<script src='/resources/scripts/pixi.js'></script>

<script>
    const canvas = document.getElementById("gstage");

    const renderer = new PIXI.autoDetectRenderer({
        view: canvas,
        width:window.innerWidth,
        height:window.innerHeight
    });

    const stage = new PIXI.Container();


    const texture = PIXI.Texture.from('/resources/images/facebook.png');
    const img = new PIXI.Sprite(texture);

    img.scale.set(5,5);
    img.anchor.x = 0.5;
    img.anchor.y = 0.5;

    img.x = renderer.width / 2;
    img.y = renderer.height / 2;
    stage.addChild(img);

    const ticker = new PIXI.Ticker();

    ticker.add(animate);
    ticker.start();


    function animate(){
        img.rotation += 0.1;
    }

</script>
</html>
