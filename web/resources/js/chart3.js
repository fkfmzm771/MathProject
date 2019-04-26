google.charts.load("current", {'packages': ['corechart']});
google.charts.load('current', {'packages': ['table']});
google.charts.load('current', {'packages': ['bar']});

google.charts.setOnLoadCallback(selectDonutChart);
google.charts.setOnLoadCallback(gamescorefind);
selectChapterScore();   //     학생 :  챕터별 별 갯수 로드
/*
selectDonutChart();     //     학생 :  도넛츠 차트 검색 시작
gamescorefind();        //     교사 :  담당 학생들의 별 갯수를 테이블차트로 불러오기
*/


//학생 챕터별 별 갯수 로드=====================================================================================
function selectChapterScore() {
    $.ajax({
        method: 'GET'
        , url: 'selectChapterScore'
        , success: function(resp){
            selectChapterScore2(resp)
        }
        , error: function () {
        }
    })
}

// 아이디 내용 변경
function setHtml(item_id, item_html)
{
    obj = document.getElementById(item_id);
   /* if (obj == null) {
        alert(item_id + ' 찾기 오류');
        return;
    }*/
    obj.innerHTML = item_html;
}


function selectChapterScore2(resp) {
    console.log(resp);

    /*let chartSum =
        resp.score1
        + resp.score2
        + resp.score3
        + resp.score4; //별 갯수 총합*/

    var secondTime = resp.PLAY_TIME;
    var h = parseInt(secondTime/3600); //시각
    var hr =  secondTime%3600;
    var m =parseInt(hr/60);     //분
    var s = hr%60;          //초
    var time = h +"時"+m+"分"+s+"秒";

    setHtml("logid",resp.STUDENT_ID);
    setHtml("nickname",resp.STUDENT_NICKNAME);
    setHtml("num1",resp.SCORE1);
    setHtml("num2",resp.SCORE2);
    setHtml("num3",resp.SCORE3);
    setHtml("num4",resp.SCORE4);
    setHtml("bluestar","青星 "+resp.BLUE_STAR+"個");
    setHtml("yellowstar","黄色の星 "+resp.YELLOW_STAR+"個");
    setHtml("playtime",time);



    /*setHtml("chartSum",chartSum);*/

   /* $("#cha_image").src = '/resources/images/card/' + resp.PLAY_CHARACTER + '.png';*/

    let chaImg = document.getElementById("cha_image");
    chaImg.src = '/resources/images/card/' + resp.PLAY_CHARACTER + '.png';

}


// 학생 도넛츠 차트 검색 시작=====================================================================================
function selectDonutChart() {

    $.ajax({
        method: 'GET',
        url: 'selectDonutChart',
        success: drawDonutChart,
        error: function () {
           /* alert("selectDonutChart실패");*/
        }
    })
}

//학생 도넛츠 차트 출력
function drawDonutChart(resp) {
    console.log(resp.chapter);

    let score = [];
    score.push(resp.stage1);
    score.push(resp.stage2);
    score.push(resp.stage3);
    score.push(resp.stage4);


    let total_clearStage = (resp.game_chapter - 1) * 10 +resp.game_stage ;//클리어 스테이지 수 누적


    setHtml("nowChapter",resp.game_chapter + '/4');
    setHtml("nowStage",resp.game_stage + '/10');

    let data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['完了', total_clearStage],
        ['非完了', 50- total_clearStage]
    ]);
    // title: '총 스테이지' + total_clearStage * 100/35 + '% 진행중',
    let options = {
        pieHole: 0.2,
        chartArea: {left: 60, top: 60},

    };

    let chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data,options);
}


//교사 전체 학생 CHAPTER 점수 테이블 로드========================================================================================
function gamescorefind() {
    $.ajax({
        method: 'GET'
        , url: 'selectClassGameScore'
        , success: drawBoxTable
        , error: function () {
            /*alert("실패");*/
        }
    })
}

//구글 표 테이블 생성
function drawBoxTable(resp) {
    //전체 테이블 Array 생성

    table_data = [];
    {
        for (key in resp) {
            table_data.push([
                resp[key].STUDETN_ID,
                resp[key].STUDENT_NAME,
                resp[key].SCORE1,
                resp[key].SCORE2,
                resp[key].SCORE3,
                resp[key].SCORE4,
               /* resp[key].play_time,
                resp[key].play_Character*/
            ]);
        }
    }
    console.log(table_data );

    let data = new google.visualization.DataTable();
    data.addColumn('string', 'ID');
    data.addColumn('string', '学生名');
    data.addColumn('number', '数字理解');
    data.addColumn('number', '演算理解');
    data.addColumn('number', '図形理解');
    data.addColumn('number', '生活活用');

    data.addRows(table_data);

    //표 불러오기
    var table = new google.visualization.Table(document.getElementById('table_div'));


    //테이블 속성 설정
    table.draw(data, {
        showRowNumber: true, width: '100%', height: '100%',
        page: 'enable',
        pageSize: 10
    });


    //표 테이블 클릭 이벤트 설정
    google.visualization.events.addListener(table, 'select', selectHandler);


    //표 클릭 이벤트 핸들러
    function selectHandler() {
        let array = [];

        let selection = table.getSelection();
        let item = selection[0];
        for (let i = 0; i < 5; i++) {
            str = data.getFormattedValue(item.row, i + 1);

            array.push(str);
        }
        drawBoxChart(array);

    }

}


//아이템 클릭 테이블 새로 생성
function drawBoxChart(array) {
    let sum_temp1 = 0;
    let sum_temp2 = 0;
    let sum_temp3 = 0;
    let sum_temp4 = 0;

    //각 항목의 총합
    for (let i = 0; i < table_data.length; i++) {
        sum_temp1 += table_data[i][2];
        sum_temp2 += table_data[i][3];
        sum_temp3 += table_data[i][4];
        sum_temp4 += table_data[i][5];
    }

    //각 항목의 평균값
    let aver1 = sum_temp1 / table_data.length;
    let aver2 = sum_temp2 / table_data.length;
    let aver3 = sum_temp3 / table_data.length;
    let aver4 = sum_temp4 / table_data.length;



    //개인 값과 평균값을 테이블에 대입
    let data = google.visualization.arrayToDataTable([
        ['評価項目', '半平均', String(array[0])],
        ['数字理解', aver1, Number(array[1])],
        ['演算理解', aver2, Number(array[2])],
        ['図形理解', aver3, Number(array[3])],
        ['生活活用', aver4, Number(array[4])]
    ]);

    //테이블 옵션 추가
    let options = {
        title: 'クラス平均と生徒点数の比較',
        vAxis: {
            title: '半平均点数'
        }
    };

    //막대 테이블 생성
    let chart1 = new google.charts.Bar(document.getElementById('box_chart'));
    chart1.draw(data, google.charts.Bar.convertOptions(options));

}















