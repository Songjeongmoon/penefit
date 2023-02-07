<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="board/notice">공지사항</a></li>
					<li class="aside_menu"><a href="#">수강후기</a></li>
					<li class="aside_menu"><a href="#">지역별게시판</a></li>
					<li class="aside_menu"><a href="board/ClassList">클래스별게시판</a></li>
				</ul>
			</aside>
		</section>
	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>