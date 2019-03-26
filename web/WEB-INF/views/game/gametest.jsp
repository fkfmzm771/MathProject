<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게임 테스트 페이지</title>
    <%--Jquery--%>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
    <%--PIXI.JS--%>
    <script src="resources/scripts/pixi.min.js"></script>

    <style>
        body {
            background-color: #d4c8ff;
            margin: 0px;
        }

        canvas {
            display: block;
            background-color: #222222;
        }
    </style>

</head>
<body>
<canvas id="my_canvas"></canvas>

</body>


<script>
    const canvas = document.getElementById('my_canvas');

    let _w = window.innerWidth;
    let _h = window.innerHeight;


    const renderer = new PIXI.Renderer({
        view: canvas,
        width: _w,
        height: _h,
        resolution: window.devicePixelRatio,
        autoDensity: true
    });



    const stage = new PIXI.Container();


    const image1 = '/resources/images/facebook.png';
    const tuxture = new PIXI.Texture.from(image1);
    const img = new PIXI.Sprite(tuxture);

    img.anchor.set(0.5);

    stage.addChild(img);


    let gageout = new PIXI.Graphics();
    gageout.beginFill(0xd3249);
    gageout.drawRect(50, 50, 50, _h - 100);
    gageout.endFill();
    gageout.interactive = true;
    gageout.buttonmode = true;
    gageout.on('pointerdown', onClick);
    stage.addChild(gageout);

    //올라가는 게이지
    let gagein = new PIXI.Graphics();
    let y_end = gageout.y + gageout.height;

    gagein.beginFill(0xffffff);
    gagein.drawRect(gageout.x + 10, y_end, 30,20);
    gagein.endFill();

    stage.addChild(gagein);



    const ticker = new PIXI.Ticker();

    ticker.add((delta) => {
        //게이지 막대 최대 크기 제한
        img.x = renderer.screen.width / 2;
        img.y = renderer.screen.height / 2;
        img.rotation += 0.1;

        renderer.render(stage);

    });


    ticker.start();

    window.addEventListener('resize', resize);

    function resize() {

        gageout.height = _h - 100;
        gagein.x = gageout.x;
        if (window.innerWidth > 600) {
            _w = window.innerWidth;

        }
        if (window.innerHeight > 400) {
            _h = window.innerHeight;

        }
        renderer.resize(_w, _h);
    }



    function onClick() {
        alert('클릭 테스트');
        // ticker.add((delta) =>{
            gagein.y = (gageout.y + gageout.height)-30;
            gagein.height =+ 30;



        // });
        // ticker.start();




        // location.href = 'joinForm';
    }


</script>

</html>
