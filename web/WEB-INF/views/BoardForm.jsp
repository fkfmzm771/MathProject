<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Title</title>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(function(){
            contentsList();
            $("#searchbtn").on("click",search);
        });

        function contentsList(){
            var host_id = document.getElementById("host_id").value;
            $.ajax({
                url : "boardList"
                ,type : "POST"
                ,data : {host_id : host_id}
                ,success :  function(fList){
                    if (fList.length != 0)
                        output(fList);
                }
            })
        };

        function output(resp){
            var data = '';

            data += '<table class="table table-striped">';
            data += ' <thead class="thead-dark">';
            data += '<tr>';
            data += '	<th style="text-align: center">Comment</th>';
            data += '	<th style="text-align: center">NickName</th>';
            data += '</tr>';
            data += '</thead>';

            data += '<tbody>';
            $.each(resp, function(index, item){
                data += '<tr class="mathboard_seq" data-sno="'+ item.mathboard_seq +'" >';
                data += '	<td class="contents" style="text-align: center">' + item.contents + '</td>';
                data += '	<td class="guest_id" style="text-align: center"><p class="h6">' + item.guest_id + '</p></td>';
                data += '</tr>';
            });

            data += '</tbody>';
            data += '</table>';

            $("#contentsList").empty();
            $("#contentsList").append(data);
        }

        function insertbtn(){
            var host_id = document.getElementById("host_id").value;
            var contents = document.getElementById("contents").value;

            $.ajax({
                url : "boardApply"
                ,type : "POST"
                ,data : {
                    host_id : host_id
                    ,contents : contents
                }
                ,success : function(){
                    document.getElementById("contents").value = "";
                    contentsList();
                }
            })
        };

        function search(){
            $("#searchbtn").submit();
        };
    </script>

    <style>
        body{
            background-color: #ffcd7e;
            padding: 10px;

        }

    </style>

</head>
<body onresize="parent.resizeTo(600,600)" onload="parent.resizeTo(600,600)">



<div id="wrapper">
    <form action="" method="POST">
        <table style="width: 100%;">
            <tr>
                <th style="margin-bottom: 10px">コメント :</th>
                <td  style="width: 70%;">
                    <input class="form-control" type="text" id="contents" name="contents"/>
                    <input type="hidden" id="host_id" name="host_id" value="${host_id}"/>
                </td>
                <td colspan="2">
                    <input class="btn btn-success" type="button" id="searchbtn" onclick="insertbtn();"
                           value="かく" />
                </td>
            </tr>
        </table>
    </form>

    <div id="contentsList">

    </div>
</div>
</body>
</html>