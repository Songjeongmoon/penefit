<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="notice">공지사항</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
				</ul>

			</aside>
			<div class="content">
				<h3>지역게시판 글등록 뷰뷰뷰뷰</h3>

				<form action="/cityReg.do" method="post">
					<div class="container">
						<div>
							<select name="sel">
								<option value="All">전체</option>
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
								<option value="O">전북</option>
								<option value="P">제주</option>
								<option value="Z">온라인</option>
							</select>
						</div>
						<div>
							<input type="hidden" name="member_id" value="${member_id }"> <input type="hidden" name="board_type" value=CC>
						</div>
						<div>
							<strong>제목</strong> <input type="text" name="board_title">

						</div>

						<div>
							<strong>내용</strong>
							<textarea name="board_content"></textarea>
						</div>

						<button type="submit" id="cityreg" onclick="cityReg()">등록</button>

					</div>
				</form>
			</div>
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
	
	
	
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		})
		
		
		$("#cityreg").click(function(evt){
				evt.preventDefault();
			
		   const member_id="${member_id}";
		   const board_title= $("input[name='board_title']").val();
		   const board_content= $("textarea[name='board_content']").val();
		   const board_type = $("input[name='board_type']").val();
           const citysel= $("select[name='sel']").val();
          // alert(citysel);
           let bvo={
                   "board_title" : board_title,
                   "board_type" : board_type,
                   "board_content" : board_content,
                   "member_id" : member_id,
                   "city_code" : citysel
                 }
           	
                 $.ajax({
                    url: "/cityReg.do",
                    method: "POST",
                    contentType:'application/json',
                    data : JSON.stringify(bvo),
                    success:function(data){
                    	alert(data);
                    	
                    	location.href="/board/cityBoardview";
                    },
                    error : () => {
                        alert("error");
                     }
                 })
			})
	</script>



	<script type="text/javascript" src="/js/javascript.js"></script>
</body>
</html>