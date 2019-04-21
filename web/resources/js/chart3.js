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
        , success: selectChapterScore2
        , error: function () {
            alert("별 총합 아작스 에러")
        }
    })
}

// 아이디 내용 변경
function setHtml(item_id, item_html)
{
    obj = document.getElementById(item_id);
    if (obj == null) {
        alert(item_id + ' 찾기 오류');
        return;
    }
    obj.innerHTML = item_html;
}


function selectChapterScore2(resp) {
    console.log(resp.score1);

    let chartSum =
        resp.score1
        + resp.score2
        + resp.score3
        + resp.score4; //별 갯수 총합

    setHtml("logid",resp.student_id);
    setHtml("logname",resp.student_name);
    setHtml("num1",resp.score1);
    setHtml("num2",resp.score2);
    setHtml("num3",resp.score3);
    setHtml("num4",resp.score4);
    setHtml("chartSum",chartSum);

    $("#cha_image").src = '/resources/images/card/' + resp.play_Character + '.png';

    let chaImg = document.getElementById("cha_image");
    chaImg.src = '/resources/images/card/' + resp.play_Character + '.png';




}


// 학생 도넛츠 차트 검색 시작=====================================================================================
function selectDonutChart() {

    $.ajax({
        method: 'GET',
        url: 'selectDonutChart',
        success: drawDonutChart,
        error: function () {
            alert("selectDonutChart실패");
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


    let total_clearStage = (resp.chapter - 1) * 5 ;//클리어 스테이지 수 누적
    let playing_Stage = 0;//현재 스테이지


    for (let i = 0; i < score.length; i++) {
        if (score[i] === 1) playing_Stage = i + 1;

        if (score[i] === 2) total_clearStage++;
    }


    setHtml("nowChapter",resp.chapter + '/7');
    setHtml("nowStage",playing_Stage + '/5');

    let data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['완료', total_clearStage],
        ['비완료', 35 - total_clearStage]
    ]);
    // title: '총 스테이지' + total_clearStage * 100/35 + '% 진행중',
    let options = {
        pieHole: 0.2,
        chartArea: {left: 100, top: 30},

    };

    let chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data,options);
}


//교사 학생들 별 갯수 테이블 로드========================================================================================
function gamescorefind() {
    $.ajax({
        method: 'GET'
        , url: 'selectClassGameScore'
        , success: drawBoxTable
        , error: function () {
            alert("실패");
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
                resp[key].student_id,
                resp[key].score1,
                resp[key].score2,
                resp[key].score3,
                resp[key].score4,
                resp[key].play_time,
                resp[key].play_Character
            ]);
        }
    }

    let data = new google.visualization.DataTable();
    data.addColumn('string', '아이디');
    data.addColumn('string', '학생이름');
    data.addColumn('number', '숫자이해');
    data.addColumn('number', '연산이해');
    data.addColumn('number', '도형이해');
    data.addColumn('number', '생활활용');

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
        ['평가항목', '반평균', String(array[0])],
        ['숫자이해', aver1, Number(array[1])],
        ['연산이해', aver2, Number(array[2])],
        ['도형이해', aver3, Number(array[3])],
        ['생활활용', aver4, Number(array[4])]
    ]);

    //테이블 옵션 추가
    let options = {
        title: '반평균과 학생점수 비교',
        vAxis: {
            title: '반평균점수'
        }
    };

    //막대 테이블 생성
    let chart1 = new google.charts.Bar(document.getElementById('box_chart'));
    chart1.draw(data, google.charts.Bar.convertOptions(options));

}















