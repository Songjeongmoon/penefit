<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

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
              backgroundColor: "",
              colors: ['#FFD56F','#FFB26B', '#FF7B54', '#939B62', 'black' ,'black'],
              
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
              colors: ['#3366CC']
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d_1'));
            chart.draw(data, options);
          }
          xhttp.open("GET", "/admin/qnaType", true);
          xhttp.send();
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
	width: 1750px;
	height: 920px;
	overflow: hidden;
	display: flex;
}

#sideBar {
	display: inline-block;
	position: relative;
	width: 15%;
	height: 100vh;
	background-color: #051937;
}

#logo {
	font-family: 'SBAggroB';
	font-weight: bold;
	font-size: 35px;
	text-align: center;
	height: 125px;
	width: 100%;
	display: inline-block;
	line-height: 130px;
	color: white;
}

.sideMenu {
	border-radius: 10px 0 0 10px;
	text-align: center;
	width: 100%;
	height: 6vh;
	margin-top: 10px;
	line-height: 6vh;
	transition: all 0.3s ease-in;
	cursor: pointer;
	font-size: 1.2em;
	font-weight: bold;
	position: relative;
	left: 20px;
	color: #F7F7F7;
}

.sideMenu:hover {
	color: #051937;
	background-color: #F7F7F7;
}

#topBar {
	display: inline-block;
	width: 100%;
	margin-top: 20px;
	height: 50px;
}

.subMenu {
	float: left;
	width: 120px;
	height: 35px;
	margin: 10px 0 0 20px;
	line-height: 3.8vh;
	text-align: center;
	font-size: 16px;
	font-weight: bolder;
	cursor: pointer;
	transition: all 0.15s;
	position: relative;
	left: 50px;
}

.subMenu1 {
	margin-left: 50px;
	color: white;
}

.subMenu:hover {
	border-bottom: 3px solid orange;
}

.article {
	border-radius: 20px;
	position: relative;
	float: left;
	width: 100%;
	height: 90%;
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

.subtitle {
	border-bottom: 1px solid #f0f0f0; width : 100%;
	border-radius: 7px;
	height: 30px;
	line-height: 30px;
	margin-bottom: 20px;
	border-radius: 7px 7px 0 0;
	font-weight: bold;
	width: 100%;
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
	left: 18%;
	bottom: 10%;
	width: 300px;
	height: 20px;
	border-radius: 10px;
	background-color: #F7F7F7;
	;
}

.inner {
	position: absolute;
	left: 18%;
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
	bottom: 40%;
	left: 38%;
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

#sideMenu5 {
	position: relative;
	top: 250px;
}

#mainBox1 {
	grid-column: 1/3;
}

#mainBox4 {
	grid-row: 2/4;
}

#mainBox5 {
	grid-row: 2/4;
}

#mainBox6 {
	grid-row: 2/4;
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

.mainTable {
	text-align: center;
	font-size: 20px;
}

td {
	border-right: 1px solid white;
	border-left: 1px solid white;
}

.footer {
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

.mainDate {
	margin: 0 20px 0 20px;
}

.stick {
	position: relative;
	background-color: orange;
	width: 20px;
	transform: translateY(-50%);
	color: white;
	left: 185px;
}

#stickBox {
	display: flex;
	position: relative;
	width: 100%;
	height: 200px;
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

#mainBox1 {
	grid-column: 1/3;
}

#mainBox4 {
	grid-row: 2/4;
}

#mainBox5 {
	grid-row: 2/4;
}

#mainBox6 {
	grid-row: 2/4;
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

.mainTable {
	text-align: left;
	font-size: 20px;
}

th {
	text-align: center;
}

td {
	border-right: 1px solid white;
	border-left: 1px solid white;
}

.footer {
	position: absolute;
	bottom: 0;
	border-radius: 0 0 7px 7px;
	width: 100%;
	height: 30px;
	background-color: black;
	color: white;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.mainDate {
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
	position: relative;
	width: 100%;
	height: 130px;
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

.page {
	display: inline-block;
}

/* QNA */

#qnabox1 table {
	box-shadow: 2px 1px 1px #f0f0f0;
	margin-left: 50px;
	width: 800px;
}

#qnabox3 table {
	box-shadow: 2px 1px 1px #f0f0f0;
	margin-left: 50px;
	width: 800px;
}

table thead tr:nth-of-type(1) {
	border-radius: 7px;
	border-bottom: thin solid #f0f0f0;
	border-top: thin solid #f0f0f0;
	height: 25px;
	line-height: 25px;
	font-weight: bolder;
	background-color: #cccccc;
}

table tbody tr {
	border-radius: 2px;
	border-bottom: thin solid #f0f0f0;
	text-align: center;
	height: 25px;
	line-height: 25px;
}

table tbody tr:hover {
	transform: scale(1.015, 1.03);
	font-weight: bold;
	background-color: #f7f7f7;
}
</style>
</head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">

	<div id="container">
		<div id="sideBar">
			<div id="logo">
				<a id="home" style="color: white;">Penefit</a>
			</div>
			<div id="sideBox">
				<div id="sideMenu1" class="sideMenu">Member</div>
				<div id="sideMenu2" class="sideMenu">Board</div>
				<div id="sideMenu3" class="sideMenu">Class</div>
				<div id="sideMenu4" class="sideMenu">Sales</div>


			</div>
		</div>
		<div style="width: 100%;">
			<div id="topBar">
				<ul id="ul1">
					<li id="member" class="subMenu">Member List</li>
					<li id="manager" class="subMenu">Manager List</li>
				</ul>

				<ul id="ul2">
					<li id="qna" class="subMenu">QnA List</li>
					<li id="notice" class="subMenu">Notice List</li>
				</ul>

				<ul id="ul3">
					<li id="suggestion" class="subMenu">Suggestion List</li>
					<li id="class" class="subMenu">Class List</li>
					<li id="review" class="subMenu">Review List</li>
				</ul>

				<ul id="ul4">
					<li id="status" class="subMenu">Status</li>
					<li id="others" class="subMenu">others</li>
				</ul>
				<a href="/"><img src="../../images/logo.png" style="width: 170px; float: right; margin-right: 50PX;"></a>
			</div>


			<div id="mainArticle" class="article">

				<div id="mainBox1" class="box">
					<div class="subtitle">&nbsp;&nbsp;최근방문자&nbsp; (7일 이내)</div>
					<div class="content">
						<div id="stickBox" style="height: 140px;">
							<c:forEach var="visit" items="${visits }">
								<div style="height: ${visit.visit}px;" class="stick">
									<span class="visit">${visit.visit }</span>
								</div>
							</c:forEach>
						</div>

						<div class="footer" id="mainFooter">
							<c:forEach var="visit" items="${visits }">
								<div class="mainDate">${visit.day}</div>
							</c:forEach>
						</div>
					</div>
				</div>


				<div id="mainBox2" class="box">
					<div class="subtitle">&nbsp;&nbsp;강사리스트</div>
					<div class="content">ㅇㅇㅇ</div>

					<table class="mainTable">
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
				</div>


				<div id="mainBox4" class="box">
					<div class="subtitle">&nbsp;&nbsp;제안서 [${suggestionCount } 건]</div>
					<div class="content"></div>

					<table class="mainTable">
						<thead>
							<tr>
								<th>NO</th>
								<th>ID</th>
								<th>Title</th>
								<th>regDate</th>
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
				</div>


				<div id="mainBox5" class="box">

					<div class="subtitle">&nbsp;&nbsp;오늘의 클래스 [${classTodayCount } 건]</div>
					<div class="content">

						<table class="mainTable">
							<thead>
								<tr>
									<th>Title</th>
									<th>teacher</th>
									<th>time</th>
									<th>min/max</th>
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
					</div>
				</div>

				<div id="mainBox6" class="box">
					<div class="subtitle">&nbsp;&nbsp;Q&A [${qnaCount } 건]</div>
					<div class="content">

						<table class="mainTable">
							<thead>
								<tr>
									<th>No</th>
									<th>Id</th>
									<th>Title</th>
									<th>regDate</th>
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
					</div>
				</div>
			</div>

			<div id="memberArticle" class="article">
				<div id="box1" class="box">1</div>
				<div class="box">2</div>
				<div class="box">3</div>
				<div class="box">4</div>
				<div class="box">5</div>
				<div class="box">6</div>
			</div>

			<div id="managerArticle" class="article">
				<div id="box1" class="box">1</div>
				<div class="box">2</div>
				<div class="box">3</div>
				<div class="box">4</div>
				<div class="box">5</div>
				<div class="box">6</div>
			</div>

			<div id="qnaArticle" class="article">
				<div class="box" id="qnabox1">
					<div class="subtitle">&nbsp;&nbsp;신규글</div>
					<div class="content">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>상태</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody id="qnaNewTbl"></tbody>
						</table>
						<div id="qnaNewBackBtn" class="page">이전</div>
						<div id="qnaNewTblBox" class="page"></div>
						<div id="qnaNewFrontBtn" class="page">다음</div>
						<input type="hidden" id="pageNewStartNum"> <input type="hidden" id="maxNewPage">
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
						<table >
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>상태</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody id="qnaAllTbl"></tbody>
						</table>
						<div id="qnaAllBackBtn" class="page">이전</div>
						<div id="qnaAllTblBox" class="page"></div>
						<div id="qnaAllFrontBtn" class="page">다음</div>
						<input type="hidden" id="pageStartNum"> <input type="hidden" id="maxPage">
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
						<div id="noticeAllBackBtn" class="page">이전</div>
						<div id="noticeAllTblBox" class="page"></div>
						<div id="noticeAllFrontBtn" class="page">다음</div>
						<input type="hidden" id="noticePageStartNum"> <input type="hidden" id="noticeMaxPage">
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
							<tbody id="noticeNewTbody"></tbody>
						</table>
						<div id="noticeNewBackBtn" class="page">이전</div>
						<div id="noticeNewTblBox" class="page"></div>
						<div id="noticeNewFrontBtn" class="page">다음</div>
						<input type="hidden" id="noticeNewPageStartNum"> <input type="hidden" id="noticeNewMaxPage">
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
							<tbody id="suggestNewTbody"></tbody>
						</table>
						<div id="suggestNewBackBtn" class="page">이전</div>
						<div id="suggestNewTblBox" class="page"></div>
						<div id="suggestNewFrontBtn" class="page">다음</div>
						<input type="hidden" id="suggestNewPageStartNum"> <input type="hidden" id="suggestNewMaxPage">
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
						<input type="text" name="suggestKeyword" id="suggestSearchBar" style="margin: 10px;"> <input type="button" value="검색" id="suggestSearchbtn"> <br> &nbsp;&nbsp;<a class="filterKeyword">검토</a>&nbsp;&nbsp;| <a class="filterKeyword">승인</a>&nbsp;&nbsp;| <a class="filterKeyword">반려</a>&nbsp;&nbsp;| <a class="filterKeyword">전체목록</a>
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
						<div id="suggestAllBackBtn" class="page">이전</div>
						<div id="suggestAllTblBox" class="page"></div>
						<div id="suggestAllFrontBtn" class="page">다음</div>
						<input type="hidden" id="suggestAllPageStartNum"> <input type="hidden" id="suggestAllMaxPage"> <input type="hidden" id="filterKeyword">
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
							<a id="dayBtn" class="status">날짜순</a> | <a id="endBtn" class="status">완료된 클래스</a> | <a id="activeBtn" class="status">진행중인 클래스</a>
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
						<div id="classAllBackBtn" class="page">이전</div>
						<div id="classAllTblBox" class="page"></div>
						<div id="classAllFrontBtn" class="page">다음</div>
						<input type="hidden" id="classAllPageStartNum" value=1> <input type="hidden" id="classAllMaxPage"> <input type="hidden" id="statusKeyword" value="desc"> <input type="hidden" id="dayStatus" value="desc"> <input type="hidden" id="push" value=0>

					</div>
				</div>
				<div class="box" id="classbox2">
					<div class="subtitle">&nbsp;&nbsp;상세보기</div>
					<div class="content">
						<form id="classUpdateForm">
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
						<div id="reviewNewBackBtn" class="page">이전</div>
						<div id="reviewNewTblBox" class="page"></div>
						<div id="reviewNewFrontBtn" class="page">다음</div>
						<input type="hidden" id="reviewPageNewStartNum" value=1> <input type="hidden" id="reviewMaxNewPage">

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
						<div id="reviewAllBackBtn" class="page">이전</div>
						<div id="reviewAllTblBox" class="page"></div>
						<div id="reviewAllFrontBtn" class="page">다음</div>
						<input type="hidden" id="reviewPageAllStartNum" value=1> <input type="hidden" id="reviewMaxAllPage">
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
					<div class="content" style="margin: 0 auto;"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
   $(".subMenu").css("display", "none");
        // SubMenu Display
        $("#sideMenu1").click(() => {
           $("#sideMenu1").css({
               "background-color": "#F7F7F7",
                "color" : "#051937"
           })
          $(".sideMenu:not(#sideMenu1)").removeAttr("style");
           $("#subMenu1").css("display", "block");
           $(".subMenu:not(#subMenu1)").removeAttr("style");
          $("#ul1").css("display", "block");
          $("#ul2").css("display", "none");
          $("#ul3").css("display", "none");
          $("#ul4").css("display", "none");
        });
        $("#sideMenu2").click(() => {
           $("#sideMenu2").css({
              "background-color": "#F7F7F7",
               "color" : "#051937"
             })
             $("#subMenu2").css("display", "block");
          $(".sideMenu:not(#sideMenu2)").removeAttr("style");
         $(".subMenu:not(#subMenu2)").removeAttr("style");
          $("#ul1").css("display", "none");
          $("#ul2").css("display", "block");
          $("#ul3").css("display", "none");
          $("#ul4").css("display", "none");
        });
        $("#sideMenu3").click(() => {
           $("#sideMenu3").css({
                 "background-color": "#F7F7F7",
                  "color" : "#051937"
                })
                 $(".sideMenu:not(#sideMenu3)").removeAttr("style");
           $("#subMenu3").css("display", "block");
           $(".subMenu:not(#subMenu3)").removeAttr("style");
          $("#ul1").css("display", "none");
          $("#ul2").css("display", "none");
          $("#ul3").css("display", "block");
          $("#ul4").css("display", "none");
        });
        $("#sideMenu4").click(() => {
           $("#sideMenu4").css({
                 "background-color": "#F7F7F7",
                  "color" : "#051937"
                })
                 $(".sideMenu:not(#sideMenu4)").removeAttr("style");
           $("#subMenu4").css("display", "block");
           $(".subMenu:not(#subMenu4)").removeAttr("style");
          $("#ul1").css("display", "none");
          $("#ul2").css("display", "none");
          $("#ul3").css("display", "none");
          $("#ul4").css("display", "block");
        });

        
        // Article Display
        $("#home").click((event) => {
           $(".subMenu").css("display", "none");
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
           $("#manager").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#member").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#notice").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#qna").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#class").removeAttr("style");
           $("#review").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#suggestion").removeAttr("style");
           $("#review").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#suggestion").removeAttr("style");
           $("#class").removeAttr("style");
          $(event.target).css("border-bottom", "3px solid orange");
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
           $("#others").removeAttr("style");
           $(event.target).css("border-bottom", "3px solid orange");
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
           $("#status").removeAttr("style");
           $(event.target).css("border-bottom", "3px solid orange");
            $("#mainArticle").css("display", "none");
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
               alert(data);
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
            data: {
            	startNum: 1
            },
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#qnaAllTbl").append(
                  "<tr><td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_num + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_title + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_status + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_regdate + "</a></td>"
                  + "</tr>");
              }
              $("tr").css({
              	 "height" : "25px",
              	 "line-height" : "25px",
              	 "border-radius" : "5px",
                })
            },
            error: function () {
              alert("error");
            },
            complete: () => {
            	$.ajax({
            		url: "/admin/qna-all-max-page",
            		method: "GET",
            		success: (data) => {
            			$("#qnaAllTblBox").empty();
            			$("#qnaAllBackBtn").css("display", "none");
            			$("#pageStartNum").val(1);
            			$("#maxPage").val(data);
            			for(let i = 1; i < 6; i++){
            				if(i <= data){
		                        $("#qnaAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
            				}else {
            					$("#qnaAllFrontBtn").css("display", "none");
            				}
            			}
            		},
            		error: () => {
            			alert("[error] 전체글 최대 페이지를 가져오는데 실패하였습니다.");
            		}
            	})
            }
          })
        }
        $("#qnaAllTblBox").click((event) => {
        	if(event.target.className == "page"){
        		let page = event.target.textContent;
        		$.ajax({
	        		url: "/admin/qnaLoadAll",
	        		method: "GET",
	        		data: {
	        			startNum: page
	        		},
	        		success: (data) => {
	        			$("#qnaAllTbl").empty();
	        			for (let i = 0; i < data.length; i++) {
	                        $("#qnaAllTbl").append(
	                          "<tr class='qnaTr'><td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_num + "</a></td>"
	                          + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_title + "</a></td>"
	                          + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_status + "</a></td>"
	                          + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_regdate + "</a></td>"
	                          + "</tr>");
	                      }
	        			
	                      $(".qnaTr").css({
	                    	 "height" : "25px",
	                    	 "line-height" : "25px",
	                    	 "border-radius" : "5px",
	                      })
	                      
	                     
	                      
	        		},
	        		error: () => {
	        			alert("[error] 페이지를 불러올수 없습니다.");
	        		}
        		})
        	}
        })
        
        
        $("#qnaAllBackBtn").click(() => {
        	$("#qnaAllFrontBtn").css("display", "inline-block");
        	$("#qnaAllTblBox").empty();
			let startNum = $("#pageStartNum").val();
			startNum = Number(startNum) - 5;
			$("#pageStartNum").val(startNum);
			if(startNum <= 1){
				$("#qnaAllBackBtn").css("display", "none");
				startNum = 1;
			}
			for(let i = startNum; i < startNum + 5; i++){
				$("#qnaAllTblBox").append("<div class = 'page'>" + i + "</div>");
			}
        })
        
        $("#qnaAllFrontBtn").click(() => {
        	$("#qnaAllBackBtn").css("display", "inline-block");
        	$("#qnaAllTblBox").empty();
        	let startNum = $("#pageStartNum").val();
			startNum = Number(startNum) + 5;
			let maxPage = $("#maxPage").val();
			$("#pageStartNum").val(startNum);
			for(let i = startNum; i < startNum + 5; i++){
				if(i <= maxPage){
                    $("#qnaAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
				}else {
					$("#qnaAllFrontBtn").css("display", "none");
				}
			}
        })

        //신규 qna 리스트
        function qnaLoadNew() {
          $("#qnaNewTbl").empty();
          $.ajax({
            method: "get",
            url: "/admin/qnaLoadNew",
            dataType: 'json',
            data: {
            	startNum: 1
            },
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#qnaNewTbl").append(
                  "<tr><td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_num + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_title + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_status + "</a></td>"
                  + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_regdate + "</a></td>"
                  + "</tr>");
              }
              $("tr").css({
             	 "height" : "25px",
             	 "line-height" : "25px",
             	 "border-radius" : "5px",
               })
            },
            error: function () {
              alert("error");
            },
            complete: () => {
            	$.ajax({
            		url: "/admin/qna-new-max-page",
            		method: "GET",
            		success: (data) => {
            			$("#qnaNewTblBox").empty();
            			$("#qnaNewBackBtn").css("display", "none");
            			$("#pageNewStartNum").val(1);
            			$("#maxNewPage").val(data);
            			for(let i = 1; i < 6; i++){
            				if(i <= data){
		                        $("#qnaNewTblBox").append("<div class = 'page'>" + i + "</div>");            				
            				}else {
            					$("#qnaNewFrontBtn").css("display", "none");
            				}
            			}
            		},
            		error: () => {
            			alert("[error] 전체글 최대 페이지를 가져오는데 실패하였습니다.");
            		}
            	})
            }
          })
        }
        $("#qnaNewTblBox").click((event) => {
        	if(event.target.className == "page"){
        		let page = event.target.textContent;
        		$.ajax({
	        		url: "/admin/qnaLoadNew",
	        		method: "GET",
	        		data: {
	        			startNum: page
	        		},
	        		success: (data) => {
	        			$("#qnaNewTbl").empty();
	        			for (let i = 0; i < data.length; i++) {
	                        $("#qnaNewTbl").append(
	                          "<tr><td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_num + "</a></td>"
	                          + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_title + "</a></td>"
	                          + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_status + "</a></td>"
	                          + "<td><a onclick='QnaReplyDetail(" + data[i].qna_num + ")'>" + data[i].qna_regdate + "</a></td>"
	                          + "</tr>");
	                      }
	        			$("tr").css({
	                    	 "height" : "25px",
	                    	 "line-height" : "25px",
	                    	 "border-radius" : "5px",
	                      })
	        		},
	        		error: () => {
	        			alert("[error] 페이지를 불러올수 없습니다.");
	        		}
        		})
        	}
        })
        $("#qnaNewBackBtn").click(() => {
        	$("#qnaNewFrontBtn").css("display", "inline-block");
        	$("#qnaNewTblBox").empty();
			let startNum = $("#pageNewStartNum").val();
			startNum = Number(startNum) - 5;
			$("#pageNewStartNum").val(startNum);
			if(startNum <= 1){
				$("#qnaNewBackBtn").css("display", "none");
				startNum = 1;
			}
			for(let i = startNum; i < startNum + 5; i++){
				$("#qnaNewTblBox").append("<div class = 'page'>" + i + "</div>");
			}
        })
        
        $("#qnaNewFrontBtn").click(() => {
        	$("#qnaNewBackBtn").css("display", "inline-block");
        	$("#qnaNewTblBox").empty();
        	let startNum = $("#pageNewStartNum").val();
			startNum = Number(startNum) + 5;
			let maxPage = $("#maxNewPage").val();
			$("#pageNewStartNum").val(startNum);
			for(let i = startNum; i < startNum + 5; i++){
				if(i <= maxPage){
                    $("#qnaNewTblBox").append("<div class = 'page'>" + i + "</div>");            				
				}else {
					$("#qnaNewFrontBtn").css("display", "none");
				}
			}
        })



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
              "backgroundColor": "#051937",
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
              dataType: 'json',
              data: {
              	startNum: 1
              },
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
                alert("error");
              },
              complete: () => {
              	$.ajax({
              		url: "/admin/review-max-new",
              		method: "GET",
              		success: (data) => {
              			$("#reviewNewTblBox").empty();
              			$("#reviewNewBackBtn").css("display", "none");
              			$("#reviewPageNewStartNum").val(1);
              			$("#reviewMaxNewPage").val(data);
              			for(let i = 1; i < 6; i++){
              				if(i <= data){
  		                        $("#reviewNewTblBox").append("<div class = 'page'>" + i + "</div>");            				
              				}else {
              					$("#reviewNewFrontBtn").css("display", "none");
              				}
              			}
              		},
              		error: () => {
              			alert("[error] 전체글 최대 페이지를 가져오는데 실패하였습니다.");
              		}
              	})
              }
            })
          }
          $("#reviewNewTblBox").click((event) => {
          	if(event.target.className == "page"){
          		let page = event.target.textContent;
          		$.ajax({
  	        		url: "/admin/reviewLoadNew",
  	        		method: "GET",
  	        		data: {
  	        			startNum: page
  	        		},
  	        		success: (data) => {
  	        			$("#reviewNewTbl").empty();
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
  	        		error: () => {
  	        			alert("[error] 페이지를 불러올수 없습니다.");
  	        		}
          		})
          	}
          })
          $("#reviewNewBackBtn").click(() => {
          	$("#reviewNewFrontBtn").css("display", "inline-block");
          	$("#reviewNewTblBox").empty();
  			let startNum = $("#reviewPageNewStartNum").val();
  			startNum = Number(startNum) - 5;
  			$("#reviewPageNewStartNum").val(startNum);
  			if(startNum <= 1){
  				$("#reviewNewBackBtn").css("display", "none");
  				startNum = 1;
  			}
  			for(let i = startNum; i < startNum + 5; i++){
  				$("#reviewNewTblBox").append("<div class = 'page'>" + i + "</div>");
  			}
          })
          
          $("#reviewNewFrontBtn").click(() => {
          	$("#reviewNewBackBtn").css("display", "inline-block");
          	$("#reviewNewTblBox").empty();
          	let startNum = $("#reviewPageNewStartNum").val();
  			startNum = Number(startNum) + 5;
  			let maxPage = $("#reviewMaxNewPage").val();
  			$("#reviewPageNewStartNum").val(startNum);
  			for(let i = startNum; i < startNum + 5; i++){
  				if(i <= maxPage){
                      $("#reviewNewTblBox").append("<div class = 'page'>" + i + "</div>");            				
  				}else {
  					$("#reviewNewFrontBtn").css("display", "none");
  				}
  			}
          })
        
        //전체리뷰 리스트
       function reviewLoadAll() {
            $("#reviewAllTbl").empty();
            $.ajax({
              method: "get",
              url: "/admin/reviewLoadAll",
              dataType: 'json',
              data: {
              	startNum: 1
              },
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
                alert("error");
              },
              complete: () => {
              	$.ajax({
              		url: "/admin/review-max-all",
              		method: "GET",
              		success: (data) => {
              			$("#reviewAllTblBox").empty();
              			$("#reviewAllBackBtn").css("display", "none");
              			$("#reviewPageAllStartNum").val(1);
              			$("#reviewMaxAllPage").val(data);
              			for(let i = 1; i < 6; i++){
              				if(i <= data){
  		                        $("#reviewAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
              				}else {
              					$("#reviewAllFrontBtn").css("display", "none");
              				}
              			}
              		},
              		error: () => {
              			alert("[error] 전체글 최대 페이지를 가져오는데 실패하였습니다.");
              		}
              	})
              }
            })
          }
          $("#reviewAllTblBox").click((event) => {
          	if(event.target.className == "page"){
          		let page = event.target.textContent;
          		$.ajax({
  	        		url: "/admin/reviewLoadAll",
  	        		method: "GET",
  	        		data: {
  	        			startNum: page
  	        		},
  	        		success: (data) => {
  	        			$("#reviewAllTbl").empty();
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
  	        		error: () => {
  	        			alert("[error] 페이지를 불러올수 없습니다.");
  	        		}
          		})
          	}
          })
          $("#reviewAllBackBtn").click(() => {
          	$("#reviewAllFrontBtn").css("display", "inline-block");
          	$("#reviewAllTblBox").empty();
  			let startNum = $("#reviewPageAllStartNum").val();
  			startNum = Number(startNum) - 5;
  			$("#reviewPageAllStartNum").val(startNum);
  			if(startNum <= 1){
  				$("#reviewAllBackBtn").css("display", "none");
  				startNum = 1;
  			}
  			for(let i = startNum; i < startNum + 5; i++){
  				$("#reviewAllTblBox").append("<div class = 'page'>" + i + "</div>");
  			}
          })
          
          $("#reviewAllFrontBtn").click(() => {
          	$("#reviewAllBackBtn").css("display", "inline-block");
          	$("#reviewAllTblBox").empty();
          	let startNum = $("#reviewPageAllStartNum").val();
  			startNum = Number(startNum) + 5;
  			let maxPage = $("#reviewMaxAllPage").val();
  			$("#reviewPageAllStartNum").val(startNum);
  			for(let i = startNum; i < startNum + 5; i++){
  				if(i <= maxPage){
                      $("#reviewAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
  				}else {
  					$("#reviewAllFrontBtn").css("display", "none");
  				}
  			}
          })

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
          $.ajax({
            method: "Delete",
            data: {
              "review_num": review_num
            },
            url: "/admin/deleteReview",
            success: function (data) {
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
        $("#noticePageStartNum").val(1);
        
        function getNotice() {
          let startNum = $("#noticePageStartNum").val();
          $("#noticeTbody").empty();
          let keyword = $("#noticeSearchBar").val();
          $("#noticeAllTblBox").empty();
          $.ajax({
            method: "GET",
            url: "/admin/getNotice",
            datatype: "json",
            data: {
            	keyword: keyword,
            	startNum: startNum
            },
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#noticeTbody").append(
                  "<tr><td class='godetail'>" + data[i].notice_num + "</td>"
                  + "<td class='godetail'>" + data[i].notice_title + "</td>"
                  + "<td class='godetail'>" + data[i].member_id + "</td>"
                  + "<td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
                );
              }
            },
            error: function () {
              alert("error");
            },
            complete: () => {
            	$("#noticeAllBackBtn").css("display", "none");
            	$.ajax({
            		url: "/admin/notice-max-page",
            		method: "GET",
            		data: {
            			keyword: keyword
            		},
            		success: (data) => {
            			$("#noticeMaxPage").val(data);
            			for(let i = 1; i < 6; i++){
            				if(i <= data){
            					$("#noticeAllTblBox").append("<div class = 'page'>" + i + "</div>");
            				} else{
            					$("#noticeAllFrontBtn").css("display", "none");
            				}
            			}
            		},
            		error: () => {
            			alert("[error] 페이지를 가져올수 없습니다.");
            		}
            	})
            }
            
          });
        }

        $("#noticeSearchbtn").click(function () {
            getNotice();
        });
        
        $("#noticeSearchBar").keydown(function (evt) {
          if (evt.keyCode == 13) {
              getNotice();
          }
        });
        
        $("#noticeAllTblBox").click((event) => {
        	if(event.target.className == "page"){
        		$("#noticeTbody").empty();
        		let keyword = $("#noticeSearchBar").val();
        		let page = event.target.textContent;
        		$.ajax({
	        		url: "/admin/getNotice",
	        		method: "GET",
	        		datatype: "json",
	        		data: {
	        			keyword: keyword,
	        			startNum: page
	        		},
	        		success: (data) => {
	        			for (let i = 0; i < data.length; i++) {
	                        $("#noticeTbody").append(
	                          "<tr><td class='godetail'>" + data[i].notice_num + "</td>"
	                          + "<td class='godetail'>" + data[i].notice_title + "</td>"
	                          + "<td class='godetail'>" + data[i].member_id + "</td>"
	                          + "<td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
	                        );
	                    }
	        		},
	        		error: () => {
	        			alert("[error] 페이지를 불러올수 없습니다.");
	        		}
        		})
        	}
        })
        $("#noticeAllBackBtn").click(() => {
        	$("#noticeAllFrontBtn").css("display", "inline-block");
        	$("#noticeAllTblBox").empty();
			let startNum = $("#noticePageStartNum").val();
			startNum = Number(startNum) - 5;
			$("#noticePageStartNum").val(startNum);
			if(startNum <= 1){
				$("#noticeAllBackBtn").css("display", "none");
				startNum = 1;
			}
			for(let i = startNum; i < startNum + 5; i++){
				$("#noticeAllTblBox").append("<div class = 'page'>" + i + "</div>");
			}
        })
        
        $("#noticeAllFrontBtn").click(() => {
        	$("#noticeAllBackBtn").css("display", "inline-block");
        	$("#noticeAllTblBox").empty();
        	let startNum = $("#noticePageStartNum").val();
			startNum = Number(startNum) + 5;
			$("#noticePageStartNum").val(startNum);
			let maxPage = $("#noticeMaxPage").val();
			for(let i = startNum; i < startNum + 5; i++){
				if(i <= maxPage){
                    $("#noticeAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
				}else {
					$("#noticeAllFrontBtn").css("display", "none");
				}
			}
        })
        
        //신규공지
        function getNoticeNew() {
          $("#noticeNewPageStartNum").val(1);
          let startNum = $("#noticeNewPageStartNum").val();
          $("#noticeNewTbody").empty();
          $("#noticeNewTblBox").empty();
          $.ajax({
            method: "GET",
            url: "/admin/getNoticeNew",
            datatype: "json",
            data: {
            	startNum: startNum
            },
            success: function (data) {
              for (let i = 0; i < data.length; i++) {
                $("#noticeNewTbody").append(
                  "<tr><td class='godetail'>" + data[i].notice_num + "</td>"
                  + "<td class='godetail'>" + data[i].notice_title + "</td>"
                  + "<td class='godetail'>" + data[i].member_id + "</td>"
                  + "<td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
                );
              }
            },
            error: function () {
              alert("error");
            },
            complete: () => {
            	$("#noticeNewBackBtn").css("display", "none");
            	$.ajax({
            		url: "/admin/notice-max-new",
            		method: "GET",
            		success: (data) => {
            			$("#noticeNewMaxPage").val(data);
            			for(let i = 1; i < 6; i++){
            				if(i <= data){
            					$("#noticeNewTblBox").append("<div class = 'page'>" + i + "</div>");
            				} else{
            					$("#noticeNewFrontBtn").css("display", "none");
            				}
            			}
            		},
            		error: () => {
            			alert("[error] 페이지를 가져올수 없습니다.");
            		}
            	})
            }
            
          });
        }

        
        $("#noticeNewTblBox").click((event) => {
        	if(event.target.className == "page"){
        		$("#noticeNewTbody").empty();
        		let page = event.target.textContent;
        		$.ajax({
	        		url: "/admin/getNoticeNew",
	        		method: "GET",
	        		datatype: "json",
	        		data: {
	        			startNum: page
	        		},
	        		success: (data) => {
	        			for (let i = 0; i < data.length; i++) {
	                        $("#noticeNewTbody").append(
	                          "<tr><td class='godetail'>" + data[i].notice_num + "</td>"
	                          + "<td class='godetail'>" + data[i].notice_title + "</td>"
	                          + "<td class='godetail'>" + data[i].member_id + "</td>"
	                          + "<td class='godetail'>" + data[i].notice_regdate + "</td><tr>"
	                        );
	                    }
	        		},
	        		error: () => {
	        			alert("[error] 페이지를 불러올수 없습니다.");
	        		}
        		})
        	}
        })
        $("#noticeNewBackBtn").click(() => {
        	$("#noticeNewFrontBtn").css("display", "inline-block");
        	$("#noticeNewTblBox").empty();
			let startNum = $("#noticeNewPageStartNum").val();
			startNum = Number(startNum) - 5;
			$("#noticeNewPageStartNum").val(startNum);
			if(startNum <= 1){
				$("#noticeNewBackBtn").css("display", "none");
				startNum = 1;
			}
			for(let i = startNum; i < startNum + 5; i++){
				$("#noticeNewTblBox").append("<div class = 'page'>" + i + "</div>");
			}
        })
        
        $("#noticeNewFrontBtn").click(() => {
        	$("#noticeNewBackBtn").css("display", "inline-block");
        	$("#noticeNewTblBox").empty();
        	let startNum = $("#noticeNewPageStartNum").val();
			startNum = Number(startNum) + 5;
			$("#noticeNewPageStartNum").val(startNum);
			let maxPage = $("#noticeNewMaxPage").val();
			for(let i = startNum; i < startNum + 5; i++){
				if(i <= maxPage){
                    $("#noticeNewTblBox").append("<div class = 'page'>" + i + "</div>");            				
				}else {
					$("#noticeNewFrontBtn").css("display", "none");
				}
			}
        })

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
               alert(data);
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
              alert("수정 완료");
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
              alert("삭제 완료");
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
	       $("#suggestNewPageStartNum").val(1);
	       let startNum = $("#suggestNewPageStartNum").val();
	       $("#suggestNewTbody").empty();
	       $("#suggestNewTblBox").empty();
	       $.ajax({
	         method: "GET",
	         url: "/admin/suggestNew",
	         datatype: "json",
	         data: {
	         	startNum: startNum
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
	         },
	         complete: () => {
	         	$("#suggestNewBackBtn").css("display", "none");
	         	$.ajax({
	         		url: "/admin/suggest-max-new",
	         		method: "GET",
	         		success: (data) => {
	         			$("#suggestNewMaxPage").val(data);
	         			for(let i = 1; i < 6; i++){
	         				if(i <= data){
	         					$("#suggestNewTblBox").append("<div class = 'page'>" + i + "</div>");
	         				}
         					if(i >= data){
        						$("#suggestNewFrontBtn").css("display", "none");
        					}
	         			}
	         		},
	         		error: () => {
	         			alert("[error] 페이지를 가져올수 없습니다.");
	         		}
	         	})
	         }
	         
	       });
	     }
	
	     
	     $("#suggestNewTblBox").click((event) => {
	     	if(event.target.className == "page"){
	     		$("#suggestNewTbody").empty();
	     		let page = event.target.textContent;
	     		$.ajax({
		        		url: "/admin/suggestNew",
		        		method: "GET",
		        		datatype: "json",
		        		data: {
		        			startNum: page
		        		},
		        		success: (data) => {
	                        let type = "";
		        			for (let i = 0; i < data.length; i++) {
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
		        		error: () => {
		        			alert("[error] 페이지를 불러올수 없습니다.");
		        		}
	     		})
	     	}
	     })
	     $("#suggestNewBackBtn").click(() => {
	     	$("#suggestNewFrontBtn").css("display", "inline-block");
	     	$("#suggestNewTblBox").empty();
				let startNum = $("#suggestNewPageStartNum").val();
				startNum = Number(startNum) - 5;
				$("#suggestNewPageStartNum").val(startNum);
				if(startNum <= 1){
					$("#suggestNewBackBtn").css("display", "none");
					startNum = 1;
				}
				for(let i = startNum; i < startNum + 5; i++){
					$("#suggestNewTblBox").append("<div class = 'page'>" + i + "</div>");
				}
	     })
	     
	     $("#suggestNewFrontBtn").click(() => {
	     	$("#suggestNewBackBtn").css("display", "inline-block");
	     	$("#suggestNewTblBox").empty();
	     	let startNum = $("#suggestNewPageStartNum").val();
				startNum = Number(startNum) + 5;
				$("#suggestNewPageStartNum").val(startNum);
				let maxPage = $("#suggestNewMaxPage").val();
				for(let i = startNum; i < startNum + 5; i++){
					if(i <= maxPage){
	                 $("#suggestNewTblBox").append("<div class = 'page'>" + i + "</div>");            				
					}
					if(i >= maxPage){
						$("#suggestNewFrontBtn").css("display", "none");
					}
				}
	     })


      //전체제안서
        function suggestAll() {
	      $("#suggestAllPageStartNum").val(1);
	      let status = $("#filterKeyword").val();
	      let keyword = $("#suggestSearchBar").val();
	      let startNum = $("#suggestAllPageStartNum").val();
	      $("#suggestAllTblBox").empty();
          $("#suggestAllTbody").empty();
          $("#suggestAllFrontBtn").css("display", "inline-block");
          $.ajax({
            method: "get",
            url: "/admin/suggestAll",
            dataType: 'json',
            data: {
            	status: status,
            	keyword: keyword,
            	startNum: startNum
            },
            success: function (data) {
              let typy = "";
            	
              for (let i = 0; i < data.length; i++) {
                if (data[i].type == 'A') {
                  type = '미용';
                } else if (data[i].type == 'B') {
                  type = '간식';
                } else if (data[i].type == 'C') {
                  type = '의류';
                } else if (data[i].type == 'D') {
                  type = '훈련';
                }else if (data[i].type == 'E') {
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
            },
            complete: () => {
	         	$("#suggestAllBackBtn").css("display", "none");
	         	$.ajax({
	         		url: "/admin/suggest-max-all",
	         		method: "GET",
	         		data: {
	         			status: status,
	                	keyword: keyword
	         		},
	         		success: (data) => {
	         			$("#suggestAllMaxPage").val(data);
	         			for(let i = 1; i < 6; i++){
	         				if(i <= data){
	         					$("#suggestAllTblBox").append("<div class = 'page'>" + i + "</div>");
	         				}
         					if(i >= data){
    							$("#suggestAllFrontBtn").css("display", "none");
    						}
	         			}
	         		},
	         		error: () => {
	         			alert("[error] 페이지를 가져올수 없습니다.");
	         		}
	         	})
	         }
          })
        }
	     
	     $("#suggestAllTblBox").click((event) => {
		     	if(event.target.className == "page"){
		     		$("#suggestAllTbody").empty();
		     		let startNum = $("#suggestAllPageStartNum").val();
			  	    let status = $("#filterKeyword").val();
			  	    let keyword = $("#suggestSearchBar").val();
		     		let page = event.target.textContent;
		     		$.ajax({
			        		url: "/admin/suggestAll",
			        		method: "GET",
			        		datatype: "json",
			        		data: {
			        			status: status,
			        			keyword: keyword,
			        			startNum: page
			        		},
			        		success: (data) => {
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
			        		error: () => {
			        			alert("[error] 페이지를 불러올수 없습니다.");
			        		}
		     		})
		     	}
		     })
		     $("#suggestAllBackBtn").click(() => {
		     	$("#suggestAllFrontBtn").css("display", "inline-block");
		     	$("#suggestAllTblBox").empty();
					let startNum = $("#suggestAllPageStartNum").val();
					startNum = Number(startNum) - 5;
					$("#suggestAllPageStartNum").val(startNum);
					if(startNum <= 1){
						$("#suggestAllBackBtn").css("display", "none");
						startNum = 1;
					}
					for(let i = startNum; i < startNum + 5; i++){
						$("#suggestAllTblBox").append("<div class = 'page'>" + i + "</div>");
					}
		     })
		     
		     $("#suggestAllFrontBtn").click(() => {
		     	$("#suggestAllBackBtn").css("display", "inline-block");
		     	$("#suggestAllTblBox").empty();
		     	let startNum = $("#suggestAllPageStartNum").val();
					startNum = Number(startNum) + 5;
					$("#suggestAllPageStartNum").val(startNum);
					let maxPage = $("#suggestAllMaxPage").val();
					for(let i = startNum; i < startNum + 5; i++){
						if(i <= maxPage){
		                 $("#suggestAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
						}
						if(i >= maxPage){
							$("#suggestAllFrontBtn").css("display", "none");
						}
					}
		     })
	     
        $("#suggestSearchbtn").click(function () {
            suggestAll();
        });
        $("#suggestSearchBar").keydown(function (evt) {
          if (evt.keyCode == 13) {
              suggestAll();
          }
        });
       

        
        //제안서필터 -검토대기
        //제안서필터 -승인
        //제안서필터 -반려
        $(".filterKeyword").click(function(evt){
           let keyword = evt.target.innerText;
           if(keyword == "전체목록"){
        	   keyword = "";
           }
           $("#filterKeyword").val(keyword);
           suggestAll();
        })
        
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
                "<tr><th style='width : 70px;'>번호</th><td>" + data.suggest_num + "</td></tr>"
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
               $("#suggestDetailTbody").empth();
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
               $("#suggestDetailTbody").empth();
            }
         })
   })
      </script>

	<script>
        //=======================클래스리스트====================
        //클래스 리스트
       
       function classListAll() {
	      $("#classAllPageStartNum").val(1);
	      let status = $("#statusKeyword").val();
	      let keyword = $("#classSearchBar").val();
	      let startNum = $("#classAllPageStartNum").val();
	      $("#classAllTblBox").empty();
          $("#classTbody").empty();
          $("#classAllFrontBtn").css("display", "inline-block");
          $.ajax({
            method: "get",
            url: "/admin/classListAll",
            dataType: 'json',
            data: {
            	status: status,
            	keyword: keyword,
            	startNum: startNum
            },
            success: function (data) {
              for(let i=0;i<data.length;i++){
                  $("#classTbody").append(
                        "<tr>"
                        +"<td class='classDetail'>"+ data[i].class_code +"</td>"
                        +"<td class='classDetail'>"+ data[i].class_subject +"</td>"
                        +"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
                        +"</tr>");
                        
           	  }
            },
            error: function () {
              alert("error");
            },
            complete: () => {
	         	$("#classAllBackBtn").css("display", "none");
	         	$.ajax({
	         		url: "/admin/class-max-all",
	         		method: "GET",
	         		data: {
	         			status: status,
	                	keyword: keyword
	         		},
	         		success: (data) => {
	         			$("#classAllMaxPage").val(data);
	         			for(let i = 1; i < 6; i++){
	         				if(i <= data){
	         					$("#classAllTblBox").append("<div class = 'page'>" + i + "</div>");
	         				}
         					if(i >= data){
    							$("#classAllFrontBtn").css("display", "none");
    						}
	         			}
	         		},
	         		error: () => {
	         			alert("[error] 페이지를 가져올수 없습니다.");
	         		}
	         	})
	         }
          })
          
        }
	     
	     $("#classAllTblBox").click((event) => {
		     	if(event.target.className == "page"){
		     		$("#classTbody").empty();
		     		let startNum = $("#classAllPageStartNum").val();
			  	    let status = $("#statusKeyword").val();
			  	    let keyword = $("#classSearchBar").val();
		     		let page = event.target.textContent;
		     		$.ajax({
			        		url: "/admin/classListAll",
			        		method: "GET",
			        		datatype: "json",
			        		data: {
			        			status: status,
			        			keyword: keyword,
			        			startNum: page
			        		},
			        		success: (data) => {
			        			for(let i=0;i<data.length;i++){
			                        $("#classTbody").append(
			                              "<tr>"
			                              +"<td class='classDetail'>"+ data[i].class_code +"</td>"
			                              +"<td class='classDetail'>"+ data[i].class_subject +"</td>"
			                              +"<td class='classDetail'>"+ data[i].class_teacher +"</td>"
			                              +"</tr>");
			                              
			                 	  }
			        		},
			        		error: () => {
			        			alert("[error] 페이지를 불러올수 없습니다.");
			        		}
		     		})
		     	}
		     })
		     $("#classAllBackBtn").click(() => {
		     	$("#classAllFrontBtn").css("display", "inline-block");
		     	$("#classAllTblBox").empty();
					let startNum = $("#classAllPageStartNum").val();
					startNum = Number(startNum) - 5;
					$("#classAllPageStartNum").val(startNum);
					if(startNum <= 1){
						$("#classAllBackBtn").css("display", "none");
						startNum = 1;
					}
					for(let i = startNum; i < startNum + 5; i++){
						$("#classAllTblBox").append("<div class = 'page'>" + i + "</div>");
					}
		     })
		     
		     $("#classAllFrontBtn").click(() => {
		     	$("#classAllBackBtn").css("display", "inline-block");
		     	$("#classAllTblBox").empty();
		     	let startNum = $("#classAllPageStartNum").val();
					startNum = Number(startNum) + 5;
					$("#classAllPageStartNum").val(startNum);
					let maxPage = $("#classAllMaxPage").val();
					for(let i = startNum; i < startNum + 5; i++){
						if(i <= maxPage){
		                 $("#classAllTblBox").append("<div class = 'page'>" + i + "</div>");            				
						}
						if(i >= maxPage){
							$("#classAllFrontBtn").css("display", "none");
						}
					}
		     })
        
      $(".status").click((event) => {
    	  $("#push").val(1);
    	  if(event.target.id == "activeBtn"){
    		  $("#statusKeyword").val("active");
    	  } else if(event.target.id == "endBtn"){
    		  $("#statusKeyword").val("end");
    	  } else if(event.target.id == "dayBtn" && $("#dayStatus").val() == "desc"){
    		  $("#statusKeyword").val("desc");
    		  $("#dayStatus").val("asc");
    	  } else{
    		  $("#statusKeyword").val("asc");
    		  $("#dayStatus").val("desc");
    	  }
    	  classListAll();
      })  
      
        
        
        
        $("#classSearchbtn").click(function () {
                classListAll();
        });
	     
        $("#classSearchBar").keydown(function (evt) {
            if (evt.keyCode == 13) {
            	classListAll();
            }
        });
        
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
                       $("#todaysSales").text(data.toLocaleString() +" 원");
                       $("#todaysSales").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
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
                       $("#weeklySales").text(data.toLocaleString() + " 원");
                       $("#weeklySales").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
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
                       $("#monthlySales").text(data.toLocaleString() +" 원");
                       $("#monthlySales").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
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
                       $("#yearlySales").text(data.toLocaleString() +" 원");
                       $("#yearlySales").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
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
                    if(data>=0){
                       $("#dayChange").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "color":"blue",
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
                    }else{
                       $("#dayChange").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "color":"red",
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
                    }
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
                    $("#weekChange").text(data.toLocaleString() +" %");
                    if(data>=0){
                       $("#weekChange").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "color":"blue",
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
                    }else{
                       $("#weekChange").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "color":"red",
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
                    }
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
                    if(data>=0){
                       $("#monthChange").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "color":"blue",
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
                    }else{
                       $("#monthChange").css({
                           "font-weight" : "bold",
                           "font-size" : "50px", 
                           "color":"red",
                           "margin-top" : "50px",
                           "font-family": "SBAggroB"
                       })
                    }
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
                    $("#buyaverage").text(data.toLocaleString() +" 원");
                    $("#buyaverage").css({
                        "font-weight" : "bold",
                        "font-size" : "50px", 
                        "margin-top" : "50px",
                        "font-family": "SBAggroB"
                    })
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
                    $("#average_purchase").css({
                        "font-weight" : "bold",
                        "font-size" : "50px", 
                        "margin-top" : "50px",
                        "font-family": "SBAggroB"
                    })
                 },
                 error: function () {
                   alert("error");
                 }
            })
         }
   </script>