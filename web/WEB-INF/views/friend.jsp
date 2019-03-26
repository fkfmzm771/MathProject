<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
	<title>Friend</title>
	<link href="resources/main.css" rel="stylesheet" />
	<script src="resources/jquery-3.3.1.min.js"></script>

	<script>
		var bookno = '';	// 수정할 때 필요한 booknum를 담아 놓을 전역변수

		$(function() {
			// code here : 각 이벤트에 맞게 함수 호출
			$("#bookRegist").on("click",bookregist);
			$("#searchbtn").on("click",search);
			init();
		});

		// 초기화
		function init() {
			// Code here
			$.ajax({
				url: "readingList",
				type: "get",
				success: function(resp){
					$("#btitle").val("");
					$("#writer").val("");
					$("#publisher").val("");
					$("#purchasedate").val("");
					$("#price").val("");
					$("#bookreview").val("");

					$("#bookRegist").val("독서평 등록");
					var list = resp;
					output(list);
				}
			});
		}

		// 출력 코드
		function output(resp) {
			// Code here
			var data = "";

			data += "<tr>";
			data += "<td>책장명</td>";
			data += "<td>책이름</td>";
			data += "<td>저자</td>";
			data += "<td>출판사</td>";
			data += "<td>구매날짜</td>";
			data += "<td>책가격</td>";
			data += "<td>독서평</td>";
			data += "<td>삭제</td>";
			data += "</tr>";

			$.each(resp,function(index, item){
				data += "<tr>";
				data += "<td>"+item.shelfname+"</td>";
				data += "<td>"+item.btitle+"</td>";
				data += "<td>"+item.writer+"</td>";
				data += "<td>"+item.publisher+"</td>";
				data += "<td>"+item.purchasedate+"</td>";
				data += "<td>"+item.price+"</td>";
				data += "<td>"+item.bookreview+"</td>";
				data += "<td><input type='button' class='delbtn' value='삭제' data-value='"+item.booknum+"'><br>";
				data += "<input type='button' class='updbtn' value='수정' data-value='"+item.booknum+"'></td>";
				data += "</tr>";
			})
			$("#book").html(data);
			$(".delbtn").on("click",bookdelete);
			$(".updbtn").on("click",bookupdate);
		}

		// 책 정보 / 독서평 수정
		function bookupdate(booknum) {
			if($("#bookRegist").val() != '독서평 등록') return;

			// Code here
			bookno = $(this).attr("data-value");

			$.ajax({
				url: "searchBook",
				data: {
					booknum : bookno
				},
				type: "get",
				success: function(book){
					bookno = book.booknum;

					$("#shelfname").val(book.shelfname);
					$("#btitle").val(book.btitle);
					$("#writer").val(book.writer);
					$("#publisher").val(book.publisher);
					$("#purchasedate").val(book.purchasedate);
					$("#price").val(book.price);
					$("#bookreview").val(book.bookreview);

					$("#bookRegist").val("독서평 수정");
				}
			});
		}
		// 책 정보 삭제
		function bookdelete(booknum) {
			var booknum = $(this).attr("data-value");

			// Code here
			$.ajax({
				url: "deleteBook",
				data: {
					booknum : booknum
				},
				type: "post",
				success: function(){
					init();
				}
			});
		}

		// 도서평 등록 / 책 정보 수정 처리
		function bookregist() {
			var shelfname  = $("#shelfname").val();
			var btitle     = $("#btitle").val();
			var writer     = $("#writer").val();
			var publisher  = $("#publisher").val();
			var purchasedate = $("#purchasedate").val();
			var price      = $("#price").val();
			var bookreview = $("#bookreview").val();

			// 데이터가 정확히 입력되었는지 검증
			// 책제목, 저자, 출판사를 반드시 입력하지 않으면 경고창
			// 책 가격을 문자로 입력했을 경우 재 입력
			// Code Here

			if(shelfname==null || btitle==null || writer==null || publisher==null || isNaN(price)) {
				alert("값을 입력해주세요.");
				return;
			}

			var mybookreview = {
				"shelfname" : shelfname
				, "btitle"  : btitle
				, "writer"  : writer
				, "publisher" : publisher
				, "purchasedate" : purchasedate
				, "price" : price
				, "bookreview" : bookreview
			};

			var url = '';

			// 등록버튼인지 수정버튼인지에 따라 url이 달라져야 한다.
			// Code here
			if(bookno == ''){
				url = "regist";
				$.ajax({
					type : 'POST'
					, url : url
					, data : mybookreview
					, success : function(resp) {
						$("#shelfname").val("");
						$("#btitle").val("");
						$("#writer").val("");
						$("#publisher").val("");
						$("#purchasedate").val("");
						$("#price").val("");
						$("#bookreview").val("");

						init();
					}
				});
			} else {
				var mybookreview2 = {
					"shelfname" : shelfname
					, "btitle"  : btitle
					, "writer"  : writer
					, "publisher" : publisher
					, "purchasedate" : purchasedate
					, "price" : price
					, "bookreview" : bookreview
					, "booknum" : bookno
				};
				url = "updateBook"
				$.ajax({
					type : 'POST'
					, url : url
					, data : mybookreview2
					, success : function(resp) {
						$("#shelfname").val("");
						$("#btitle").val("");
						$("#writer").val("");
						$("#publisher").val("");
						$("#purchasedate").val("");
						$("#price").val("");
						$("#bookreview").val("");

						init();
					}
				});
			}
		}

function idCheck(){
    window.open("searchFriendForm", "newwin", "top=200, left=300, height=400, width=700")
}
</script>

</head>
<body>

<h2>[ 내 독서 노트 ]</h2>
<div id="mybook">
    <table id="book">
    </table>
</div>

<input type="button" value="친구 검색" onclick="idCheck();">

</body>
</html>