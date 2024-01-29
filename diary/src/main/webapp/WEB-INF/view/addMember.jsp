<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
* { padding: 0; margin: 0; }

html, body {
  height: 100%;
  background: #ffffff;
}

#container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100%;
}

#addMemberBox {
  width: 300px;
  text-align: center;
  background-color: #ffffff;
}
.input-form-box {
  border: 0px solid #ff0000;
  display: flex;
  margin-bottom: 5px;
}
.input-form-box > span {
  display: block;
  text-align: left;
  padding-top: 5px;
  min-width: 65px;
}
.button-login-box {
  margin: 10px 0;
}
#addMemberTitle {
  color:#000000;
  font-weight: bold;
  font-size: 32px;
  text-transform: uppercase;
  padding: 5px;
  margin-bottom: 20px;
  background: linear-gradient(to right, #270a09, #8ca6ce);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
#inputBox {
  margin: 10px;
}

#inputBox button {
  padding: 3px 5px;
}
</style>
   
  <!-- [jQuery] -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body class="text-center">
	<div id="container">
	<div id="addMemberBox">
	<div id="addMemberTitle">회원가입</div>
	<form method="post" id="addForm" action="${pageContext.request.contextPath}/addMember">
		<table class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
			<tr>
				<td width="30%">아이디</td>
				<td><input type="text" id="memberId" name="memberId" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="memberPw" name="memberPw" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="memberPw2" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
			</tr>
		</table>
	</form>
	<button class="btn btn-outline-success" style="width:100%" id="idCkBtn">ID중복확인</button>
		<button id="addBtn" class="btn btn-outline-success" style="width:100%">회원가입</button>
	<br><a href="${pageContext.request.contextPath }/login" class="btn btn-outline-success" style="width:100%">로그인화면</a>
	</div>
	</div>
</body>

<script>
	$('#addBtn').click(function() {
		if($('#memberId').val().length < 1) {
			alert('아이디를 입력하세요');
		} else if($('#memberPw').val().length < 1) {
			alert('비밀번호를 입력하세요');
		} else if($('#memberPw').val() != $('#memberPw2').val()) {
			alert('비밀번호를 확인');
		} else {
			$('#addForm').submit();
		}
	});
	
	$('#idCkBtn').click(function(){
		$.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/idCheck',
            data: { memberId: $('#memberId').val() },
            success: function(result) {
                if (result == 0) {
                	console.log(result);
                    alert('사용 가능한 아이디입니다.');
                } else {
                	console.log(result);
                    alert('이미 사용 중인 아이디입니다.');
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    });
</script>

</html>