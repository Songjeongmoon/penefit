<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix=c uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 상세목록</h1>
<form action="noticeOne.do" method="post">
<table border="1">
<tr>
	<th>작성자</th><td>${member_id }</td>
</tr>
<tr>
	<th>제목</th><td>${board_title }</td>
</tr>
<tr>
	<th>내용</th><td>${board_content }</td>
</tr>
<tr>
	<th>작성일</th><td>${board_regdate }</td>
</tr>

<tr>
	<th>조회수</th><td>${board_viewcnt }</td>
</tr>
</table>
<button type="submit" onclick="location.href='###'">수정</button>
<button type="button" onclick="location.href='@@@'">삭제</button>
<button type="button" onclick="location.href='&&&'">목록</button>
</form>
</body>
</html>