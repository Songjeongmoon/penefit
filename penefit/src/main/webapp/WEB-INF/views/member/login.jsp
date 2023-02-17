<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
.login {
	margin-left: 500px;
	margin-top: 300px;
	width: 300px;
	height: 300px;
	border: solid 1px black;
}

.loginmain {
	margin-top: 25px;
	margin-left: 35px;
}

input[type=text] {
	width: 200px;
	height: 30px;
}

input[type=password] {
	width: 200px;
	height: 30px;
}
</style>
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
							<h5>로그인화면입니다!</h5>
						</div>
						<div id="login_id">
							아이디<br> <input type="text" name="member_id">
						</div>
						<div id="login_pw">
							비밀번호<br> <input type="password" name="member_pw">
						</div>
						<div>
							<input type="submit" value="로그인" onclick="return submit_check()">
						</div>
					</div>
				</div>
			</form>
		</section>
		</div>
		<%@ include file="../footer.jsp"%>
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
</body>
</html>