<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script>
	function validate() {
		var usertype = document.getElementsByName("usertype"); // id는 중복이 불가능하므로 Name을 써야할 경우
		var usertypetemp = usertype.selected; // 둘중 하나 선택하는것이기 때문에 선택된걸 가져와야 하므로 selected
		
		var id = document.getElementById("id").value;
		
		if(id.length == 0){
			alert("ID 중복확인을 이용하여 ID를 입력해주세요");
			return false;
		}
		
		var pw = document.getElementById("pw");
		var upw = document.getElementById("upw");

		var temp1 = pw.value;
		var temp2 = upw.value;

		if (temp1 != temp2) {
			alert("비밀번호와 비밀번호 확인값이 같아야합니다.");
// 			pw.select(); // 그 칸의 값을 드래그(?) 해놓는다
			pw.focus(); // 그 칸에 커서를 갖다 놓는다
			return false;
		}

		if (!(temp1.trim().length >= 3 && temp1.trim().length <= 10)) {
			alert("비밀번호 길이는 3이상 10이하여야 합니다(스페이스바 제외)");
			pw.select();
			return false;
		}

		var name = document.getElementById("name");

		var tempname = name.value;

		if (tempname.trim().length == 0) {
			alert("이름을 입력하셔야 합니다");
			name.focus();
			return false;
		}
		
		var nickname = document.getElementById("nickname");
		var tempnickname = nickname.value;
		
		if (tempnickname.trim().length == 0) {
			alert("닉네임을 입력하셔야 합니다");
			nickname.focus();
			return false;
		}
		
		var phone1 = document.getElementById("phone1");
		var phone2 = document.getElementById("phone2");
		var phone = document.getElementById("phone");

		var phonetemp1 = phone1.value;
		var phonetemp2 = phone2.value;

		if (isNaN(phonetemp2)) {
			alert("전화번호는 숫자만 입력하세요");

			return false;
		} else if (phonetemp2.trim().length != 8) {
			alert("핸드폰 번호를 8자리수로 입력해주세요");

			return false;
		}

		document.getElementById("phone").value = phonetemp1 + phonetemp2;
		return true;
	};
	
// ID 중복확인
function idCheck(){
	window.open("idCheck", "newwin", "top=200, left=300, height=400, width=400")
}
</script>

</head>
<body>
	<h2>[ 회원 가입 ]</h2>

	<!-- 가입 폼 시작 -->
	<form id="" action="joinus" method="POST">
		<table border="1">
			<tr>
				<th>구분</th>
				<td>
					<input class="" type="radio" name="usertype" value="student" checked /> 학생
					<input class="" type="radio" name="usertype" value="parents" /> 부모님
					<input class="" type="radio" name="usertype" value="teacher" /> 선생님
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input id="id" type="text" value="" name="id" 
					placeholder="버튼을 이용해주세요 ->" readonly="readonly" /> 
				    <input type="button" value="ID중복확인" onclick="idCheck();">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input id="pw" type="password" name="pw" placeholder="공백제외 3~10자리"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input id="upw" type="password" placeholder="위의 비밀번호와 동일하게 입력"/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input id="name" type="text" name="name" placeholder="본명"/>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>
					<input id="email" type="text" name="email" placeholder="eMail"/>
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td>
					<input id="nickname" type="text" name="nickname" placeholder="사용하실 닉네임"/>
				</td>
			</tr>

			<tr>
				<th>스마트폰</th>
				<td>
					<select id="phone1">
						<option value="010">010</option>
						<option value="019">019</option>
						<option value="018">018</option>
						<option value="017">017</option>
					</select> 
					<input id="phone2" type="text" placeholder="-없이 숫자만 입력" /> 
					<input id="phone" type="hidden" name="phone" value="" />
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input id="btn" type="submit" value="회원가입" onclick="return validate();" /> 
					<input type="reset" value="지우기" />
				</th>
			</tr>
		</table>
	</form>
</body>
</html>