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
h2{
	text-align: center;
}
table{
	width: 1000px;
	margin: 0 auto;
}
.cart_img{
	width: 100px;
	height: 100px;
}
.delete_img{
	width: 30px;
	height: 30px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="box">
		<section>
			<h2>장바구니</h2>
			<div>
				<table border="1">
					<thead>
						<tr>
							<th>순서</th>
							<th>체크박스</th>
							<th>클래스사진</th>
							<th>클래스명</th>
							<th>강사명</th>
							<th>일시</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.shopping_cart_num }</td>
							<td><input type="checkbox"></td>
							<td><a href="class-detail?class_code=${list.class_code }"><img src="../images/${list.class_photo }" class="cart_img"></a></td>
							<td><a href="class-detail?class_code=${list.class_code }">${list.class_subject }</a></td>
							<td><a href="classList-search?keyword=${list.class_teacher }">${list.class_teacher }</a></td>
							<td>${list.class_day } <br>
								${list.class_time }</td>
							<td><a href="#"><img src="../images/delete.png" class="delete_img"></a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>