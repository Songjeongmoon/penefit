<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style>
#noticeTbl {
	margin: 0 auto;
	border-collapse: collapse;
}

#noticeTbl th {
	width: 200px;
	background-color: #F0EEED;
}
#noticeTbl td{
	width: 400px;
	height : 35px;
	padding-left: 20px;
}
#noticeTbl tr {
	height: 35px;
}

#noticeTbl tr, td, th {
	border-bottom: thin solid #DBD5CB;
}

button {
	background-color: #AACD6E;
	border: none;
	color: white;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 70px;
	height: 33px;
	line-height: 35px;
	border-radius: 7px;
	margin: 20px;
}
#modal{
	width: 600px;
	height: 500px;
	position: absolute;
	background-color: pink;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="/board/notice?pageNum=1&start=1">공지사항</a></li>
					<li class="aside_menu"><a href="/board/cityBoardview?pageNum=1&start=1">지역별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
				<h2>공지사항</h2>
				<form action="noticeOne.do" method="post">
					<table id="noticeTbl">


						<tr>
							<th>번호</th>
							<td>${nvo.notice_num }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${nvo.member_id }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${nvo.notice_title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${nvo.notice_content }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${nvo.notice_regdate }</td>
						</tr>

						<tr>
							<th>조회수</th>
							<td>${nvo.notice_viewcnt }</td>
						</tr>
					</table>
					<div style="margin: 0 auto; text-align: center;">
						<input type="hidden" name="notice_num" value="${nvo.notice_num}">

						<c:if test="${sessionScope.member_id == nvo.member_id }">
						</c:if>
						<button type="button" onclick="location.href='notice?pageNum=1&start=1'">목록</button>
						
						
					</div>
				</form>
			</div>

		</section>
	</div>

	<script>
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		})
	</script>
</body>
</html>