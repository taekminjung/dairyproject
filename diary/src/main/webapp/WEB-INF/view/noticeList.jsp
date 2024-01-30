<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>
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
</style>
</head>
<body style="text-align: center;">
<div>&nbsp;</div>
	<h1>안녕하세요!! <mark>${loginMember.memberId}</mark>님</h1>
	<div>&nbsp;</div>
		현재 페이지 : <span class="badge bg-warning">${currentPage}</span>
		<div>&nbsp;</div>
		<div class="btn-group btn-group-sm">
		<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-success" >홈으로</a>
	<a href="${pageContext.request.contextPath}/selectScheduleListBySearch" class="btn btn-outline-success" >일정 검색</a>
	<a href="${pageContext.request.contextPath}/noticeList" class="btn btn-outline-success" >공지사항</a>
	<a href="${pageContext.request.contextPath}/updatePw"  class="btn btn-outline-success" >비밀번호 수정</a>
	<a href="${pageContext.request.contextPath}/logout"  class="btn btn-outline-success"  >로그아웃</a>
	</div>
	<div>&nbsp;</div>
	<div class="container">
	<table class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
					<thead class="table-success">
					<th >NO</th>
					<th >제목</th>
					<th>수정/삭제</th>
					</thead>
				<c:forEach var="n" items="${list}">
				<tr>
					<td>${n.getNoticeNo()}</td>
					<td><a href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.getNoticeNo()}">${n.noticeTitle}</a></td>
					
                    <td>
                    <c:if test="${loginMember.memberLevel eq 1}">
                    <a href="${pageContext.request.contextPath}/updateNotice?noticeNo=${n.getNoticeNo()}" class="btn-sm btn-outline-success"  >수정</a>
                    	<a href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${n.getNoticeNo()}" class="btn-sm btn-outline-success" >삭제</a>
                    </c:if>
                    </td>
				</tr>
				</c:forEach>
			</table>
			<c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage - 1}" class="btn-sm btn-outline-success"  >이전</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage + 1}" class="btn-sm btn-outline-success"  >다음</a>
		<div>&nbsp;</div>
		<c:if test="${loginMember.memberLevel eq 1}">
			<form action="${pageContext.request.contextPath}/addNotice" method="post">
			<div style="text-align: center;">
				제목:<input type="text" name="noticeTitle" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)">
				</div><br>
			<div style="text-align: center;">
				<textarea rows="10" cols="150" name="noticeContent"  style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)"></textarea>
			</div>
			<div style="text-align: center;">
				비밀번호:<input type="text" name="noticePw" style="border:0; border-radius:15px; outline: none;  background-color: rgb(245, 245, 245)">
				</div>
				<br>
			<div style="text-align: center;">
				<button class="btn btn-outline-success"  type="submit">공지사항 추가</button>
			</div>
			</form>
		  </c:if>
		  </div>
</body>
</html>