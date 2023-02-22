<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<div class="box">
			<form name="frm_login" id="frm_login" method="post" action="login.do">
				<div class="login">
					<div class="loginmain">
						<div id="login_title">
							<h2>로그인</h2>
						</div>
						<div id="login_id">
							<p>아&nbsp;이&nbsp;디</p>
							<br>
							<input type="text" name="member_id">
						</div>
						<div id="login_pw">
							<p>비밀번호</p>
							<br>
							<input type="password" name="member_pw">
						</div>
						<div>
							<input type="submit" value="로그인" onclick="return submit_check()">
						</div>
					</div>
				</div>
			</form>




		</div>
	</div>
</body>
</html>