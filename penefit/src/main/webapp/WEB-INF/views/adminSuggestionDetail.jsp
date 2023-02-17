<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "./header.jsp" %>

<div>${suggestion.suggest_num }</div>
<div>${suggestion.type }</div>
<div>${suggestion.member_id}</div>
<div>${suggestion.suggest_title }</div>
<div>${suggestion.suggest_content }</div>
<div>${suggestion.city_code }</div>
<div>${suggestion.suggest_photo }</div>
<div>${suggestion.class_time }</div>
<div>${suggestion.maxCnt }</div>
<div>${suggestion_price }</div>
<div>${suggestion.suggest_regdate }</div>
<input id = "admitBtn" type = "button" value = "승인">


<%@ include file = "./footer.jsp" %>

<script>

	$("#admitBtn").click(() => {
		$.ajax({
			url: "/admin/class",
			method: "post",
			data: {
				suggest_num: ${suggestion.suggest_num}
			},
			success: (data) => {
					alert(data);
					location.href = "/adminView";
				
			},
			error: () => {
				alert("error!!!");
			}
	
		})
	})
	
</script>
</body>
</html>