<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>QnA 수정 View</h3>
<form action="qna_ModiDo" method="post">
	<div>
		  <input type="hidden" name="qna_num" value="${qvo.qna_num }">
	제목 : <input type="text" name="qna_title" value="${qvo.qna_title }"><br>
	내용 : <input type="text" name="qna_content" value="${qvo.qna_content }">
	</div>
	<div>
	 <input type="submit" value="수정">
	</div>
</form>	
</body>
</html>