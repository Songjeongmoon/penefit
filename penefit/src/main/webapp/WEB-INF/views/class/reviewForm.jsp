<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#reviewtbl{
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	border-radius : 7px;
	padding :10px;
	margin: 0 auto;
	width: 600px;
}
#reviewtbl td{
	height: 40px;
}
#reviewtbl td{
	width: 100px;
}
.star {
	position: relative;
	color: #ddd;
}
textarea{
	width: 300px;
	height: 200px;	
}
.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}
.button{
	width: 200px;
	height: 40px;
	border: none;
	border-radius: 7px;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	margin: 5px;
}
#regbtn{
	background-color: #75BD43;
}
</style>
<link rel="stylesheet" href="/css/style.css">

</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<h2>리뷰작성</h2>
				<form action="/class/reviewList" method="post" enctype="multipart/form-data" id="reviewForm">
					<table id="reviewtbl">
						<tr>
							<th>클래스 제목</th>
							<td>${classinfo.class_subject }<input type="hidden" value="${classinfo.class_code }" name="class_code">
							<input type="hidden" value="${buy_history_num }" name="buy_history_num"></td>
						</tr>
						<tr>
							<th>강사</th>
							<td>${classinfo.class_teacher }</td>
						</tr>
						<tr>
							<th>강의시간</th>
							<td>${classinfo.class_date }</td>
						</tr>
						<tr>
							<th>사진</th>
							<td><input type="file" name="file" multiple="multiple" onchange="checkSize(this)"></td>
						</tr>
						<tr>
							<th>수강후기</th>
							<td><textarea name="review_content" id="review_content"></textarea></td>
						</tr>
						<tr>
							<th>점수</th>
							<td><span class="star"> ★★★★★ 
							<span>★★★★★</span> 
							<input type="range" id="stars" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
							</span><span id="val"></span></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="member_id" value="${member_id }" readonly="readonly"></td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input type="submit" value="등록" id="regbtn" class="button" onclick="getScore()"></td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input type="button" value="돌아가기" class="button" onclick="history.back()"></td>
						</tr>
					</table>

				</form>



		</section>
	</div>
	<script>
	let class_code = "${classinfo.class_code}";
	function getScore(){
		let score = document.querySelector(".star span").clientWidth/32;
		alert(score);
		$("#val").html("<input type='hidden' value='"+ score+"' name='score' >")
			
	}
		
	
	const drawStar = (target) => {
		const v = target.value * 10;
		const v2 = v + "%";
		  $('.star span').css("width", v2);
		}

	</script>
</body>
</html>