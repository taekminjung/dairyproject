<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- [jQuery] -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- [Bootstrap] -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<div>&nbsp;</div>
	<div class="container" align="center">
	<h1>안녕하세요!! <mark>${loginMember.memberId}</mark>님</h1>
	<div>&nbsp;</div>
	<div class="btn-group btn-group-sm">
	<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-success" >홈으로</a>
	<a href="${pageContext.request.contextPath}/selectScheduleListBySearch" class="btn btn-outline-success" >일정 검색</a>
	<a href="${pageContext.request.contextPath}/noticeList" class="btn btn-outline-success" >공지사항</a>
	<a href="${pageContext.request.contextPath}/updatePw"  class="btn btn-outline-success" >비밀번호 수정</a>
	<a href="${pageContext.request.contextPath}/logout"  class="btn btn-outline-success"  >로그아웃</a>
	</div>
	<div>&nbsp;</div>
		<br><h1>일정 검색</h1><br>
		<div>
			<form action="${pageContext.request.contextPath }/selectScheduleListBySearch" method="get">
				<select name="year">
					<option value=""></option>
					<c:forEach var="y" begin="${maxMinMap.minYear }" end="${maxMinMap.maxYear }" step="1">
						<option value="${y}">${y}</option>
					</c:forEach>
				</select>년
				<select name="month">
					<option value=""></option>
					<c:forEach var="m" begin="1" end="12" step="1">
						<option value="${m }">${m }</option>
					</c:forEach>
				</select>월
				<select name="date">
					<option value=""></option>
					<c:forEach var="d" begin="1" end="31" step="1">
						<option value="${d }">${d }</option>
					</c:forEach>
				</select>일
				<button class="btn-sm btn-outline-success" >검색</button>
			</form>
		</div><br>
		<table class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>내용</th>
			</tr>
			<c:forEach var="s" items="${list }">
				<tr>
					<td>${s.scheduleNo }</td>
					<td>${s.scheduleDate }</td>
					<td>${s.scheduleMemo }</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<c:if test="${currentPage  > 1 }">
				<a href="${pageContext.request.contextPath }/selectScheduleListBySearch?currentPage=${currentPage - 1}&year=${year }&month=${month }&date=${date }" class="btn-sm btn-outline-success">이전</a>
			</c:if>
			<c:if test="${!(currentPage  > 0) }">
				<button class="btn-sm btn-outline-success"  disabled>이전</button>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath }/selectScheduleListBySearch?currentPage=${currentPage + 1}&year=${year }&month=${month }&date=${date }" class="btn-sm btn-outline-success">다음</a>
			</c:if>
			<c:if test="${!(currentPage < lastPage)}">
				<button class="btn-sm btn-outline-success"  disabled>다음</button>
			</c:if>
		</div>
	</div>
</body>
</html>