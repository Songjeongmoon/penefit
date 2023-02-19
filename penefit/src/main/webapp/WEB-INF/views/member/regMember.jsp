
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

h1 {
	font-size: 20px;
	margin-bottom: 5px;
	color: #BBB09F;
}

h6 {
	font-size: 10px;
	color : #655B4B;
}

.regmem {
	margin-left: 400px;
	margin-top: 30px;
	width: 600px;
	height: 800px;
	border: solid 1px #BBB09F;
	border-radius: 7px;
	box-shadow: 7px 7px 7px  7px #DBD5CB;
}

.reg_main {
	margin-top: 60px;
	margin-left: 110px;
}

input[type=text] {
	width: 300px;
	height: 40px;
	font-size: 20px;
	line-height: 70px;
	margin-top: 5px;
	margin-bottom: 10px;
}

input[type=password] {
	width: 300px;
	height: 40px;
	font-size: 20px;
	line-height: 50px;
	margin-top: 5px;
	margin-bottom: 10px;
}

input[type=button] {
	width: 100px;
	height: 43px;
	background-color: #75BD43;
	border: none;
	border-radius: 5px;
	font-size: 22px;
	line-height: 50px;
	position: relative;
	top: 4px;
	color: white;
	box-shadow: 2px 2px 2px  2px #DBD5CB;
}
input[type=submit] {
	width: 305px;
	height: 43px;
	background-color: #75BD43;
	border: none;
	border-radius: 5px;
	font-size: 25px;
	line-height: 50px;
	position: relative;
	top: 4px;
	color: white;
	font-size: 26px;
	box-shadow: 2px 2px 2px  2px #DBD5CB;
}

h4 {
	margin-bottom: 40px;
}
span::after {
	content: "*";
	color: red; 
	margin-left: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="../header.jsp"%>
		<div class="box">
			<div class="regmem">
				<div class="reg_main">
					<div id="main title">
						<h1>회원가입</h1>
						<h6>회원가입을 통해 다양한 서비스를 만나보세요!</h6>
					</div>
					<form name="form" action="regMember" method="post">

						<div id="mem_id">
							<span>아이디</span><br> <input type="text" placeholder="아이디 입력(6~20자)"
								name="member_id" /> <input type="button" value="중복확인"
								onclick="idCheck()"> <br>
							<div id="demo"></div>
						</div>
						<div id="mem_pw">
							<span>비밀번호</span><br> <input type="password"
								placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8-20자)" name="member_pw" />
						</div>
						<div id="mem_pw2">
							<span>비밀번호 확인</span><br> <input type="password" placeholder="비밀번호 재입력"
								name="member_pw2" onkeyup="checkPwd()" /> <br>
							<div id="checkPw"></div>
						</div>
						<div id="mem_name">
							<span>이름</span><br> <input type="text" placeholder="이름 입력"
								name="member_name" />
						</div>
						<div id="mem_tel">
							<span>전화번호</span><br> <input type="text"
								placeholder="휴대폰 번호 입력('-'제외 11자리 입력)" name="member_tel" />
						</div>
						<div id="mem_address">
							<span>주소</span><br> <input type="text" placeholder="주소입력(시, 도, 구까지)"
								name="member_address" />
						</div>
						<input type="hidden" name="member_grade" value="A">
						<div id="mem_regbutton">
							<input type="submit" value="회원가입">
						</div>
					</form>
				</div>

			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
	<script>
	$("#blackloupe_img2").click(()=> {
  	  if ($("#divsearch").css("display") == "none") { 
  	        $("#divsearch").css("display", "block");//display :none 일떄
  	    } else {
  	    	 $("#divsearch").css("display", "none"); //display :block 일떄
  	    } 
  });
    $(".title").click(function(){
  	//  alert("click");
  	  if ($(".subtitle").css("display") == "none"){
  		  $(".subtitle").css("display", "block");
  	  }else{
  		  $(".subtitle").css("display", "none");
  	  }
    });
		function idCheck() {
			let id = document.form.member_id.value;
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {

				if (this.responseText == 0) {
					document.getElementById("demo").style.fontSize = "15px";
					document.getElementById("demo").style.color = "green";
					document.getElementById("demo").innerHTML = "사용가능";
				} else {
					document.getElementById("demo").style.fontSize = "15px";
					document.getElementById("demo").style.color = "red";
					document.getElementById("demo").innerHTML = "사용불가";
				}
			}
			xhttp.open("GET", "idCheck?id=" + id, true);
			xhttp.send();

		}

		function checkPwd() {
			var pw1 = document.form.member_pw.value;
			var pw2 = document.form.member_pw2.value;
			if (pw1 != pw2) {
				document.getElementById('checkPw').style.fontSize = "15px";
				document.getElementById('checkPw').style.color = "red";
				document.getElementById('checkPw').innerHTML = "동일한 암호를 입력하세요.";
			} else {
				document.getElementById('checkPw').style.fontSize = "15px";
				document.getElementById('checkPw').style.color = "green";
				document.getElementById('checkPw').innerHTML = "암호가 확인 되었습니다.";

			}
		}

		function legcheck() {
			const member_id = $("input[name='member_id']").val();
			const member_pw = $("input[name='member_pw']").val();
			const member_pw2 = $("input[name='member_pw2']").val();
			const member_name = $("input[name='member_name']").val();
			const member_tel = $("input[name='member_tel']").val();
			const member_address = $("input[name='member_address']").val();

			if (member_id == '') {
				alert("아이디를 입력하세요");
				member_id.focus();
				return false;
			} else if (member_pw == '') {
				alert("비밀번호를 입력하세요");
				member_pw.focus();
				return false;
			} else if (member_pw2 == '') {
				alert("비밀번호를 확인하세요");
				member_pw2.focus();
				return false;
			} else if (member_name == '') {
				alert("이름을 입력하세요");
				member_name.focus();
				return false;
			} else if (member_tel == '') {
				alert("전화번호를 입력하세요");
				member_tel.focus();
				return false;
			} else if (member_address == '') {
				alert("주소를 입력하세요");
				member_address.focus();
				return false;
			} else {
				submit();
			}
		};
	</script>
</body>
</html>