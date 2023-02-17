<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">문의</li>
					<li class="aside_menu"><a href="FAQ">FAQ</a></li>
					<li class="aside_menu"><a href="QnA">Q&A</a></li>
				</ul>
			</aside>

			<div class="content">
				<h1>Q&A 게시판</h1>
				<form action="/qnaForm" method="post">
					<table border="1">
						<tr>
							<th>제목</th>
							<td><input type="text" name="qna_title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="qna_content"></textarea></td>
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

			</div>
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		$("#aside_menu_btn").mouseover(function() {
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			$("#aside_submenu").css("display", "none");
		})
	</script>

</body>
</html>