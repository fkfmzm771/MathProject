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

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/pixi.js/4.5.1/pixi.min.js "></script>


    <style>
        * {
            padding: 0;
            margin: 0}
    </style>

</head>
<body>
<script>


    // let type = "WebGL"
    // if (!PIXI.utils.isWebGLSupported()) {
    //     type = "canvas"
    // }
    //
    // PIXI.utils.sayHello(type)

    let app = new PIXI.Application();
    app.renderer.backgroundColor = 0x06139;
    app.renderer.view.style.position = "absolute";
    app.renderer.view.style.display = "block";
    app.renderer.autoResize = true;
    app.renderer.resize(window.innerWidth, window.innerHeight);

    document.body.appendChild(app.view);

    let texture = PIXI.utils.TextureCache["../images/tooplate_main.png"];
    let sprite = new PIXI.Sprite(texture)

    app.stage.addChild(sprite);

    PIXI.loader
        .add("/resources/images/facebook.png")
        .load(setup);

    function setup() {
        let cat = new PIXI.Sprite(PIXI.loader
            .resources["/resources/images/facebook.png"].texture);


        app.stage.addChild(cat);
    }

</script>

<h1>게임테스트 페이지</h1>

</body>




</html>
