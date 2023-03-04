<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/style.css">

<style>
* {
	/* border :1px solid pink; */
	
}
section {
	text-align: center;
}
.login {
	position: relative;
	top: 30px;
	margin: 0 auto;
	display: inline-block;
	width: 400px;
	height: 500px;
	border: solid 1px #BBB09F;
	border-radius: 7px;
	box-shadow: 7px 7px 7px 7px #DBD5CB;
}
#login_title h2 {
	margin-top: 50px;
	font-size: 40px;
	color: #BBB09F;
}
#login_id, #login_pw {
	margin-top: 35px;
}
input[type='text'], input[type='password'] {
	height: 40px;
	width: 250px;
}
input[type='submit'] {
	width: 250px;
	margin-top: 20px;
	height: 40px;
	background-color: #75BD43;
	font-size: 20px;
	line-height: 40px;
	border-radius: 7px;
	color: white;
	border: none;
}
p {
	text-align: left;
	display: inline;
	position: relative;
	right: 90px;
}
</style>
</head>

</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
			<section>
			<form name="frm_login" id ="frm_login"  method="post" action="login.do">
				<div class="login">
					<div class="loginmain">
						<div id="login_title">
							<h2>로그인</h2>
						</div>
						<div id="login_id">
							<p>아&nbsp;이&nbsp;디</p><br> <input type="text" name="member_id">
						</div>
						<div id="login_pw">
							<p>비밀번호</p><br> <input type="password" name="member_pw">
						</div>
						<div>
							<input type="submit" value="로그인" onclick="return submit_check()">
						</div>
					</div>
				</div>
			</form>
		</section>
		</div>
<script>

/*$("#frm_login").ready(function() {
    let message = "[[${msg}]]";
    if (message != "") {
        alert(message);
    }else {
    }
})*/

function submit_check(){
	const member_id= $("input[name='member_id']").val();
	const member_pw= $("input[name='member_pw']").val();
	
	if(member_id ==''){
		alert("아이디를 입력하세요");
		member_id.focus();
		return false;
	}else if(member_pw ==''){
		alert("비밀번호를 입력하세요");
		member_pw.focus();
		return false;
	}else{
		submit();
	}
};

</script>

	<div class="box">
		<section>
			<form name="frm_login" id="frm_login" method="post" action="login.do">
				<div class="login">
					<div class="loginmain">
						<div id="login_title">
							<h2>로그인</h2>
						</div>
						<div id="login_id">
							<p>아&nbsp;이&nbsp;디</p>
							<br> <input type="text" name="member_id">
						</div>
						<div id="login_pw">
							<p>비밀번호</p>
							<br> <input type="password" name="member_pw">
						</div>
						<div>
							<input type="submit" value="로그인" onclick="return submit_check()">
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
	<script>
		/*$("#frm_login").ready(function() {
		 let message = "[[${msg}]]";
		 if (message != "") {
		 alert(message);
		 }else {
		 }
		 })*/
		function submit_check() {
			const member_id = $("input[name='member_id']").val();
			const member_pw = $("input[name='member_pw']").val();
			if (member_id == '') {
				alert("아이디를 입력하세요");
				member_id.focus();
				return false;
			} else if (member_pw == '') {
				alert("비밀번호를 입력하세요");
				member_pw.focus();
				return false;
			} else {
				form.submit();
			}
		};
	</script>

	<script type="text/javascript" src="/js/javascript.js"></script>



</body>

</html>