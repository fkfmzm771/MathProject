<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Title</title>
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
            var data = '댓글';
            data += '<table>';

            data += '<tr>';
            data += '	<td>NICKNAME</td>';
            data += '	<td>CONTENTS</td>';
            data += '</tr>';
            data += '</table>';

            data += '<table>';
            $.each(resp, function(index, item){
                data += '<tr class="mathboard_seq" data-sno="'+ item.mathboard_seq +'" >';
                data += '	<td class="guest_id">' + item.guest_id + '</td>';
                data += '	<td class="contents">' + item.contents + '</td>';
                data += '</tr>';
            });

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

</head>
<body>
<div id="wrapper">
    <form action="" method="POST">
        <table>
            <tr>
                <th>내용 : </th>
                <td>
                    <input type="text" id="contents" name="contents"/>
                    <input type="hidden" id="host_id" name="host_id" value="${host_id}"/>
                </td>
                <td colspan="2">
                    <input type="button" id="searchbtn" onclick="insertbtn();" value="등록" />
                </td>
            </tr>
        </table>
    </form>

    <div id="contentsList">

    </div>
</div>
</body>
</html>