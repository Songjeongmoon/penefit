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
.mypageTitle {
	text-align: center;
	margin-bottom: 10PX;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">마이페이지</li>
					<li class="aside_menu" id="myinfoLabel">내 정보</li>
					<li class="aside_menu" id="myHistoryLabel"><a href="#">구매내역</a></li>
					<li class="aside_menu" id="aside_menu_btn">나의 클래스
						<div id="aside_submenu">
							<p id="mySuggestLabel">&nbsp;&nbsp;제안내역</p>
							<p>
							<p id="myClassLabel">&nbsp;&nbsp;클래스내역</p>
							<p>
							<p>&nbsp;&nbsp;추가?</p>
						</div>
					</li>
					<li class="aside_menu" id="myInquiryLabel">나의 문의내역</li>
				</ul>

			</aside>
			<div class="content" id="myinfo">
				<h3 class="mypageTitle">[마이페이지]</h3>
			</div>
			<div class="content" id="purchaseHistory">
				<h3 class="mypageTitle">[구매내역]</h3>
				<table border="1">
					<thead>
						<tr>
							<th>구매일자</th>
							<th>구매번호</th>
							<th></th>
							<th>구매일자</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="content" id="myClassSuggest">
				<h3 class="mypageTitle">[클래스제안내역]</h3>
			</div>
			<div class="content" id="myClassList">
				<h3 class="mypageTitle">[나의클래스]</h3>
			</div>
			<div class="content" id="myInquiry">
				<h3 class="mypageTitle">[문의내역]</h3>
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
		//메뉴선택시 내용 div display 설정
		$(document).ready(function() {
			$(".content:not(#myinfo)").css("display", "none");
			$("#myinfo").css("display", "block");
		});
		$("#myinfoLabel").click(function() {
			$(".content:not(#myinfo)").css("display", "none");
			$("#myinfo").css("display", "block");
		});
		$("#myHistoryLabel").click(function() {
			$(".content:not(#purchaseHistory)").css("display", "none");
			$("#purchaseHistory").css("display", "block");
		});
		$("#myInquiryLabel").click(function() {
			$(".content:not(#myInquiry)").css("display", "none");
			$("#myInquiry").css("display", "block");
		});
		$("#mySuggestLabel").click(function() {
			$(".content:not(#myClassSuggest)").css("display", "none");
			$("#myClassSuggest").css("display", "block");
		});
		$("#myClassLabel").click(function() {
			$(".content:not(#myClassList)").css("display", "none");
			$("#myClassList").css("display", "block");
		});
	</script>
</body>
</html>