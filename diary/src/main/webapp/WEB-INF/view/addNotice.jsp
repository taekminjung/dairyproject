<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가 </title>
</head>
<body>
		<h1>공지 추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/addNotice">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="20" rows="4" name="noticeContent"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="noticePw"></td>
			</tr>
		</table>
		<button>추가</button>
	</form>
</body>
</html>