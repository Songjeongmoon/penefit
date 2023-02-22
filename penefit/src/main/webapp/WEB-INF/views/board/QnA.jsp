<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
</head>

<style>
input[type='text'] {
	width: 400px;
}

textarea {
	width: 400px;
	height: 300px;
}
table{
	margin: 0 auto;
	position: relative;
	right : 40px;
	box-shadow: 3px 3px 3px 3px #DBD5CB;
	border-radius: 7px;
}
}
#table tr, th, td {
	border-radius: 7px;
	border: 1px solid #BBB09F;
}

tbody th {
	width: 150px;
	text-align: center;
}
tbody td {
	text-align: center;
	padding: 10px;
}
input[type='submit']{
	background-color: #75BD43;
	font-size: 25px;
	color: white;
	width: 200px;
	height: 40px;
	border : none;
	border-radius: 7px;
	box-shadow: 3px 3px 3px 3px #DBD5CB;
	margin: 10px 0;
}
</style>
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
				<h2>Q&A 게시판</h2>
				<form action="/board/qnaForm" method="post">
					<table id="table">
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
							<td><input type="text" name="member_id"
								value="${member_id }" readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="등록"></td>
						</tr>
					</table>
				</form>

			</div>
		</section>
	</div>
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