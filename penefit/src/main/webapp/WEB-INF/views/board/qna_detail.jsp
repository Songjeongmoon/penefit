<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
</head>
<body>
	<h2>qna 상세</h2>

	<div class="container">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><input type="text" name="qna_num" value="${qna.qna_num }" readonly="readonly"></td>
			</tr>
			<tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_id" value="${qna.member_id }" readonly="readonly"></td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="qna_title"
					value="${qna.qna_title }"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><input type="text" name="qna_content"
					value="${qna.qna_content}"></td>
			</tr>
		</table>
	</div>

	<br>
	<br>
	<hr>
	
	<div class="reply_container">
		<div class="reply_reg">
			<textarea class="reply_content" name="reply_content"></textarea>
			<input type="button" value="등록" onclick="regReply()">
		</div>
	
		<label for="reply_list">댓글목록</label>
			<c:forEach var="rlist" items="${rlist }">
				<div>${rlist.reply_content }</div>
				<div class="reply_content">
					<div>작성자 : ${rlist.member_id }</div>
					<button type="button">삭제</button>
				</div>
			</c:forEach>
	</div>

<script>
	function regReply(){
		
		const reply_content = $(#reply_content).val();
		
		$.ajax({
			url:"/replyReg"
		})
		
		
		
	}


</script>	




</body>
</html>