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
<title>댓글 수정</title>
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
	<h1 >댓글 수정</h1>
		<table  class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
			<tr>
				<th>댓글 번호</th>
				<th>현재 내용</th>
			</tr>
			<tr>
				<td>${resultC.getCommentNo()}</td>
				<td>${resultC.getCommentContent()} </td>
			</tr>
		</table>
		<form method="post">
		<table  class="table table-bordered" style = "table-layout: auto; width: 100%; height: 100%;table-layout: fixed;">
				<tr>
					<th>댓글 번호</th>
					<th>내용 수정</th>
				</tr>
				<tr>
					<td>${resultC.getCommentNo()}</td>
				   <td><textarea  name="commentContent"></textarea></td>
				</tr>
				<input type="hidden"  name="noticeNo"  value="${resultC.getNoticeNo()}">
		</table>
		<button  class="button">수정</button>
		</form>
</body>
</html>