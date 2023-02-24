<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#error {
	position: relative;
	width: 100%;
	height: 100%;
}

h2 {
	margin: 0;
}

#move_home { /*HOME버튼*/
	display: inline-block;
	width: 100px;
	background-color: rgb(40, 46, 221);
	border: 1px solid rgb(40, 46, 221);
	color: white;
	width: 140px;
	height: 30px;
	margin-left: 100px;
}

#move_support { /*지원팀 가기 버튼*/
	display: inline-block;
	width: 100px;
	border: 1px solid rgb(40, 46, 221);
	color: rgb(40, 46, 221);
	background-color: white;
	width: 140px;
	height: 30px;
}

.error_window { /*모달창*/
	width: 500px;
	height: 280px;
	margin: 100px auto;
	padding: 20px 10px;
	background: rgb(237, 240, 241);
	border: 2px solid rgb(237, 240, 241);
	border-radius: 20px;
	padding: 50px;
}

.error_title{
	display: flex;
}

img {
	/*position:absolute;*/
	display: inline-block;
	width: 100px;
	height: 100px;
}
</style>
<body>
	<div id="error">
		<div class="error_window">
			<div class="error_title">
				<div id="error_img">
					<img src="../images/warn.png" id="erro_img">
				</div>

				<div>
					<h2><strong>500 ERROR</strong></h2>
					<br>
					<h2>요청하신 페이지를 찾을 수 없습니다</h2>
				</div>
			</div>
			<div>
				<p>죄송합니다. 찾고있는 페이지를 찾을 수 없습니다.</p>
				<p>이전 페이지로 돌아가거나 홈페이지를 이동하십시오.</p>
				<p>또는 지원 팀에 문의하십시오</p>

				<button id="move_home" onclick="location.href='/'"/>홈으로 이동</button>
				<button id="move_support">지원팀 문의</button>
			</div>
		</div>

	</div>

	
</body>
</html>