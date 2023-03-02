<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<style>

#city_tbl {
	width: 900px;
	margin: 0 auto;
	position: relative;
	text-align: center;
}
#city_tbl th{
	background-color:  #DBD5CB;
	height : 35px;
}

#city_box1 {
	display: block;
}

#city_box2 {
	display: none;
}
#selectbox{
	position: relative;
	left : 75px;
	width: 900px;
	margin-bottom: 20px;
}
input[type='button'], button[type='button']{
	background-color: #75BD43;
	border : none;
	width: 50px;
	height: 35px;
	line-height: 30px;
	box-shadow : 1px 1px 1px 1px #DBD5CB;
	border-radius: 3px;
	color: white; 
	margin-right: 20px;
}
#write{
	width: 70px;
}
select{
	width: 150px;
	height: 35px;
}
#keyword{
	width: 300px;
}
h2 {
	text-align: center;
	font-size: 35px;
	margin-bottom: 20px;
	font-weight: bold;
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
               <li class="aside_menu"><a href="/board/notice?pageNum=1&start=1">공지사항</a></li>
				<li class="aside_menu"><a href="/board/cityBoardview?pageNum=1&start=1">지역별게시판</a></li>
            </ul>

			</aside>
			<div class="content">
					<h2 style="font-weight: bold;">지역별 게시판</h2>
				<div id="selectbox">
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

					<button type="button" id="check_city" onclick="one_City()">선택</button>&nbsp;&nbsp;&nbsp; 
					<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요..."> 
					<input type="button" value="검색" id="searchBtn" onclick="search_city()">
					<div style="text-align: right;">
						<button type="button" onclick="location.href='city_regView'" id="write">글쓰기</button>
					</div>
				</div>
				
				<div id="citybox1">
					<table id="city_tbl">
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
	                     			+ "</td><td style='width:400px;'><a href='city_detail?board_num="+obj[i].board_num+"'>"+ obj[i].board_title  
	                     			+"</td><td>" + obj[i].member_id  
	                     			+"</td><td>" + obj[i].board_viewcnt  
	                     			+"</td><td>" + obj[i].board_regdate + "</td><tr>"
               
	            }
	            $("tr").css("border-bottom","thin solid #BBB09F");
	            $("a").css("color","black");
	            $("a").css("text-decoration","none");
	            
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
			$("tbody").empty();
	         const xhttp = new XMLHttpRequest();
	         xhttp.onload = function() {

	            let data = this.responseText;

	            let obj = JSON.parse(data);

	            for (let i = 0; i < obj.length; i++) {
	               tbody.innerHTML += "<tr><td>" + obj[i].board_num
	               					+ "</td><td>"+ obj[i].city_name
	               				 	+ "</td><td><a href='city_detail?board_num="+obj[i].board_num+"'>"+ obj[i].board_title
	                     			+ "</a></td><td>" + obj[i].member_id  
	                   	 		 	+ "</td><td>" + obj[i].board_viewcnt
	                     			+ "</td><td>" + obj[i].board_regdate + "</td><tr>";     
	            }
	         }
	         xhttp.open("GET","/api/oneCityBoard?check_city=" +check_city);
	         xhttp.send();
	    }
		
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
                                                 "</td><td>" + data[i].city_name +
                                                 "</td><td><a href='city_detail?board_num="+data[i].board_num+"'>" + data[i].board_title +
                                                 "</td><td>" + data[i].member_id +
                                                 "</td><td>" + data[i].board_viewcnt +
                                                 "</td><td>" +data[i].board_regdate + 
                                                 "</td></tr>"
                                                 )
                               
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