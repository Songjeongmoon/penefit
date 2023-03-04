<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<style>
.content {
	margin: 0 atuo;
}
h2{
	text-align: center;
	font-size: 35px;
	margin-bottom: 20px;
}
#cityDetailTbl {
	margin: 0 auto;
	width: 700px;
	border-collapse: collapse;
}

hr {
	border: thin solid #DBD5CB;
}

#cityDetailTbl tr {
	height: 35px;
}

#cityDetailTbl th, td, tr {
	border-bottom: thin solid #DBD5CB;
}

button, input[type='button'], input[type='submit'] {
	background-color: #75BD43;
	border: none;
	color: white;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 70px;
	height: 33px;
	line-height: 35px;
	border-radius: 7px;
	margin: 5px;
}

textarea {
	margin: 0 auto;
	width: 80%;
	height: 100px;
	border: thin solid #DBD5CB;
	border-radius: 7px;
	padding: 5px;
}

.reply_container {
	margin: 0 auto;
	text-align: center;
}

.reply_List table {
	width: 800px;
	margin: 0 auto;
	border-collapse: collapse;
	border-bottom: thin solid #DBD5CB;
}

.reply_List table th{
background-color:#BBB09F;


}
.container{
	width: 600px;
	margin: 0 auto;
	text-align: center;
}
input[type='text']{
	width: 600px;
	height: 30px;
}
strong{
	float: left;
	margin: 5px;
}
textarea{
	width: 590px;
}
</style>
<link rel="stylesheet" href="/css/">

<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="notice">공지사항</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
				</ul>


			</aside>
			<div class="content">
				<h2>지역별 게시판</h2>
					<form method="post" action="city_modi.do" style="margin: 0 auto;">
					<div class="container">

						<div>
							<div>
								<input type="hidden" name="board_num" value="${cvo.board_num}">
							</div>
						</div>

						<div>
							<strong>작성자</strong>
							<div>
								<input type="text" name="member_id" value="${cvo.member_id}"
									readonly="readonly">
							</div>
						</div>

						<div>
							<strong>제목</strong>
							<div>
								<input type="text" name="board_title" value="${cvo.board_title}">
							</div>
						</div>

						<div>
							<strong>내용</strong>
							<div>
								<textarea name="board_content">${cvo.board_content }</textarea>
							</div>
						</div>
						<div>
							<input type="submit" id="modibtn" value="수정">
						</div>
					</div>
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