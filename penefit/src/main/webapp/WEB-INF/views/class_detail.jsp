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
.class_one {
	width: 225px;
	height : 300px;
	display: inline-block;
}

.class_one img {
	width: 220px;
	height: 200px;
}

.class_one p a:nth-of-type(1) {
	font-size: 18px;
}

.class_one p:nth-of-type(2) {
	font-size: 13px;
	line-height: 0px;
}

#aside_submenu {
	display: none;
	width: 100px;
}

#aside_submenu p {
	margin: 5px 0;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="box">
		<section>
			<img src="${cvo.class_photo }">
			${cvo.class_code }
			${cvo.class_subject }
			
			
			
		</section>
	</div>
	<%@ include file="footer.jsp"%>
	<script>
		
	</script>
</body>
</html>