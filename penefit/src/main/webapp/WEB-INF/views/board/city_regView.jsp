<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#form {
<<<<<<< HEAD
   margin: 0 auto;
=======
	margin: 0 auto;
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git
}

input, textarea {
<<<<<<< HEAD
   width: 350px;
   margin-bottom: 20px;
}

select {
   width: 350px;
   margin-bottom: 20px;
}

textarea {
   height: 200px;
}
button{
   background-color: #75BD43;
   border: none;
   color: white;
   box-shadow: 2px 2px 2px 2px #DBD5CB;
   width: 70px;
   height: 33px;
   line-height: 35px;
   border-radius: 7px;
   margin: 5px;
}
strong{
   margin-right: 20px;
=======
	width: 350px;
	margin-bottom: 20px;
}

select {
	width: 350px;
	margin-bottom: 20px;
}

textarea {
	height: 200px;
}
button{
	background-color: #75BD43;
	border: none;
	color: white;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 70px;
	height: 33px;
	line-height: 35px;
	border-radius: 7px;
	margin: 5px;
}
strong{
	margin-right: 20px;
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git
}
</style>
<link rel="stylesheet" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<<<<<<< HEAD
   <%@ include file="../header.jsp"%>
   <div class="box">
      <section>
         <aside>
            <ul>
               <li class="aside_title">커뮤니티</li>
               <li class="aside_menu"><a href="notice">공지사항</a></li>
               <li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
            </ul>
=======
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
<<<<<<< HEAD
					<li class="aside_menu"><a href="/board/notice?pageNum=1&start=1">공지사항</a></li>
					<li class="aside_menu"><a href="#">수강후기</a></li>
					<li class="aside_menu"><a href="/board/cityBoardview">지역별게시판</a></li>
					<li class="aside_menu"><a href="#">클래스별게시판</a></li>
=======
					<li class="aside_menu"><a href="notice">공지사항</a></li>
					<li class="aside_menu"><a href="cityBoard">지역별게시판</a></li>
>>>>>>> branch 'master' of https://github.com/Songjeongmoon/penefit.git
				</ul>
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git

<<<<<<< HEAD
         </aside>
         <div class="content">
            <h2>지역게시판</h2>
            <div style="text-align: center;">
               <form action="/cityReg.do" method="post" id="form">
                  <div class="container">
                     <div>
                        <strong>지역</strong> <select name="sel">
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
=======
			</aside>
			<div class="content">
				<h2>지역게시판</h2>
				<div style="text-align: center;">
					<form action="/cityReg.do" method="post" id="form">
						<div class="container">
							<div>
								<strong>지역</strong> <select name="sel">
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
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git

<<<<<<< HEAD
                     </div>
=======
							</div>

							<div style="display: flex; justify-content: center; align-items: center;">
								<strong style="margin-bottom: 50px;">내용</strong>
								<textarea name="board_content"></textarea>
							</div>

							<button type="button" id="cityreg" onclick="cityReg()">등록</button>
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git

<<<<<<< HEAD
                     <div style="display: flex; justify-content: center; align-items: center;">
                        <strong style="margin-bottom: 50px;">내용</strong>
                        <textarea name="board_content"></textarea>
                     </div>

                     <button type="button" id="cityreg" onclick="cityReg()">등록</button>

                  </div>
               </form>
            </div>
         </div>
      </section>
   </div>
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
=======
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
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
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git
           const citysel= $("select[name='sel']").val();
           
           if(citysel == "All"){
        	   alert("지역을 지정해주세요");
        	   return false;
		   }else if(board_title == ""){
        	   alert("제목을 입력해주세요");
        	   return false;
           } else if(board_content == ""){
        	   alert("본문을 입력해주세요.");
           	   return false;
           }
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