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
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="notice">공지사항</a></li>
					<li class="aside_menu"><a href="#">수강후기</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
					<li class="aside_menu"><a href="classList_new">클래스별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
				<form action="city_modi.do" method="post">
					<div class="container">

						<div>
							<div>
								<input type="hidden" name="board_num" value="${cvo.board_num}">
							</div>
						</div>

						<div>
							<strong>작성자</strong>
							<div>
								<input type="text" name="member_id" value="${cvo.member_id}"
									readonly="readonly">
							</div>
						</div>

						<div>
							<strong>제목</strong>
							<div>
								<input type="text" name="board_title" value="${cvo.board_title}">
							</div>
						</div>

						<div>
							<strong>내용</strong>
							<div>
								<input type="text" name="board_content" value="${cvo.board_content }">
							</div>
						</div>
						<div>
							<input type="submit" value="수정">
						</div>
					</div>
				</form>

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
</body>
</html>