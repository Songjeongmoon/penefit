<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">문의</li>
					<li class="aside_menu"><a href="#">FAQ</a></li>
					<li class="aside_menu"><a href="QnA">Q&A</a></li>				
				</ul>
			</aside>

			<div class="content">
				<h1>Q&A</h1>
				<div align="right">
				<button type="button" onclick="location.href='QnARegView'">글쓰기</button>
				</div>
				
				<table id="qna_tbl">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					
						<c:forEach var="qlist" items="${qlist }">
						<tbody>
							<tr>
								<td>${qlist.qna_num }</td>
								<td><a href="qna_detail?qna_num=${qlist.qna_num }">${qlist.qna_title }</a></td>
								<td>${qlist.member_id }</td>
								<td>${qlist.qna_regdate }</td>
							</tr>
						</tbody>
						</c:forEach>
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