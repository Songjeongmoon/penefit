<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
	<h2>qna 상세</h2>

	<div class="container">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><input type="text" name="qna_num" value="${qna.qna_num }" readonly="readonly"></td>
			</tr>
			<tr>
			<tr>
				<th>작성자</th>
				<td>${qna.member_id }"</td>
			</tr>

			<tr>
				<th>제목</th>
				<td>${qna.qna_title }</td>
			</tr>

			<tr>
				<th>내용</th>
				<td>${qna.qna_content}</td>
			</tr>
		<c:if test ="${sessionScope.member_id == qna.member_id }">	
			<button type="button" onclick="location.href='qna_ModiView?qna_num=${qna.qna_num }'">수정</button>
			<button type="button" onclick="location.href='qna_delete?qna_num=${qna.qna_num }'">삭제</button>
		</c:if>
			<button type="button" onclick="location.href='QnA'">목록</button>
		</table>
	</div>
	

	<br>
	<br>
	<hr>
	
	<div class="reply_container">
		<div class="reply_reg">
			<input type="text" name="qna_num" value="${qna.qna_num }">
			<input type="hidden" name="reply_type" value="R"><br>			
			<input type="text" name="member_id" value="${qna.member_id }" readonly="readonly"><br>
			<textarea name="reply_content" id="rReply"></textarea><br>
			<input type="button"  value="등록" onclick="regReply()">
		</div>

<hr>
<br>

<br>		
		<div class="reply_List" >
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

<script>
	function regReply(){				//댓글 등록
		const qna_num = document.querySelector("input[name='qna_num']").value;
		const reply_type = document.querySelector("input[name='reply_type']").value;
		const member_id = document.querySelector("input[name='member_id']").value;
		const reply_content = document.querySelector("textarea[name='reply_content']").value;
		
		
		const obj =  {
				qna_num: qna_num,
				reply_type :reply_type,
				member_id :member_id,
				reply_content : reply_content
		}	
		const json_obj = JSON.stringify(obj);
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		     this.responseText;
		  }
		  xhttp.open("POST", "/api/qna/reply", true);
		  xhttp.setRequestHeader("Content-type", "application/json");
		  xhttp.send(json_obj);			
	}	
	
	//댓글 리스트
	
	getReplyList();
	
	function getReplyList() {
		const qna_num = document.querySelector("input[name='qna_num']").value;
		const tbody = document.querySelector("#tbody");
		tbody.replaceChildren();
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		    let data = this.responseText;
		    alert(data);
		    let obj = JSON.parse(data);
		    
		    for (let i = 0; i < obj.length; i++) {
	               tbody.innerHTML += "<tr><td>" + obj[i].reply_content + "</td><td>"
	                     + obj[i].member_id + "</td><td>"
	                     + "<button type='button' id='delBtn'>삭제</button></td></tr>";
		    }
		  }
		  xhttp.open("GET", "/api/qna/replyList/qna_num/" + qna_num, true);
		  xhttp.send();
	}
	
	
	function delReply(evt){
		if(evt.target.tagName != 'INPUT'){
			return;
		}
		
		const delBtn = document.querySelector("button[type=button]");
		const xhttp = new XMLHttpRequest();
		
		xhttp.onload = function() {
			getReplyList();
		}
		
		 xhttp.open("GET", "/api/qna/delReply/qna_num/" + qna_num, true);
	     xhttp.send();

	     }

	
	
	
	
</script>	
</body>
</html>