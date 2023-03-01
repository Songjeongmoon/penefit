<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<h1>MyClassList Page</h1>
<hr>

<table border = "1">

	<thead>
		<tr>
			<th>제목</th><th>수강생/정원</th>
			<th>시간/날짜</th>
			<th>지역</th><th>가격</th>
			<th>등록일</th>
		</tr>
	</thead>
	
	<tbody id = "tbody"></tbody>

</table>



<script>

	$.ajax({
		url: "/class/list/my",
		method: "POST",
		dataType: "json",
		data: {
			member_id : "song"
		},
		success: (data) => {
			for(let i = 0; i < data.length; i++){
				$("#tbody").append("<tr>"
						+ "<td>" + data[i].class_subject + "</td><td>" + data[i].class_memcnt + "/" + data[i].class_memlit
						+ "</td><td>" + data[i].suggest_title + "</td><td>" + data[i].class_time
						+ "</td><td>" + data[i].city_name + "</td><td>" + data[i].class_price
						+ "</td><td>" + data[i].class_regdate
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