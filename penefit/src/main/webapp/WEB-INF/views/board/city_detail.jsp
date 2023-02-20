<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="/css/">
<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="notice">공지사항</a></li>
					<li class="aside_menu"><a href="#">수강후기</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
					<li class="aside_menu"><a href="classList_new">클래스별게시판</a></li>
				</ul>
			</aside>
			<div class="content">
				<h1>city 상세목록</h1>
				<table border="1">

						<tr>
							<th>번호</th>
							<td>${cvo.board_num }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${cvo.member_id }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${cvo.board_title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${cvo.board_content }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${cvo.board_regdate }</td>
						</tr>

						<tr>
							<th>조회수</th>
							<td>${cvo.board_viewcnt }</td>
						</tr>
						<tr>
							<td colspan="2">
													<input type="hidden" name="board_num" value="${cvo.board_num}">

					<c:if test="${sessionScope.member_id == cvo.member_id }">
						<button type="button"
							onclick="location.href='city_modiView?board_num=${cvo.board_num }'">수정</button>
						<button type="button"
							onclick="location.href='delCity?board_num=${cvo.board_num }'">삭제</button>

					</c:if>
					<button type="button" onclick="location.href='cityBoardview'">목록</button>
							</td>
						</tr>
					</table>

				<br>
				<hr>

				<div class="reply_container">
					<div class="reply_reg">
						<input type="hidden" name="board_num" value="${cvo.board_num }">
						<input type="hidden" name="reply_num" value="${reply_num}">
						<input type="hidden" name="reply_type" value="C"><br>
						<input type="hidden" name="member_id" value="${member_id }"
						 id="writer"	readonly="readonly"><br>
						<textarea name="reply_content" id="rReply" placeholder="댓글 내용을 입력해주세요."></textarea>
						<br> <input type="button" value="등록" onclick="regReply()">
					</div>
				</div>
				<hr>
				<br> <br>
				<div class="reply_List">
					<table border="1">
						<thead>
							<tr>
								<th>내용</th>
								<th>작성자</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="tbody">

						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
	<script>
	
	alert($("#writer").val());
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		})
		
		function regReply() { //댓글 등록
			const board_num = document.querySelector("input[name='board_num']").value;
			const reply_num = document.querySelector("input[name='reply_num']").value;
			const reply_type = document.querySelector("input[name='reply_type']").value;
			const member_id = document.querySelector("input[name='member_id']").value;
			const reply_content = document.querySelector("textarea[name='reply_content']").value;
			
			const obj = {
				board_num : board_num,
				reply_num : reply_num,
				reply_type : reply_type,
				member_id : member_id,
				reply_content : reply_content
			}
			const json_obj = JSON.stringify(obj);
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				this.responseText;
				window.location.reload();
			}
			xhttp.open("POST", "/api/city/reply", true);
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(json_obj);
		}

		//댓글 리스트
		
		getReplyList();
		
		function getReplyList() {
			const board_num = document.querySelector("input[name='board_num']").value;
			const tbody = document.querySelector("#tbody");
			$("#tbody").empty();
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				let obj = JSON.parse(data);
				
				for (let i = 0; i < obj.length; i++) {
					let msg = "";
					if("${sessionScope.member_id }" == obj[i].member_id){
						msg = "<td><button type='button' class ='delBtn'>삭제</button></td></tr>";
            		} else{
            			msg = "</tr>";
            		}
					
					tbody.innerHTML += "<tr><td><input type='hidden' name='reply_num' value='" + obj[i].reply_num + "'>"
									+ obj[i].reply_content
									+ "</td><td>"
									+ obj[i].member_id +"</td>" + msg;
				}
				
				
			}
			xhttp.open("GET", "/api/city/replyList/board_num/" + board_num, true);
			xhttp.send();
		}
		
		$(document).on("click",".delBtn", function(evt){
			//버튼(evt가 발생한 타겟)을 기준으로 부모 : td --> 부모 --> tr --> 0번째 자식 -->첫번째 td --> 내용물
			
			let reply_num = evt.target.parentElement.parentElement.children[0].children[0].value;
			delReply(reply_num);
		
		})
		
		function delReply(reply_num) {
  			const xhttp = new XMLHttpRequest();
 			 xhttp.onload = function() {
  			  //alert(this.responseText);
 				getReplyList();
  			  }
 			 xhttp.open("DELETE", "/api/city/delReply/reply_num/"+ reply_num, true);
 			 xhttp.setRequestHeader("Content-type", "application/json");
 			 xhttp.send();
		}
		
		
		
	</script>
	<script type="text/javascript" src="/js/javascript.js"></script>
</body>
</html>