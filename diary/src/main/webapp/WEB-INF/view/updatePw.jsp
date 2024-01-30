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
<title>비밀번호 변경</title>
</head>
<body style="text-align: center;">
		<div><h1>비밀번호 수정</h1></div>
		<form method="post">
			<table align= "center">
			<thead class="table-success">
				<th>현재 비밀번호</th>
				<th>변경할 비밀번호</th>
			</thead>
			<tr>
				<td><input type="text" name="memberPw" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
				<td><input type="text" name="newMemberPw" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></td>
			</tr>
			</table>
			<button class="btn btn-outline-success" >변경하기</button>
		</form>
</body>
</html>