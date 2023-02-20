<%@page import="com.penefit.moons.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<form action="notice_modi.do" method="post">
<div class="container">

		<div>
			<div><input type="hidden" name="notice_num" value="${nvo.notice_num}" ></div>
		</div>
        <div>
        	<strong>제목</strong>
            <div><input type="text" name="notice_title" value="${nvo.notice_title}"></div>
        </div>
        
        <div>
			<strong>작성자</strong>
			<div><input type="text" name="member_id" value="${nvo.member_id}" readonly="readonly"></div>
        </div>
        
        <div>
			<strong>내용</strong>
			<div><input type="text" name="notice_content" value="${nvo.notice_content }"></div>   
        </div>
        <div>
            <input type="submit" value="수정">
		</div>
</div>
</form>
</body>
</html>