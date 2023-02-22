<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.subbox{
	height: 45%;
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
				<li id="subMenu1" class="subMenu">Suggestion</li>
				<li class="subMenu" id="select">Class</li>
				<li class="subMenu">Product</li>
				<li class="subMenu">User</li>
				<li class="subMenu">Infomation</li>
			</ul>
		</div>

		<div id="article">
			<div id="box1" class="box">
				<div class="subbox">
					<h4>신규문의</h4>


				</div>
				<div class="subbox">
					<h4>전체문의</h4>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
						<c:forEach var="list" items="${list }">
							<tr>
								<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_num }</a></td>
								<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_title }</a></td>
								<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_status }</a></td>
								<td><a href="adminQnaDetail?qnaNum=${list.qna_num }">${list.qna_regdate }</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>