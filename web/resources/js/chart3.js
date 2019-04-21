

//<!---------------------------------전체 점수 테이블 DB에서 불러오기 시작----------------------------------------------->
google.load('visualization', '1', {'packages': ['table']});
// google.setOnLoadCallback(drawVisualization);


google.charts.load('current', {'packages':['table']});
google.charts.load('current', {'packages': ['bar']});
google.charts.load('current', {'packages': ['corechart']});





setTimeout(function(){
    gamescorefind()
},100)

reserchchart();



//교사 테이블 로드
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
                resp[key].student_name,
                resp[key].number_score,
                resp[key].calculation_score,
                resp[key].shape_score,
                resp[key].life_score
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
            str = data.getFormattedValue(item.row, i+1);

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




//커브 차트 시작
function reserchchart() {

    $.ajax({
        method: 'GET',
        url: 'userGameScore',
        success: drawdonutChart,
        error: function () {
            // alert("실패ㅋzzzㅋ");
        }
    })
}


//커브 아작스 리턴 처리
function drawdonutChart(resp) {
    let temp = [];
    if (resp != null) {
        for (var i = 2; i <= 11; i++) {
            temp.push(eval('resp.game' + i))
        }
    }
    let num_temp1 = 0;
    let num_temp2 = 0;
    for (let i = 0; i < temp.length; i++) {
        if (temp[i] > 0) {
            num_temp1 += 1;
        } else {
            num_temp2 += 1;
        }
    }
    console.log(num_temp1);
    console.log(num_temp2);

    let data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['완료', num_temp1],
        ['비완료', num_temp2]
    ]);

    let options = {
        title: num_temp1*10+'% 진행중',

        pieHole: 0.3,
        chartArea: {left: 130, top: 70},

    };

    let chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data, options);
}






