<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>다이어리 프로젝트 Home</title>
<style>
.button {
  background-color: white;;
  color: black; 
  border: 2px solid #008CBA;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  margin: 2px 1px;
  cursor: pointer;
}
  a {
  	  text-decoration: none;
  }
</style>
</head>
<body style="text-align: center;">
	<h1>안녕하세요!! <mark>${loginMember.memberId}</mark>님</h1>
	<a href="${pageContext.request.contextPath}/selectScheduleListBySearch" class="button" >일정 검색</a>
	<a href="${pageContext.request.contextPath}/noticeList" class="button" >공지사항</a>
	<a href="${pageContext.request.contextPath}/updatePw"  class="button" >비밀번호 수정</a>
	<a href="${pageContext.request.contextPath}/logout"  class="button" >로그아웃</a>
	
	
	<!--  달력 출력 -->
	<div>
		<h1>${calendarMap.targetY}년 ${calendarMap.targetM+1}월</h1>
	</div>	
	<div>
			<a href="${pageContext.request.contextPath}/home?targetY=${calendarMap.targetY}&targetM=${calendarMap.targetM-1}">이전달</a>
			
			<!-- 만약 href속성값 매개값이 많으면 c:url jstl을 사용하면 가독성 높일 수 있다 -->
			<c:url var = "nextUrl" value="/home">
				<c:param name="targetY" value="${calendarMap.targetY}"></c:param>
				<c:param name="targetM" value="${calendarMap.targetM+1}"></c:param>	
			</c:url>
			<a href="${nextUrl}">다음달</a>
		</div>
		<table class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;" >
			<tr>
				<th width="15%">일</th>
				<th width="15%">월</th>
				<th width="15%">화</th>
				<th width="15%">수</th>
				<th width="15%">목</th>
				<th width="15%">금</th>
				<th width="15%">토</th>
			</tr>
			<tr>
				<c:forEach var="i" begin="1" end="${calendarMap.totalTd}" step="1">
					<c:set var="d" value="${(i - calendarMap.beginBlank)}"></c:set>
					<td>
						<c:if test="${d < 1 || d > calendarMap.lastDate}">
							&nbsp;
						</c:if>
						<c:if test="${!(d < 1 || d > lastDay)}">
							
							<a href="${pageContext.request.contextPath}/ScheduleList?targetY=${calendarMap.targetY}&targetM=${calendarMap.targetM+1}&targetD=${d}">
								<span>${d}</span>
							</a>
							<div>
							<c:forEach var="m" items="${list}">
								<c:if test="${m.targetD == d}">
								<div><span class="badge badge-danger">${m.cnt}</span></div>
								<div><mark>${m.memo}</mark></div>
								</c:if>
							</c:forEach>
								</div>
						</c:if>
				<!-- 한행에 7열씩 출력하도록 -->
						<c:if test="${i< calendarMap.totalTd && i%7==0}">
							</tr><tr>
						</c:if>
					</td>
				</c:forEach>
			</tr>
		</table>
	
</body>
</html>