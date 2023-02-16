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

.list_img {
	width: 100px;
	height: 100px;
}

table {
	width: 1200px;
}

table, tr, th, td {
	border: 1px solid black;
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
						<th>강의시간</th>
						<th>장바구니</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
		</section>
	</div>
	<%@ include file="footer.jsp"%>

	<script>
		//장바구니에 담기
		$(document).on("click",".addCart", function(evt) {
							let class_code = evt.target.parentElement.parentElement.children[1].innerText;
							location.href = "class/shoppingcart?class_code="
									+ class_code;
						});
		//위시리스트에서 삭제
		$(document).on("click",".deleteClass", function(evt) {
							let wishNum = evt.target.parentElement.parentElement.children[0].innerText;
							deleteWish(wishNum);
						});
		//위시리스트페이지에서 삭제기능
		function deleteWish(wishNum) {
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				getWishList();
			}
			xhttp.open("DELETE", "/wishlist2?wishNum=" + wishNum, true);
			xhttp.send();
		}
		getWishList();
		//위시리스트 목록
		function getWishList() {
			$("#tbody").empty();
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				let list= JSON.parse(data);
				for(let i = 0; i<list.length;i++){
					$("#tbody").append("<tr><td>"
							+ list[i].wishlist_num +"</td><td>"
							+ list[i].class_code +"</td><td>"
							+ "<a href='class/class-detail?class_code=" + list[i].class_code + "'><img class='list_img' src='images/"+list[i].suggest_photo+"'></a></td><td>"
							+ "<a href='class/class-detail?class_code=" + list[i].class_code + "'>" +list[i].class_subject+"</td><td>"
							+ "<a href='class/classList-search?keyword=" + list[i].class_teacher + "'>" + list[i].class_teacher+"</td><td>"
							+ list[i].class_date +"</td><td>"
							+ "<button type='button' class='addCart'>장바구니</button></td><td>"
							+ "<button type='button' class='deleteClass'>삭제</button></td><td>"
					);
					
				}
			}
			xhttp.open("GET", "/wishlist3", true);
			xhttp.send();
		}
		
	</script>
</body>
</html>