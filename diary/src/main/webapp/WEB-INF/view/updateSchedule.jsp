<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>일정 수정</title>
</head>
<body style="text-align: center;">
<h1>안녕하세요 <mark>${loginMember.memberId}</mark>님</h1>
	<h2>선택하신${targetY}년 ${targetM}월 ${targetD}일의  ${scheduleNo}번 일정을 수정해주세요</h2>
	<a href="${pageContext.request.contextPath}/home" class="btn btn-outline-success">홈으로</a>
	<br>
	<table class="table table-bordered">
		<form action="${pageContext.request.contextPath}/updateSchedule?scheduleNo=${scheduleNo}" method="post">
		<input type="hidden" name="targetY" value="${targetY}">
		<input type="hidden" name="targetM" value="${targetM}">
		<input type="hidden" name="targetD" value="${targetD}">
		<input type="text" value="${map.scheduleDate}" readonly style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"><br>
		<textarea rows="10" cols="100" name="scheduleMemo" placeholder="${map.scheduleMemo}" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></textarea>
		<br>
		<button type="submit" class="btn btn-outline-success">일정 수정</button>
		</form>
	</table>
</body>
</html>