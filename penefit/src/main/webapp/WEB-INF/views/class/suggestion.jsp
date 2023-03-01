<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<Style>
#formsuggest {
	text-align: left;
}

#suggesttbl {
	margin: 0 auto;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	border-radius: 7px;
	padding: 20px;
}

#suggesttbl th {
	text-align: center;
	width: 200px;
}

#suggesttbl td {
	width: 300px;
	height: 35px;
	padding-left: 5px;
}

#suggesttbl input, select, textarea {
	width: 350px;
	height: 40px;
}

#suggesttbl textarea {
	height: 200px;
}

#submitbtn {
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 500px;
	height: 40px;
	line-height: 40px;
	font-weight: bold;
	margin-top: 10px;
}
</Style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">클래스</li>
					<li class="aside_menu"><a href="/class/classList">클래스 전체보기</a></li>
					<li class="aside_menu"><a href="/class/classList-ongoing">진행중인클래스</a></li>
					<li class="aside_menu" id="aside_menu_btn">카테고리별 클래스
						<div id="aside_submenu">
							<p>
								<a href="classList-category?key=A">&nbsp;&nbsp;의류</a>
							</p>
							<p>
								<a href="classList-category?key=B">&nbsp;&nbsp;식품</a>
							</p>
							<p>
								<a href="classList-category?key=C">&nbsp;&nbsp;미용</a>
							</p>
							<p>
								<a href="classList-category?key=D">&nbsp;&nbsp;기타</a>
							</p>
						</div>
					</li>
					<li class="aside_menu"><a href="/class/classList-new">신규
							클래스</a></li>
					<li class="aside_menu"><a href="/class/classList-expired">지난클래스</a></li>
					<li class="aside_menu"><a href="/class/suggestion">클래스제안</a></li>
				</ul>

			</aside>
			<div class="content">
				<h2>클래스제안</h2>
				<br>
				<form action="/class/suggestion" method="post"
					enctype="multipart/form-data" id="formsuggest">
					<table id="suggesttbl">
						<tr>
							<th>분류</th>
							<td><select name="type" style="text-align: center;">
									<option value="">- - - - -분류 - - - - -</option>
									<option value="A">미용</option>
									<option value="B">간식</option>
									<option value="C">훈련</option>
									<option value="D">의류</option>
							</select></td>
						</tr>

						<tr>
							<th>ID</th>
							<td><input type="text" name="member_id"
								value="${member_id }" style="text-align: center;"></td>
						</tr>
						<tr>
							<th>주제</th>
							<td><input type="text" name="suggest_title"></td>
						</tr>
						<tr>
							<th>지역</th>
							<td><select name="city_code" style="text-align: center;">
									<option value="">- - - - - 지역 - - - - -</option>
									<option value="A">서울</option>
									<option value="B">경기</option>
									<option value="C">인천</option>
									<option value="D">강원</option>
									<option value="E">충남</option>
									<option value="F">대전</option>
									<option value="G">충북</option>
									<option value="H">부산</option>
									<option value="I">울산</option>
									<option value="J">대구</option>
									<option value="K">경북</option>
									<option value="L">경남</option>
									<option value="M">전남</option>
									<option value="N">광주</option>
									<option value="O">제주</option>
									<option value="Z">온라인</option>
							</select></td>
						</tr>
						<tr>
							<th>수업예정일</th>
							<td><input type="datetime-local" name="class_time"
								style="text-align: center;"></td>
						</tr>
						<tr>
							<th>수업길이(시간기준)</th>
							<td><input type="number" name="time" value="1" min="1"
								style="text-align: center;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="suggest_content"></textarea></td>
						</tr>
						<tr>
							<th>최대인원</th>
							<td><input type="number" name="maxCnt"></td>
						</tr>
						<tr>
							<th>참가비용</th>
							<td><input type="number" name="price"></td>
						</tr>
						<tr>
							<th>추가이미지 첨부</th>
							<td><input type="file" multiple="multiple" name="files"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><input
								type="submit" value="신청" id="submitbtn"></td>
						</tr>
					</table>
				</form>

			</div>
		</section>
	</div>







	<script>
	$("input[type='submit']").click( (event) => {
		if($("select[name='type']").val() == ""){
			alert("분류를 선택해주세요.");
			return false;
		} else if($("input[name='suggest_title']").val() == ""){
			alert("주제를 입력해주세요.");
			return false;
		} else if($("select[name='city_code']").val() == ""){
			alert("수업하시려는 지역을 선택해주세요.");
			return false;
		} else if($("textarea[name='suggest_content']").val() == ""){
			alert("내용을 입력해주세요.");
			return false;
		} else if($("input[name='maxCnt']").val() == ""){
			alert("최대 수용인원을 입력해주세요.");
			return false;
		} else if($("input[name='price']").val() == ""){
			alert("참가비용을 입력해주세요.");
			return false;
		} else if($("input[name='files']").val() == ""){
			alert("첨부이미지를 추가해주세요.");
			return false;
		} else if($("input[name='class_time']").val() == ""){
			alert("시간대를 선택해주세요.");
			return false;
		} else{
			return true;
		}
	
	})
</script>

</body>
</html>
