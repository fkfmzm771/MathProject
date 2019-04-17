<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
	<title>Friend</title>
	<link href="resources/main.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script>

		$(function(){
			init();
		});

		//모든 데이터 읽어옴
		function init() {
			$.ajax({
				url: "friendList"
				,type: "get"
				,data: {}
				,success: function(fList){
					output(fList);
				}
			});
		}

		// 출력
		function output(resp) {
			var data = '<table>';

			data += '<tr>';
			data += '	<td>ID</td>';
			data += '	<td>NAME</td>';
			data += '	<td>NICKNAME</td>';
			data += '</tr>';

			$.each(resp, function(index, item){
				data += '<tr class="friend_seq" data-sno="'+ item.FRIEND_SEQ +'" >';
				data += '	<td class="friend_id">' + item.FRIEND_ID + '</td>';
				data += '	<td class="friend_name">' + item.FRIEND_NAME + '</td>';
				data += '	<td class="friend_nickname">' + item.FRIEND_NICKNAME + '</td>';
				data += '	<td><input type="button"  class="delbtn" data-sno="'+item.FRIEND_SEQ +'"value="끊기" /></td>';
				data += '</tr>';
			});
			$("#friendDiv").append(data);
			$(".delbtn").on("click", function(event){
				del($(event.target));
			});
		}

	// 팔로우 삭제
		function del(target) {
			var delno = $(target).attr('data-sno');
			if (delno != null) {
                alert(delno);
				$.ajax({
					url:"deleteFriend"
					,type : "post"
					,data : {seq : delno}
					,success: function(result){
						$("#friendDiv").empty();
						init();
					}
				});
			} else{
				alert("??");
			}
		}

function searchid(){
    window.open("searchFriendForm", "newwin", "top=200, left=300, height=400, width=700")
}
</script>

</head>
<body>

<input type="button" value="유저 검색" onclick="searchid();">

<div id="friendDiv">
	내 친구 목록<br/>
</div>

</body>
</html>