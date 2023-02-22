

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="/css/style.css">
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
						<div id="postnum">
							<span>우편번호</span><br> <input type="text" placeholder="우편번호" name="postnum" />
						</div>
						<div id="address_button" >
							<input type="button" onclick="execution_daum_address()" value="주소찾기"/>
						</div>
						<div id="mem_address">
							<span>주소</span><br> <input type="text"  name="member_address" />
						</div>
						<div id="mem_addressdetail">
							<span>상세주소</span><br> <input type="text" placeholder="주소입력(시, 도, 구까지)" name="member_addressdetail" />
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

		/* 다음 주소 연동 */
		function execution_daum_address(){
		 
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.querySelector("input[name='postnum']").value = data.zonecode;
	                document.querySelector("input[name='member_address']").value = addr;
	                
	                $("input[name='member_addressdetail']").attr("readonly",false);
	                $("input[name='member_addressdetail']").focus();
                  
                 }
              }).open();
     }
	</script>
</body>

</html>