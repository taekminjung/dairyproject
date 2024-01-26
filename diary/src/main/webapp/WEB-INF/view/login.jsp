<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- [jQuery] -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- [Bootstrap] -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
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

#loginBox {
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
#loginBoxTitle {
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
   <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- 나의 스타일 추가 -->
    <link rel="stylesheet" href="css/login.css?v=1234">
</head>
<body class="text-center">
	 <div id="container">
	<div id="loginBox">
	 <div id="loginBoxTitle">로그인</div>
		<form action="${pageContext.request.contextPath }/login" method="post" >
			<table class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
				<tr>
					<th width="30%">아이디</th>
					<td><input type="text" name="memberId" value="admin" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="memberPw" value="1234" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
				</tr>
			</table>
			<button class="btn btn-outline-success" style="width:100%">로그인</button>
		</form>
		<br>
		<a href="${pageContext.request.contextPath }/addMember" class="btn btn-outline-success" style="width:100%">회원가입</a>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>