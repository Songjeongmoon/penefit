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
section {
	border: 1px solid blue;
}

#list_img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<c:set var="class_code" scope="page" value="${cvo.class_code }" />

	<div class="box">
		<section>
			<h2>위시리스트</h2>
			<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>클래스코드</th>
					<th>사진</th>
					<th>클래스명</th>
					<th>강사명</th>
					<th>강의일</th>
					<th>강의시간</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="w" items="${list }">
					<tr>
						<td>${w.wishlist_num }</td>
						<td>${w.class_code }</td>
						<td><img id="list_img" src="images/${w.class_photo }"></td>

						<td>${w.class_subject }</td>
						<td>${w.class_teacher }</td>
						<td>${w.class_day }</td>
						<td>${w.class_time }</td>
						<td><button type="button" class="addCart">장바구니</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
	<%@ include file="footer.jsp"%>

	<script>
		//장바구니에 담기
		$(".addCart").click(function(evt) {
			let class_code = evt.target.parentElement.parentElement.children[1].innerText;
			location.href="shoppingcart?class_code="+class_code;
		});
	</script>
</body>
</html>