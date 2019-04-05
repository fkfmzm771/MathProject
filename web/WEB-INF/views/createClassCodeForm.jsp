<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>createMyClass</title>

    <script src="resources/jquery-3.3.1.min.js"></script>
    <script>


        $(function(){
            $("#codebtn").on("click",insertMyclass);
        })

        function insertMyclass(){
            var classname;
            classname = document.getElementById("classname").value;

            $(function(){
                $.ajax({
                    url: "createCode"
                    ,type: "GET"
                    ,data: {
                        classname:classname
                    }
                    ,success: function(){
                        alert("반 생성 완료");
                        myclose();
                    }
                });
            })
        }
        function myclose(){
            window.opener.location.reload();
            window.close();
        }
    </script>

</head>
<body>
<div id="wrapper">
    <form action="createCode" method="GET">
        <table>
            <tr>
                <th>반이름 : </th>
                <td>
                    <input type="text" id="classname" name="classname"/>
                </td>
                <td colspan="2">
                    <input type="button" id="codebtn" value="반 코드 생성하기" />
                </td>
            </tr>
        </table>
    </form>
    <hr />
</div>
</body>
</html>