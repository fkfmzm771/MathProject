<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Title</title>
    <script src="resources/jquery-3.3.1.min.js"></script>
    <script>


        $(function(){
            $("#searchbtn").on("click",search);
            $("#apply").on("click",apply);
        })

        function search(){
            $("#search").submit();
        }

        function apply(){
            var user_id;
            user_id = document.getElementById("user_id").value;

            $(function(){
                $.ajax({
                    url: "friendApply"
                    ,type: "GET"
                    ,data: {
                        user_id:user_id
                    }
                    ,success: function(){
                        alert("친구 신청 완료");
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
    <form action="searchFriend" method="GET">
        <table>
            <tr>
                <th>닉네임 : </th>
                <td>
                    <input type="text" id="nickname" name="nickname"/>
                </td>
                <td colspan="2">
                    <input type="submit" id="searchbtn" value="검색" />
                </td>
            </tr>
        </table>
    </form>

    <hr />
    <c:if test="${user_id != null}">
    <div>
        <form id="applyFriend" action="applyFriend" method="GET">
            <table>
                <tr>
                    <td>ID</td>
                    <td></td>
                    <td>닉네임</td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>${user_id}</td>
                    <td></td>
                    <td>${user_nickname}</td>
                    <td></td>
                    <td><input type="button" id="apply" value="신청"><br/></td>
                    <td><input type="hidden" id="user_id" value=${user_id}></td>
                </tr>
            </table>
        </form>
    </div>
    </c:if>
    <div id="message">${message}</div>

</div>
</body>
</html>