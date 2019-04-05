<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
	<title>MyClass</title>
	<link href="resources/main.css" rel="stylesheet" />
	<script src="resources/jquery-3.3.1.min.js"></script>

	<script>
		$(function(){
			// init();
			classList();
		});

		// //모든 데이터 읽어옴
		// function init() {
		// 	$.ajax({
		// 		url: "classList"
		// 		,type: "get"
		// 		,data: {}
		// 		,success: function(cList){
		// 			output(cList);
		// 		}
		// 	});
		// }

		// 반 목록 출력
		function classList() {
			$.ajax({
				url: "classNameList"
				,type: "get"
				,data: {}
				,success: function(cList){
					nameoutput(cList);
				}
			});
		}

		// 반이름 출력
		function nameoutput(resp) {
			var data = '<select id="selectclass" onchange="chageLangSelect()">';
			$.each(resp, function(index, item){
				data += '<option class="classNameList" value="' +item.myclass_code +'">' + item.myclass_name + '</option>';
			});
			data += '</select>';
			$("#myclassListDiv").append(data);

			// $(".selectclass").on("click", function(event){
			// 	del($(event.target));
			// });
		}

		function chageLangSelect(){
			var target = document.getElementById("selectclass");

			var temp = target.options[target.selectedIndex].value;

			console.log(temp);
			$.ajax({
				url: "classList"
				,type: "get"
				,data: {myclass_code : temp}
				,success: function(cList){
					output(cList);
				}
			});
		}

		// 반에서 삭제
		// function del(target) {
		// 	var class_code = $(target).attr('value');
		// 	if (class_code != null) {
		// 		alert(class_code);
		// 		$.ajax({
		// 			url:"ClassList"
		// 			,type : "GET"
		// 			,data : {myclass_code : class_code}
		// 			,success: function(caList){
		// 				output(caList);
		// 			}
		// 		});
		// 	}
		// }

		// 출력
		function output(resp) {
			var data = '<table>';

			data += '<th>';
			data += '	<td>학생아이디</td>';
			data += '	<td>학생이름</td>';
			data += '	<td>학생닉네임</td>';
			data += '	<td>반코드</td>';
			data += '	<td>반명</td>';
			data += '</th>';

			$.each(resp, function(index, item){
				data += '<tr class="friend_seq" data-sno="'+ item.MYCLASS_CODE +'" >';
				data += '	<td class="student_id">' + item.STUDENT_ID + '</td>';
				data += '	<td class="student_name">' + item.STUDENT_NAME + '</td>';
				data += '	<td class="student_nickname">' + item.STUDENT_NICKNAME + '</td>';
				data += '	<td class="myclass_code">' + item.MYCLASS_CODE + '</td>';
				data += '	<td class="myclass_name">' + item.MYCLASS_NAME + '</td>';
				data += '	<td><input type="button"  class="delbtn" data-code="'+item.MYCLASS_CODE +'" data-studentid="'+item.STUDENT_ID +'" value="끊기" /></td>';
				data += '</tr>';
			});
			$("#myclassDivInner").html("");
			$("#myclassDivInner").append(data);
		}
		function createClassCode(){
			window.open("createClass", "newwin", "top=200, left=300, height=400, width=700")
		}
	</script>

</head>
<body>

<h2>[ 우리반 ]</h2>

<input type="button" value="반 코드 생성하러 하기" onclick="createClassCode();">

<div id="myclassListDiv">
	우리반 목록<br/>
</div>

<div id="myclassDiv">
	내 친구 목록<br/>
	<div id="myclassDivInner">

	</div>
</div>

</body>
</html>