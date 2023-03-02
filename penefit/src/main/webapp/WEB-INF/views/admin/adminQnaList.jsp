<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<h1>adminQnaList</h1>
<hr>
<table>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>상태</th>
	<th>등록일</th>
</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_num }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_title }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_status }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_regdate }</a></td>
	</tr>
</c:forEach>
</table>



</body>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<h1>adminQnaList</h1>
<hr>
<table>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>상태</th>
	<th>등록일</th>
</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_num }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_title }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_status }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_regdate }</a></td>
	</tr>
</c:forEach>
</table>



</body>
>>>>>>> branch 'master' of https://github.com/Songjeongmoon/penefit.git
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<h1>adminQnaList</h1>
<hr>
<table>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>상태</th>
	<th>등록일</th>
</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_num }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_title }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_status }</a></td>
		<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_regdate }</a></td>
	</tr>
</c:forEach>
</table>



</body>
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git
>>>>>>> branch 'master' of https://github.com/Songjeongmoon/penefit.git
</html>