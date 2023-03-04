<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<!-- <script type="text/javascript" -->
<!--    src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
   
<!-- iamport.payment.js -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="/css/style.css">
<link href="https://fonts.googleapis.com/
  icon?family=Material+Icons rel='stylesheet'">
<style>
#aside_submenu {
	display: none;
	width: 100px;
}

#aside_submenu p {
	margin: 5px 0;
}
.centerinfo{
    width: 900px;
    height: 800px;
    margin-left: 350px;
    margin-top: 30px;
}
.centertitle{
    width: 900px;
    height: 150px;
	text-align: left;
}
.centerinfocenter{
    width: 900px;
    height: 150px;
    text-align: center;
}
.centerinfobottom{
    width: 900px;
    height: 300px;
    margin-top: 50px;
    text-align: left;
}
.centerimg{
 	width: 900px;
    height: 200px;
    margin-bottom: 50px;
}
#centertitleleft{
    width: 420px;
    height: 300px;
    display: inline-block;
    text-align: left;
}
#centertitleleft > h2{
text-align: left;
}
#centertitleright{
    width: 440px;
    height: 300px;
    display: inline-block;
}
#centerinfobottomleft{
    width: 420px;
    height: 300px;
    display: inline-block;
}
#centerinfobottomright{
    width: 440px;
    height: 300px;
    display: inline-block;
	margin-top: 70px;
}
span{
	font-size: 20px;
	color: #9ACD32;
	font-weight :bolder;
}

#quoteR, #quoteL{
margin-bottom : 30px;
	width: 20px;
    height: 20px;
}
h2, h4{
	font-weight :bolder;
}
#centerimgsize{
	margin-left : 80px;
	width: 700px;
    height: 200px;
}
</style>

</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">센터소개</li>
					<li class="aside_menu"><a href="#">센터소개</a></li>
					<li class="aside_menu"><a href="#">센터연혁</a></li>

				</ul>

			</aside>
		    <div class="centerinformation">
		        <div class="centerinfo">
		            <div class="centertitle">
		                <div id="centertitleleft">
		                    <span>Center Information</span>
		                    <h2>반려인 문화교실</h2>
		                </div>
		                <div id="centertitleright">
		                    <br>
		                    <h5>반려동물을 키우는 반려인들을 위한 다양한 원데이클래스를 제공해주는 플랫폼입니다.</h5>
		                </div>
		            </div>
		            <div class="centerimg">
		            <img src ="/images/PET12.jpg" id=centerimgsize>
		            </div>
		            <div class="centerinfocenter">
		                <span class="quoteBefore"><img src="/images/quoteL.png" id ="quoteL"></span>
		                <p class="desc">
		                    <strong style="font-weight: bold;">'반려인 문화교실 플랫폼’ Penefit은 대한민국에서 반려동물을 사랑하는 반려인들을 위한 환경을 만듭니다.</strong><br>
		                  하나의 원데이클래스라는 틀을 넘어 반려동물과 반려인들을 위한 삶의 질을 향상 시킬 다양한 가능성을 제공하는 플랫폼입니다.
		                  </p>
		                <span class="quoteAfter"><img src="/images/quoteR.png" id ="quoteR"></i></span>
		            </div>
		            <div class="centerinfobottom">
		                <div id="centerinfobottomleft">
		                    <span>Unique Value</span>
		                    <h5>Penefit에서는 반려동물을 사랑한다면 누구나 강사가 되며, 성장하고 더불어 살아 갑니다. </h5>
		                    <br><br><br>
		                </div>
		                <div id="centerinfobottomright">
		                
		                    <p>반려동물 보유 가구가 대한민국 전체 가구의 3분의 1 수준에 달하며, 
		                        반려동물을 인생의 '반려자'로 여깁니다.</p>
		             		<p> Penefit은 사람과 반려동물이 행복하게
		                        공존하는 사회를 목표로 동물복지와 반려문화 조성을 위해서 설립하게 되었습니다.</p>
		                          </div>
		            </div>
		        </div>
		    </div>
		</section>
	</div>

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
</body>
</html>