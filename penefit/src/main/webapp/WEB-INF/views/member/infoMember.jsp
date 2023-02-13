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
.mypageTitle {
	text-align: center;
	margin-bottom: 10PX;
}
.meminfo{
    width: 600px;
    height : 800px;
    border: solid 1px black;
    margin-left :200px;
	margin-top :100px;
}
.mem_info{
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
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">마이페이지</li>
					<li class="aside_menu" id="myinfoLabel">내 정보</li>
					<li class="aside_menu" id="myHistoryLabel"><a href="#">구매내역</a></li>
					<li class="aside_menu" id="aside_menu_btn">나의 클래스
						<div id="aside_submenu">
							<p id="mySuggestLabel">&nbsp;&nbsp;제안내역</p>
							<p>
							<p id="myClassLabel">&nbsp;&nbsp;클래스내역</p>
							<p>
							<p>&nbsp;&nbsp;추가?</p>
						</div>
					</li>
					<li class="aside_menu" id="myInquiryLabel">나의 문의내역</li>
				</ul>

			</aside>
			<div class="content" id="myinfo">
					    <div class="meminfo">
        <div class="mem_info">
            <div id="mem_maintitle">
                <h2>내 정보 관리</h2>
                <hr>
            </div>
           
        
            <div id="mem_id">
                아이디<br>
                <input type="text" name="member_id" value="${member_id }">
            </div>
            <div id="mem_pw">
                비밀번호<br>
                <input type="text" name="member_pw" value="${memberinfo.member_pw }">
            </div>
            <div id="mem_name">
                이름<br>
                <input type="text" name="member_name" value="${memberinfo.member_name }">
            </div>
            <div id="mem_tel">
                전화번호<br>
                <input type="text" name="member_tel" value="${memberinfo.member_tel }">
            </div>
              <div id="mem_address">
                전화번호<br>
                <input type="text" name="member_address" value="${memberinfo.member_address }">
            </div>
            <div id="mem_grade">
                회원등급<br>
                <input type="hidden" name="member_grade" value="${memberinfo.member_grade }">
            </div> 
     
            <div id="mem_buttons">
                <input type="button" name="mem_update" value="정보수정" onclick="UpdateMem()">
                <input type="button" name="mem_delete" value="회원탈퇴" onclick="delMem()">
            </div>     		
		</div>
		</div>
				
	
			</div>
			<div class="content" id="purchaseHistory">
				<h3 class="mypageTitle">[구매내역]</h3>
				<table border="1">
					<thead>
						<tr>
							<th>구매일자</th>
							<th>구매번호</th>
							<th></th>
							<th>구매일자</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="content" id="myClassSuggest">
				<h3 class="mypageTitle">[클래스제안내역]</h3>
			</div>
			<div class="content" id="myClassList">
				<h3 class="mypageTitle">[나의클래스]</h3>
			</div>
			<div class="content" id="myInquiry">
				<h3 class="mypageTitle">[문의내역]</h3>
			</div>
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		})
		//메뉴선택시 내용 div display 설정
		$(document).ready(function() {
			$(".content:not(#myinfo)").css("display", "none");
			$("#myinfo").css("display", "block");
		});
		$("#myinfoLabel").click(function() {
			$(".content:not(#myinfo)").css("display", "none");
			$("#myinfo").css("display", "block");
		});
		$("#myHistoryLabel").click(function() {
			$(".content:not(#purchaseHistory)").css("display", "none");
			$("#purchaseHistory").css("display", "block");
		});
		$("#myInquiryLabel").click(function() {
			$(".content:not(#myInquiry)").css("display", "none");
			$("#myInquiry").css("display", "block");
		});
		$("#mySuggestLabel").click(function() {
			$(".content:not(#myClassSuggest)").css("display", "none");
			$("#myClassSuggest").css("display", "block");
		});
		$("#myClassLabel").click(function() {
			$(".content:not(#myClassList)").css("display", "none");
			$("#myClassList").css("display", "block");
		});
		
		
		
		function UpdateMem(){
		     const updateid= $("input[name='member_id']").val();
		     const updatepw= $("input[name='member_pw']").val();
		     const updatename= $("input[name='member_name']").val();
		     const updatetel= $("input[name='member_tel']").val();
		     const updateaddress= $("input[name='member_address']").val();
		     const updategrade= $("input[name='member_grade']").val();
		     
		     let member={
		    	"member_id" : updateid,
		    	"member_pw" : updatepw,
		    	"member_name" : updatename,
		    	"member_tel" : updatetel,
		    	"member_address" : updateaddress,
		    	"member_grade" : updategrade
		     }
		     $.ajax({
		        url: "/member/updateMember",
		        method: "POST",
		        contentType: "application/json",
		        data : JSON.stringify(member),
		        success: (data) => {
		        	alert(data);
		        },
		        error : () => {
		        	alert("error");
		        }
		     })
		     
		      
		  }

		function delMem(){
		     const memberid= $("input[name='member_id']").val();
		     
		     $.ajax({
		        url: "deleteMember",
		        method: "DELETE",
		        data : {     
		        		"member_id" : memberid  
		        	}

		     })
		     
		  }  
	</script>
</body>
</html>