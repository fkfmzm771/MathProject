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
            $("#searchbtn").on("click",search);
            $("#apply").on("click",apply);
        });

        function search(){
            $("#search").submit();
        };

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
                        alert("팔로우 완료");
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
    <form action="searchFriend" method="GET">
        <table>
            <tr>
                <th>ニックネーム : </th>
                <td>
                    <input type="text" id="nickname" name="nickname"/>
                </td>
                <td colspan="2">
                    <input class="btn btn-success" type="submit" id="searchbtn" value="けんさく" />
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
                    <td>ニックネーム</td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>${user_id}</td>
                    <td></td>
                    <td>${user_nickname}</td>
                    <td></td>
                    <td><input type="button" id="apply" value="팔로우"><br/></td>
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