<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="/css/style.css">
<style>
#reglogo {
	width: 100px;
	height: 90px;
	margin-bottom: 30px;
}

#regmembers {
	width: 600px;
	height: 500px;
	margin-top: 100px;
	margin-left: 400px;
	text-align: center;
}

input[type=button] {
	width: 305px;
	height: 47px;
	background-color: #75BD43;
	border: none;
	border-radius: 5px;
	font-size: 25px;
	line-height: 50px;
	position: relative;
	top: 4px;
	color: white;
	font-size: 26px;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
}
</style>
</head>
<body>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<div class="regComplete">
				<div id="regmembers">
					<img src="/images/regmemlogo2.png" id="reglogo">
					<h3>회원가입이 완료되었습니다.</h3>
					<br>
					<h5>로그인 후 안전하고 편리하게</h5>
					<h5>Penefit서비스를 이용하실수 있습니다.</h5>
					<br>
					<br> <input type="button" value="로그인페이지로이동" onclick="location.href='/member/login'" />
				</div>
			</div>



		</section>
	</div>

</body>
</body>
</html>