<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("member_id", "eseo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>QnA 글등록</h2>
${member_id }님
<form action="QnARegDo" method="post">

	
	<div>
        <strong>작성자</strong>
     	<div><input type="text" name="member_id" value="${member_id }"></div>
    </div>
	<div>
		<strong>제목</strong>
		<div><input type="text" name="qna_title"></div>
    </div>
    <div>
        <strong>내용</strong>
     	<div><input type="text" name="qna_content"></div>
    </div>
	<div>
		<input type="submit" value="등록">
	</div>

</form>
</body>
</html>
