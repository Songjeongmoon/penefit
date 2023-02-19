<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../../header.jsp" %>
<h1>Suggestion List Page</h1>
<hr>
<table border = "1">

	<thead>
		<tr>
			<th>no</th><th>분류</th>
			<th>제목</th><th>시간</th>
			<th>지역</th><th>가격</th>
			<th>정원</th><th>등록일</th>
		</tr>
	</thead>
	
	<tbody id = "tbody"></tbody>

</table>


<%@ include file="../../footer.jsp" %>

<script>
	
	$.ajax({
		url: "/class/suggestion-list",
		method: "POST",
		dataType: "json",
		data: {
			member_id : "song"
		},
		success: (data) => {
			for(let i = 0; i < data.length; i++){
				$("#tbody").append("<tr>"
						+ "<td>" + data[i].suggest_num + "</td><td>" + data[i].type
						+ "</td><td>" + data[i].suggest_title + "</td><td>" + data[i].class_date
						+ "</td><td>" + data[i].city_code + "</td><td>" + data[i].price
						+ "</td><td>" + data[i].maxCnt + "</td><td>" + data[i].suggest_regdate
						+ "</td></tr>");
			}
		},
		error: () => {
			alert("Error..!!");
		}
	})
	
	
</script>

</body>
</html>