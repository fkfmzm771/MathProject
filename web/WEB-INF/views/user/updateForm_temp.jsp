<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>

<script>
function validate() {
		var pw = document.getElementById("pw");
		var upw = document.getElementById("upw");

		var temp1 = pw.value;
		var temp2 = upw.value;

		if (temp1 != temp2) {
			alert("비밀번호와 비밀번호 확인값이 같아야합니다.");
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
		return true;
	};
</script>
</head>
<body>
	<h2>[ 회원 정보 수정 ]</h2>

	<!-- 가입 폼 시작 -->
	<form id="" action="userUpdate" method="POST">
		<table border="1">
			<tr>
				<th>구분</th>
				<td>
					<input id="type" name="type" type="text" value="${type }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input id="userid" name="userid" type="text" value="${userid }" readonly="readonly" /> 
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
					<input id="name" type="text" value="${name }" name="name" />
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>
					<input id="email" type="text" value="${email }" name="email" />
				</td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td>
					<input id="nickname" type="text" value="${nickname }" name="nickname" />
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input id="btn" type="submit" value="업데이트" onclick="return validate();" /> 
					<input type="reset" value="초기화" />
				</th>
			</tr>
		</table>
	</form>
</body>
</html>