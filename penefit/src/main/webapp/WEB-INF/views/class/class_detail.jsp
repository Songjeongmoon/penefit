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
img{
	width: 500px;
	height: 500px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<div><img src="../images/${cvo.class_photo }"></div>
			${cvo.class_code }<br>
			${cvo.class_subject }<br>
			
			
			
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		
	</script>
</body>
</html>