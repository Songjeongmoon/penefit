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
	private int suggest_num;
	private String member_id;
	private String suggest_title;
	private String suggest_content;
	private String suggest_regdate;
	private String city_code;
	private String suggest_photo;
	private String class_time;
	private int maxCnt;
	private int price;
	private String type;
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




<%@ include file="../../footer.jsp" %>


<script>
	
	$("#tbody").click( (event) => {
		if(event.target.className == "suggestion_title"){
			let num = event.target.previousElementSibling.previousElementSibling.innerText;
			
			location.href = "/admin/suggestion/detail?suggest_num=" + num;
		}
	})

	$.ajax({
		url: "/admin/suggestion/list",
		method: "GET",
		dataType : "json",
		success: (data) => {
			for(let i = 0; i < data.length; i++){
				$("#tbody").append("<tr>"
						+ "<td>" + data[i].suggest_num + "</td><td>" + data[i].type + "</td>"
						+ "<td class = 'suggestion_title' value = '" + data[i].suggest_num + "'>" + data[i].suggest_title + "</td><td>" + data[i].city_code + "</td>"
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


</script>
</body>
</html>