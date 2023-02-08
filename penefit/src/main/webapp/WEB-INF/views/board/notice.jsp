<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
#aside_submenu {
	display: none;
	width: 100px;
}

#notice_tbl {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	width: 700px;
	text-align: center;
}

#notice_tbl th, tr, td{
	border: 1px solid black;
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
					<li class="aside_menu" id="aside_menu_btn">수강후기</li>
					<li class="aside_menu"><a href="#">지역별게시판</a></li>
					<li class="aside_menu"><a href="classList_new">클래스별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
				<h1>공지사항 페이지(하는 중...)</h1>
				<table id="notice_tbl">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nlist" items="${nlist }">
							<tr>
								<td>${nlist.board_num }</td>
								<td><a href="notice_detail?board_num=${nlist.board_num }">${nlist.board_title }</a></td>
								<td>${nlist.member_id }</td>
								<td>${nlist.board_regdate }</td>
								<td>${nlist.board_viewcnt }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
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