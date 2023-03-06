<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#listBox{
	display:relative;
}

.pageBox{
	margin:0 auto;
	position:absolute;
	top : 720px;
	left : 450px;
	
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
					<li class="aside_menu"><a href="/class/classList?pageNum=1&start=1">클래스
							전체보기</a></li>
					<li class="aside_menu"><a
						href="/class/classList-ongoing?pageNum=1&start=1">진행중인클래스</a></li>
					<li class="aside_menu" id="aside_menu_btn">카테고리별 클래스
						<div id="aside_submenu">
							<p>
								<a href="classList-category?key=A&pageNum=1&start=1">&nbsp;&nbsp;의류</a>
							</p>
							<p>
								<a href="classList-category?key=B&pageNum=1&start=1">&nbsp;&nbsp;식품</a>
							</p>
							<p>
								<a href="classList-category?key=C&pageNum=1&start=1">&nbsp;&nbsp;미용</a>
							</p>
							<p>
								<a href="classList-category?key=D&pageNum=1&start=1">&nbsp;&nbsp;기타</a>
							</p>
						</div>
					</li>
					<li class="aside_menu"><a href="/class/classList-new">신규
							클래스</a></li>
					<li class="aside_menu"><a
						href="/class/classList-expired?pageNum=1&start=1">지난클래스</a></li>
					<li class="aside_menu"><a href="/class/suggestion">클래스제안</a></li>
				</ul>

			</aside>
			<input type="hidden" id="startPage" value="${startNum}"> <input
				type="hidden" id="maxPage" value="${count }">
			<div class="content" id="listBox">
			
			<c:set var="start" value="${pstart }" />
				<c:set var="end" value="${pstart + 4 }" />

				<c:if test="${count % 8 gt 0 }">
					<c:set var="count" value="${count / 8 + 1 }" />
				</c:if>

				<c:if test="${count % 8 eq 0 }">
					<c:set var="count" value="${count / 8 }" />
				</c:if>
				<c:forEach var="c" items="${list }">
					<div class="class_one">
						<a href="class-detail?class_code=${c.class_code }"><img
							src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a> <br>
						<hr>
						<br>
						<p>
							<a href="class-detail?class_code=${c.class_code }">${c.class_subject }</a>
						</p>
						<p>${c.class_price }</p>
						<p>${c.class_teacher }</p>
					</div>

				</c:forEach>
			 
				<div class="pageBox">
					<c:if test="${start ne 1 }">
						<a href="/class/classList-category?key=${key }&pageNum=${start - 5}&start=${start - 5}">[이전]</a>
					</c:if>
				<c:forEach var="pageNum" begin="${start }" end="${end }">
					<c:if test="${pageNum lt count  }">
						<a href="/class/classList-category?key=${key }&pageNum=${pageNum }&start=${start}">${pageNum }</a>&nbsp;&nbsp;
              		</c:if>
				</c:forEach>
					<c:if test="${start + 5 lt count }">
						<a href="/class/classList-category?key=${key }&pageNum=${start + 5}&start=${start + 5}">[다음]</a>
					</c:if>
				</div>
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
		
// 		let startNum = "${startNum}";
// 		alert(startNum);
	
	</script>
</body>
</html>