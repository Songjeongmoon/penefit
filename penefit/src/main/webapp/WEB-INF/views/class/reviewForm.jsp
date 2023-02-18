<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
    <style>
 .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
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
    width: 0 ;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
    </style>
</head>
<body>
	<table>
		<tr>
			<th>클래스 제목</th>
			<td>${classinfo.class_subject }</td>
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
			<th>수강후기</th>
			<td><textarea name="review_content" id="review_content"></textarea></td>
		</tr>
		<tr>
			<th>점수</th>
			<td>
				
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${member_id }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="등록" id="regbtn"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="돌아가기"
				onclick="history.back()"></td>
		</tr>
	</table>
<span class="star">
    ★★★★★
    <span>★★★★★</span>
    <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
  </span>
  
	<script>
		let class_code = "${classinfo.class_code}";
		$("#regbtn").click(
				function() {
						let score = document.querySelector(".star span").clientWidth/32;
						alert(score);
						let review_content = $("#review_content").val();
						location.href = "reviewList?review_content="
							+ review_content + "&class_code=" + class_code + "&score=" + score;
				
				});
		
		const drawStar = (target) => {
			
			const v = target.value * 10;
			const v2 = v + "%";
			  $('.star span').css("width", v2);
			}
	
	</script>
</body>
</html>