<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<style>
#city_tbl th, tr, td {
	border: 1px solid black;
}

#city_box1 {
	display: block;
}

#city_box2 {
	display: none;
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
					<li class="aside_menu"><a href="reViewBoard">수강후기</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
					<li class="aside_menu"><a href="classList_new">클래스별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
				<h3>지역별 게시판</h3>
				<!-- 1. 이동 버튼이 있어야함 -->
				<select id="sel" name="sel">
					<option value="All">전체</option>
					<option value="A">서울</option>
					<option value="B">경기</option>
					<option value="C">인천</option>
					<option value="D">강원</option>
					<option value="E">충남</option>
					<option value="F">대전</option>
					<option value="G">충북</option>
					<option value="H">부산</option>
					<option value="I">울산</option>
					<option value="J">대구</option>
					<option value="K">경북</option>
					<option value="L">경남</option>
					<option value="M">전남</option>
					<option value="N">광주</option>
					<option value="O">전북</option>
					<option value="P">제주</option>
					<option value="Z">온라인</option>
				</select>

				<button type="button" id="check_city" onclick="one_City()">선택</button>
				&nbsp;&nbsp;&nbsp; <input type="text" name="keyword" id="keyword"
					placeholder="제목을 입력하세요..."> <input type="button" value="검색"
					id="searchBtn" onclick="search_city()">

				<div align="right">
					<button type="button" onclick="location.href='city_regView'">글쓰기</button>
				</div>


				<div id="citybox1">
					<table border="1" id="city_tbl">
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
						<!--tbody에 내용물이 바뀌는것 -->
						<tbody id="tbody1">

						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		});
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		});
		

		<!-- 2. 이동버튼을 클릭했을때, 선택된 값을 받아와야해 -->
		all_City();
		
		
		function all_City(){
			
			const tbody = document.querySelector("#tbody1");
			$("tbody").empty();
			 
	        const xhttp = new XMLHttpRequest();
	        xhttp.onload = function() {

	        	
	           let data = this.responseText;
	           let obj = JSON.parse(data);
	         
	            for (let i = 0; i < obj.length; i++) {
	               tbody.innerHTML += "<tr><td>" + obj[i].board_num 
	               					+"</td><td>" +obj[i].city_name 
	                     			+ "</td><td><a href='city_detail?board_num="+obj[i].board_num+"'>"+ obj[i].board_title  
	                     			+"</td><td>" + obj[i].member_id  
	                     			+"</td><td>" + obj[i].board_viewcnt  
	                     			+"</td><td>" + obj[i].board_regdate + "</td><tr>"
               
	            }
	         }
	         xhttp.open("GET","/api/cityBoard/");
	         xhttp.send();
	    }
	
		function one_City(){
			$("#city_box1").css("display","none");
			$("#city_box2").css("display","block");
			const check_city = document.querySelector("select").value;
			if(check_city == "All"){
				all_City();
				return false;
			}
			const tbody = document.querySelector("#tbody1");
			 tbody.replaceChildren();
	         const xhttp = new XMLHttpRequest();
	         xhttp.onload = function() {

	            let data = this.responseText;

	            let obj = JSON.parse(data);

	            for (let i = 0; i < obj.length; i++) {
	               tbody.innerHTML += "<tr><td>" + obj[i].board_num
	               					+ "</td><td>"+ obj[i].city_code
	               				 	+ "</td><td><a href='city_detail?board_num="+obj[i].board_num+"'>"+ obj[i].board_title
	                     			+ "</a></td><td>" + obj[i].member_id  
	                   	 		 	+ "</td><td>" + obj[i].board_viewcnt
	                     			+ "</td><td>" + obj[i].board_regdate + "</td><tr>";     
	             
	            }
	         }
	         xhttp.open("GET","/api/oneCityBoard?check_city=" +check_city);
	         xhttp.send();
	    }
		
		//const obj = document.querySelector().val;
		
  function search_city(){
            
            $("#tbody1").empty();         
            const citysel= $("select[name='sel']").val();
               const keyword= $("#keyword").val();
          
                    $.ajax({
                       url: "/board/citySearch",
                       method: "GET",
                       data : {
                          citysel : citysel,
                          keyword : keyword
                       },
                       success:function(data){
                              for(let i=0 ; i<data.length ; i++){
                                  $("#tbody1").append("<tr><td>" + data[i].board_num +
                                                 "</td><td>" + data[i].city_code +
                                                 "</td><td>" + data[i].board_title +
                                                 "</td><td>" + data[i].member_tel +
                                                 "</td><td>" + data[i].board_content +
                                                 "</td><td>" + data[i].member_id +
                                                 "</td><td>" + data[i].board_viewcnt +
                                                 "</td><td>" +data[i].board_regdate + 
                                                 "</td></tr>"
                                                 )
                                alert(data);
                             }
                       },
                       error : () => {
                          alert("error");
                       }
                       });
             }
             
	</script>

</body>
</html>