<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../style.css">
<style>
.meminfo{
    width: 600px;
    height : 800px;
    border: solid 1px black;
    margin-left :400px;
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
<div id="delpwShow" class="modal">
	<div id="delpwShowContent">
	<form type ="post" name ="delform">
	<h3>비밀번호 확인</h3><br>
	<input type="text" name="member_pw" >
	</form>
	</div>
</div>


		</section>
	</div>
	<%@ include file="../footer.jsp"%>
<script>


/*$("input[name='member_delete']").click(function(event) {
  event.preventDefault(); 

  $(this).modal({
    fadeDuration: 250,
/*
  escapeClose: false,
  clickClose: false,
  showClose: false
*/
/*  });
});
function delpwcheck() {
    var form = document.delform;
    if (!form.name.value) {
        alert("비밀번호를 입력해주세요.");
        form.member_pw.focus();
        return;
    }
   
    $.ajax({
        type: "post",
        url: "deleteMember",
        data: {
        	member_id:{
        		"member_id" : memberid  
        	}
        },
        dataType: "text",
        success: function(data) {         
            	alert(data);
 
        },
        error: () => {
        	alert("error");
        }
        
    });
}*/

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