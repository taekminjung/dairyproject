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
<h1>안녕하세요 <mark>${loginMember.memberId}</mark>님</h1>
	<h2>공지 상세보기</h2>
	<a href="${pageContext.request.contextPath }/home" class="button" >홈으로</a>
	<a href="${pageContext.request.contextPath }/logout" class="button" >로그아웃</a>
		<table  class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
			<tr>
				<th width="10%">번호</th>
				<th width="30%">제목</th>
				<th width="30%">내용</th>
				<th width="20%">작성일</th>
				
			</tr>
			<tr>
				<td>${ resultNotice.getNoticeNo()}</td>
				<td>${ resultNotice.getNoticeTitle()}</td>
				<td>${ resultNotice.getNoticeContent()}</td>
				<td>${ resultNotice.getCreatedate()}</td>
			</tr>
		</table>
		<h4> 댓글</h4>
		<table class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
			<tr>
				<th width="5%">댓글 번호</th>
				<th width="30%">댓글 내용</th>
				<th width="5%">댓글 수정</th>
				<th width="5%">댓글 삭제</th>
			</tr>
			<c:forEach var="c" items="${com}">
		<c:choose>
		<c:when test="${c.isSecret =='N' }">
			<tr>
				<td>${c.getCommentNo()}</td>
				<td>${c.getCommentContent()}</td>
				<td><a href="${pageContext.request.contextPath}/updateComment?commentNo=${c.getCommentNo()}&noticeNo=${ resultNotice.getNoticeNo()}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/deleteComment?commentNo=${c.getCommentNo()}&noticeNo=${ resultNotice.getNoticeNo()}">삭제</a></td>
			</tr>
			</c:when>
			<c:when test="${c.isSecret =='Y' &&(Member.getMemberId() == c.getMemberId()  || Member.getMemberLevel() > 0)}">
			<tr>
				<td>${c.getCommentNo()}</td>
				<td>${c.getCommentContent()}</td>
				<td><a href="${pageContext.request.contextPath}/updateComment?commentNo=${c.getCommentNo()}&noticeNo=${ resultNotice.getNoticeNo()}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/deleteComment?commentNo=${c.getCommentNo()}&noticeNo=${ resultNotice.getNoticeNo()}">삭제</a></td>
			</tr>
			</c:when>
			<c:when test="${c.isSecret =='Y' }">
			<tr>
			<td>${c.getCommentNo()}</td>
			<td>비밀 댓글 입니다.</td>
			<td></td>
			<td></td>
			</tr>
			</c:when>
		</c:choose>
			</c:forEach>

		</table>

		<h1> 댓글 추가하기</h1>
			<form action="${pageContext.request.contextPath}/addComment" method="post" >
			<input type="hidden" name="noticeNo" value="${ resultNotice.getNoticeNo()}">
				<table>
						<tr >
						<td><textarea rows="5" cols="258"  name="commentContent"></textarea></td>
						</tr>	
						<tr>
							<td>비밀글 여부: <select class="form-select" name="isSecret">
							<option value="Y">Y</option>
           				    <option value="N">N</option>
							</select></td>
						</tr>
						
				</table>
				<button class="button"> 추가</button>
			</form>

</body>
</html>