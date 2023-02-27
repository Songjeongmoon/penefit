<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<style>
body {
	background-color: #232428;
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
	background-color: rgb(0, 0, 0);
}

#logo {
	font-weight: bold;
	font-size: 50px;
	text-align: center;
	height: 125px;
	width: 100%;
	display: inline-block;
	line-height: 130px;
	color: aqua;
}

#sideBox {
	border-top: 1px solid red;
}

.sideMenu {
	background-color: rgba(0, 0, 0, 0.573);
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
	color: rgb(81, 81, 81);
}

.sideMenu:hover {
	color: black;
	background-color: rgb(122, 225, 225);
}

#topBar {
	position: absolute;
	display: inline-block;
	width: 85%;
}

#topBar>ul {
	display: flex;
	flex-direction: row;
}

.subMenu {
	width: 11%;
	height: 3.5vh;
	background-color: rgba(0, 0, 0, 0.573);
	color: rgb(81, 81, 81);
	margin: 20px 20px 0 20px;
	line-height: 3.5vh;
	text-align: center;
	border-radius: 7px;
	font-size: 16px;
	font-weight: bolder;
	cursor: pointer;
	transition: all 0.15s;
}

#subMenu1 {
	margin-left: 100px;
}

.subMenu:hover {
	background-color: white;
	transform: scale(1.03, 1.07);
	color: black;
}

#article {
	border-radius: 20px;
	position: absolute;
	left: 15%;
	top: 50px;
	display: inline-block;
	width: 85%;
	height: 95%;
	display: grid;
	grid-gap: 15px;
	justify-content: center;
	grid-template-columns: repeat(3, 30%);
	grid-template-rows: repeat(3, 30%);
}

.box {
	border : 1px solid red;
	justify-content: center;
	align-items: center;
	background-color: rgb(255, 255, 255);
	border-radius: 30px;
	margin-top: 30px;
}

#box1 {
	grid-column: 1/6;
	grid-row: 1/4;
	padding: 20px;
}
#tbl_box1{
	width: 90%;
	margin: 0 auto;
	
}
</style>
</head>

<body>
	<div id="container">
		<div id="sideBar">
			<div id="logo">PeNeFit</div>
			<div id="sideBox">
				<div class="sideMenu">Dashboard</div>
				<div class="sideMenu">Member</div>
				<div class="sideMenu">Board</div>
				<div class="sideMenu">Class</div>
			</div>
		</div>

		<div id="topBar">
			<ul>
				<li id="subMenu1" class="subMenu" style="color:black; background-color: white; ">Suggestion</li>
				<li class="subMenu" id="select">Class</li>
				<li class="subMenu">Review</li>
				<li class="subMenu">ddd</li>
				<li class="subMenu">ddd</li>
			</ul>
		</div>

		<div id="article">
			<div id="box1" class="box">
				<h3>신규제안</h3>
				<table border="1" id="tbl_box1">

					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>지역</th>
							<th>가격</th>
							<th>ID</th>
							<th>정원</th>
							<th>시간</th>
							<th>등록일</th>
						</tr>
					</thead>

					<tbody id="tbody_new"></tbody>
				</table>

				<div id="modal" style='display: none'>
					<div id="detailModal"></div>
					<textarea id="rejectReason" placeholder="반려사유"></textarea>
				</div>

			</div>
			<hr>
			<div id="box2" class="box">
				<h3>전체제안</h3>
				<table border="1"></table>
			</div>
		</div>
	</div>

	<script>


	$.ajax({
		url: "/admin/suggestion/list",
		method: "GET",
		dataType : "json",
		success: (data) => {
			for(let i = 0; i < data.length; i++){
				$("#tbody").append("<tr>"
						+ "<td>" + data[i].suggest_num + "</td><td>" + data[i].type + "</td>"
						+ "<td class='showDetail'>" + data[i].suggest_title + "</td><td>" + data[i].city_code + "</td>"
						+ "<td>" + data[i].price + "</td><td>" + data[i].member_id + "</td>"
						+ "<td>" + data[i].maxCnt + "</td><td>" + data[i].class_time + "</td>"
						+ "<td>" + data[i].suggest_regdate + "</td>"
						+"</tr>");
			}
		},
		error: () => {
			alert("Error!...");
		}
	})
	
	$("#tbody").click( (event) => {
		if(event.target.className == "showDetail"){
			let num = event.target.previousElementSibling.previousElementSibling.textContent;
			$("#modal").css("display", "block");
			
			$.ajax({
				url: "/admin/suggestion/one",
				method: "GET",
				dataType: "json",
				data: {
					suggest_num : num
				},
				success: (data) => {
					alert(data);
					$("#detailModal").html("<div>"
							+ "코드 : <div id = 'suggestNum'>" + data.suggest_num + "</div>"
							+ "제목 : <div>" + data.suggest_title + "</div>내용 : <div>" + data.suggest_content + "</div>"
							+ "첨부 이미지 : <div>" + data.suggest_photo + "</div>강의날짜 : <div>" + data.class_time + "</div>"
							+ "</div><button id = admitBtn>승인</button></div><button id = rejectBtn>반려</button>");
				},
				error: () => {
					alert("fail");
				}
			})
		}
	})
	
	$("#detailModal").click( (event) => {
		if(event.target.id == "admitBtn"){
			let num = $("#suggestNum").text();
			$.ajax({
				url: "/admin/class",
				method: "post",
				data: {
					suggest_num: num
				},
				success: (data) => {
					if(data == 1){
						alert("등록 완료되었습니다.");
					} else{
						alert("에러로 인해 등록실패하였습니다.");
					}
					location.href = "/adminView";
				},
				error: () => {
					alert("Error");
					location.href = "adminView";
				}
			})
		}
	})
	
	$("#detailModal").click( (event) => {
		if(event.target.id == "rejectBtn"){
			let num = $("#suggestNum").text();
			let reason = $("#rejectReason").val();
			$.ajax({
				url: "/admin/suggestion",
				method: "put",
				data: {
					suggest_num: num,
					reject_reason: reason
				},
				success: (data) => {
					if(data == 1){
						alert("제안서를 반려하였습니다.");
					} else{
						alert("에러로 인해 반려 실패했습니다.");
					}
					location.href = "/adminView";
				},
				error: () => {
					alert("Error");
					location.href = "adminView";
				}
			})
		}
	})
	
	</script>
</body>

</html>