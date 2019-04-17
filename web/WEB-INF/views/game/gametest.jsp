<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게임 테스트 페이지</title>
    <%--Jquery--%>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>

    <link href="/resources/game/css/style.css" rel="stylesheet" type="text/css">


</head>
<body>
<canvas id="my_canvas"></canvas>

</body>


<%--PIXI.JS--%>
<script src="/resources/game/js/pixi.min.js"></script>
<script src="/resources/game/js/viewport.js"></script>


<script>


    let turnset = true;


    // 전체화면 설정

    var docV = document.documentElement;

    //전체화면 실행
    function openFullScreenMode() {
        if (docV.requestFullscreen)
            docV.requestFullscreen();
        else if (docV.webkitRequestFullscreen) // Chrome, Safari (webkit)
            docV.webkitRequestFullscreen();
        else if (docV.mozRequestFullScreen) // Firefox
            docV.mozRequestFullScreen();
        else if (docV.msRequestFullscreen) // IE or Edge
            docV.msRequestFullscreen();
    }

    // 전체화면 해제
    function closeFullScreenMode() {
        if (document.exitFullscreen)
            document.exitFullscreen();
        else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
            document.webkitExitFullscreen();
        else if (document.mozCancelFullScreen) // Firefox
            document.mozCancelFullScreen();
        else if (document.msExitFullscreen) // IE or Edge
            document.msExitFullscreen();
    }

    //캔버스 호출
    const canvas = document.getElementById('my_canvas');

    //화면 생성시 기본 화면값
    let _w = window.innerWidth;
    let _h = window.innerHeight;

    const renderer = new Renderer({
        view: canvas,
        width: _w,
        height: _h,
        backgroundColor: 0x1099bb,
        resolution: window.devicePixelRatio,
        autoDensity: true
    });
    //컨테이너 생성


    var PIXI = require('pixi.js');
    var Viewport = require('pixi-viewport');


    const stage = new PIXI.Container();


    let viewport = new Viewport({
        screenWidth: _w,
        screenHeight: _h,
        worldWidth: 1000,
        worldHeight: 1000,
        interaction: renderer.plugins.interaction

    });
    stage.addChild(viewport);

    viewport
        .drag()
        .pinch()
        .wheel()
        .decelerate();


    //이미지의 스프라이트화(메모리에 영향이 있는듯)
    const image1 = '/resources/images/icons/facebook.png';
    const tuxture = new pixi.Texture.from(image1);
    const img = new pixi.Sprite(tuxture);

    const bg = 'resources/images/bg/bg_05.jpg';
    const bgtuxture = new pixi.Texture.from(bg);
    const bg_sp = new pixi.Sprite(bgtuxture);


    //스프라이트의 기준점을 자신의 중앙으로 바꿈
    img.anchor.set(0.5);
    // bg_sp.anchor.set(0.5);
    bg_sp.width = _w;
    bg_sp.height = _h;


    //사각형 게이지 생성
    let gageout1 = new PIXI.Graphics();
    gageout1.beginFill(0xd3249);
    gageout1.drawRect(100, 100, 100, 100);
    gageout1.endFill();
    gageout1.interactive = true;
    gageout1.buttonmode = true;
    gageout1.on('pointerdown', onClick);

    //사각형 게이지 생성
    let gageout2 = new PIXI.Graphics();
    gageout2.beginFill(0xd3249);
    gageout2.drawRect(100, 500, 100, 100);
    gageout2.endFill();
    gageout2.interactive = true;
    gageout2.buttonmode = true;
    gageout2.on('pointerdown', onClick);

    //컨테이너에 스프라이트를 추가
    viewport.addChild(bg_sp);
    viewport.addChild(img);
    viewport.addChild(gageout1);
    viewport.addChild(gageout2);


    const ticker = new PIXI.Ticker();
    //ㅣ
    ticker.add((delta) => {
        //게이지 막대 최대 크기 제한
        img.x = renderer.screen.width / 2;
        img.y = renderer.screen.height / 2;
        img.rotation += 0.1;

        renderer.render(stage);
    });

    ticker.start();


    //창 화면 크기 자동 조절
    window.addEventListener('resize', resize);

    function resize() {
        _w = window.innerWidth;
        _h = window.innerHeight;
        bg_sp.width = _w;
        bg_sp.height = _h;
        renderer.resize(_w, _h);
    }

    function onClick() {
        renderer.render(stage2);
        // location.href = 'joinForm';
        // if (turnset) {
        //     openFullScreenMode();
        //     turnset = !turnset;
        // }else{
        //     closeFullScreenMode();
        //     turnset = !turnset;
        // }
    }


</script>


</html>
