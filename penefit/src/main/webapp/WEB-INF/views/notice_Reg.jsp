<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 공지사항 등록페이지 도착</h1>
	${member_id }님
	<form action="/notice_reg.do" method="post">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="notice_title"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><input type="text" name="notice_content"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_id" value="${member_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>

		</table>
	</form>
</body>
</html>