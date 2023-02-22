<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>
@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
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

h1 {
	font-family: 'SBAggroB';
	position: absolute;
	z-index: 1;
	font-size: 90px;
	text-align: center;
	top: 1000px;
	left : 900px;
	color : #F99417;
}
#banner2btn{
	width: 170px;
	height: 40px;
	border-radius: 20px;
	position: absolute;
	background-color: #F99417;
	color: white;
	font-size: 25px;
	border: none;
	line-height: 40px;
	top : 1260px;
	left: 910px;
}
#banner1info{
animation : slide 2s;

}
@keyframes slide{
	from{
		right : -100px;
	}
	to{
		right : 500px;
	}
}
</style>
<body>

	<%@include file="header.jsp"%>

	<div class="box">
		<section>
			<div class="banner">
				<img src="../images/mainbanner1.png">
				<button class="infomore">자세히보기</button>
			</div>
			<div id="banner1">
				<img src="../images/mango.jpg" style="width: 100%">

			</div>
						<div id="banner1info">

				<h1>
					망고랑 <br> 놀자&#9829;
				</h1>
				<button id="banner2btn">자세히보기</button>
			</div>
		</section>
	</div>
	<br>
	<br>
	<br>
	<br>
	<!-- <div class="banner">
				<img src="../images/banner3.png">
				<button class="infomore">자세히보기</button>
			</div> -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 			<div class="youtube">
				<iframe width="600" height="315" style ="margin:  0 22px;" src="https://www.youtube.com/embed/HHIQp-cMrro" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
			<div class="youtube">
				<iframe width="600" height="315" style ="margin:  0 22px;" src="https://www.youtube.com/embed/hvF2MFzx0Vw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div> -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		
</body>
</html>