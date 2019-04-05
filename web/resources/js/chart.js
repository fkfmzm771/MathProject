src = "https://code.jquery.com/jquery-3.3.1.js"
integrity = "sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin = "anonymous"


//<!---------------------------------전체 점수 테이블 DB에서 불러오기 시작----------------------------------------------->

gamescorefind();//<!--전체점수테이블 작동-->

table_data = [];
function gamescorefind() {
    $.ajax({
        method: 'GET'
        , url: 'gamescorefind'
        , success: function (resp) {
            // alert(JSON.stringify(resp));
            //console.log(resp);

             console.log(JSON.stringify(resp));

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
        , error: function () {
            alert("실패");
        }
    })
}
//<!---------------------------------전체 점수 테이블 DB에서 불러오기 끝------------------------------------------------->

//<!----------------------------------google table 시작-------------------------------------------------->

google.load('visualization', '1.0', {'packages': ["corechart", 'table', 'gauge', 'controls']});
google.charts.setOnLoadCallback(drawTable);

console.log(table_data);


function drawTable() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', '아이디');
    data.addColumn('string', '학생이름');
    data.addColumn('number', '숫자이해');
    data.addColumn('number', '연산이해');
    data.addColumn('number', '도형이해');
    data.addColumn('number', '생활활용');


    data.addRows(table_data);


    var table = new google.visualization.Table(document.getElementById('table_div'));

    table.draw(data, {
        showRowNumber: true, width: '100%', height: '100%',
        page: 'enable',
        pageSize: 10
    });

    google.visualization.events.addListener(table, 'select', selectHandler);

    array = [];

    function selectHandler() {
        var selection = table.getSelection();
        array = [];
        var item = selection[0];
        for (var i = 0; i < 5; i++) {
            var str = data.getFormattedValue(item.row, i+1);

            array.push(str);
        }
        console.log(array);

        drawcurveChart(array);
    }
}


/*

google.load('visualization', '1.0', {'packages':['corechart', 'table', 'gauge', 'controls']});
google.setOnLoadCallback(apiLoaded);

function apiLoaded() {
    drawStringFilter();
}

function drawStringFilter() {
    var dashboard = new google.visualization.Dashboard(document.getElementById('stringFilter_dashboard_div'));
    var control = new google.visualization.ControlWrapper({
        'controlType': 'StringFilter',
        'containerId': 'stringFilter_control_div',
        'options': {
            'filterColumnIndex': 0
        }
    });
    var table = new google.visualization.ChartWrapper({
        'chartType': 'Table',
        'containerId': 'stringFilter_chart_div',
        'options': {'height': '25em', 'width': '20em'}
    });


    google.visualization.events.addListener(table, 'select', tableSelectHandler);
    function tableSelectHandler(){
        var selectedItem = chart.getChart().getSelection()[0];
        alert(selectedItem.row);
    }

    var data = google.visualization.arrayToDataTable([
        ['Name', 'Age','kkk'],
        ['chl', 1, 0],
        ['Mical', 15, 1],
        ['Michel', 2, 2],
        ['Michael', 8, 3]

    ]);
    dashboard.bind(control, chart);
    dashboard.draw(data);
}
*/


//<!----------------------------------google table 끝---------------------------------------------------------->

//<!----------------------------------google line chart 시작--------------------------------------------------->

google.charts.load('current', {'packages': ['bar']});
google.charts.setOnLoadCallback(drawcurveChart);

function drawcurveChart(array) {

    console.log(array);
    let aver1 = 0.0;
    let aver2 = 0.0;
    let aver3 = 0.0;
    let aver4 = 0.0;

    let sum_temp1 = 0;
    let sum_temp2 = 0;
    let sum_temp3 = 0;
    let sum_temp4 = 0;

    for (let i = 0; i < table_data.length; i++) {

        sum_temp1 += table_data[i][2];
        sum_temp2 += table_data[i][3];
        sum_temp3 += table_data[i][4];
        sum_temp4 += table_data[i][5];

    }
    aver1 = sum_temp1 / table_data.length;
    aver2 = sum_temp2 / table_data.length;
    aver3 = sum_temp3 / table_data.length;
    aver4 = sum_temp4 / table_data.length;


    var data = google.visualization.arrayToDataTable([
        ['평가항목', '반평균', array[0]],
        ['숫자이해', aver1, Number(array[1])],
        ['연산이해', aver2, Number(array[2])],
        ['도형이해', aver3, Number(array[3])],
        ['생활활용', aver4, Number(array[4])]
    ]);

    var options = {

        title: '반평균과 학생점수 비교',
        vAxis: {
            title: '반평균점수'

        }
    };

    var chart = new google.charts.Bar(document.getElementById('curve_chart'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}

//<!----------------------------------google line chart 끝--------------------------------------------------->

