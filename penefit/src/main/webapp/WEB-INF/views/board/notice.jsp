<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style>
#aside_submenu {
	display: none;
	width: 100px;
}

h2 {
	text-align: center;
}

#notice_tbl {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	width: 700px;
	text-align: center;
}

#notice_tbl {
	text-align: center;
	width: 950px;
	margin: 0 auto;
	border-collapse: collapse;
	border-bottom: 2px solid black;
}

#notice_tbl th {
	background-color: black;
	color: white;
}

#notice_tbl tr {
	border-bottom: thin solid black;
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
				<h2>공지사항</h2>
				<table id="notice_tbl">
					<thead>
						<tr>
							<th>번호</th>
							<th style="width: 250px;">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nlist" items="${nlist }">
							<tr>
								<td>${nlist.notice_num }</td>
								<td><a href="notice_detail?notice_num=${nlist.notice_num }">${nlist.notice_title }</a></td>
								<td>${nlist.member_id }</td>
								<td>${nlist.notice_regdate }</td>
								<td>${nlist.notice_viewcnt }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징징징 -->
				<div class="container mt-3">
					<h2>Pagination</h2>

					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
						<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
					</ul>

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
		
		
		
		$(".page-item").on("click", function(e){
			alert("누름!");
			alert($(".page-item").val());
			
		function getPagingList() {
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				let obj = JSON.parse(data);
				
				for (let i = 0; i < 5; i++) {
					
					+="<tr><td>" + notice_num
					+"</td><td>" + notice_title 
					+"</td><td>" + notice	
					
				}
			}
			xhttp.open("GET", " ", true);
			xhttp.send();
		}
		
		$(".page-item").on("click", function(e){
			
			let reply_num = evt.target.parentElement.parentElement.children[0].children[0].value;
			delReply(reply_num);
		
		})	
		
			
			
			

			
			
		});
	</script>

	<script type="text/javascript" src="/js/javascript.js"></script>
</body>
</html>