<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>
@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GongGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
#footer {
	text-align: center;
	color: gray;
	
	
}

#footer a {
	color: gray;
}

footer {
	border-top: thin #DBD5CB solid;
	margin-top: 50px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}
.prev, .next {
	cursor: pointer;
	position: relative;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 40px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

.pnbtn {
	display: inline;
	position: relative;
	left: 930px;
	top: -80px;
}

.rightnow1 {
	display: inline-block;
	width: 200px;
	height: 35px;
	line-height: 38px;
	background-color: #f0f0f0;
	border-radius: 30px;
	font-size: 20px;
	text-align: center;
	font-family: 'GongGothicMedium';
	position: relative;
	top : -300px;
	left : 580px;
	box-shadow: 1px 1px 1px gray;
}

.rightnow1:hover {
	cursor: pointer;
}

.youtube {
	margin: 0 auto;
	display: inline-flex;
}

.youtube ifram {
	width: 600px;
	margin: 0 20px;
}

#banner1 img {
	position: absolute;
	top: 800px;
	height: 600px;
}
#listBox1, #listBox2{
	margin: 0 auto;
	position: relative;
	left:50px;
	width: 1300px;
	margin-bottom: 80px;
}
h1 {
	font-family: 'SBAggroB';
	z-index: 1;
	font-size: 35px;
	text-align: center;
	color: #F99417;
	text-shadow: 1px 1px 1px gray;
	margin-bottom: 20px;
}

#banner2btn {
	width: 170px;
	height: 40px;
	border-radius: 20px;
	position: absolute;
	background-color: #F99417;
	color: white;
	font-size: 25px;
	border: none;
	line-height: 40px;
	top: 1260px;
	left: 910px;
}

#banner1info {
	animation: slide 2s;
}

@
keyframes slide {from { right :-100px;
	
}

.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
	margin-top: 120px;
	text-align: center;
	margin: 0 auto;
	background-color: black;
}

/* effect */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* Next & previous buttons */

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

.bannerbox{
	display: inline;
}

</style>
<body>

	<%@include file="header.jsp"%>
	<div class="box">
		<div class="bannerbox">
			<div class="slideshow-container">

				<div class="mySlideDiv fade active">
					<img src="../images/pbann1.jpg">
				</div>

				<div class="mySlideDiv fade">
					<img src="../images/pbann2.jpg">
				</div>

				<div class="mySlideDiv fade">
					<img src="../images/pbann3.jpg">
				</div>
				<div class="mySlideDiv fade">
					<img src="../images/pbann4.jpg">
				</div>

			</div>
			<div class="pnbtn">
				<a class="prev" onclick="prevSlide()">&#10094;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="next" onclick="nextSlide()">&#10095;</a>
			</div>
			<div class="rightnow1">지금바로보러 Go!</div>
		</div>
		
			<div  id="listBox1">
			<h1>금주의 신규 OPEN!!</h1>
				<c:forEach var="c" items="${newlist }">
					<div class="class_one">
						<a href="class-detail?class_code=${c.class_code }"><img src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a>
						<p>
							<a href="class-detail?class_code=${c.class_code }">${c.class_subject }</a>
						</p>
						<p>${c.class_teacher }</p>
					</div>	
				</c:forEach>
			</div>
			<div  id="listBox2">
			<h1>페네핏이 추천하는!</h1>
				<c:forEach var="c" items="${recolist }">
					<div class="class_one">
						<a href="class-detail?class_code=${c.class_code }"><img src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a>
						<p>
							<a href="class-detail?class_code=${c.class_code }">${c.class_subject }</a>
						</p>
						<p>${c.class_teacher }</p>
					</div>	
				</c:forEach>
			</div>
			
	<footer>
		<div class="box">
			<div id="footer">
				<br>
				<br>
				<p>
					<a href="/">Home&nbsp;&nbsp;</a> <a href="/centerinfo/centerinfo">About&nbsp;&nbsp;</a> <a href="/board/FAQ">FAQ&nbsp;&nbsp;</a> <a href="#">Pricing</a>
				</p>
				<p>© Copyright Penefit. All Rights Reserved</p>
			</div>
		</div>
	</footer>
	</div>
	<script>
		$(document).ready(function() {
			$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김

			setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
		});

		//이전 슬라이드
		function prevSlide() {
			$(".mySlideDiv").hide(); //모든 div 숨김
			var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
			var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수

			//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
			$(".mySlideDiv").each(function(index, item) {
				if ($(this).hasClass("active")) {
					currentIndex = index;
				}

			});

			//새롭게 나타낼 div의 index
			var newIndex = 0;

			if (currentIndex <= 0) {
				//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
				newIndex = allSlide.length - 1;
			} else {
				//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
				newIndex = currentIndex - 1;
			}

			//모든 div에서 active 클래스 제거
			$(".mySlideDiv").removeClass("active");

			//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
			$(".mySlideDiv").eq(newIndex).addClass("active");
			$(".mySlideDiv").eq(newIndex).show();

		}

		//다음 슬라이드
		function nextSlide() {
			$(".mySlideDiv").hide();
			var allSlide = $(".mySlideDiv");
			var currentIndex = 0;

			$(".mySlideDiv").each(function(index, item) {
				if ($(this).hasClass("active")) {
					currentIndex = index;
				}

			});

			var newIndex = 0;

			if (currentIndex >= allSlide.length - 1) {
				//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
				newIndex = 0;
			} else {
				//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
				newIndex = currentIndex + 1;
			}

			$(".mySlideDiv").removeClass("active");
			$(".mySlideDiv").eq(newIndex).addClass("active");
			$(".mySlideDiv").eq(newIndex).show();

		}
	</script>
</body>
</html>