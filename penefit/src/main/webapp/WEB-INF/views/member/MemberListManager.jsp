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
.memberlist{
  	margin-left :300px;
	margin-top :100px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			
<div class = memberlist>
	<div id = "memberlistTitle">
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
	<th>회원아이디</th><th>회원비밀번호</th><th>회원이름</th><th>회원전화번호</th><th>회원주소</th><th>회원등급</th><th colspan ="2">관리자지정</th>
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

			for(i = 0;i<obj.length;i++ ){
				tbody.innerHTML +="<tr><td class='objid''>" +obj[i].member_id +"</td><td>" + obj[i].member_pw +"</td><td>" + obj[i].member_name+"</td><td>" + obj[i].member_tel+"</td><td>"
				+ obj[i].member_address+"</td><td>"+obj[i].member_grade+"</td><td><select name='memberOptionChange'>"
			  	+ "<option value='hh'>-- 선택 --</option><option value='A'>일반</option>"
			  	+ "<option value='B'>강사</option><option value='C'>관리자</option></select></td>"
			  	+ "<td><input class = 'gradeChange' type = 'button' value ='저장'></td></tr>";
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
    alert(search);
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
    		   $("#tbody").append("<tr><td>" +data[i].member_id +"</td><td>" + data[i].member_pw +"</td><td>" + data[i].member_name+"</td><td>" + data[i].member_tel+"</td><td>"
    	  				+ data[i].member_address+"</td><td>"+data[i].member_grade+"</td><td><select name='memberOptionChange'>"
    				  	+ "<option value='hh'>-- 선택 --</option><option value='A'>일반</option>"
    				  	+ "<option value='B'>강사</option><option value='C'>관리자</option></select></td>"
    				  	+ "<td><input class = 'gradeChange' type = 'button' value ='저장'></td></tr>")
    	          
    	   }
         
       }
       
    })
}	
$("#tbody").click((e) => {
	if(e.target.className == "gradeChange"){
		 let memberOptionChange = e.target.parentElement.previousElementSibling.firstChild.value;
		 let id = e.target.parentElement.parentElement.firstChild.innerText;
		 $.ajax({
		        url: "gradeChange",
		        method: "PUT",
		        data : {     
		         "id": id,
		         "grade":memberOptionChange
		        },
		        success: function(data){
		           alert(data);
		           
		        },
		        error: function(){
		           alert("error..");
		        }
		        
		     })      
		  
	}

})

</script>
</body>
</html>