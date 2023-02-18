<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#modal {
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#move_home {							/*HOME버튼*/
	display: inline-block;
	width: 100px;
	background-color:blue;
	border: 1px solid blue;
	color:white;
	width:140px;
	height:30px;
	margin-left:100px;
}

#movoe_support {						/*지원팀 가기 버튼*/		
	display: inline-block;
	width: 100px;
	border: 1px solid blue;
	color:blue;
	background-color:white;
	width:140px;
	height:30px;
	
}

#modal .modal_content {					/*모달창*/
	width: 500px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid lightgray;
}



#erro_img{
	display:block;
	width:90px;
	height: 90px;
}
</style>
<body>
	<div id="modal">

		<div class="modal_content">
		<div id="error_box"><a href="/"><img src="../images/warn.png" id="erro_img"></a></div>
			<h2>404ERROR</h2><br>
			<h2>요청하신 페이지를 찾을 수 없습니다</h2>
			
			<p>죄송합니다. 찾고있는 페이지를 찾을 수 없습니다.</p>
			<p>이전 페이지로 돌아가거나 홈페이지를 이동하십시오.</p>
			<p>또는 지원 팀에 문의하십시오</p>

			<button type="button" id="move_home" onclick="location.href='/'">홈으로 이동</button>
			<button type="button" id="movoe_support">지원팀 문의</button>

		</div>

		<div class="modal_layer"></div>
	</div>

	<script>
		document.getElementById("modal_open_btn").onclick = function() {
			document.getElementById("modal").style.display = "block";
		}

		document.getElementById("modal_close_btn").onclick = function() {
			document.getElementById("modal").style.display = "none";
		}
	</script>
</body>
</html>