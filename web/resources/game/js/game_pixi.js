//
// $(function () {
//     window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
//     window.moveTo(0, 0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
//     window.resizeTo(1280, 800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
// });
//


var docV = document.documentElement;
// 전체화면 설정
$(function () {
    openFullScreenMode();
});

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

const renderer = new PIXI.Renderer({
    view: canvas,
    width: _w,
    height: _h,
    backgroundColor: 0x1099bb,
    resolution: window.devicePixelRatio,
    autoDensity: true
});
//컨테이너 생성
const stage = new PIXI.Container();

//이미지의 스프라이트화(메모리에 영향이 있는듯)
const image1 = '/resources/images/icons/facebook.png';
const tuxture = new PIXI.Texture.from(image1);
const img = new PIXI.Sprite(tuxture);

//스프라이트의 기준점을 자신의 중앙으로 바꿈
img.anchor.set(0.5);

//컨테이너에 스프라이트를 추가
stage.addChild(img);


//사각형 게이지 생성
let gageout = new PIXI.Graphics();
gageout.beginFill(0xd3249);
gageout.drawRect(50, 100, 100, _h - 100);
gageout.endFill();

gageout.interactive = true;
gageout.buttonmode = true;
gageout.on('pointerdown', onClick);
stage.addChild(gageout);

//올라가는 게이지
let gagein = new PIXI.Graphics();
let y_end = gageout.y + gageout.height;

gagein.beginFill(0xffffff);
gagein.drawRect(gageout.x + 10, y_end, 30, 20);
gagein.endFill();

stage.addChild(gagein);


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

window.addEventListener('resize', resize);

function resize() {
    _w = window.innerWidth;
    _h = window.innerHeight;

    gageout.height =

    renderer.resize(_w, _h);
}

function onClick() {
    // ticker.add((delta) =>{
    // gagein.y = (gageout.y + gageout.height) - 30;
    // gagein.height = +30;


    // });
    // ticker.start();


    // location.href = 'joinForm';
}
