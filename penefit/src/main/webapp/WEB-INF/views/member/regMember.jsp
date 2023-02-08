<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: content-box;
	font-family: 'Pretendard-Regular';
	
}

h1{
    font-size: 20px;
    margin-bottom: 5px;
}
h4{
    font-size: 10px;
}
.regmem{
	margin-left :400px;
	margin-top :200px;
    width: 600px;
    height :800px;
    border: solid 1px black;

}
.reg_main{
    margin-top: 60px;
    margin-left: 110px;
}
input[type=text] {
	width: 300px;
	height: 40px;
	font-size: 14px;
    margin-top: 5px;
    margin-bottom: 10px;
}
input[type=password] {
	width: 300px;
	height: 40px;
	font-size: 14px;
    margin-top: 5px;
    margin-bottom: 10px;
}
input[type=button] {
	width: 80px;
	height: 40px;
	font-size: 14px;

}
h4{
    margin-bottom: 40px;
}


</style>
</head>
<body>
<div class="container">
<%@ include file="../header.jsp" %>
        <div class="box">
        <div class="regmem">
        <div class = "reg_main">
        <div id="main title">
            <h1>회원가입</h1>
            <h5>회원가입을 통해 다양한 서비스를 만나보세요!</h5>
        </div>
		<form name ="form" action="regMember" method="post">
		
        <div id="mem_id">
            아이디*<br>
            <input type="text"  placeholder="아이디 입력(6~20자)" name="member_id"/>
            <input type="button" value="중복확인" onclick="idCheck()">
            <br><div id="demo"></div>
        </div>
        <div id="mem_pw">
            비밀번호*<br>
            <input type="password" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8-20자)" name="member_pw"/>
        </div>
        <div id="mem_pw2">
            비밀번호 확인*<br>
            <input type="password" placeholder="비밀번호 재입력" name="member_pw2" onkeyup="checkPwd()"/>
            <br><div id="checkPw"></div>
        </div>
            <div id="mem_name">
            이름*<br>
            <input type="text"  placeholder="이름 입력" name="member_name"/>
        </div>
         <div id="mem_tel">
            전화번호*<br>
            <input type="text" placeholder="휴대폰 번호 입력('-'제외 11자리 입력)" name="member_tel"/>
        </div>       
         <div id="mem_address">
            주소*<br>
            <input type="text" placeholder="주소입력" name="member_address"/>
        </div> 
        <input type="hidden" name="member_grade" value="A">
        <div id="mem_regbutton">
            <input type="submit" value="회원가입">
        </div>  
              </form>   
        </div>
     
    </div>
        </div>
<%@ include file="../footer.jsp" %>
</div>
<script>
function idCheck(){
	let id = document.form.member_id.value;
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
		  
		if(this.responseText == 0){
		document.getElementById("demo").style.fontSize = "15px";
		document.getElementById("demo").style.color = "green";
		document.getElementById("demo").innerHTML = "사용가능";	
		}else{
		document.getElementById("demo").style.fontSize = "15px";
		document.getElementById("demo").style.color = "red";
	    document.getElementById("demo").innerHTML = "사용불가";
	    }
	  }
	  xhttp.open("GET", "idCheck?id="+id, true);
	  xhttp.send();

}

function checkPwd(){
	  var pw1 = document.form.member_pw.value;
	  var pw2 = document.form.member_pw2.value;
	  if(pw1!=pw2){
	   document.getElementById('checkPw').style.fontSize = "15px";
	   document.getElementById('checkPw').style.color = "red";
	   document.getElementById('checkPw').innerHTML = "동일한 암호를 입력하세요.";
	  }else{
	   document.getElementById('checkPw').style.fontSize = "15px";
	   document.getElementById('checkPw').style.color = "green";
	   document.getElementById('checkPw').innerHTML = "암호가 확인 되었습니다.";
	   
	  }
}
</script>
</body>
</html>