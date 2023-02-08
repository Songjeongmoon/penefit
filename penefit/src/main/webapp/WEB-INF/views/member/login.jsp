<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login{
	margin-left :500px;
	margin-top :300px;
    width: 300px;
    height : 300px;
    border: solid 1px black;
}
.loginmain{
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
<div class="container">
<%@ include file="../header.jsp" %>
        <div class="box">
            <body>
		    <form name="frm_login" method="post" action="login.do">
		    <div class="login">
		    <div class="loginmain">
		        <div id ="login_title">
		            <h2>로그인</h2>
		            <h5>로그인화면입니다!</h5>
		        </div>
		        <div id="login_id">
		            아이디<br>
		            <input type="text" name="member_id" >
		        </div>
		        <div id="login_pw">
		            비밀번호<br>
		            <input type="password" name="member_pw" >
		        </div>
		        <div>
		            <input type="submit" value="로그인">
		        </div>
		    </div>
		    </div>
		    </form>
		</body>
        </div>
<%@ include file="../footer.jsp" %>
</div>
</body>
</html>