<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style>
h1 {
text-align: center;
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
					<li class="aside_menu"><a href="notice">공지사항</a></li>
					<li class="aside_menu"><a href="#">수강후기</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
					<li class="aside_menu"><a href="classList_new">클래스별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
			<h2>공지사항 상세목록</h2>
			<form action="noticeOne.do" method="post">

				<table border="1">
				
					<tr>
						<th>번호</th><td>${nvo.notice_num }</td>
					</tr>
					<tr>
						<th>작성자</th><td>${nvo.member_id }</td>
					</tr>
					<tr>
						<th>제목</th><td>${nvo.notice_title }</td>
					</tr>
					<tr>
						<th>내용</th><td>${nvo.notice_content }</td>
					</tr>
					<tr>
						<th>작성일</th><td>${nvo.notice_regdate }</td>
					</tr>

					<tr>
						<th>조회수</th><td>${nvo.notice_viewcnt }</td>
					</tr>
				</table>

				<input type="hidden" name="notice_num" value="${nvo.notice_num}">

				<c:if test ="${sessionScope.member_id == nvo.member_id }">
					<button type="button" onclick="location.href='notice_modiView?notice_num=${nvo.notice_num }'">수정</button>
					<button type="button" onclick="location.href='delNotice?notice_num=${nvo.notice_num }'">삭제</button>
				</c:if>
					<button type="button" onclick="location.href='notice'">목록</button>
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
	<script type="text/javascript" src="/js/javascript.js"></script>
</body>
</html>