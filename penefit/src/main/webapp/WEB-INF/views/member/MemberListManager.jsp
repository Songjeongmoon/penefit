<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../style.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
.memberlistgrade{
  	margin-left :0px;
	margin-top :100px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			
<div class = memberlistgrade>
	<div id = "memberlistgradeTitle">
		<h2>[회원목록]</h2>
	</div>
	<div id="memberSearch">
	<select name='memberOption'>
  	<option value='' selected>-- 선택 --</option>
  	<option value='member_id'>아이디</option>
  	<option value='member_name'>이름</option>
  	<option value='member_grade'>등급</option>
	</select>
	<input type="text" name="searchMem" id="searchMem">
	<input type="button" value="검색" id="searchMemBtn" onclick="serchMem()">
	</div>
	<div id="memberlistTable">
	<table border ="2">
	<thead>
	<tr>
	<th>회원아이디</th><th>회원비밀번호</th><th>회원이름</th><th>회원전화번호</th><th>회원등급</th><th colspan ="2">관리자지정</th>
	</tr>
	</thead>
	<tbody id = "tbody">

	</tbody>
	</table>
	</div>
</div>



		</section>
	</div>
	<%@ include file="../footer.jsp"%>
<script>



getlist();

function getlist() {
	  let tbody = document.querySelector("#tbody");
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
		 let data = this.responseText;
		 let obj = JSON.parse(data);
		 alert(obj[0].member_address);

			for(i = 0;i<obj.length;i++ ){
				tbody.innerHTML +="<tr><td class='objid''>" +obj[i].member_id +"</td><td><input type='text' value="+obj[i].member_pw+"></td><td>" 
				+ "<input type='text' value="+obj[i].member_name+"></td><td><input type='text' value=" + obj[i].member_tel+"></td><td>"
				+ "<input  type='text'value='"+obj[i].member_address+"'></td><td>"+obj[i].member_grade+"</td>"
			  	+ "<td><input type='button' class = 'memChange' value='수정'></td>"
			  	+ "<td><input type='button' class = 'memDel' value='삭제'></td></tr>";
			}
	    }
	  xhttp.open("GET", "selectall", true);
	  xhttp.send();
	}


function serchMem() {
	
	$("#tbody").empty();
    let memberOption = $("select[name='memberOption']").val();
    let search = $("#searchMem").val();
    alert(memberOption);

    urldata = "";
    data ="";
    if(memberOption=="member_id"){
       urldata = "/member/selectOneid";
       data = "id";
    }else if(memberOption=="member_name"){
       urldata = "/member/selectOnename";
       data = "name";
    }else if(memberOption=="member_grade"){
       urldata = "/member/selectOnegrade";
       data = "grade";
    }
    $.ajax({
       url: urldata+"?"+data+"="+search,
       method: "GET",
       dataType: "json",
       success: (data) => {
    	   for(let i=0 ; i<data.length;i++){
    		   $("#tbody").append("<tr><td>" +data[i].member_id +"</td><td><input type='text' value=" + data[i].member_pw +"></td><td>"
    				    + "<input type='text' value="+data[i].member_name+"></td><td><input type='text' value=" + data[i].member_tel+"></td><td>"
    	  				+ "<input type='text' value='"+data[i].member_address+"'></td><td>"+data[i].member_grade+"</td>"
    				  	+ "<td><input type='button' class = 'memChange' value='수정'></td>"
    				  	+ "<td><input type='button' class = 'memDel'  value='삭제'></td></tr>")
    	          
    	   }
         
       }
       
    })
}	


$("#tbody").click((e) => {
	if(e.target.value == "수정"){
		let id = e.target.parentElement.parentElement.children[0].innerText;
		let pw = e.target.parentElement.parentElement.children[1].firstChild.value;
		let name = e.target.parentElement.parentElement.children[2].firstChild.value;
		let tel = e.target.parentElement.parentElement.children[3].firstChild.value;
		let address = e.target.parentElement.parentElement.children[4].firstChild.value;
		let grade = e.target.parentElement.parentElement.children[5].innerText;
		
		   let obj_member = {
	               "member_id" : id,
	               "member_pw" : pw,
	               "member_name" : name,
	               "member_tel" : tel,
	               "member_address" : address,
	               "member_grade" :grade
	            }
		   alert(JSON.stringify(obj_member));
		      $.ajax({
		             url: "/member/UpdateMemManager",
		             method: "POST",
		             contentType: "application/json",
		             data: JSON.stringify(obj_member),
		             success: function(data){
		                 alert(data);
		         	}
		      })  

	} else if(e.target.value == "삭제"){
		let id = e.target.parentElement.parentElement.children[0].innerText;
		
		 $.ajax({
             url: "/member/deleteMemManager",
             method: "DELETE",
             data: {
            	 "id" : id
             },
             success: function(data){
                 alert(data);
         	}
      })  
		
	}

})
</script>
</body>
</html>