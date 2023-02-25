<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>adminQnaDetail</h1>
	<hr>
	<table>
		<tr>
			<th>Qna번호</th>
			<td>${qna.qna_num }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${qna.qna_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${qna.qna_content }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${qna.member_id }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${qna.qna_regdate }</td>
		</tr>
		<tr>
			<th>답변</th>
			<td><textarea name="adminReply">${reply }</textarea></td>
		</tr>
		<tr>
			<td>
				<c:if test="${qna.qna_status =='답변대기'}">
					<input type="button" id="qnaReplyBtn" value="답변등록">
				</c:if>
				<c:if test="${qna.qna_status =='답변완료'}">
					<input type="button" value="답변완료">
				</c:if>
			</td>
		</tr>
	</table>


	<script>
		$("#qnaReplyBtn").click(function() {
			var form = document.createElement('form');

			var obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'content');
			obj1.setAttribute('value', $("textarea").val());
			form.appendChild(obj1);

			var obj2;
			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'adminid');
			obj2.setAttribute('value', '${member_id}');
			form.appendChild(obj2);

			var obj3;
			obj3 = document.createElement('input');
			obj3.setAttribute('type', 'hidden');
			obj3.setAttribute('name', 'qnanum');
			obj3.setAttribute('value', '${qna.qna_num}');
			form.appendChild(obj3);

			form.setAttribute('method', 'post');
			form.setAttribute('action', "/admin/qnaReplyvalue");
			document.body.appendChild(form);
			form.submit();

		});
	</script>
</body>
</html>