<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<br><h1>일정 검색</h1><br>
		<div>
			<form action="${pageContext.request.contextPath }/scheduleListByYMD" method="get">
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
				<button class="btn btn-outline-dark">검색</button>
			</form> 
		</div><br>
		<table class="table table-bordered">
			<tr>
				<th>no</th>
				<th>date</th>
				<th>memo</th>
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
			<c:if test="${currentPage - 1 > 0 }">
				<a href="${pageContext.request.contextPath }/scheduleListByYMD?currentPage=${currentPage - 1}&year=${year }&month=${month }&date=${date }" class="btn btn-outline-dark">이전</a>
			</c:if>
			<c:if test="${!(currentPage - 1 > 0) }">
				<button class="btn btn-outline-dark" disabled>이전</button>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath }/scheduleListByYMD?currentPage=${currentPage + 1}&year=${year }&month=${month }&date=${date }" class="btn btn-outline-dark">다음</a>
			</c:if>
			<c:if test="${!(currentPage < lastPage)}">
				<button class="btn btn-outline-dark" disabled>다음</button>
			</c:if>
		</div>
	</div>
</body>
</html>