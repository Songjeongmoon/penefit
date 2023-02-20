<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../../header.jsp" %>

<table border = "1">
	
	<thead>
		<tr>
			<th>번호</th><th>분류</th><th>제목</th>
			<th>지역</th><th>가격</th><th>ID</th>
			<th>정원</th><th>시간</th><th>등록일</th>
		</tr>
	</thead>
	
	<tbody id = "tbody"></tbody>
</table>
<div id = "modal" style = 'display:none'>
<div id = "detailModal"></div>
<textarea id = "rejectReason" placeholder = "반려사유"></textarea>
</div>




<%@ include file="../../footer.jsp" %>


<script>


	$.ajax({
		url: "/admin/suggestion/list",
		method: "GET",
		dataType : "json",
		success: (data) => {
			for(let i = 0; i < data.length; i++){
				$("#tbody").append("<tr>"
						+ "<td>" + data[i].suggest_num + "</td><td>" + data[i].type + "</td>"
						+ "<td class='showDetail'>" + data[i].suggest_title + "</td><td>" + data[i].city_code + "</td>"
						+ "<td>" + data[i].price + "</td><td>" + data[i].member_id + "</td>"
						+ "<td>" + data[i].maxCnt + "</td><td>" + data[i].class_time + "</td>"
						+ "<td>" + data[i].suggest_regdate + "</td>"
						+"</tr>");
			}
		},
		error: () => {
			alert("Error!...");
		}
	})
	
	$("#tbody").click( (event) => {
		if(event.target.className == "showDetail"){
			let num = event.target.previousElementSibling.previousElementSibling.textContent;
			$("#modal").css("display", "block");
			
			$.ajax({
				url: "/admin/suggestion/one",
				method: "GET",
				dataType: "json",
				data: {
					suggest_num : num
				},
				success: (data) => {
					$("#detailModal").html("<div>"
							+ "코드 : <div id = 'suggestNum'>" + data.suggest_num + "</div>"
							+ "제목 : <div>" + data.suggest_title + "</div>내용 : <div>" + data.suggest_content + "</div>"
							+ "첨부 이미지 : <div>" + data.suggest_photo + "</div>강의날짜 : <div>" + data.class_time + "</div>"
							+ "</div><button id = admitBtn>승인</button></div><button id = rejectBtn>반려</button>");
				},
				error: () => {
					alert("fail");
				}
			})
		}
	})
	
	$("#detailModal").click( (event) => {
		if(event.target.id == "admitBtn"){
			let num = $("#suggestNum").text();
			$.ajax({
				url: "/admin/class",
				method: "post",
				data: {
					suggest_num: num
				},
				success: (data) => {
					if(data == 1){
						alert("등록 완료되었습니다.");
					} else{
						alert("에러로 인해 등록실패하였습니다.");
					}
					location.href = "/adminView";
				},
				error: () => {
					alert("Error");
					location.href = "adminView";
				}
			})
		}
	})
	
	$("#detailModal").click( (event) => {
		if(event.target.id == "rejectBtn"){
			let num = $("#suggestNum").text();
			let reason = $("#rejectReason").val();
			$.ajax({
				url: "/admin/suggestion",
				method: "put",
				data: {
					suggest_num: num,
					reject_reason: reason
				},
				success: (data) => {
					if(data == 1){
						alert("제안서를 반려하였습니다.");
					} else{
						alert("에러로 인해 반려 실패했습니다.");
					}
					location.href = "/adminView";
				},
				error: () => {
					alert("Error");
					location.href = "adminView";
				}
			})
		}
	})
	



</script>
</body>
</html>