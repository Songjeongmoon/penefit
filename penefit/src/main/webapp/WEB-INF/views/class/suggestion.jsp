

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
<%@ include file="../header.jsp" %>
<h1>Suggestion Page</h1>
<hr>

<form action = "/class/suggestion" method = "post" enctype = "multipart/form-data">
	
	분류<select name = "type">
		<option value = "">--분류--</option>
		<option value = "A">미용</option>
		<option value = "B">간식</option>
		<option value = "C">훈련</option>
		<option value = "D">의류</option>
	</select><br>
	
	id<input type = "text" name = "member_id" value = "${member_id }"><br>
	주제<input type = "text" name = "suggest_title"><br>
	
	지역<select name = "city_code">
		<option value = "">--지역--</option>
		<option value = "A">서울</option><option value = "B">경기</option>
		<option value = "C">인천</option><option value = "D">강원</option>
		<option value = "E">충남</option><option value = "F">대전</option>
		<option value = "G">충북</option><option value = "H">부산</option>
		<option value = "I">울산</option><option value = "J">대구</option>
		<option value = "K">경북</option><option value = "L">경남</option>
		<option value = "M">전남</option><option value = "N">광주</option>
		<option value = "O">제주</option><option value = "Z">온라인</option>
	</select><br>
	시간<input type = "datetime-local" name = "class_time"><br>
	수업시간<input type = "number" name = "time" value = "1" min = "1"><br>
	내용<textarea name = "suggest_content"></textarea><br>
	최대인원<input type = "number" name = "maxCnt" value = 0><br>
	참가비용<input type = "number" name = "price" value = 0><br>
	추가 첨부이미지<input type = "file" multiple = "multiple" name = "files"><br>
	<input type = "submit" value = "신청">
</form>


<%@ include file="../footer.jsp" %>




</body>
</html>
