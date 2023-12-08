<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
 <!-- [jQuery] -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- [Bootstrap] -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="text-align: center;">
	<h1 style="text-align: center;">안녕하세요 <mark>${loginMember.memberId}</mark>님</h1>
	<h2 style="text-align: center;"><mark>${targetY}년 ${targetM}월 ${targetD}일</mark>의 일정입니다</h2>
	<div class="btn-group btn-group-sm">
	<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-success" >홈으로</a>
	<a href="${pageContext.request.contextPath}/selectScheduleListBySearch" class="btn btn-outline-success" >일정 검색</a>
	<a href="${pageContext.request.contextPath}/noticeList" class="btn btn-outline-success" >공지사항</a>
	<a href="${pageContext.request.contextPath}/updatePw"  class="btn btn-outline-success" >비밀번호 수정</a>
	<a href="${pageContext.request.contextPath}/logout"  class="btn btn-outline-success"  >로그아웃</a>
	</div>
	<table class="table table-bordered">
			<tr>
					<th>일</th>
					<th>일정번호</th>
					<th>일정 내용</th>
					<th>수정/삭제</th>	
			</tr>
		<c:forEach var="m" items="${list}">
		<tr>
			<td>${targetD}일</td>
			<td>${m.scheduleNo}번</td>
			<td>${m.scheduleMemo}</td>
			<td><a href="${pageContext.request.contextPath}/updateSchedule?scheduleNo=${m.scheduleNo}&targetY=${targetY}&targetM=${targetM}&targetD=${targetD}" class="btn-sm btn-outline-success" >수정</a>
			<a href="${pageContext.request.contextPath}/deleteSchedule?scheduleNo=${m.scheduleNo}&targetY=${targetY}&targetM=${targetM}&targetD=${targetD}" class="btn-sm btn-outline-success" >삭제</a></td>
		
		</tr>
		</c:forEach>
	</table>
	<div style="text-align: center;">
	<form action="${pageContext.request.contextPath}/insertSchedule" method="post">
	<input type="hidden" name="targetY" value="${targetY}">
	<input type="hidden" name="targetM" value="${targetM}">
	<input type="hidden" name="targetD" value="${targetD}">
	<textarea rows="10" cols="150" name="scheduleMemo"></textarea>
	<div><button class="btn-sm btn-outline-success"  type="submit">일정 추가</button></div>
	</form>
	</div>
</body>
</html>