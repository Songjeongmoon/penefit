<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
.class_one {
	width: 225px;
	height : 300px;
	display: inline-block;
}

.class_one img {
	width: 220px;
	height: 200px;
}

.class_one p a:nth-of-type(1) {
	font-size: 18px;
}

.class_one p:nth-of-type(2) {
	font-size: 13px;
	line-height: 0px;
}

#aside_submenu {
	display: none;
	width: 100px;
}

#aside_submenu p {
	margin: 5px 0;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">클래스</li>
					<li class="aside_menu"><a href="class/classList">클래스 전체보기</a></li>
					<li class="aside_menu" id="aside_menu_btn">카테고리별 클래스
						<div id="aside_submenu">
							<p>
								<a href="classList-category?key=CA">&nbsp;&nbsp;의류</a>
							</p>
							<p>
								<a href="classList-category?key=CB">&nbsp;&nbsp;식품</a>
							</p>
							<p>
								<a href="classList-category?key=CC">&nbsp;&nbsp;미용</a>
							</p>
							<p>
								<a href="classList-category?key=CD">&nbsp;&nbsp;기타</a>
							</p>
						</div>
					</li>
					<li class="aside_menu"><a href="#">베스트 클래스</a></li>
					<li class="aside_menu"><a href="classList-new">신규 클래스</a></li>
				</ul>

			</aside>
			<div class="content">
				<c:forEach var="c" items="${list }">
					<div class="class_one">
						<a href="class-detail?class_code=${c.class_code }"><img src="../images/${c.class_photo }"></a>
						<p>
							<a href="class-detail?class_code=${c.class_code }">${c.class_subject }</a>
						</p>
						<p>${c.class_teacher }</p>
					</div>	
				</c:forEach>
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