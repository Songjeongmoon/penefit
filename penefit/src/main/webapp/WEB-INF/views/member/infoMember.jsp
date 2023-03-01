
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<style>
.mypageTitle {
	text-align: center;
	margin-bottom: 10PX;
}

.meminfo {
	width: 500px;
	height: 700px;
	margin: 0 auto;
	margin-top: 30px;
	border-radius: 7px;
	padding: 10px;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
}

.mem_info {
	margin-top: 60px;
	margin-left: 110px;
}

input[type=text] {
	width: 300px;
	height: 40px;
	font-size: 14px;
	margin-top: 5px;
	margin-bottom: 10px;
}

#modal_history {
	position: absolute;
	width: 450px;
	height: 600px;
	border: 2px solid black;
	background-color: white;
	z-index: 300;
	border-radius: 10px;
	display: inline-block;
	padding: 20px;
	top: 20px;
	left: 490px;
}

.selectBox {
	display: none;
	text-align: center;
	margin-top: 10px;
	position: absolute;
	left: 100px;
}

#selectClass {
	height: 40px;
	display: none;
	position: absolute;
}

#gotoReviewForm {
	height: 40px;
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 90px;
	position: absolute;
	left: 200px;
}

#modal_history_case {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.8);
	z-index: 300;
	display: none;
}

#modal_qna_case {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	display: none;
	background: rgba(0, 0, 0, 0.8);
	z-index: 600;
}

#history_content th {
	background-color: #DBD5CB;
	height: 35px;
}

#history_content {
	margin: 0 auto;
	text-align: center;
	width: 1000px;
}

#history_content tr {
	height: 40px;
}

#modal_qna {
	position: absolute;
	width: 450px;
	height: 500px;
	border: 2px solid black;
	background-color: white;
	z-index: 300;
	border-radius: 10px;
	display: inline-block;
	padding: 20px;
	top: 20px;
	left: 490px;
}

input[type='button'] {
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 148px;
	height: 40px;
	line-height: 40px;
	font-weight: bold;
	margin-top: 10px;
}

#delMemBtn {
	background-color: gray;
}

h2 {
	text-align: center;
	font-size: 35px;
	margin-bottom: 30px;
}

table {
	margin: 0 auto;
	border: none;
}

h4 {
	text-align: center;
	font-weight: bold;
	font-size: 35px;
	margin-bottom: 30px;
}

#modalClose {
	position: absolute;
	background-color: rgba(0, 0, 0, 0);
	border: none;
	left: 450px;
	bottom: 590px;
	font-size: 40px;
}

#cancelbtn, #writebtn, #closebtn {
	width: 150px;
	height: 40px;
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
}

#closebtn {
	position: absolute;
	left: 160px;
	bottom: 30px;
}

#history_detail tr {
	height: 35px;
}

#history_detail  th {
	width: 100px;
}

.aside_menu:hover {
	cursor: pointer;
}

#sugTbl {
	width: 900px;
	text-align: center;
}

#sugTbl  th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

.mypageTitle {
	text-align: center;
	font-size: 35px;
	margin-bottom: 30px;
}

#myclasstbl {
	text-align: center;
}

#reviewTbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

#reviewTbl {
	text-align: center;
}


#qnatbl {
	width: 900px;
	text-align: center;
}

#qnatbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

#qna_reply, #qna_detail {
	width: 400px;
}

#qna_reply th {
	text-align: center;
}

#qna_detail th {
	text-align: center;
}

#qna_reply {
	text-align: left;
}

#qna_reply tr:nth-of-type(2) {
	text-align: left;
	height: 150px;
	overflow: scroll;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">마이페이지</li>
					<li class="aside_menu" id="myinfoLabel">내 정보</li>
					<li class="aside_menu" id="myHistoryLabel"><a href="#">구매내역</a></li>
					<li class="aside_menu" id="myReviewLabel"><a href="#">나의후기</a></li>
					<li class="aside_menu" id="aside_menu_btn">나의 클래스
						<div id="aside_submenu">
							<p id="mySuggestLabel">&nbsp;&nbsp;제안내역</p>
							<p>
							<p id="myClassLabel">&nbsp;&nbsp;클래스내역</p>
							<p>
							<p>&nbsp;&nbsp;추가?</p>
						</div>
					</li>
					<li class="aside_menu" id="myInquiryLabel">나의 문의내역</li>
				</ul>

			</aside>
			<div class="content" id="myinfo">
				<h2>내 정보 관리</h2>
				<div class="meminfo">
					<div class="mem_info">
						<div id="mem_maintitle"></div>


						<div id="mem_id">
							아이디<br>
							<input type="text" name="member_id" value="${member_id }">
						</div>
						<div id="mem_pw">
							비밀번호<br>
							<input type="text" name="member_pw" value="${memberinfo.member_pw }">
						</div>
						<div id="mem_name">
							이름<br>
							<input type="text" name="member_name" value="${memberinfo.member_name }">
						</div>
						<div id="mem_tel">
							전화번호<br>
							<input type="text" name="member_tel" value="${memberinfo.member_tel }">
						</div>
						<div id="postnum">
							우편번호<br> <input type="text"  name="postnum" value="${memberinfo.postnum }"/>
						</div>
						<div id="address_button" >
							<input type="button" onclick="execution_daum_address()" value="주소찾기"/>
						</div>
						<div id="mem_address">
							주소<br>
							<input type="text" name="member_address" value="${memberinfo.member_address }">
						</div>
						<div id="mem_addressdetail">
							상세주소<br> <input type="text" name="member_addressdetail" value="${memberinfo.member_addressdetail }" />
						</div>
						<div id="mem_grade">
							<br>
							<input type="hidden" name="member_grade" value="${memberinfo.member_grade }">
						</div>

						<div id="mem_buttons">
							<input type="button" name="mem_update" value="정보수정" onclick="UpdateMem()">
							<input type="button" name="mem_delete" value="회원탈퇴" id="delMemBtn" onclick="delMem()">
						</div>
					</div>
				</div>

			</div>
			<div class="content" id="purchaseHistory">
				<h2 class="mypageTitle">구매내역</h2>
				<!-- 구매상세내역 모달 -->
				<div id="modal_history_case">
					<div id="modal_history">
						<h4>구매상세내역</h4>
						<button type="button" id="modalClose">Ｘ</button>

						<table id="history_detail">
							<!-- 구매내역 상세보기 -->
						</table>
						<div style="text-align: center; margin-top: 20px;">
							<button type="button" id="cancelbtn">구매취소하기</button>
							<button type="button" id="writebtn">리뷰</button>
						</div>
						<div class="selectBox">
							<select id="selectClass">

							</select>
							<button type="button" id="gotoReviewForm">작성</button>
						</div>
					</div>
				</div>

				<!-- 구매리스트 -->
				<table id="history_content">
					<thead>
						<tr>
							<th>구매번호</th>
							<th>주문번호</th>
							<th>구매일자</th>
							<th>구매내용</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody id="historyTbody">
						<!-- 구매리스트 -->
					</tbody>
				</table>
			</div>

			<div class="content" id="myReview">
				<h2>나의 후기</h2>
				<table id="reviewTbl">
					<thead>
						<tr>
							<th>작성일</th>
							<th colspan="2">클래스정보</th>
							<th>내용</th>
						</tr>
					</thead>

					<tbody id="reviewBody"></tbody>

				</table>


			</div>

			<div class="content" id="myClassSuggest">
				<h2 class="mypageTitle">클래스제안내역</h2>
				<table id="sugTbl">
					<thead>
						<tr>
							<th>분류</th>
							<th style="width: 300px;">제목</th>
							<th>지역</th>
							<th>시간대</th>
							<th>참가비</th>
							<th>정원</th>
							<th>등록일</th>
						</tr>
					</thead>

					<tbody id="suggestionBody"></tbody>

				</table>
			</div>
			<div class="content" id="myClassList">
				<h2 class="mypageTitle">나의클래스</h2>
				<table id="myclasstbl">
					<thead>
						<tr>
							<th style="width: 300px;">제목</th>
							<th>강사</th>
							<th>강의일자</th>
							<th>지역</th>
						</tr>
					</thead>

					<tbody id="myClassListBody"></tbody>

				</table>

			</div>
			<div class="content" id="myInquiry">
				<h2 class="mypageTitle">문의내역</h2>
				<table id="qnatbl">
					<thead>
						<tr>
							<th>문의번호</th>
							<th>문의글</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody id="qnaTbody">
						<!--  -->
					</tbody>
				</table>

				<div id="modal_qna_case">
					<div id="modal_qna">
						<h4>문의상세내역</h4>
						<table id="qna_detail">
							<!-- 문의 상세보기 -->
						</table>
						<table id="qna_reply">
							<!-- 문의 답변 -->
							<tr>
								<th>답변 내용</th>
							</tr>
							<tr>
								<td id="qna_reply_content" style="height: 200px;"></td>
							</tr>
						</table>
						<button type="button" id="closebtn">뒤로 돌아가기</button>

					</div>
				</div>

			</div>
		</section>
	</div>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	/* 다음 주소 연동 */
	function execution_daum_address(){
	 
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name='postnum']").value = data.zonecode;
                document.querySelector("input[name='member_address']").value = addr;
                
                $("input[name='member_addressdetail']").attr("readonly",false);
                $("input[name='member_addressdetail']").focus();
              
             }
          }).open();
 }
	
	
      $("#aside_menu_btn").mouseover(function() {
         $("#aside_submenu").css("display", "block");
      });
      $("#aside_menu_btn").mouseout(function() {
         $("#aside_submenu").css("display", "none");
      });
      //메뉴선택시 내용 div display 설정
      $(document).ready(function() {
         $(".content:not(#myinfo)").css("display", "none");
         $("#myinfo").css("display", "block");
      });
      $("#myinfoLabel").click(function() {
         $(".content:not(#myinfo)").css("display", "none");
         $("#myinfo").css("display", "block");
      });
      $("#myHistoryLabel").click(function() {
         $(".content:not(#purchaseHistory)").css("display", "none");
         $("#purchaseHistory").css("display", "block");
         $("#modal_history_case").css("display","none");
         //결제내역 받아오기
         getHistory();
      });
      $("#myInquiryLabel").click(function() {
         $(".content:not(#myInquiry)").css("display", "none");
         $("#myInquiry").css("display", "block");
         qnaList();
      });
      $("#myReviewLabel").click(function() {
         $(".content:not(#myReview)").css("display", "none");
         $("#myReview").css("display", "block");
         reviewList();
      });
      $("#mySuggestLabel").click(function() {
          $(".content:not(#myClassSuggest)").css("display", "none");
          $("#myClassSuggest").css("display", "block");
       
       });
      $("#myClassLabel").click(function() {
         $(".content:not(#myClassList)").css("display", "none");
         $("#myClassList").css("display", "block");
      });
      
      
      
      function UpdateMem(){
           const updateid= $("input[name='member_id']").val();
           const updatepw= $("input[name='member_pw']").val();
           const updatename= $("input[name='member_name']").val();
           const updatetel= $("input[name='member_tel']").val();
           const updatepostnum= $("input[name='postnum']").val();
           const updateaddress= $("input[name='member_address']").val();
           const updateaddressdetail= $("input[name='member_addressdetail']").val();
           const updategrade= $("input[name='member_grade']").val();
           
           if(updateid == "" || updatepw == "" || updatename == "" || 
        		   updatetel == "" || updatepostnum == "" || updateaddress == "" || 
        		   updateaddressdetail == "" || updategrade == ""){
        	   alert("공백이 존재합니다.");
        	   return false;
           }
           let member={
             "member_id" : updateid,
             "member_pw" : updatepw,
             "member_name" : updatename,
             "member_tel" : updatetel,
             "postnum" : updatepostnum,
             "member_address" : updateaddress,
             "member_addressdetail" : updateaddressdetail,
             "member_grade" : updategrade
           }
           $.ajax({
              url: "/member/updateMember",
              method: "PUT",
              contentType: "application/json",
              data : JSON.stringify(member),
              success: (data) => {
            	  alert(data);
              },
              error: () => {
                 alert("error");
              }
           });
           
            
        }

      function delMem(){
           const memberid= $("input[name='member_id']").val();
           
           $.ajax({
              url: "deleteMember",
              method: "DELETE",
              data : {     
                    "member_id" : memberid  
                 },
             success: (data) => {
               	  alert(data);
               	  location.href="/";
                 },

           });
           
        }  
      
      //결제내역 받아오기
      function getHistory(){
         $("#historyTbody").empty();
         
         const xhttp = new XMLHttpRequest();
           xhttp.onload = function() {
             let data = this.responseText;
             let list =JSON.parse(data);
             for(let i=0;i<list.length;i++){
               $("#historyTbody").append(
                     "<tr class='tr'><td><a href='#' class='modal_history'>" + list[i].buy_history_num + "</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].merchant_uid +"</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].buy_history_date +"</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].name+ "</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].buy_history_current +  "</a></td></tr>");
            
             }
               $("#historyTbody td").css("border-bottom","thin solid #BBB09F");
	            $("#historyTbody a").css("color","black");
	            $("#historyTbody a").css("text-decoration","none");
           }
           xhttp.open("GET", "/historyList", true);
           xhttp.send();
           
      }
      
      //구매번호를 누르면 모달창
      $(document).on("click",".modal_history",function(evt){
         $("#modal_history_case").css("display","block");
         $(".content").css("z-index", "500");
         let buy_history_num = evt.target.parentElement.parentElement.children[0].innerText;
         getOneHistory(buy_history_num);
      });
      //결제 상세내역 닫기
      $("#modalClose").click(function(){
         $("#modal_history_case").css("display","none");
         $(".content").css("z-index", "50");
         $(".selectBox").css("display", "none");
         $("#selectClass").css("display", "none");
      });
      //구매취소-1
         $("#cancelbtn").click(function(){
            let result = confirm("정말 취소하시겠습니까?");
            if(result){
               if($(".current").text()=="결제완료"){
                  alert("취소 처리 되었습니다.");
                  //취소function
                  let buy_history_num = $(".buy_history_num").val();
                  cancelClass(buy_history_num);
               }else if($(".current").text()=="취소완료"){
                  alert("이미 취소된 주문입니다.");
               }else if($(".current").text()=="취소승인대기"){
                  alert("관리자가 취소 확인중인 주문입니다.");
               }else{
                  let msg;
                  if($(".current").text()=="기간만료"){
                     msg = "사유 : 기간만료\n";
                  }else{
                     msg = "사유 : 수강완료\n";
                  }
                  alert(msg + "취소가 불가능 한 주문입니다. ");
               }
                  
            }
      });
      
      //결제상세내역 받아오기
      function getOneHistory(buy_history_num){
         $("#history_detail").empty();
         
         const xhttp = new XMLHttpRequest();
           xhttp.onload = function() {
             let data = this.responseText;
             let json = JSON.parse(data);
             
             
             
             $("#history_detail").html("<tr><th>구매번호</th><td class='merchant_uid'>" + json.merchant_uid +"</td></tr>"
                   + "<input type ='hidden' class = 'buy_history_num' value=" + json.buy_history_num +">"
                   + "<input type ='hidden' class = 'class_arr' value=" + json.class_arr +">"
                   + "<tr><th>결제방법</th><td>" + json.pay_method +"</td></tr>"
                   + "<tr><th>결제금액</th><td>" + json.amount +" 원</td></tr>"
                   + "<tr><th>구매일자</th><td>" + json.buy_history_date +"</td></tr>"
                   + "<tr><th>구매자명</th><td>" + json.buyer_name +"</td></tr>"
                   + "<tr><th>이메일</th><td>" + json.buyer_email +"</td></tr>"
                   + "<tr><th>연락처</th><td>" + json.buyer_tel +"</td></tr>"
                   + "<tr><th>주소</th><td>" + json.buyer_addr +"</td></tr>"
                   + "<tr><th>상태</th><td class='current'>" + json.buy_history_current +"</td></tr>"
                   + "<tr><th>내용</th><td>" + json.name +"</td></tr>"
                   );
             
             }
	            
           xhttp.open("GET", "/OneHistory/buy_history_num/" + buy_history_num, true);
           xhttp.send();
           
      }
      
      //리뷰목록
      
      function reviewList() {
          $("#reviewBody").empty();
          const xhttp = new XMLHttpRequest();
          xhttp.onload = function() {
             let data = this.responseText;
             let json = JSON.parse(data);
             for(let i = 0;i<json.length;i++){
                $("#reviewBody").append("<tr>"
                					+"<td style='width : 100px;'>" + json[i].review_regdate+ "</td>"
                					+"<td><a href='/class/class-detail?class_code=" +json[i].class_code+ "'><img src='../images/" + json[i].review_photo + "' style='width:100px; height:100px;'></a></td>"
                					+"<td><a href='/class/class-detail?class_code="+json[i].class_code+"'>" + json[i].class_subject + "</a></td>"
                					+"<td>" +   json[i].review_content+ "</td><tr>");
             }
                $("td").css({
                	"border-bottom":"thin solid #BBB09F",
                	"height":"40px"
                });
                $("td:nth-of-type(4)").css({
                	"width":"300px",
                	"height":"100px",
                });
 	            $("a").css("color","black");
 	            $("a").css("text-decoration","none");
          }
          xhttp.open("GET", "/myReviewList", true);
          xhttp.send();
       }
       
      //취소하기
      function cancelClass(buy_history_num) {
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
            this.responseText;
         }
         xhttp.open("DELETE", "/noClass/buy_history_num/" + buy_history_num, true);
         xhttp.send();
      }
      let result;
      //리뷰쓸 코드 선택
      $("#writebtn").click(function(){
    	 $("#selectClass").empty();
         $(".selectBox").css("display", "block");
         $("#selectClass").css("display", "block");
         let buy_history_num = $(".buy_history_num").val();
         let class_arr = $(".class_arr").val();
         let class_buy = class_arr.split("-");
        
         for(let i = 0;i<class_buy.length-1;i++){
        	 if(reviewCheck(buy_history_num, class_buy[i])==0){
	             $("#selectClass").append("<option value='" + class_buy[i]+"'> "+class_buy[i]+"</option>");
        	 }
         }
      });
      
      
      //리뷰중복방지
      
      
      function reviewCheck(buy_history_num, class_code){
    	  
			$.ajax({
				
				method : "Get",
				url : "/classAndReviewList",
				async: false,
				data : {
					"buy_history_num" : buy_history_num,
					"class_code" : class_code
				},
				success: function(data){
					result = data;
				},
				error : function(){
					alert("실패");
				}
				
			});
    	  
			return result ;
      }
      
      //리뷰쓰러가기
      
      $("#gotoReviewForm").click(function(){
         let class_code = $(".selectBox option:selected").val();
         let buy_history_num = $(".buy_history_num").val();
         location.href="/class/reviewForm?class_code=" + class_code + "&buy_history_num=" + buy_history_num;         
         
      });
      
      
      //qna리스트 가져오기
      function qnaList() {
         $("#qnaTbody").empty();
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
            let data = this.responseText;
            let json = JSON.parse(data);
            for(let i = 0;i<json.length;i++){
               $("#qnaTbody").append("<tr><td class='viewReply'>" + json[i].qna_num + "</td>"
                     +"<td class='viewReply'>" + json[i].qna_title + "</td>"
                     +"<td class='viewReply'>" + json[i].qna_status + "</td>"
                     +"<td class='viewReply'>" + json[i].qna_regdate + "</td></tr>"   
               )
            }
               $("td").css("border-bottom","thin solid #BBB09F");
               $("td").css("height","40px");
	            $("a").css("color","black");
	            $("a").css("text-decoration","none");
         }
         xhttp.open("GET", "/qnaList", true);
         xhttp.send();
      }
      
      //상세내역
      $(document).on("click",".viewReply",function(evt){
         $("#modal_qna_case").css("display","block");
         $(".content").css("z-index", "500");
         let qna_num = evt.target.parentElement.children[0].innerText;
         $("#qna_detail").empty();;
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
            let data = this.responseText;
            let obj = JSON.parse(data);
               $("#qna_detail").append("<tr><th>제목</th><td class='viewReply'>" + obj.qna_title + "</td></tr>"
                     +"<tr><th>내용</th><td class='viewReply'>" + obj.qna_content + "</td></tr>"
                     +"<tr><th>상태</th><td class='viewReply'>" + obj.qna_status + "</td></tr>"
                     +"<tr><th>등록일</th><td class='viewReply'>" + obj.qna_regdate + "</td></tr>");
               qnaReply(qna_num);
               $("td").css("border-bottom","thin solid #BBB09F");
	            $("a").css("color","black");
	            $("a").css("text-decoration","none");
         }
         xhttp.open("GET", "/qnaOneList/qna_num/" + qna_num, true);
         xhttp.send();
      })
      
      $("#closebtn").click(function(){
         $("#modal_qna_case").css("display","none");
      });
      
      //답변내용 불러오기
      
      
      function qnaReply(qna_num){
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
            let data = this.responseText;
               $("#qna_reply_content").text(data);   
         }
         xhttp.open("GET", "/qnaReply/qna_num/" + qna_num, true);
         xhttp.send();
      }
      
      $("#closebtn").click(function(){
         $("#modal_qna_case").css("display","none");
         $(".content").css("z-index", "50");
      });
      
      $.ajax({
    	 
         url: "/class/list/my",
         method: "POST",
         dataType: "json",
         data: {
            member_id: "${member_id}"
         },
         success: (data) => {
        	 $("#myClassListBody").empty();
            for(let i = 0; i < data.length; i++){
               $("#myClassListBody").append("<tr>"
                     + "<td>" + data[i].class_subject + "</td><td>" + data[i].class_teacher + "</td>"
                     + "<td>" + data[i].city_date + "</td><td>" + data[i].class_name + "</td>"
                     + "</tr>");
            }
               $("td").css("border-bottom","thin solid #BBB09F");
	            $("a").css("color","black");
	            $("a").css("text-decoration","none");
         },
         error: () => {
            alert("error");
         }
         
      })
      
      
      $.ajax({
         url: "/class/suggestion-list",
         method: "POST",
         dataType: "json",
         data: {
            member_id: "${member_id}"
         },
         success: (data) => {
            for(let i = 0; i < data.length; i++){
               $("#suggestionBody").append("<tr>"
                     + "<td>" + data[i].type + "</td><td>" + data[i].suggest_title + "</td>"
                     + "<td>" + data[i].city_code + "</td><td>" + data[i].class_time + "</td>"
                     + "<td>" + data[i].price + "</td><td>" + data[i].maxCnt + "</td>"
                     + "<td>" + data[i].suggest_regdate + "</td>"
                     + "</tr>");
            }
               $("td").css("border-bottom","thin solid #BBB09F");
	            $("a").css("color","black");
	            $("a").css("text-decoration","none");
         },
         error: () => {
            alert("error");
         }
         
      })
      
      </script>
</body>

</html>