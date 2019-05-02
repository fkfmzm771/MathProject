<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UpdateForm</title>
	<!-- Bootstrap -->
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
	<!-- font awesome -->
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- Custom style -->
	<link rel="stylesheet" href="../plugin/bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="../config/js/join.js"></script>

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
<%--<h2>[ 회원 정보 수정 ]</h2>

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
</form>--%>

<article class="container" >
	<div class="page-header">
		<div class="col-md-6 col-md-offset-3" style="text-align: center;">
			<h2>[會員情報修整 ]</h2>
		</div>
	</div>
	<div class="col-sm-6 col-md-offset-3">
		<form role="form">
			<div class="form-group">
				<label for="inputName">區分</label>
				<input type="text" class="form-control" id="type" name="type" value="${type }" readonly="readonly" >
			</div>
			<div class="form-group">
				<label for="InputEmail">アイディ</label>
				<input type="text" class="form-control" id="userid"  name="userid"  value="${userid }" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="inputPassword">パスワ-ド</label>
				<input type="text" class="form-control" id="pw" name="pw"  placeholder="空白を除く3~10席">
			</div>
			<div class="form-group">
				<label for="inputPassword">パスワ-ド確認</label>
				<input type="text" class="form-control" id="upw" placeholder="上のパスワ?ドと同一に入力">
			</div>
			<div class="form-group">
				<label for="inputMobile">名前</label>
				<input type="text" class="form-control" id="name" name="name" value="${name }">
			</div>
			<div class="form-group">
				<label for="inputtelNO">Eメ-ル</label>
				<input type="text" class="form-control" id="email"  value="${email }" name="email" >
			</div>
			<div class="form-group">
				<label for="inputtelNO">ニックネ-ム</label>
				<input type="text" class="form-control" id="nickname"value="${nickname }" name="nickname">
			</div>



			<div class="form-group text-center">

				<input class="btn btn-primary" id="btn" type="submit" value="アップデ?ト" onclick="return validate();" />
				<input class="btn btn-warning" type="reset" value="初期化" />

			</div>
		</form>
	</div>

</article>


</body>
</html>