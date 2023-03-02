<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#detailModal {
		border: 1px solid red;
		display: none;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translateX(-50%);	
	}
	#add {
		display: inline-block;
		width: 100%;
		height: 150px;
		border: 1px solid red;
	}
	.imgBox {
		heigth: 150px;
		width: 150px;
	}
</style>
</head>
<body>
<%@ include file = "./header.jsp" %>

검색<input type = "text" name = "search" value=""><input type = "button" id = "searchBtn" value = "검색"><br>
<table id = "classList" border = "1">
	<thead>
		<tr>
			<th>코드</th><th>제목</th><th>현재인원</th>
			<th>강사</th><th>수업일</th><th>참가비</th>
			<th>지역</th><th>등록일</th><th>수정일</th><th></th>
		</tr>
	</thead>
	
	<tbody id = "classListBody">
		<c:forEach var = "list" items = "${list }">
		<tr>

			<td>${list.class_code }</td>
			<td class = "classDetail">${list.class_subject }</td>
			<td>${list.class_memcnt }/${list.class_memlit }</td>
			<td>${list.class_teacher }</td>
			<td>${list.class_date }</td>
			<td>${list.class_price }</td>
			<td>${list.city_code }</td>
			<td>${list.class_regdate }</td>
			<td>${list.class_modidate }</td>
			<td><button class="deleteBtn" value = "${list.class_code }">삭제</button></td>
			
		</tr>
		</c:forEach>
	
	</tbody>
	
	

</table>
	<div id = "detailModal">
		<form id = "updateForm">
			첨부했던 이미지<div id = "add"></div>
			클래스코드<input type = "text" name = "class_code"><br>
			제목<input type = "text" name = "class_subject"></input><br>
			강사<input type = "text" name = "class_teacher"></input><br>
			수강날짜<input type = "text" name = "class_date"></input><br>
			내용<input type = "text" name = "class_info"></input><br>
		 최대정원<input type = "text" name = "class_memlit"></input><br>
			가격<input type = "text" name = "class_price"></input><br>
			첨부사진<input type = "text" name = "suggest_photo"><br>
			파일 새로넣기<input type = "file" name = "files" multiple="multiple"><br>
			<button type = "button" id = "updateBtn" >수정</button>
			<button type = "button" id = "closeBtn" >닫기</button>
		</form>
		
	</div>
<button id = "dayBtn" value = "desc">날짜순</button>
<button id = "endBtn">완료된 클래스</button>
<button id = "activeBtn">진행중 클래스</button>
<<<<<<< HEAD
<%@ include file = "./footer.jsp" %>
<img id = "im" />
=======

>>>>>>> branch 'master' of https://github.com/Songjeongmoon/penefit.git

<script>

	$("#closeBtn").click(() => {
		$("#detailModal").css("display", "none");
		$("#classList").css("display", "block");
	})

	$("#endBtn").click((event) => {
		$.ajax({
			url: "/admin/class/end",
			method: "GET",
			dataType: "json",
			success: (data) => {
				$("#classListBody").empty();
				for(let i = 0; i < data.length; i++){
					$("#classListBody").append("<tr>"
					+ "<td>" + data[i].class_code + "</td><td class = classDetail>" + data[i].class_subject + "</td>"
					+ "<td>" + data[i].class_memcnt + "/" + data[i].class_memlit + "</td><td>" + data[i].class_teacher + "</td>"
					+ "<td>" + data[i].class_date + "</td><td>" + data[i].class_price + "</td>"
					+ "<td>" + data[i].city_code + "</td><td>" + data[i].class_regdate + "</td>"
					+ "<td>" + data[i].class_modidate + "</td>"
					+ "<td><button class='deleteBtn' value = '" + data[i].class_code + "'>삭제</button></td>"
					+ "</tr>");
				}
			},
			error: () => {
				alert("error");
			}
			
		})
	})
	
	$("#activeBtn").click((event) => {
		$.ajax({
			url: "/admin/class/active",
			method: "GET",
			dataType: "json",
			success: (data) => {
				$("#classListBody").empty();
				for(let i = 0; i < data.length; i++){
					$("#classListBody").append("<tr>"
					+ "<td>" + data[i].class_code + "</td><td class = classDetail>" + data[i].class_subject + "</td>"
					+ "<td>" + data[i].class_memcnt + "/" + data[i].class_memlit + "</td><td>" + data[i].class_teacher + "</td>"
					+ "<td>" + data[i].class_date + "</td><td>" + data[i].class_price + "</td>"
					+ "<td>" + data[i].city_code + "</td><td>" + data[i].class_regdate + "</td>"
					+ "<td>" + data[i].class_modidate + "</td>"
					+ "<td><button class='deleteBtn' value = '" + data[i].class_code + "'>삭제</button></td>"
					+ "</tr>");
				}
			},
			error: () => {
				alert("error");
			}
			
		})
	})
	
	$("#dayBtn").click((event) => {
		if(event.target.value == "desc"){
			event.target.value = "asc";
			$.ajax({
				url: "/admin/class/ASC",
				method: "GET",
				dataType: "json",
				success: (data) => {
					$("#classListBody").empty();
					for(let i = 0; i < data.length; i++){
						$("#classListBody").append("<tr>"
						+ "<td>" + data[i].class_code + "</td><td class = classDetail>" + data[i].class_subject + "</td>"
						+ "<td>" + data[i].class_memcnt + "/" + data[i].class_memlit + "</td><td>" + data[i].class_teacher + "</td>"
						+ "<td>" + data[i].class_date + "</td><td>" + data[i].class_price + "</td>"
						+ "<td>" + data[i].city_code + "</td><td>" + data[i].class_regdate + "</td>"
						+ "<td>" + data[i].class_modidate + "</td>"
						+ "<td><button class='deleteBtn' value = '" + data[i].class_code + "'>삭제</button></td>"
						+ "</tr>");
					}
				},
				error: () => {
					alert("error");
				}
				
			})
		} else{
			event.target.value = "desc";
			$.ajax({
				url: "/admin/class/DESC",
				method: "GET",
				dataType: "json",
				success: (data) => {
					$("#classListBody").empty();
					for(let i = 0; i < data.length; i++){
						$("#classListBody").append("<tr>"
						+ "<td>" + data[i].class_code + "</td><td class = classDetail>" + data[i].class_subject + "</td>"
						+ "<td>" + data[i].class_memcnt + "/" + data[i].class_memlit + "</td><td>" + data[i].class_teacher + "</td>"
						+ "<td>" + data[i].class_date + "</td><td>" + data[i].class_price + "</td>"
						+ "<td>" + data[i].city_code + "</td><td>" + data[i].class_regdate + "</td>"
						+ "<td>" + data[i].class_modidate + "</td>"
						+ "<td><button class='deleteBtn' value = '" + data[i].class_code + "'>삭제</button></td>"
						+ "</tr>");
					}
				},
				error: () => {
					alert("error");
				}
				
			})
		}
	})
	
	$("#classListBody").click((event) => {
		if(event.target.className == "classDetail"){
			$("#classList").css("display", "none");
			$("#detailModal").css("display", "inline-block");
			let code = event.target.previousElementSibling.textContent;
			$("#add").empty();
			$.ajax({
				url: "/admin/class/one",
				method: "GET",
				data: {
					class_code : code
				},
				success: (data) => {
					let photo = data.suggest_photo.split("-");
					
					for(let i = 0; i < photo.length; i++){
						$("#add").append("<img class = 'imgBox' src=../../images/" + photo[i] + "/>");
					
					}
					$("input[name='im']").val(photo[0]);
					$("input[name='class_code']").val(data.class_code);
					$("input[name='class_subject']").val(data.class_subject);
					$("input[name='class_teacher']").val(data.class_teacher);
					$("input[name='class_date']").val(data.class_date);
					$("input[name='class_info']").val(data.class_info);
					$("input[name='class_memlit']").val(data.class_memlit);
					$("input[name='class_price']").val(data.class_price);
					$("input[name='suggest_photo']").val(data.suggest_photo);
				},
				error: () => {
					alert("error");
				}
			})
		}
	})
	
	$("#classListBody").click( (event) => {
		if(event.target.className == "deleteBtn"){
			$.ajax({
				url: "/admin/class",
				method: "DELETE",
				data: {
					class_code: event.target.value
				},
				success: (data) => {
					alert(data);
					location.reload();
				},
				error: () => {
					alert("error");
				}
			
			})
		}
	})
	
	$("#searchBtn").click(() => {
		let data = $("input[name='search']").val();
		$("#classListBody").empty();
		$.ajax({
			url: "/admin/class/index",
			method: "GET",
			dataType: "json",
			data: {
				class_subject : data
			},
			success: (data) => {
				for(let i = 0; i < data.length; i++){
					$("#classListBody").append("<tr>"
					+ "<td>" + data[i].class_code + "</td><td class = classDetail>" + data[i].class_subject + "</td>"
					+ "<td>" + data[i].class_memcnt + "/" + data[i].class_memlit + "</td><td>" + data[i].class_teacher + "</td>"
					+ "<td>" + data[i].class_date + "</td><td>" + data[i].class_price + "</td>"
					+ "<td>" + data[i].city_code + "</td><td>" + data[i].class_regdate + "</td>"
					+ "<td>" + data[i].class_modidate + "</td>"
					+ "<td><button class='deleteBtn' value = '" + data[i].class_code + "'>삭제</button></td>"
					+ "</tr>");
				}
				
			},
			error: () => {
				alert("error");
			}
			
		})
	})
	
	$("#updateBtn").click(() => {
		let form = $("#updateForm")[0];
		let data = new FormData(form);
		$.ajax({             
	    	method: "PUT",          
	        enctype: 'multipart/form-data',  
	        url: "/admin/class/update",        
	        data: data,          
	        processData: false,    
	        contentType: false,      
	        cache: false,           
	        timeout: 600000,       
	        success: function(data) {
	        	alert(data);
	        },          
	        error: function () {  
	            alert("fail");      
	        }     
		});
		
	})
	
</script>
</body>
</html>