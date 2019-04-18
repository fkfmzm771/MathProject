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
            $("#searchbtn").on("click",search);
            $("#apply").on("click",apply);
        });

        function search(){
            $("#search").submit();
        };

        function apply(){
            var student_myclass_code;
            student_myclass_code = document.getElementById("classcode").value;

            $(function(){
                $.ajax({
                    url: "applyClass"
                    ,type: "GET"
                    ,data: {
                        student_myclass_code:student_myclass_code
                    }
                    ,success: function(){
                        alert("신청 완료");
                        opener.location.reload();
                        window.close();
                    }
                });
            })
        }
    </script>

    <style>
        div#message {
            color :red;
        }
    </style>

</head>
<body>
<div id="wrapper">
    <form action="searchclassCode" method="GET">
        <table>
            <tr>
                <th>반 코드 : </th>
                <td>
                    <input type="text" id="code" name="code"/>
                </td>
                <td colspan="2">
                    <input type="submit" id="searchbtn" value="검색" />
                </td>
            </tr>
        </table>
    </form>

    <hr />
    <c:if test="${id != null}">
    <div>
        <form id="applyClass" action="applyClass" method="GET">
            <table>
                <tr>
                    <td>반 이름</td>
                    <td></td>
                    <td>반 코드</td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>${name}</td>
                    <td></td>
                    <td>${code}</td>
                    <td></td>
                    <td><input type="button" id="apply" value="신청"><br/></td>
                    <td><input type="hidden" id="classcode" value=${code}></td>
                </tr>
            </table>
        </form>
    </div>
    </c:if>
    <div id="message">${message}</div>

</div>
</body>
</html>