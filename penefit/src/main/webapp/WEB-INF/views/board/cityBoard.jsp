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
					<li class="aside_menu"><a href="reViewBoard">수강후기</a></li>
					<li class="aside_menu"><a href="#">지역별게시판</a></li>
					<li class="aside_menu"><a href="classList_new">클래스별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
				<h3>지역별 게시판</h3>
				<select name="sel">
					<option value="cityA">서울</option>
					<option value="cityB">경기</option>
					<option value="cityC">인천</option>
					<option value="cityD">강원</option>
					<option value="cityE">충남</option>
					<option value="cityF">대전</option>
					<option value="cityG">충북</option>
					<option value="cityH">부산</option>
					<option value="cityI">울산</option>
					<option value="cityJ">대구</option>
					<option value="cityK">경북</option>
					<option value="cityL">경남</option>
					<option value="cityM">전남</option>
					<option value="cityN">광주</option>
					<option value="cityO">전북</option>
					<option value="cityP">제주</option>
					<option value="cityZ">온라인</option>
				</select>
				<input type="text" name="searchReview" id="searchReview">
				<input type="button" value="검색" id="searchBtn">
				
				<div align="right">
				<button type="button" onclick="location.href='city_regView'">글쓰기</button>
				</div>
				  <table border="1">
      				<thead>
        				 <tr>
        				 	<th>번호</th>
           					<th>지역</th>
            				<th>제목</th>
            				<th>작성자</th>
            				<th>조회수</th>
            				<th>등록일</th>
        				 </tr>
      				</thead>
      				<tbody>
       				  

      				</tbody>
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
				
				
				
				
				
				
				
				
				
				
				
			</div>
</body>
</html>