<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대시보드</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        google.charts.setOnLoadCallback(drawChart1);
        function drawChart() {
          const xhttp = new XMLHttpRequest();
          let obj;
          xhttp.onload = function () {
            let data1 = this.responseText;
            obj = JSON.parse(data1);

            var data = google.visualization.arrayToDataTable([
              ['', ''],
              [obj[0].type + " : 미용", obj[0].qty],
              [obj[1].type + " : 요리", obj[1].qty],
              [obj[2].type + " : 의류", obj[2].qty],
              [obj[3].type + " : 기타", obj[3].qty]
            ]);

            var options = {
              pieHole: 0.3,
              backgroundColor: ""
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
          }
          xhttp.open("GET", "/admin/suggestType", true);
          xhttp.send();
        }

        function drawChart1() {
          const xhttp = new XMLHttpRequest();
          let obj;
          xhttp.onload = function () {
            let data1 = this.responseText;
            obj = JSON.parse(data1);

            var data = google.visualization.arrayToDataTable([
              ['', ''],
              [obj[0].qna_type, obj[0].qty],
              [obj[1].qna_type, obj[1].qty],
              [obj[2].qna_type, obj[2].qty],
              [obj[3].qna_type, obj[3].qty],
              [obj[4].qna_type, obj[4].qty]
            ]);

            var options = {
              pieHole: 0.4,
              backgroundColor: "",
              color: 'black'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d_1'));
            chart.draw(data, options);
          }
          xhttp.open("GET", "/admin/qnaType", true);
          xhttp.send();
        }
      </script>

  <script src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
	  google.charts.load("current", {packages:["corechart"]});
	  google.charts.setOnLoadCallback(drawChart);
	  
	  function drawChart() {

	      var currentDay = new Date();  
	      var theYear = currentDay.getFullYear();
	      var theMonth = currentDay.getMonth();
	      var theDate  = currentDay.getDate();


	      var thisWeek = [];
	       
	      for(var i=0; i<7; i++) {
	        var resultDay = new Date(theYear, theMonth, theDate- i);
	        var yyyy = resultDay.getFullYear();
	        var mm = Number(resultDay.getMonth()) + 1;
	        var dd = resultDay.getDate();
	       
	        mm = String(mm).length === 1 ? '0' + mm : mm;
	        dd = String(dd).length === 1 ? '0' + dd : dd;
	       
	        thisWeek[i] = yyyy + '-' + mm + '-' + dd;
	      }

	      
	      
	    var data = google.visualization.arrayToDataTable([
	      ["날짜", "가입자수" ],
	      [thisWeek[6], ${member7dayCount}],
	      [thisWeek[5], ${member6dayCount}],
	      [thisWeek[4], ${member5dayCount}],
	      [thisWeek[3], ${member4dayCount}],
	      [thisWeek[2], ${member3dayCount}],
	      [thisWeek[1], ${member2dayCount}],
	      [thisWeek[0], ${membertodayCount}]
	 
	    ]);

	    var chart = new google.visualization.ColumnChart(document.getElementById('memberchartdiv'));

        chart.draw(data);
      }
  </script>





<link rel="stylesheet" href="/css/reset.css" />
<style>
@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'ChosunGu';
	background-color: #F7F7F7;
}

a {
	text-decoration: none;
	color: black;
}

#container {
	position: apsolute;
	width: 100%;
	height: 100%;
}

#sideBar {
	display: inline-block;
	position: relative;
	width: 15%;
	height: 100vh;
	background-color: #1C2739;
}

#logo {
	font-family: 'SBAggroB';
	font-weight: bold;
	font-size: 40px;
	text-align: center;
	height: 125px;
	width: 100%;
	display: inline-block;
	line-height: 130px;
	color: white;
}

.sideMenu {
	background-color: #232428;
	border-radius: 15px;
	text-align: center;
	width: 77%;
	height: 6vh;
	margin: 0 auto;
	margin-top: 20px;
	line-height: 6vh;
	transition: all 0.1s ease-in;
	cursor: pointer;
	font-size: 1.2em;
	font-weight: bold;
	color: white;
	box-shadow: 1px 1px 1px 1px gray;
}

.sideMenu:hover {
	color: black;
	background-color: #AACD6E;
}

#topBar {
	position: absolute;
	display: inline-block;
	width: 85%;
}

.subMenu {
	float: left;
	width: 11%;
	height: 3.5vh;
	background-color: rgb(57, 57, 57);
	color: white;
	margin: 20px 20px 0 20px;
	line-height: 3.5vh;
	text-align: center;
	border-radius: 7px;
	font-size: 16px;
	font-weight: bolder;
	cursor: pointer;
	transition: all 0.15s;
}

.subMenu1 {
	margin-left: 50px;
	color: white;
}

.subMenu:hover {
	background-color: #AACD6E;
	transform: scale(1.03, 1.07);
	color: black;
	box-shadow: 2px 2px 2px 2px gray;
}

.article {
	border-radius: 20px;
	position: absolute;
	left: 15%;
	top: 50px;
	width: 85%;
	height: 95%;
	display: grid;
	grid-gap: 15px;
	justify-content: center;
	grid-template-columns: repeat(3, 30%);
	grid-template-rows: repeat(3, 30%);
}

.box {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	background-color: #F7F7F7;
	border-radius: 7px;
	margin-top: 30px;
	color: black;
	background-color: white;
	box-shadow: 2px 2px 2px 2px gray;
	position: relative;
}

#ul2 {
	display: none;
}

#ul3 {
	display: none;
}

#ul4 {
	display: none;
}

#memberArticle {
	display: none;
}

#managerArticle {
	display: none;
}

#qnaArticle {
	display: none;
}

#noticeArticle {
	display: none;
}

#suggestionArticle {
	display: none;
}

#classArticle {
	display: none;
}

#reviewArticle {
	display: none;
}
#statusArticle {
	display: none;
}
#othersArticle {
	display: none;
}

#home {

      	display: inline-block;
      	position: absolute;
      	width: 150px;
      	height: 50px;
      	right: 15px;
      	top: 13px;
      	cursor: pointer;
      	z-index: 1;
 }

.subtitle {
	background-color: black;
	width: 100%;
	border-radius: 7px;
	height: 30px;
	line-height: 30px;
	margin-bottom: 20px;
	border-radius: 7px 7px 0 0;
	color: white;
	font-weight: bold;
}

#qnaDetailTbl tr {
	height: 30px;
}

#reviewDetailTbl tr {
	height: 30px;
}

#qnabox1 {
	grid-column: 1/3;
}

#spendtime {
	font-size: 40px;
	font-family: 'SBAggroB';
}

#qnabox2 {
	grid-row: 1/3;
	grid-column: 3/4;
}

#qnabox3 {
	grid-column: 1/3;
}

#reviewbox1 {
	grid-column: 1/3;
}

#reviewbox2 {
	grid-row: 1/3;
	grid-column: 3/4;
}

#reviewbox3 {
	grid-column: 1/3;
}

.outer {
	position: absolute;
	left: 8%;
	bottom: 10%;
	width: 300px;
	height: 20px;
	border-radius: 10px;
	background-color: #F7F7F7;
	;
}

.inner {
	position: absolute;
	left: 8%;
	bottom: 10%;
	width: 120px;;
	height: 20px;
	border-radius: 10px;
	background-color: blue;
}

#persent {
	font-family: 'SBAggroB';
	margin-top: 20px;
	font-size: 50px;
	position: absolute;
	bottom: 15%;
	left: 14%;
}

.pie-chart1 {
	position: absolute;
	left: 70%;
	display: inline-block;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	transition: 0.3s;
	display: inline-block;
}

#noticebox1 {
	grid-row: 1/3;
	grid-column: 1/3;
}

#noticebox2 {
	grid-row: 1/4;
	grid-column: 3/4;
}

#noticebox3 {
	grid-row: 3/4;
	grid-column: 1/3;
}

#newNoticeForm {
	float: right;
	margin: 4px;
}

#noticeWritingTbl {
	width: 380px;;
	margin: 0 auto;
}

#noticeWritingTbl tr {
	height: 50px;
}

#noticeWritingTbl input[type='text'], textarea {
	height: 30px;
	width: 90%;
}

#noticeWritingTbl textarea {
	height: 200px;
}

#noticeSearchBar {
	width: 80%;
	height: 25px;
}

#suggestbox1 {
	grid-column: 1/3;
	grid-row: 1/2;
}

#suggestbox3 {
	grid-column: 1/3;
	grid-row: 2/4;
}

#suggestbox4 {
	grid-row: 2/4;
}

#classbox1 {
	grid-column: 1/3;
	grid-row: 1/3;
}

#classbox2 {
	grid-column: 3/4;
	grid-row: 1/3;
}

#homebtn {
	width: 100%;
	height: 100%;
	background-color: #AACD6E;
	box-shadow: 1px 1px 1px 1px gray;	
	transform: scale(1.03, 1.07);
	color: #655B4B;
	line-height: 3.5vh;
	text-align: center;
	border-radius: 10px;
	border : none;
	font-size: 20px;
	font-weight: bolder;
	cursor: pointer;
	transition: all 0.15s;
	font-family: 'ChosunGu';
}
#sideMenu5{
	position: relative;
	top : 400px;
}
#mainBox1 {
       grid-column: 1 / 3;
}
#mainBox4 {
      grid-row: 2 / 4;
}
#mainBox5 {
      grid-row: 2 / 4;
}
#mainBox6 {
     grid-row: 2 / 4;
}
.mainTop {
	color: white;
    width: 100%;
    height: 70px;
    background-color: black;;
    border-radius: 7px 7px 0 0;
    display: flex;
    justify-content: center;
    align-items: center;
}
.mainTitle{
    display: inline-block;
    margin: 40px;
    font-size: 30px;
    color: skyblue
}
.mainTable {
    text-align: center;
    color: skyblue;
    font-size: 20px;
}
td {
    border-right: 1px solid white;
    border-left: 1px solid white;
}
.footer{
    position: absolute;
    bottom: 0;
    border-radius: 0 0 7px 7px;
   	width: 100%;
    height: 50px;
   	background-color: black;
   	color: white;
   	display: flex;
   	flex-direction: row;
   	justify-content: center;
   	align-items: center;
}
.mainDate{
    margin: 0 20px 0 20px;
}
.stick {
    position: relative;
    top: 50%;
   	background-color: orange;
   	width: 20px;
   	transform: translateY(-50%);
   	margin: 0 30px 0 30px;
   	color: orange;
}
#stickBox {
  	display: flex;
   	position: absolute;
   	width: 100%;
  	height: 200px;
   	top: 0;
   	border-radius: 30px 30px 0 0;
   	flex-direction: row;
  	justify-content: center;
   	align-items: center;	
}
th {
    border-right: 1px solid white;
}
.visit {
   	position: absolute;
   	top: -20px;
}

 #memberBox1{
      grid-column: 1 / 4;
      grid-row:1/3;
      background-color: white;
      }
     #memberBox2{
      grid-column: 1 / 4;
      background-color: white;
     }
      
      #managerBox1{
      grid-column: 1 / 3;
      grid-row:1/4;
      background-color: white;
      }
      #managerBox2{
      grid-column: 3 / 4;
      grid-row:1/4;	
      background-color: white;
      }
      .memberlistgrade{
      margin-left: 20px;

      }
     #memberlistTable table {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	#memberlistTable th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	
	#memberlistTable th {
	   background-color: #f2f2f2;
	  font-weight: bold;
	  text-align: center;
	  padding: 10px;
	}
	#membertbody input[type=text]{
	  width: 100%;
	  border: none;
	  background-color: transparent;
	}

    #membertbody tr:nth-child(even) {
 	 background-color: #f2f2f2;
	}
	#membertbody tr:nth-child(odd) {
 	 background-color: #ffffff;
	}
    #membertbody .memChange, .memDel {
	  border: none;
/* 	  background-color: #4CAF50;  */
	  color: black;
	  padding: 5px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 12px;
	  cursor: pointer;
	  border-radius: 5px;
	}
	#membertbody .memChange:hover, .memDel:hover {
	  background-color: #3e8e41;
	}
	.membernewR{
	width:200px;
  	height: 200px;
	} 
    </style>
  </head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<div id="container">
		<div id="sideBar">
			<div id="logo">Penefit</div>
			<div id="sideBox">
				<div id="sideMenu1" class="sideMenu">Member</div>
				<div id="sideMenu2" class="sideMenu">Board</div>
				<div id="sideMenu3" class="sideMenu">Class</div>
				<div id="sideMenu4" class="sideMenu">Sales</div>
				<div id="sideMenu5" class="sideMenu"><button type="button" id="homebtn" onclick="location.href='/'">홈으로</button></div>
				

			</div>
		</div>


      <div id="topBar">
        <ul id="ul1">
          <li id="member" class="subMenu subMenu1">Member List</li>
          <li id="manager" class="subMenu">Manager List</li>
        </ul>

        <ul id="ul2">
          <li id="qna" class="subMenu subMenu1">QnA List</li>
          <li id="notice" class="subMenu">Notice List</li>
        </ul>

        <ul id="ul3">
          <li id="suggestion" class="subMenu subMenu1">Suggestion List</li>
          <li id="class" class="subMenu">Class List</li>
          <li id="review" class="subMenu">Review List</li>
        </ul>

        <ul id="ul4">
			<li id="status" class="subMenu subMenu1">Status</li>
			<li id="others" class="subMenu">others</li>
		</ul>
			<img id="home" src="../../images/logo.png"></img>
		</div>

      
      <!-- Article start -->
      
      <div id="mainArticle" class="article">
      
        <div id="mainBox1" class="box">
        
        	<div id = "stickBox">
	        	<c:forEach var = "visit" items = "${visits }">
	       			<div style = "height: ${visit.visit}px" class = "stick"><span class = "visit">${visit.visit }</span></div>
	       		</c:forEach>
	        </div>
	        
	       	<div class="footer" id="mainFooter">
	       		<c:forEach var = "visit" items = "${visits }">
	       			<div class = "mainDate">${visit.day}</div>
	       		</c:forEach>
	       	</div>
        
     	 </div>
        
        
        <div id="mainBox2" class="box">
        	<div class="mainTop">
        		<span class = "mainTitle">강사 리스트</span>
        	</div>
        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>ID</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="member" items="${memberList }">
        				<tr>
	        				<td>${member.member_id }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
       		<div class="footer"></div>
        </div>
        
        
        <div id="mainBox4" class="box">
        	<div class="mainTop">
        		<span class = "mainTitle">총 ${suggestionCount }개의 제안서가 있음</span>
        	</div>
        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>NO</th><th>ID</th>
        				<th>Title</th><th>regDate</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="suggestion" items="${suggestionList }">
        				<tr>
	        				<td>${suggestion.suggest_num }</td>
	        				<td>${suggestion.member_id }</td>
	        				<td>${suggestion.suggest_title }</td>
	        				<td>${suggestion.suggest_regdate }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
       		<div class="footer"></div>
        </div>
        
        
        <div id="mainBox5" class="box">
        
	        <div class="mainTop">
	        		<span class = "mainTitle">오늘의 클래스 </span>
	        </div>
	        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>Title</th><th>teacher</th>
        				<th>time</th><th>min/max</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="vo" items="${classTodayList }">
        				<tr>
	        				<td>${vo.class_subject }</td>
	        				<td>${vo.class_teacher }</td>
	        				<td>${vo.class_date }</td>
	        				<td>${vo.class_memcnt }/${vo.class_memlit }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
	        <div class="footer">
	        	<span>today: ${classTodayCount }&nbsp; </span>
	        	<span>end: ${classEndCount }&nbsp; </span>
	        	<span>active: ${classActiveCount }</span>
	        </div>
	    </div>
	        
        <div id="mainBox6" class="box">
        		        <div class="mainTop">
	        		<span class = "mainTitle"> QnA List </span>
	        </div>
	        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>No</th><th>Id</th>
        				<th>Title</th><th>regDate</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="qna" items="${qnaList }">
        				<tr>
	        				<td>${qna.qna_num }</td>
	        				<td>${qna.member_id }</td>
	        				<td>${qna.qna_title }</td>
	        				<td>${qna.qna_regdate }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
	        <div class="footer">
	        	<span>total: ${qnaCount }</span>
	        </div>
        </div>
      </div>
      
      <div id="memberArticle" class="article">
        <div id="memberBox1" class="box">
			<div class = memberlistgrade>
				<div id = "memberlistgradeTitle">
					<h2>[회원목록]</h2>
				</div>
					<div id="memberSearch">
						<select name='memberOption'>
						  	<option value='' selected>-- 선택 --</option>
						  	<option value='member_id'>아이디</option>
						  	<option value='member_name'>이름</option>
						  	<option value='member_grade'>등급</option>
						</select>
						<input type="text" name="searchMem" id="searchMem1">
						<input type="button" value="검색" id="searchMemBtn" onclick="serchMem()">
					</div>
					<div id="memberlistTable">
					<table border ="1">
						<thead>
							<tr>
								<th>회원아이디</th><th>회원비밀번호</th><th>회원이름</th><th>회원전화번호</th><th>우편번호</th><th>회원주소</th><th>회원상세주소</th><th>회원등급</th><th colspan ="2">관리자지정</th>
							</tr>
						</thead>
						<tbody id = "membertbody">
					
						</tbody>
					</table>
					 <div id="page" style="text-align: center;">
		               <input type="hidden" name="Memmanager_startNum" value="1">
		               <button type="button" id="Memmanager_backBtn" style="width: 40px;">이전</button>
		               <div id="Memmanager_pages" style="display: inline;"></div>
		               <button type="button" id="Memmanager_frontBtn" style="width: 40px;">다음</button>
		          	  </div>
					</div>
			</div>

		</div>
		<div id="memberBox2">
		<div class ="membernew">
			<div id= "membernewL">
				<h2>[신규 가입 회원]</h2>
				${membertodayCount }명
			</div>
			<div class="membernewR">
			  <div id="memberchartdiv" style="width: 400px; height: 100px; position: relative; top: -20px; left: 10px;"></div>
			</div>
		</div>
		
		</div>
		
		
      </div>

      <div id="managerArticle" class="article">
        <div id="managerBox1" class="box">
        <div class = memberlist>
			<div id = "memberlistTitle">
				<h2>[회원목록]</h2>
			</div>
			<div id="memberSearch">
				<select name='memberOption2'>
				  	<option value='' selected>-- 선택 --</option>
				  	<option value='member_id'>아이디</option>
				  	<option value='member_name'>이름</option>
				  	<option value='member_grade'>등급</option>
				</select>
				<input type="text" name="searchMem" id="searchMem2">
				<input type="button" value="검색" id="searchMemBtn" onclick="serchMem2()">
			</div>
			<div id="memberlistTable">
				<table border ="1">
					<thead>
						<tr>
							<th>회원아이디</th><th>회원비밀번호</th><th>회원이름</th><th>회원전화번호</th><th>회원등급</th><th colspan ="2">관리자지정</th>
						</tr>
					</thead>
						<tbody id = "tbodygrade">
				
					</tbody>
				</table>
			</div>
		</div>
        
        </div>
         <div id="managerBox2" class="box"> 
      </div>
	</div>
	
	
     <div id="qnaArticle" class="article">
			<div class="box" id="qnabox1">
				<div class="subtitle">&nbsp;&nbsp;신규글</div>
				<div class="content">
					<table style="width: 600px; text-align: center; padding-left: 20px;">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
						<tbody id="qnaNewTbl"></tbody>
					</table>
				</div>
			</div>
			<div class="box" id="qnabox2">
				<div class="subtitle">&nbsp;&nbsp;상세보기</div>
				<div class="content">
					<table id="qnaDetailTbl">
						<tbody id="qnaDetailTbody"></tbody>
					</table>
				</div>
			</div>
			<div class="box" id="qnabox3">
				<div class="subtitle">&nbsp;&nbsp;전체글</div>
				<div class="content">
					<table style="width: 600px; text-align: center; padding-left: 20px;">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
						<tbody id="qnaAllTbl"></tbody>
					</table>
				</div>


			</div>
			<div class="box" id="qnabox4">
				<div class="subtitle">&nbsp;&nbsp;답변율</div>
				<div class="content" id="chartContent">
					<h2 id="persent"></h2>
					<div class="outer"></div>
					<div class="inner"></div>

				</div>

			</div>
			<div class="box" id="qnabox5">
				<div class="subtitle">&nbsp;&nbsp;평균답변속도</div>
				<div class="content" style="margin: 0 auto; position: relative; top: 25px;">
					<h2 id="spendtime"></h2>
				</div>

			</div>
			<div class="box" id="qnabox6">
				<div class="subtitle">&nbsp;&nbsp;문의타입</div>
				<div class="content">
					<h2 id="qnaType"></h2>
					<div id="piechart_3d_1" style="width: 150px; height: 100px; position: relative; top: -20px; left: 10px;"></div>
				</div>

			</div>
		</div>

		<div id="noticeArticle" class="article">
			<div class="box" id="noticebox1">
				<div class="subtitle">&nbsp;&nbsp;공지사항</div>
				<div class="content">
					<input type="text" name="noticeKeyword" id="noticeSearchBar"> <input type="button" value="검색" id="noticeSearchbtn">
					<table id="noticeTbl">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="noticeTbody"></tbody>
					</table>
				</div>
			</div>
			<div class="box" id="noticebox2">
				<div class="subtitle">
					&nbsp;&nbsp;작성
					<button type="button" id="newNoticeForm">신규</button>
				</div>
				<div class="content">
					<div></div>
					<form method="post">
						<table id="noticeWritingTbl">
							<tbody id="noticeWritingTbody">
								<!--  -->
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="box" id="noticebox3">
				<div class="subtitle">&nbsp;&nbsp;신규공지</div>
				<div class="content">
					<table id="noticeNewTbl">
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="noticeNewtbody"></tbody>
					</table>
				</div>
			</div>
		</div>

		<div id="suggestionArticle" class="article">
			<div class="box" id="suggestbox1">
				<div class="subtitle">&nbsp;&nbsp;신규제안</div>
				<div class="content">
					<table id="suggestNewTbl" style="margin: 10px;">
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>제안명</th>
								<th>작성자</th>
								<th>일시</th>
							</tr>
						</thead>
						<tbody id="suggestNewTbody">
							<!--  -->
						</tbody>
					</table>
				</div>
			</div>
			<div class="box" id="suggestbox2">
				<div class="subtitle">&nbsp;&nbsp;제안별비율</div>
				<div class="content">
					<div id="piechart_3d" style="width: 150px; height: 100px; position: relative; top: -20px; left: 10px;"></div>
				</div>
			</div>
			<div class="box" id="suggestbox3">
				<div class="subtitle">&nbsp;&nbsp;전체제안</div>
				<div class="content">
					<input type="text" name="suggestKeyword" id="suggestSearchBar" style="margin: 10px;"> <input type="button" value="검색" id="suggestSearchbtn">
					<table id="suggestAllTbl" style="margin: 10px;">
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>제안명</th>
								<th>작성자</th>
								<th>일시</th>
							</tr>
						</thead>
						<tbody id="suggestAllTbody"></tbody>
					</table>
				</div>
			</div>
			<div class="box" id="suggestbox4">
				<div class="subtitle">&nbsp;&nbsp;상세보기</div>
				<div class="content">
					<table id="suggestDetailTbl" style="margin: 10px;">
						<tbody id="suggestDetailTbody">
							<!--  -->
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div id="classArticle" class="article">
			<div class="box" id="classbox1">
				<div class="subtitle">&nbsp;&nbsp;클래스</div>
				<div class="content">
					<input type="text" name="classKeyword" id="classSearchBar" style="margin: 10px;"> <input type="button" value="검색" id="classSearchbtn">
					<div>
						<a id="dayBtn">날짜순</a> | <a id="endBtn">완료된 클래스</a> | <a id="activeBtn">진행중인 클래스</a>
					</div>
					<table id="classtbl" style="margin: 10px;">
						<thead>
							<tr>
								<th>코드</th>
								<th>제목</th>
								<th>강사</th>
							</tr>

						</thead>

						<tbody id="classTbody">
							<!--  -->
						</tbody>
					</table>
				</div>
			</div>
			<div class="box" id="classbox2">
				<div class="subtitle">&nbsp;&nbsp;상세보기</div>
				<div class="content">
					<form action='/admin/classUpdate' method='post' enctype='multipart/form-data'>
						<table id="classDetailtbl" style="margin: 10px;">
							<tbody id="classDetailTbody">
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="box" id="classbox3">
				<div class="subtitle">&nbsp;&nbsp;클래스현황(오픈클래스 / 전체클래스)</div>
				<div class="content">
					<h2 id="classStatus"></h2>
				</div>
			</div>
			<div class="box" id="classbox4">
				<div class="subtitle">&nbsp;&nbsp;클래스분포도</div>
				<div class="content"></div>
			</div>
			<div class="box" id="classbox5">
				<div class="subtitle">&nbsp;&nbsp;등록률(수강등록인원 / 전체인원)</div>
				<div class="content">
					<h5 id="classMem"></h5>
					<h3 id="classRate"></h3>
				</div>
			</div>
		</div>

		<div id="reviewArticle" class="article">
			<div class="box" id="reviewbox1">
				<div class="subtitle">&nbsp;&nbsp;신규리뷰</div>
				<div class="content">
					<table style="width: 600px; text-align: center; padding-left: 20px;">
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>내용</th>
								<th>점수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="reviewNewTbl"></tbody>
					</table>


				</div>
			</div>
			<div class="box" id="reviewbox2">
				<div class="subtitle">&nbsp;&nbsp;리뷰상세보기</div>
				<div class="content" style="margin: 0 auto;">
					<table id="reviewDetailTbl">
						<tbody id="reviewDetailTbody"></tbody>
					</table>

				</div>
			</div>
			<div class="box" id="reviewbox3">
				<div class="subtitle">&nbsp;&nbsp;전체리뷰</div>
				<div class="content">
					<table style="width: 600px; text-align: center; padding-left: 20px;">
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>내용</th>
								<th>점수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="reviewAllTbl"></tbody>
					</table>

				</div>


			</div>
			<div class="box" id="reviewbox4">
				<div class="subtitle">&nbsp;&nbsp;금주의 최고평점강의</div>
				<div class="content" id="chartContent">
					<h3 id="bestClass"></h3>
					<div id="bestClassinfo"></div>
				</div>

			</div>
			<div class="box" id="reviewbox5">
				<div class="subtitle">&nbsp;&nbsp;금주의 최저평점강의</div>
				<div class="content">
					<h3 id="worstClass"></h3>
					<div id="worstClassinfo"></div>
				</div>

			</div>
			<div class="box" id="reviewbox6">
				<div class="subtitle">&nbsp;&nbsp;전체리뷰수</div>
				<div class="content">
					<h3 id="reviewCnt"></h3>
				</div>

			</div>
		</div>
		<div id="statusArticle" class="article">
			<div class="box" id="salesbox1">
				<div class="subtitle">&nbsp;&nbsp;오늘의 매출</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="todaysSales"></h2>
				</div>
			</div>
			<div class="box" id="salesbox2">
				<div class="subtitle">&nbsp;&nbsp;주간매출</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="weeklySales"></h2>
				</div>
			</div>
			<div class="box" id="salesbo3">
				<div class="subtitle">&nbsp;&nbsp;이번달매출</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="monthlySales"></h2>
				</div>
			</div>
		
			<div class="box" id="salesbox4">
				<div class="subtitle">&nbsp;&nbsp;전일대비 증감율</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="dayChange"></h2>
				</div>
			</div>
			<div class="box" id="salesbox5">
				<div class="subtitle">&nbsp;&nbsp;전주대비 증감율</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="weekChange"></h2>
				</div>
			</div>
			<div class="box" id="salesbox6">
				<div class="subtitle">&nbsp;&nbsp;전월대비 증감율</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="monthChange"></h2>
				</div>
			</div>
				<div class="box" id="salesbox7">
				<div class="subtitle">&nbsp;&nbsp;올해매출</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="yearlySales"></h2>
				</div>
			</div>
			<div class="box" id="salesbox8">
				<div class="subtitle">&nbsp;&nbsp;1회 평균결제금액</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="buyaverage"></h2>
				</div>
			</div>
			<div class="box" id="salesbox9">
				<div class="subtitle">&nbsp;&nbsp;월간 평균 구매횟수</div>
				<div class="content" style="margin: 0 auto;">
					<h2 id="average_purchase"></h2>
				</div>
			</div>
		</div>
		<div id="othersArticle" class="article">
			<div class="box" id="statusbox1">
				<div class="subtitle">&nbsp;&nbsp;</div>
				<div class="content" style="margin: 0 auto;">
				</div>
			</div>
		</div>
	</div>



	<script>
        // SubMenu Display
        $("#sideMenu1").click(() => {
          $("#ul1").css("display", "block");
          $("#ul2").css("display", "none");
          $("#ul3").css("display", "none");
          $("#ul4").css("display", "none");
        });
        $("#sideMenu2").click(() => {
          $("#ul1").css("display", "none");
          $("#ul2").css("display", "block");
          $("#ul3").css("display", "none");
          $("#ul4").css("display", "none");
        });
        $("#sideMenu3").click(() => {
          $("#ul1").css("display", "none");
          $("#ul2").css("display", "none");
          $("#ul3").css("display", "block");
          $("#ul4").css("display", "none");
        });
        $("#sideMenu4").click(() => {
          $("#ul1").css("display", "none");
          $("#ul2").css("display", "none");
          $("#ul3").css("display", "none");
          $("#ul4").css("display", "block");
        });

        // Article Display
        $("#home").click((event) => {
	    	$(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
	    	$("#mainArticle").css("display", "grid");
	        $("#memberArticle").css("display", "none");
	        $("#managerArticle").css("display", "none");
	        $("#qnaArticle").css("display", "none");
	        $("#noticeArticle").css("display", "none");
	        $("#suggestionArticle").css("display", "none");
	        $("#classArticle").css("display", "none");
	        $("#reviewArticle").css("display", "none");
	        $("#statusArticle").css("display", "none");
	        $("#othersArticle").css("display", "none");
      	});
        $("#member").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "grid");
          $("#managerArticle").css("display", "none");
          $("#qnaArticle").css("display", "none");
          $("#noticeArticle").css("display", "none");
          $("#suggestionArticle").css("display", "none");
          $("#classArticle").css("display", "none");
          $("#reviewArticle").css("display", "none");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
        });
        $("#manager").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "none");
          $("#managerArticle").css("display", "grid");
          $("#qnaArticle").css("display", "none");
          $("#noticeArticle").css("display", "none");
          $("#suggestionArticle").css("display", "none");
          $("#classArticle").css("display", "none");
          $("#reviewArticle").css("display", "none");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
        });
        $("#qna").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "none");
          $("#managerArticle").css("display", "none");
          $("#qnaArticle").css("display", "grid");
          $("#noticeArticle").css("display", "none");
          $("#suggestionArticle").css("display", "none");
          $("#classArticle").css("display", "none");
          $("#reviewArticle").css("display", "none");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
          QnaReplyRate();
          qnaLoadAll()
          qnaLoadNew()
          spendtime();
        });
        $("#notice").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "none");
          $("#managerArticle").css("display", "none");
          $("#qnaArticle").css("display", "none");
          $("#noticeArticle").css("display", "grid");
          $("#suggestionArticle").css("display", "none");
          $("#classArticle").css("display", "none");
          $("#reviewArticle").css("display", "none");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
          getNotice();
          getNoticeNew();
        });
        $("#suggestion").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "none");
          $("#managerArticle").css("display", "none");
          $("#qnaArticle").css("display", "none");
          $("#noticeArticle").css("display", "none");
          $("#suggestionArticle").css("display", "grid");
          $("#classArticle").css("display", "none");
          $("#reviewArticle").css("display", "none");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
          newsuggestion();
          suggestAll();
        });
        $("#class").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "none");
          $("#managerArticle").css("display", "none");
          $("#qnaArticle").css("display", "none");
          $("#noticeArticle").css("display", "none");
          $("#suggestionArticle").css("display", "none");
          $("#classArticle").css("display", "grid");
          $("#reviewArticle").css("display", "none");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
          classListAll();
          classRate();
          currentClassStatus();
        });
        $("#review").click(() => {
          $(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          $(event.target).css("backgroundColor", "blue");
          $("#mainArticle").css("display", "none");
          $("#memberArticle").css("display", "none");
          $("#managerArticle").css("display", "none");
          $("#qnaArticle").css("display", "none");
          $("#noticeArticle").css("display", "none");
          $("#suggestionArticle").css("display", "none");
          $("#classArticle").css("display", "none");
          $("#reviewArticle").css("display", "grid");
          $("#statusArticle").css("display", "none");
          $("#othersArticle").css("display", "none");
          reviewLoadNew();
          reviewLoadAll();
          bestClass();
          worstClass();
          getReviewCount();
        });
        $("#status").click(() => {
        	$(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          	$(event.target).css("backgroundColor", "blue");
          	$("#mainArticle").css("display", "none");
            $("#memberArticle").css("display", "none");
            $("#managerArticle").css("display", "none");
            $("#qnaArticle").css("display", "none");
            $("#noticeArticle").css("display", "none");
            $("#suggestionArticle").css("display", "none");
            $("#classArticle").css("display", "none");
            $("#reviewArticle").css("display", "none");
            $("#statusArticle").css("display", "grid");
            $("#othersArticle").css("display", "none");
            todaysSales();
            weeklySales();
            monthlySales();
            yearlySales();
            monthChange();
            weekChange();
            dayChange();
            buyaverage();
            averagePurchase();
          });
        $("#others").click(() => {
        	$(".subMenu").css("backgroundColor", "rgb(57, 57, 57)");
          	$(event.target).css("backgroundColor", "blue");
          	$("#mainArticle").css("display", "grid");
            $("#memberArticle").css("display", "none");
            $("#managerArticle").css("display", "none");
            $("#qnaArticle").css("display", "none");
            $("#noticeArticle").css("display", "none");
            $("#suggestionArticle").css("display", "none");
            $("#classArticle").css("display", "none");
            $("#reviewArticle").css("display", "none");
            $("#statusArticle").css("display", "none");
            $("#othersArticle").css("display", "grid");
          });
      </script>

	<!-- 답변 -->
	<script>
        $(document).on("click", "#qnaReplyBtn", function (evt) {
          let qnaNum = evt.target.parentElement.parentElement.parentElement.children[0].children[1].innerText;
          let content = evt.target.parentElement.parentElement.parentElement.children[5].children[1].children[0].value;
          let adminid = "${member_id}";
          let obj = {
            "qnaNum": qnaNum,
            "content": content,
            "adminid": adminid
          }
          let postdata = JSON.stringify(obj);

          //답변 등록하기
          $.ajax({
            method: "post",
            url: "/admin/qnaReplyvalue",
            data: {
              "qnaNum": qnaNum,
              "content": content,
              "adminid": adminid
            },
            success: function (data) {
              qnaLoadAll();
              qnaLoadNew();
              QnaReplyRate();
              spendtime();

            },
            error: function () {
              alert("error");
            },
            complete: function () {
              QnaReplyDetail(qnaNum);
            }
          });

        })
        //전체 qna 리스트
        function qnaLoadAll() {
          $("#qnaAllTbl").empty();
          $.ajax({
            method: "get",
            url: "/admin/qnaLoadAll",
            dataType: 'json',
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#qnaAllTbl").append(
                  "<tr><td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_num + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_title + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_status + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_regdate + "</a></td>"
                  + "</tr>");
              }
            },
            error: function () {
              alert("error");
            }
          })
        }

        //신규 qna 리스트
        function qnaLoadNew() {
          $("#qnaNewTbl").empty();
          $.ajax({
            method: "get",
            url: "/admin/qnaLoadNew",
            dataType: 'JSON',
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#qnaNewTbl").append(
                  "<tr><td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_num + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_title + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_status + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_regdate + "</a></td>"
                  + "</tr>");
              }
            },
            error: function () {
              alert("error");
            }
          })
        }



        //상세보기
        function QnaReplyDetail(qnaNum) {
          const xhttp = new XMLHttpRequest();
          xhttp.onload = function () {
            let data = this.responseText;
            let obj = JSON.parse(data);
            let msg;
            if (obj.qna_status == '답변대기') {
              msg = "<input type='button' id='qnaReplyBtn' value='답변등록' >";
            } else {
              msg = "<input type='button' value='답변완료'>";

            }
            if (obj.reply == null) {
              replyMsg = "";
            } else {
              replyMsg = obj.reply;
            }
            $("#qnaDetailTbody").html(
              "<tr><th style='width: 200px;'>Qna번호</th><td style='width: 60%;'>" + obj.qna_num + "</td></tr>"
              + "<tr><th>제목</th><td>" + obj.qna_title + "</td></tr>"
              + "<tr><th>내용</th><td>" + obj.qna_content + "</td></tr>"
              + "<tr><th>작성자</th><td>" + obj.member_id + "</td></tr>"
              + "<tr><th>등록일</th><td>" + obj.qna_regdate + "</td></tr>"
              + "<tr><th id='th'>답변</th><td><textarea name='adminReply' id='notice_content'>" + replyMsg + "</textarea></td></tr>"
              + "<tr><td  id='btn' colspan='2'>" + msg + "</td></tr>");

            $("#qnaReplyBtn").css({
              "width": "100px",
              "border": "none",
              "border-radius": "3px",
              "backgroundColor": "#1C2739",
              "color": "white"
            });
            $("#btn").css("text-align", "center");
            $("#btn").css("marging-top", "20px;");
            $("textarea").css("height", "100px");
          }
          xhttp.open("GET", "/admin/adminQnaDetail?qnaNum=" + qnaNum, true);
          xhttp.send();    adminQnaDetail
        }



        //답변율

        function QnaReplyRate() {
          const xhttp = new XMLHttpRequest();
          xhttp.onload = function () {
            let data = this.responseText;
            $("#persent").text(Math.floor(data) + " %");
            let w = 300 * data * 0.01;
            $(".inner").css("width", w);
          }
          xhttp.open("GET", "/admin/qnaReplyRate", true);
          xhttp.send();
        }

        //평균답변시간

        function spendtime() {
          const xhttp = new XMLHttpRequest();
          xhttp.onload = function () {
            let data = this.responseText;
            const temp1 = data * 10
            const temp2 = Math.ceil(temp1) / 10;
            $("#spendtime").text(temp2 + " 일");
          }
          xhttp.open("GET", "/admin/spendtime", true);
          xhttp.send();
        }


      </script>
	<script>
        //=============================리뷰=================================
        //신규리뷰 리스트
        function reviewLoadNew() {
          $("#reviewNewTbl").empty();
          $.ajax({
            method: "get",
            url: "/admin/reviewLoadNew",
            dataType: 'JSON',
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#reviewNewTbl").append(
                  "<tr><td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].review_num + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].member_id + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].review_content + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].score + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].review_regdate + "</a></td>"
                  + "</tr>");

              }
            },
            error: function () {
              alert("reviewLoadNew Error");
            }
          });
        }
        //전체리뷰 리스트
        function reviewLoadAll() {
          $("#reviewAllTbl").empty();
          $.ajax({
            method: "get",
            url: "/admin/reviewLoadAll",
            dataType: 'JSON',
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#reviewAllTbl").append(
                  "<tr><td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].review_num + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].member_id + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].review_content + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].score + "</a></td>"
                  + "<td><a onclick='reviewDetail(" + data[i].review_num + ")'>" + data[i].review_regdate + "</a></td>"
                  + "</tr>");

              }
            },
            error: function () {
              alert("reviewLoadAll Error");
            }
          });
        }

        //상세보기
        function reviewDetail(review_num) {
          $("#reviewDetailTbody").empty();
          $.ajax({
            method: "get",
            datatype: "JSON",
            url: "/admin/reviewDetail",
            data: {
              "review_num": review_num
            },
            success: function (data) {
              $("#reviewDetailTbody").html(
                "<tr><td colspan='2' style='width: 30%; text-align : center;' ><img src='../images/" + data.review_photo + "' style ='width :150px; height:150px; '></td></tr>"
                + "<tr><input type='hidden' name='review_num' value='" + data.review_num + "'><th style='width: 30%;'>내용</th><td>" + data.review_content + "</td></tr>"
                + "<tr><th>작성자</th><td>" + data.member_id + "</td></tr>"
                + "<tr><th>평점</th><td>" + data.score + "</td></tr>"
                + "<tr><th>과목코드</th><td><a href='#'>" + data.class_code + "</a></td></tr>"
                + "<tr><th>등록일</th><td>" + data.review_regdate + "</td></tr>"
                + "<tr><td colspan='2' style='text-align : center;'><input type='button' class='reviewDelbtn' value='삭제'></td></tr>"
              )

            },
            error: function () {
              alert("reviewDeatil Error");
            }


          });
        }

        $(document).on("click", ".reviewDelbtn", function (evt) {
          let review_num = evt.target.parentElement.parentElement.parentElement.children[1].children[0].value;
          alert(review_num);
          $.ajax({
            method: "Delete",
            data: {
              "review_num": review_num
            },
            url: "/admin/deleteReview",
            sucess: function (data) {
              alert("삭제완료!");
            },
            error: function () {
              alert("error");
            },
            complete: function () {
              reviewLoadNew();
              reviewLoadAll();
            }

          });

        })
        //금주 최고의 강의
        function bestClass() {
          $.ajax({
            method: "Get",
            datatype: "json",
            url: "/admin/bestClass",
            success: function (data) {
              const temp1 = data * 10;
              const temp2 = Math.ceil(temp1) / 10;
              $("#bestClass").text(data.score + " 점\n" + data.class_code);
              let obj = whatClass(data.class_code);
              $("#bestClassinfo").text(obj.class_subject);
            },
            error: function () {
              alert("bestClass Error");
            },
            complete: function () {

            }
          });
        }
        //금주 최악의 강의
        function worstClass() {
          $.ajax({
            method: "Get",
            url: "/admin/worstClass",
            datatype: "json",
            success: function (data) {
              const temp1 = data * 10;
              const temp2 = Math.ceil(temp1) / 10;
              $("#worstClass").text(data.score + " 점\n" + data.class_code);
              let obj = whatClass(data.class_code);
              $("#worstClassinfo").text(obj.class_subject);

            },
            error: function () {
              alert("worstClass Error");
            },
            complete: function () {


            }


          });
        }
        //강의정보 가져오기
        function whatClass(class_code) {
          let classinfo;
          $.ajax({
            method: "Get",
            url: "/admin/class.what",
            datatype: "json",
            async: false,
            data: {
              "class_code": class_code
            },
            success: function (data) {
              classinfo = data;
            },
            error: function () {
              alert("whatClass Error");
            }
          });
          return classinfo;
        }

        //전체 리뷰 갯수
        function getReviewCount() {
          $.ajax({

            method: "Get",
            url: "/admin/getReviewCount",
            success: function (data) {
              $("#reviewCnt").text(data);
            },
            error: function () {
              alert("getReviewCount Error");
            }
          });

        }

      </script>
	<script>
        //=============공지 NOTICE======================
        //공지목록
        function getNotice() {
          $("#noticeTbody").empty();
          $.ajax({
            method: "GET",
            url: "/admin/getNotice",
            datatype: "json",
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#noticeTbody").append(
                  "<tr ><td class='godetail'>" + data[i].notice_num + "</td>"
                  + "<td class='godetail'>" + data[i].notice_title + "</td>"
                  + "<td class='godetail'>" + data[i].member_id + "</td>"
                  + "< td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
                );

              }


            },
            error: function () {
              alert("error");
            }


          });
        }

        $("#noticeSearchbtn").click(function () {
          let keyword = $("#noticeSearchBar").val();
          if (keyword == "") {
            getNotice();
          } else {
            getsearchNotice(keyword);

          }
        });
        $("#noticeSearchBar").keydown(function (evt) {
          let keyword = $("#noticeSearchBar").val();
          if (evt.keyCode == 13) {

            if (keyword == "") {
              getNotice();
            } else {
              getsearchNotice(keyword);
            }
          }
        });
        //공지 검색목록
        function getsearchNotice(keyword) {
          $("#noticeTbody").empty();
          $.ajax({
            method: "GET",
            url: "/admin/getsearchNotice",
            datatype: "json",
            data: {
              "keyword": keyword
            },
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#noticeTbody").append(
                  "<tr><td  class='godetail'>" + data[i].notice_num + "</td>"
                  + "<td  class='godetail'>" + data[i].notice_title + "</td>"
                  + "<td class='godetail'>" + data[i].member_id + "</td>"
                  + "<td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
                );

              }


            },
            error: function () {
              alert("error");
            }


          });
        }
        //신규공지
        function getNoticeNew() {
          $("#noticeNewtbody").empty();
          $.ajax({
            method: "GET",
            url: "/admin/getNoticeNew",
            datatype: "json",
            success: function (data) {

              for (let i = 0; i < data.length; i++) {
                $("#noticeNewtbody").append(
                  "<tr ><td class='godetail'>" + data[i].notice_num + "</td>"
                  + "<td class='godetail'>" + data[i].notice_title + "</td>"
                  + "<td class='godetail'>" + data[i].member_id + "</td>"
                  + "<td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
                );

              }


            },
            error: function () {
              alert("error");
            }


          });
        }

        //공지등록
        $(document).on("click", "#regNoticeBtn", function () {
           let notice_title = $("input[name='notice_title']").val();
            let member_id = "${member_id}";
            let notice_content = $("#notice_content").val();
            $.ajax({
              method: "post",
              url: "/admin/regNotice",
              data: {
                "notice_title": notice_title,
                "member_id": member_id,
                "notice_content": notice_content
              },
              success: function (data) {
                getNotice();
                getNoticeNew();
              },
              error: function () {
                alert("error");
              }

            })
        })

        //공지등록폼
        $("#newNoticeForm").click(function () {
          regNotice();
        })
        function regNotice() {
          $("#noticeWritingTbody").empty();
          $("#noticeWritingTbody").html(
            "<tr>"
            + "<th>번호</th>"
            + "<td><input type='text' readonly='readonly'></td>"
            + "</tr>"
            + "<tr>"
            + "<th>제목</th>"
            + "<td><input type='text' name='notice_title' ></td>"
            + "</tr>"
            + "<tr>"
            + "<th >내용</th>"
            + "<td><textarea name='notice_content' id='notice_content'></textarea></td>"
            + "</tr>"
            + "<tr>"
            + "<th>작성자</th>"
            + "<td ><input style='text-align: center;' type='text' name='member_id' value='${member_id }' ></td>"
            + "</tr>"
            + "<tr style='text-align: center;'>"
            + "<td colspan='2'><input type='button'  value='등록' id='regNoticeBtn'></td>"
            + "</tr>");

        }



        //공지상세보기
        $(document).on("click", ".godetail", function (evt) {
          let notice_num = evt.target.parentElement.children[0].innerText;
          noticeDetail(notice_num);
        })

        function noticeDetail(notice_num) {
          $("#noticeWritingTbody").empty();
          $.ajax({
            method: "get",
            url: "/admin/noticeDetail",
            data: {
              "notice_num": notice_num
            },
            datatype: "json",
            success: function (data) {
              $("#noticeWritingTbody").html(
                "<tr>"
                + "<th>번호</th>"
                + "<td><input type='text' readonly='readonly' value='" + data.notice_num + "'></td>"
                + "</tr>"
                + "<tr>"
                + "<th>제목</th>"
                + "<td><input type='text' name='notice_title' value='" + data.notice_title + "'></td>"
                + "</tr>"
                + "<tr>"
                + "<th >내용</th>"
                + "<td><textarea name='notice_content' id='notice_content'>" + data.notice_content + "</textarea></td>"
                + "</tr>"
                + "<tr>"
                + "<th>작성자</th>"
                + "<td ><input style='text-align: center;' type='text' name='member_id'  readonly='readonly' value='" + data.member_id + "' ></td>"
                + "</tr>"
                + "<tr style='text-align: center;'>"
                + "<td colspan='2'><input type='button'  value='수정' class='modiNoticeBtn'>"
                + "<input type='button'  value='삭제' class='delNoticeBtn'></td>"
                + "</tr>");
            },
            error: function () {
              alert("error");
            }

          })

        }

        //공지수정
        $(document).on("click", ".modiNoticeBtn", function (evt) {
          let notice_num = evt.target.parentElement.parentElement.parentElement.childNodes[0].children[1].children[0].value;
          modiNotice(notice_num);
        })
        function modiNotice(notice_num) {

          let notice_title = $("input[name='notice_title']").val();
          let member_id = $("input[name='member_id']").val();
          let notice_content = $("#notice_content").val();

          $.ajax({
            method: "put",
            url: "/admin/modiNotice",
            data: {
              "notice_title": notice_title,
              "member_id": member_id,
              "notice_content": notice_content,
              "notice_num": notice_num
            },
            success: function (data) {
              getNotice();
              getNoticeNew();
            },
            error: function () {
              alert("error");
            }

          })
        }

        //공지삭제
        $(document).on("click", ".delNoticeBtn", function (evt) {
          let notice_num = evt.target.parentElement.parentElement.parentElement.childNodes[0].children[1].children[0].value;
          delNotice(notice_num);
        })
        function delNotice(notice_num) {


          $.ajax({
            method: "delete",
            url: "/admin/delNotice",
            data: {
              "notice_num": notice_num,
            },
            success: function (data) {
              getNotice();
              getNoticeNew();
            },
            error: function () {
              alert("error");
            }

          })
        }
      </script>

	<!-- 제안서 -->
	<script>
        //신규제안서
        function newsuggestion() {
          $("#suggestNewTbody").empty();
          $.ajax({
            method: "get",
            url: "/admin/suggestNew",
            dataType: 'json',
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                let type;
                if (data[i].type == 'A') {
                  type = '미용';
                } else if (data[i].type == 'B') {
                  type = '의류';
                } else if (data[i].type == 'C') {
                  type = '요리';
                } else if (data[i].type == 'D') {
                  type = '기타';
                }
                $("#suggestNewTbody").append(
                  "<tr><td class='goSuggestDetail'>" + data[i].suggest_num + "</td>"
                  + "<td class='goSuggestDetail'>" + type + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].suggest_title + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].member_id + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].suggest_regdate + "</td>"
                  + "</tr>");
              }
            },
            error: function () {
              alert("error");
            }
          })
        }



        //전체제안서
        function suggestAll() {
          $("#suggestAllTbody").empty();
          $.ajax({
            method: "get",
            url: "/admin/suggestAll",
            dataType: 'json',
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                let type;
                if (data[i].type == 'A') {
                  type = '미용';
                } else if (data[i].type == 'B') {
                  type = '의류';
                } else if (data[i].type == 'C') {
                  type = '요리';
                } else if (data[i].type == 'D') {
                  type = '기타';
                }
                $("#suggestAllTbody").append(
                  "<tr><td class='goSuggestDetail'>" + data[i].suggest_num + "</td>"
                  + "<td class='goSuggestDetail'>" + type + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].suggest_title + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].member_id + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].suggest_regdate + "</td>"
                  + "</tr>");
              }
            },
            error: function () {
              alert("error");
            }
          })
        }
        $("#suggestSearchbtn").click(function () {
          let keyword = $("#suggestSearchBar").val();
          if (keyword == "") {
            suggestAll();
          } else {
            getsearchSuggestion(keyword);

          }
        });
        $("#suggestSearchBar").keydown(function (evt) {
          let keyword = $("#suggestSearchBar").val();
          if (evt.keyCode == 13) {

            if (keyword == "") {
              suggestAll();
            } else {
              getsearchSuggestion(keyword);
            }
          }
        });
        // 제안 검색목록
        function getsearchSuggestion(keyword) {
          $("#suggestAllTbody").empty();
          $.ajax({
            method: "GET",
            url: "/admin/getsearchSuggestion",
            datatype: "json",
            data: {
              "keyword": keyword
            },
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                let type;
                if (data[i].type == 'A') {
                  type = '미용';
                } else if (data[i].type == 'B') {
                  type = '의류';
                } else if (data[i].type == 'C') {
                  type = '요리';
                } else if (data[i].type == 'D') {
                  type = '기타';
                }
                $("#suggestAllTbody").append(
                  "<tr><td class='goSuggestDetail' >" + data[i].suggest_num + "</td>"
                  + "<td class='goSuggestDetail'>" + type + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].suggest_title + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].member_id + "</td>"
                  + "<td class='goSuggestDetail'>" + data[i].suggest_regdate + "</td>"
                  + "</tr>");
              }


            },
            error: function () {
              alert("error");
            }


          });
        }

        //제안상세보기
        $(document).on("click", ".goSuggestDetail", function (evt) {
          let suggest_num = evt.target.parentElement.children[0].innerText;
          suggestDetail(suggest_num);
        })

        function suggestDetail(suggest_num) {
          $("#suggestDetailTbody").empty();
          $.ajax({
            method: "get",
            url: "/admin/suggestDetail",
            data: {
              "suggest_num": suggest_num
            },
            datatype: "json",
            success: function (data) {
              let city_name;
              if (data.city_code == 'A') {
                city_name = '서울';
              } else if (data.city_code == 'B') {
                city_name = '경기';
              } else if (data.city_code == 'C') {
                city_name = '인천';
              } else if (data.city_code == 'D') {
                city_name = '강원';
              } else if (data.city_code == 'E') {
                city_name = '충남';
              } else if (data.city_code == 'F') {
                city_name = '대전';
              } else if (data.city_code == 'G') {
                city_name = '충북';
              } else if (data.city_code == 'H') {
                city_name = '부산';
              } else if (data.city_code == 'I') {
                city_name = '울산';
              } else if (data.city_code == 'J') {
                city_name = '대구';
              } else if (data.city_code == 'K') {
                city_name = '경북';
              } else if (data.city_code == 'L') {
                city_name = '경남';
              } else if (data.city_code == 'M') {
                city_name = '전남';
              } else if (data.city_code == 'N') {
                city_name = '광주';
              } else if (data.city_code == 'O') {
                city_name = '제주';
              } else if (data.city_code == 'Z') {
                city_name = '온라인';
              }

              $("#suggestDetailTbody").html(
                "<tr><th>번호</th><td>" + data.suggest_num + "</td></tr>"
                + "<tr><th>구분</th><td>" + data.type + "</td></tr>"
                + "<tr><th>제안명</th><td>" + data.suggest_title + "</td></tr>"
                + "<tr><th>제안내용</th><td>" + data.suggest_content + "</td></tr>"
                + "<tr><th>강의시간</th><td>" + data.class_time + "</td></tr>"
                + "<tr><th>인원수</th><td>" + data.maxCnt + "</td></tr>"
                + "<tr><th>지역</th><td>" + city_name + "</td></tr>"
                + "<tr><th>제안일자</th><td>" + data.suggest_regdate + "</td></tr>"
                + "<tr><th>상태</th><td>" + data.status + "</td></tr>"
                + "<tr><th>반려사유</th><td><textarea name='reject_reason' value='" + data.reject_reason + "'></textarea></td></tr>"
                + "<tr><td  colspan='2'><input type='button' value='승인' id='approval'>"
                + "<input type='button' value='반려' id='reject'></td></tr>"



              );

            },
            error: function () {
              alert("error");
            }

          })

        }

      //제안승인
      
      $(document).on("click","#approval", (event) => {
			let suggest_num = event.target.parentElement.parentElement.parentElement.children[0].children[1].innerText;
			alert(suggest_num);
			$.ajax({
				url: "/admin/classreg",
				method: "post",
				data: {
					suggest_num: suggest_num
				},
				success: (data) => {
					if(data == 1){
						alert("등록 완료되었습니다.");
					} else{
						alert("에러로 인해 등록실패하였습니다.");
					}
				},
				error: () => {
					alert("Error");
				}, 
				complete:()=> {
					newsuggestion();
					suggestAll;
				}
			})
	})
	//제안반려
	  $(document).on("click","#reject", (event) => {
			let suggest_num = event.target.parentElement.parentElement.parentElement.children[0].children[1].innerText;
			let reason =  event.target.parentElement.parentElement.parentElement.children[9].children[1].children[0].value;
			alert(suggest_num);
			alert(reason);
			
			$.ajax({
				url: "/admin/rejectSuggest",
				method: "put",
				data: {
					suggest_num: suggest_num,
					reject_reason: reason
				},
				success: (data) => {
					if(data == 1){
						alert("제안서를 반려하였습니다.");
					} else{
						alert("에러로 인해 반려 실패했습니다.");
					}
				},
				error: () => {
					alert("Error");
				}, 
				complete:()=> {
					newsuggestion();
					suggestAll;
				}
			})
	})
      </script>

	<script>
        //=======================클래스리스트====================
        //클래스 리스트
        function classListAll() {
          $("#classTbody").empty();
          $.ajax({
            method: "get",
            url: "/admin/classListAll",
            dataType: 'json',
            success: function (data) {
            	for(let i=0;i<data.length;i++){
	                $("#classTbody").append(
	                		"<tr>"
	                		+"<td class='classDetail'>"+ data[i].class_code +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_subject +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
	                		+"</tr>"
	                		
	                );
            	}
            },
            error: function () {
              alert("error");
            }
          })
        }
		
        
        $("#classSearchbtn").click(function () {
            let keyword = $("#classSearchBar").val();
            if (keyword == "") {
            	 classListAll();
            } else {
            	classListSearch(keyword);

            }
          });
          $("#classSearchBar").keydown(function (evt) {
            let keyword = $("#classSearchBar").val();
            if (evt.keyCode == 13) {

              if (keyword == "") {
            	  classListAll();
              } else {
            	  classListSearch(keyword);
              }
            }
          });
      //클래스 검색
        function classListSearch(keyword) {
          $("#classTbody").empty();
          $.ajax({
            method: "get",
            url: "/admin/classListSearch",
            dataType: 'json',
            data :{
            	"keyword" : keyword
            },
            success: function (data) {
            	for(let i=0;i<data.length;i++){
	                $("#classTbody").append(
	                		"<tr>"
	                		+"<td class='classDetail'>"+ data[i].class_code +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_subject +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
	                		+"</tr>"
	                		
	                );
            	}
            },
            error: function () {
              alert("error");
            }
          })
        }
      
      //클래스정보상세보기
		$(document).on("click",".classDetail",function(evt){
			let class_code = evt.target.parentElement.children[0].innerText;
			classDetail(class_code);
		})
		
		function classDetail(class_code){
			$("#classDetailTbody").empty();
	          $.ajax({
	            method: "get",
	            url: "/admin/classDetail",
	            dataType: 'json',
	            data :{
	            	"class_code" : class_code
	            },
	            success: function (data) {
		                $("#classDetailTbody").append(
		                		"<tr><th>클래스코드</th><td><input type = 'text' name = 'class_code' readonly='readonly'value='"+data.class_code+"' ></td></tr>"
		                		+"<tr><th>제목</th><td><input type = 'text' name = 'class_subject' value='"+data.class_subject+"' ></input></td></tr>"
		                		+"<tr><th>강사</th><td><input type = 'text' name = 'class_teacher' value='"+data.class_teacher+"' ></input></td></tr>"
		                		+"<tr><th>수강날짜</th><td><input type = 'text' name = 'class_date' value='"+data.class_date+"' ></input>"
		                		+"<input type = 'hidden' name = 'class_regdate' value='"+data.class_regdate+"' ></input></td></tr>"
		                		+"<input type = 'hidden' name = 'city_code' value='"+data.city_code+"' ></input></td></tr>"
		                		+"<tr><th>내용</th><td><textarea name = 'class_info' >"+data.class_info+"</textarea></td></tr>"
		                		+"<tr><th>최대정원</th><td><input type = 'text' name = 'class_memlit' value='"+data.class_memlit+"' ></input></td></tr>"
		                		+"<tr><th>가격</th><td><input type = 'text' name = 'class_price' value='"+data.class_price+"' ></input></td></tr>"
		                		+"<tr><th>첨부사진</th><td><input type = 'text' name = 'suggest_photo' value='"+data.suggest_photo+"' ></td></tr>"
		                		+"<tr><th>파일 새로넣기</th><td><input type = 'file' name = 'files' multiple='multiple'></td></tr>"
		                		+"<tr><td colspan='2'><input type = 'submit' value = '수정'><input type = 'button' value = '삭제' class='delClass'></td></tr>"

		                );
	            },
	            error: function () {
	              alert("error");
	            }
	          })
    	  
      }
      //정렬하기
      $("#endBtn").click((event) => {
		$.ajax({
			url: "/admin/class/end",
			method: "GET",
			dataType: "json",
			success: (data) => {
				$("#classTbody").empty();
				for(let i = 0; i < data.length; i++){
					$("#classTbody").append(
	                		"<tr>"
	                		+"<td class='classDetail'>"+ data[i].class_code +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_subject +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
	                		+"</tr>"
	                );
				}
			},
			error: () => {
				alert("error");
			}
			
		})
	})
	
	$("#activeBtn").click((event) => {
		$.ajax({
			url: "/admin/class/active",
			method: "GET",
			dataType: "json",
			success: (data) => {
				$("#classTbody").empty();
				for(let i = 0; i < data.length; i++){
					$("#classTbody").append(
	                		"<tr>"
	                		+"<td class='classDetail'>"+ data[i].class_code +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_subject +"</td>"
	                		+"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
	                		+"</tr>"
	                );
				}
			},
			error: () => {
				alert("error");
			}
			
		})
	})
	$("#dayBtn").click((event) => {
		if(event.target.value == "desc"){
			event.target.value = "asc";
			$.ajax({
				url: "/admin/class/ASC",
				method: "GET",
				dataType: "json",
				success: (data) => {
					$("#classTbody").empty();
					for(let i = 0; i < data.length; i++){
						$("#classTbody").append(
		                		"<tr>"
		                		+"<td class='classDetail'>"+ data[i].class_code +"</td>"
		                		+"<td class='classDetail'>"+ data[i].class_subject +"</td>"
		                		+"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
		                		+"</tr>"
		                );
					}
				},
				error: () => {
					alert("error");
				}
				
			})
		} else{
			event.target.value = "desc";
			$.ajax({
				url: "/admin/class/DESC",
				method: "GET",
				dataType: "json",
				success: (data) => {
					$("#classTbody").empty();
					for(let i = 0; i < data.length; i++){
						$("#classTbody").append(
		                		"<tr>"
		                		+"<td class='classDetail'>"+ data[i].class_code +"</td>"
		                		+"<td class='classDetail'>"+ data[i].class_subject +"</td>"
		                		+"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
		                		+"</tr>"
		                );
					}
				},
				error: () => {
					alert("error");
				}
				
			})
		}
	})
	//클래스 삭제
      $(document).on("click",".delClass", function(evt){
    	  let class_code = $("input[name='class_code']").val();
    	  let class_subject = $("input[name='class_subject']").val();
    	  let suggest_photo = $("input[name='suggest_photo']").val();
    	  let class_teacher = $("input[name='class_teacher']").val();
    	  let class_date = $("input[name='class_date']").val();
    	  let class_info = $("textarea[name='class_info']").val();
    	  let class_memlit = $("input[name='class_memlit']").val();
    	  let class_price = $("input[name='class_price']").val();
    	  let city_code = $("input[name='city_code']").val();
    	  let class_regdate = $("input[name='class_regdate']").val();
    	  let suggest_num = $("input[name='suggest_num']").val();
    	  alert(class_regdate);
    	  
    	  $.ajax({
    		  method : "delete",
    		  url: "/admin/delClass",
              data :{
            	  "class_code" : class_code,
            	  "class_subject" : class_subject, 
            	  "suggest_photo" : suggest_photo, 
            	  "class_teacher" : class_teacher,
            	  "class_date" : class_date, 
            	  "class_info" : class_info, 
            	  "class_memlit" : class_memlit, 
            	  "class_price" : class_price, 
            	  "city_code" : city_code, 
            	  "class_regdate" : class_regdate, 
            	  "suggest_num" : suggest_num
            	  
              },
              success: function (data) {
            	  
              },
              error: function () {
                alert("error");
              },
              complete:function(){
            	  classListAll();
              }
    	  })
      })
	
      
      //클래스 숫자
      function currentClassStatus(){
    	  $.ajax({
    		  method : "get",
    		  url: "/admin/currentClassStatus",
              success: function (data) {
				$("#classStatus").text(data);
              
              },
              error: function () {
                alert("error");
              }
    	  })
      }
	
      //비율구하기
      function classRate(){
    	  
    	  $.ajax({
    		  method : "get",
    		  url: "/admin/classRate",
              dataType: 'json',
              success: function (data) {
            	  $("#classMem").text(data.memcnt +"  /  " + data.memlit);
            	  $("#classRate").text(data.rate +"  %  ");
              },
              error: function () {
                alert("error");
              }
    	  })
      }
      
      </script>
	<script>
		//===============매출===================
			//오늘의 매출
			 function todaysSales(){
		    	  
		    	  $.ajax({
		    		  method : "get",
		    		  url: "/admin/todaysSales",
		              dataType: 'json',
		              success: function (data) {
		            	  $("#todaysSales").text(data +" 원");
		              },
		              error: function () {
		                alert("error");
		              }
		    	  })
		      }
		//주간매출
		 function weeklySales(){
		    	  
		    	  $.ajax({
		    		  method : "get",
		    		  url: "/admin/weeklySales",
		              dataType: 'json',
		              success: function (data) {
		            	  $("#weeklySales").text(data +" 원");
		              },
		              error: function () {
		                alert("error");
		              }
		    	  })
		      }
		
		//월간매출
		 function monthlySales(){
		    	  
		    	  $.ajax({
		    		  method : "get",
		    		  url: "/admin/monthlySales",
		              dataType: 'json',
		              success: function (data) {
		            	  $("#monthlySales").text(data +" 원");
		              },
		              error: function () {
		                alert("error");
		              }
		    	  })
		      }
		//연간매출
		 function yearlySales(){
		    	  
		    	  $.ajax({
		    		  method : "get",
		    		  url: "/admin/yearlySales",
		              dataType: 'json',
		              success: function (data) {
		            	  $("#yearlySales").text(data +" 원");
		              },
		              error: function () {
		                alert("error");
		              }
		    	  })
		      }
		
		//전일대비 증감율
		
		function dayChange(){
	    	  
	    	  $.ajax({
	    		  method : "get",
	    		  url: "/admin/dayChange",
	              dataType: 'json',
	              success: function (data) {
	            	  $("#dayChange").text(data +" %");
	              },
	              error: function () {
	                alert("error");
	              }
	    	  })
	      }

		//전주대비 증감율
		
		function weekChange(){
	    	  
	    	  $.ajax({
	    		  method : "get",
	    		  url: "/admin/weekChange",
	              dataType: 'json',
	              success: function (data) {
	            	  $("#weekChange").text(data +" %");
	              },
	              error: function () {
	                alert("error");
	              }
	    	  })
	      }

		//전월대비 증감율
		
		function monthChange(){
	    	  
	    	  $.ajax({
	    		  method : "get",
	    		  url: "/admin/monthChange",
	              dataType: 'json',
	              success: function (data) {
	            	  $("#monthChange").text(data +" %");
	              },
	              error: function () {
	                alert("error");
	              }
	    	  })
	      }
		
		//1회평균결제금액
		
		
		
		function buyaverage(){
	    	  
	    	  $.ajax({
	    		  method : "get",
	    		  url: "/admin/buyaverage",
	              dataType: 'json',
	              success: function (data) {
	            	  $("#buyaverage").text(data +" 원");
	              },
	              error: function () {
	                alert("error");
	              }
	    	  })
	      }
		//월간 평균 구매횟수
		function averagePurchase(){
	    	  
	    	  $.ajax({
	    		  method : "get",
	    		  url: "/admin/averagePurchase",
	              dataType: 'json',
	              success: function (data) {
	                  const temp1 = data * 10
	                  const temp2 = Math.ceil(temp1) / 10;
	            	  $("#average_purchase").text(temp2 +" 회");
	              },
	              error: function () {
	                alert("error");
	              }
	    	  })
	      }
	</script>

     <script>
      //(문지현)회원목록
      getlist();
      Memmanager_page();
	  function getlist() {
		 let tbody = document.querySelector("#membertbody");
		 const xhttp = new XMLHttpRequest();
		 xhttp.onload = function() {
		 let data = this.responseText;
		 let obj = JSON.parse(data);
		
		 for(i = 0;i<obj.length;i++ ){
			tbody.innerHTML +="<tr><td class='objid''>" +obj[i].member_id +"</td><td><input type='text' value="+obj[i].member_pw+"></td><td>" 
			+ "<input type='text' value="+obj[i].member_name+"></td><td><input type='text' value=" + obj[i].member_tel+"></td><td>"
			+ "<input type='text' value="+obj[i].postnum+"></td><td><input  type='text' value='"+obj[i].member_address+"'></td><td>"
			+ "<input  type='text' value='"+obj[i].member_addressdetail+"'></td><td>"+obj[i].member_grade+"</td>"
			+ "<td><input type='button' class = 'memChange' value='수정'></td>"
			+ "<td><input type='button' class = 'memDel' value='삭제'></td></tr>";
			 }
		  }
			  xhttp.open("GET", "/member/MembermanagerList?pageNum=1", true);
			  xhttp.send();
			}
	  
      $("#Memmanager_pages").on("click", function (event) {
          let e = event.target.className;
          if (e == "pageBtn") {
          $("#membertbody").empty();
             let pageNum = event.target.textContent;
             $.ajax({
                url: "/member/MembermanagerList",
                method: "get",
                dataType: "json",
                data: {
                   pageNum: pageNum
                },
                success: (data) => {
                   
                   for (let i = 0; i < data.length; i++) {
                      $("#membertbody").append("<tr><td>" +data[i].member_id +"</td><td><input type='text' value="+data[i].member_pw+"></td><td>" 
                  			+ "<input type='text' value="+data[i].member_name+"></td><td><input type='text' value=" + data[i].member_tel+"></td><td>"
                			+ "<input type='text' value="+data[i].postnum+"></td><td><input  type='text' value='"+data[i].member_address+"'></td><td>"
                			+ "<input  type='text' value='"+data[i].member_addressdetail+"'></td><td>"+data[i].member_grade+"</td>"
                			+ "<td><input type='button' class = 'memChange' value='수정'></td>"
                			+ "<td><input type='button' class = 'memDel' value='삭제'></td></tr>");
                   }
                   $("td").css({
                      "border-bottom": "thin solid #BBB09F",
                      "height": "40px"
                   });
                   $("td:nth-of-type(4)").css({
                      "width": "300px",
                      "height": "100px",
                   });
                   $("a").css("color", "black");
                   $("a").css("text-decoration", "none");
                },
                error: () => {
                   alert("Error [실패]");
                }


             })

          }


       })

	//회원목록 최대페이지
      function Memmanager_max() {
         let maxPage;
         $.ajax({
            url: "/member/MembermanagermaxPage",
            method: "get",
            async: false,
            success: function (data) {
               maxPage = data;
            },
            error: function () {
               alert("error!");
            }
         })
         return maxPage;
      }
      
      //회원목록 페이지버튼
      function Memmanager_page() {
         $("#membertbody").empty();
         //ajax로 가져온다
         let start = $("input[name=Memmanager_startNum]").val();
         let startNum = Number(start);
         let maxPage = Memmanager_max();
         let endPage = startNum+4;
     
         if(startNum == 1){
            $("#Memmanager_backBtn").hide();
         }
         if(endPage > maxPage){
            endPage=(maxPage+1);
         }
         
         for (let i = startNum; i < endPage+1; i++) {
            $("#Memmanager_pages").append(
            "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
            )
         }
         $("#Memmanager_frontBtn").css({
            "width": "40px",   
            "margin": "0 3px",   
            "border": "none",
            "background-color": "rgba(0, 0, 0, 0)"
         })
         $("#Memmanager_backBtn").css({
            "width": "40px",   
            "margin": "0 3px",   
            "border": "none",
            "background-color": "rgba(0, 0, 0, 0)"
         })


      }
      //나의 문의내역 다음버튼
      $("#Memmanager_frontBtn").click(() => {
         $("#Memmanager_backBtn").show();
         $("#Memmanager_pages").empty();
         let start = $("input[name=Memmanager_startNum]").val();
         let startNum = Number(start) +5;
         $("input[name=Memmanager_startNum]").val(startNum);
         
         let maxPage = Memmanager_max();

         let endPage = startNum+5;
            if(endPage>maxPage){
               endPage=maxPage;
               $("#Memmanager_frontBtn").hide();
            }
         for (let i = startNum; i < endPage+1; i++) {
            
            $("#Memmanager_pages").append(
            "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
            )
         }
         $("#Memmanager_frontBtn").css({
            "width": "40px",   
            "margin": "0 3px",   
            "border": "none",
            "background-color": "rgba(0, 0, 0, 0)"
         })
         $("#Memmanager_backBtn").css({
            "width": "40px",   
            "margin": "0 3px",   
            "border": "none",
            "background-color": "rgba(0, 0, 0, 0)"
         })
      });

      //나의 문의내역 이전버튼
      $("#Memmanager_backBtn").click(() => {
         $("#Memmanager_frontBtn").show();
         $("#Memmanager_pages").empty();
         let start = $("input[name=Memmanager_startNum]").val();
         let startNum = Number(start) -5;

         
         if(startNum == 1){
            $("#Memmanager_backBtn").hide();
         }
         $("input[name=Memmanager_startNum]").val(startNum);
         
         
         let maxPage = Memmanager_max();
         let endPage = startNum+4;
         
         for (let i = startNum; i < endPage+1; i++) {
            
            $("#Memmanager_pages").append(
            "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
            )
         }
      });
      
      
		
		function serchMem() {
			
			$("#membertbody").empty();
		    let memberOption = $("select[name='memberOption']").val();
		    let search = $("#searchMem1").val();
		    alert(memberOption);
		
		    urldata = "";
		    data ="";
		    if(memberOption=="member_id"){
		       urldata = "/member/selectOneid";
		       data = "id";
		    }else if(memberOption=="member_name"){
		       urldata = "/member/selectOnename";
		       data = "name";
		    }else if(memberOption=="member_grade"){
		       urldata = "/member/selectOnegrade";
		       data = "grade";
		    }
		    $.ajax({
		       url: urldata+"?"+data+"="+search,
		       method: "GET",
		       dataType: "json",
		       success: (data) => {
		    	   for(let i=0 ; i<data.length;i++){
		    		   $("#membertbody").append("<tr><td>" +data[i].member_id +"</td><td><input type='text' value=" + data[i].member_pw +"></td><td>"
		    				    + "<input type='text' value="+data[i].member_name+"></td><td><input type='text' value=" + data[i].member_tel+"></td><td>"
		    					+ "<input type='text' value="+data[i].postnum+"></td><td><input  type='text' value='"+data[i].member_address+"'></td><td>"
		    					+ "<input  type='text' value='"+data[i].member_addressdetail+"'></td><td>"+data[i].member_grade+"</td>"
		    				  	+ "<td><input type='button' class = 'memChange' value='수정'></td>"
		    				  	+ "<td><input type='button' class = 'memDel'  value='삭제'></td></tr>")
		    	          
		    	   }
		         
		       }
		       
		    })
		}	
		
		
		$("#membertbody").click((e) => {
			if(e.target.value == "수정"){
				let id = e.target.parentElement.parentElement.children[0].innerText;
				let pw = e.target.parentElement.parentElement.children[1].firstChild.value;
				let name = e.target.parentElement.parentElement.children[2].firstChild.value;
				let tel = e.target.parentElement.parentElement.children[3].firstChild.value;
				let postnum = e.target.parentElement.parentElement.children[4].firstChild.value;
				let address = e.target.parentElement.parentElement.children[5].firstChild.value;
				let addressdetail = e.target.parentElement.parentElement.children[6].firstChild.value;
				let grade = e.target.parentElement.parentElement.children[7].innerText;
				
				   let obj_member = {
			               "member_id" : id,
			               "member_pw" : pw,
			               "member_name" : name,
			               "member_tel" : tel,
			               "postnum" : postnum,
			               "member_address" : address,
			               "member_addressdetail" : addressdetail,
			               "member_grade" :grade
			            }
				   alert(JSON.stringify(obj_member));
				      $.ajax({
				             url: "/member/UpdateMemManager",
				             method: "POST",
				             contentType: "application/json",
				             data: JSON.stringify(obj_member),
				             success: function(data){
				                 alert(data);
				         	}
				      })  
		
			} else if(e.target.value == "삭제"){
				let id = e.target.parentElement.parentElement.children[0].innerText;
				
				 $.ajax({
		             url: "/member/deleteMemManager",
		             method: "DELETE",
		             data: {
		            	 "id" : id
		             },
		             success: function(data){
		                 alert(data);
		         	}
		      })  
				
			}
		
		})
	//(문지현)회원등급변경
	
	getlist2();

	function getlist2() {
		  let tbody = document.querySelector("#tbodygrade");
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			 let data = this.responseText;
			 let obj = JSON.parse(data);
	
				for(i = 0;i<obj.length;i++ ){
					tbody.innerHTML +="<tr><td class='objid''>" +obj[i].member_id +"</td><td>" + obj[i].member_pw +"</td><td>" + obj[i].member_name+"</td><td>" + obj[i].member_tel+"</td><td>"
					+ obj[i].member_grade+"</td><td><select name='memberOptionChange'>"
				  	+ "<option value='hh'>-- 선택 --</option><option value='A'>일반</option>"
				  	+ "<option value='B'>강사</option><option value='C'>관리자</option></select></td>"
				  	+ "<td><input class = 'gradeChange' type = 'button' value ='저장'></td></tr>";
				}
		    }
		  xhttp.open("GET", "/member/selectall", true);
		  xhttp.send();
		}
	
	
	function serchMem2() {
		
		$("#tbodygrade").empty();
	    let memberOption = $("select[name='memberOption2']").val();
	    let search = $("#searchMem2").val();
	    alert(memberOption);
	    alert(search);
	    urldata = "";
	    data ="";
	    if(memberOption=="member_id"){
	       urldata = "/member/selectOneid";
	       data = "id";
	    }else if(memberOption=="member_name"){
	       urldata = "/member/selectOnename";
	       data = "name";
	    }else if(memberOption=="member_grade"){
	       urldata = "/member/selectOnegrade";
	       data = "grade";
	    }
	    $.ajax({
	       url: urldata+"?"+data+"="+search,
	       method: "GET",
	       dataType: "json",
	       success: (data) => {
	    	   for(let i=0 ; i<data.length;i++){
	    		   $("#tbodygrade").append("<tr><td>" +data[i].member_id +"</td><td>" + data[i].member_pw +"</td><td>" + data[i].member_name+"</td><td>" + data[i].member_tel+"</td><td>"
	    	  				+data[i].member_grade+"</td><td><select name='memberOption2'>"
	    				  	+ "<option value='hh'>-- 선택 --</option><option value='A'>일반</option>"
	    				  	+ "<option value='B'>강사</option><option value='C'>관리자</option></select></td>"
	    				  	+ "<td><input class = 'gradeChange' type = 'button' value ='저장'></td></tr>")
	    	          
	    	   }
	         
	       }
	       
	    })
	}	
	$("#tbodygrade").click((e) => {
		if(e.target.className == "gradeChange"){
			 let memberOptionChange = e.target.parentElement.previousElementSibling.firstChild.value;
			 let gradeid = e.target.parentElement.parentElement.firstChild.textContent;
			 alert(memberOptionChange);
			 alert(id);
			 $.ajax({
			        url: "/member/gradeChange",
			        method: "PUT",
			        data : {     
			         "gradeid": gradeid,
			         "grade":memberOptionChange
			        },
			        success: function(data){
			           alert(data);
			           
			        },
			        error: function(){
			           alert("error..");
			        }
			        
			     })      
			  
		}
	
	})
	
	//신규가입회원
	
	
    </script>
  </body>

</html>
