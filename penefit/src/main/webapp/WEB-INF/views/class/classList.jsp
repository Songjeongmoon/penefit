<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
								<ul>
					<li class="aside_title">클래스</li>
					<li class="aside_menu"><a href="/class/classList">클래스 전체보기</a></li>
					<li class="aside_menu"><a href="/class/classList-ongoing">진행중인클래스</a></li>
					<li class="aside_menu" id="aside_menu_btn">카테고리별 클래스
						<div id="aside_submenu">
							<p>
								<a href="classList-category?key=A">&nbsp;&nbsp;의류</a>
							</p>
							<p>
								<a href="classList-category?key=B">&nbsp;&nbsp;식품</a>
							</p>
							<p>
								<a href="classList-category?key=C">&nbsp;&nbsp;미용</a>
							</p>
							<p>
								<a href="classList-category?key=D">&nbsp;&nbsp;기타</a>
							</p>
						</div>
					</li>
					<li class="aside_menu"><a href="/class/classList-new">신규 클래스</a></li>
					<li class="aside_menu"><a href="/class/classList-expired">지난클래스</a></li>
					<li class="aside_menu"><a href="/class/suggestion">클래스제안</a></li>
				</ul>

			</aside>
			<div class="content" id="listBox">
				<c:forEach var="c" items="${list }" varStatus="status">
					<div class="class_one">
						<a href="class-detail?class_code=${c.class_code }"><img
							src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a>
					<br><br>
						<p>
							<a href="class-detail?class_code=${c.class_code }">${c.class_subject }</a>
						</p>
						<p>${c.class_price } 원</p>
						<p>${c.class_teacher }</p>
					</div>
				</c:forEach>
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