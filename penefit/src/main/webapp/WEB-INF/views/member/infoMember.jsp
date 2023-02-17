<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<link rel="stylesheet" href="../style.css">
<style>
.mypageTitle {
   text-align: center;
   margin-bottom: 10PX;
}

.meminfo {
   width: 600px;
   height: 800px;
   border: solid 1px black;
   margin-left: 200px;
   margin-top: 100px;
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
<<<<<<< HEAD
	position: absolute;
	width: 450px;
	height: 500px;
	border: 2px solid black;
	background-color: white;
	z-index: 300;
	border-radius: 10px;
}

.selectBox {
	display: none;
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

#modal_qna {
	position: absolute;
	width: 450px;
	height: 500px;
	border: 2px solid black;
	background-color: white;
	z-index: 600;
	border-radius: 10px;
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
            <div class="meminfo">
               <div class="mem_info">
                  <div id="mem_maintitle">
                     <h2>내 정보 관리</h2>
                     <hr>
                  </div>


                  <div id="mem_id">
                     아이디<br> <input type="text" name="member_id"
                        value="${member_id }">
                  </div>
                  <div id="mem_pw">
                     비밀번호<br> <input type="text" name="member_pw"
                        value="${memberinfo.member_pw }">
                  </div>
                  <div id="mem_name">
                     이름<br> <input type="text" name="member_name"
                        value="${memberinfo.member_name }">
                  </div>
                  <div id="mem_tel">
                     전화번호<br> <input type="text" name="member_tel"
                        value="${memberinfo.member_tel }">
                  </div>
                  <div id="mem_address">
                     전화번호<br> <input type="text" name="member_address"
                        value="${memberinfo.member_address }">
                  </div>
                  <div id="mem_grade">
                     회원등급<br> <input type="hidden" name="member_grade"
                        value="${memberinfo.member_grade }">
                  </div>

                  <div id="mem_buttons">
                     <input type="button" name="mem_update" value="정보수정"
                        onclick="UpdateMem()"> <input type="button"
                        name="mem_delete" value="회원탈퇴" onclick="delMem()">
                  </div>
               </div>
            </div>

         </div>
         <div class="content" id="purchaseHistory">
            <h3 class="mypageTitle">[구매내역]</h3>
            <!-- 구매상세내역 모달 -->
            <div id="modal_history_case">
               <div id="modal_history">
                  <h4>구매상세내역</h4>
                  <button type="button" id="modalClose">Ｘ</button>

                  <table id="history_detail">
                     <!-- 구매내역 상세보기 -->
                  </table>
                  <button type="button" id="cancelbtn">구매취소하기</button>
                  <button type="button" id="writebtn">리뷰</button>

                  <div class="selectBox">
                     <select id="selectClass">

<<<<<<< HEAD
				<!-- 구매리스트 -->
				<table border="1">
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
			<div class="content" id="myClassSuggest">
				<h3 class="mypageTitle">[클래스제안내역]</h3>
			</div>
			<div class="content" id="myClassList">
				<h3 class="mypageTitle">[나의클래스]</h3>
			</div>
			<div class="content" id="myInquiry">
				<h3 class="mypageTitle">[문의내역]</h3>
			</div>
		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		});
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
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
			
			//결제내역 받아오기
			getHistory();
		});
		$("#myInquiryLabel").click(function() {
			$(".content:not(#myInquiry)").css("display", "none");
			$("#myInquiry").css("display", "block");
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
		     const updateaddress= $("input[name='member_address']").val();
		     const updategrade= $("input[name='member_grade']").val();
		     
		     let member={
		    	"member_id" : updateid,
		    	"member_pw" : updatepw,
		    	"member_name" : updatename,
		    	"member_tel" : updatetel,
		    	"member_address" : updateaddress,
		    	"member_grade" : updategrade
		     }
		     $.ajax({
		        url: "/member/updateMember",
		        method: "POST",
		        contentType: "application/json",
		        data : JSON.stringify(member),
		        success: (data) => {
		        	alert(data);
		        },
		        error : () => {
		        	alert("error");
		        }
		     });
		     
		      
		  }
=======
                     </select>
                     <button type="button" id="gotoReviewForm">리뷰작성하러가기</button>
                  </div>
               </div>
            </div>
>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git

<<<<<<< HEAD
		function delMem(){
		     const memberid= $("input[name='member_id']").val();
		     
		     $.ajax({
		        url: "deleteMember",
		        method: "DELETE",
		        data : {     
		        		"member_id" : memberid  
		        	},
		     			success:(data) => {
				        	alert(data);
				        	location.href="/member/home";
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
							"<tr><td><a href='#' class='modal_history'>" + list[i].buy_history_num + "</a></td>"
							+"<td><a href='#' class='modal_history'>" + list[i].merchant_uid +"</a></td>"
							+"<td><a href='#' class='modal_history'>" + list[i].buy_history_date +"</a></td>"
							+"<td><a href='#' class='modal_history'>" + list[i].name+ "</a></td>"
							+"<td><a href='#' class='modal_history'>" + list[i].buy_history_current +  "</a></td></tr>");
				}
			    }
			  xhttp.open("GET", "/historyList", true);
			  xhttp.send();
			  
		}
		
		//구매번호를 누르면 모달창
		$(document).on("click",".modal_history",function(evt){
			$("#modal_history").css("display","block");
			let buy_history_num = evt.target.parentElement.parentElement.children[0].innerText;
			getOneHistory(buy_history_num);
		});
		//결제 상세내역 닫기
		$("#modalClose").click(function(){
			$("#cancel_Modol").css("display","none");
			$("#modal_history").css("display","none");
		});
		//구매취소-1
			$("#cancelbtn").click(function(){
			$("#cancel_Modol").css("display","block");
		});
		//구매취소 -2
		$("#cancelbtn1").click(function(){
			if($(".current").text()=="결제완료"){
				alert("취소 처리 되었습니다.");
				//취소function
				let buy_history_num = $(".buy_history_num").val();
				alert(buy_history_num);
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
				
		});
		cancelbtn
		//결제상세내역 받아오기
		function getOneHistory(buy_history_num){
			$("#history_detail").empty();
			
			const xhttp = new XMLHttpRequest();
			  xhttp.onload = function() {
			    let data = this.responseText;
			    let json = JSON.parse(data);
			    let class_buyy = json.class_arr.slice(0, -1 );
			    
			    
			    $("#history_detail").html("<tr><th>구매번호</th><td class='merchant_uid'>" + json.merchant_uid +"</td></tr>"
			    		+ "<input type ='hidden' class = 'buy_history_num' value=" + json.buy_history_num +">"
			    		+ "<tr><th>결제방법</th><td>" + json.pay_method +"</td></tr>"
			    		+ "<tr><th>구매일자</th><td>" + json.buy_history_date +"</td></tr>"
			    		+ "<tr><th>구매자명</th><td>" + json.buyer_name +"</td></tr>"
			    		+ "<tr><th>이메일</th><td>" + json.buyer_email +"</td></tr>"
			    		+ "<tr><th>연락처</th><td>" + json.buyer_tel +"</td></tr>"
			    		+ "<tr><th>주소</th><td>" + json.buyer_addr +"</td></tr>"
			    		+ "<tr><th>상태</th><td class='current'>" + json.buy_history_current +"</td></tr>"
			    		+ "<tr><th>내용</th><td>" + json.name +"</td></tr>"
			    		)
			    }
			  xhttp.open("GET", "/OneHistory/buy_history_num/" + buy_history_num, true);
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
		
		
		
		</script>
=======
            <!-- 구매리스트 -->
            <table border="1">
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
         <div class="content" id="myClassSuggest">
            <h3 class="mypageTitle">[클래스제안내역]</h3>
            <table border="1">
               <thead>
                  <tr>
                     <th>분류</th>
                     <th>제목</th>
                     <th>지역</th>
                     <th>시간대</th>
                     <th>참가비</th>
                     <th>최대정원</th>
                     <th>등록일</th>
                  </tr>
               </thead>

               <tbody id="suggestionBody"></tbody>

            </table>
         </div>
         <div class="content" id="myClassList">
            <h3 class="mypageTitle">[나의클래스]</h3>
            <table border="1">
               <thead>
                  <tr>
                     <th>제목</th>
                     <th>강사</th>
                     <th>강의일자</th>
                     <th>지역</th>
                  </tr>
               </thead>

               <tbody id="myClassListBody"></tbody>

            </table>
         
         </div>
         <div class="content" id="myInquiry">
            <h3 class="mypageTitle">[문의내역]</h3>
            <table>
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
                        <td id="qna_reply_content"></td>
                     </tr>
                  </table>
                  <button type="button" id="closebtn">뒤로 돌아가기</button>

               </div>
            </div>

         </div>
      </section>
   </div>
   <%@ include file="../footer.jsp"%>
   <script>
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
           const updateaddress= $("input[name='member_address']").val();
           const updategrade= $("input[name='member_grade']").val();
           
           let member={
             "member_id" : updateid,
             "member_pw" : updatepw,
             "member_name" : updatename,
             "member_tel" : updatetel,
             "member_address" : updateaddress,
             "member_grade" : updategrade
           }
           $.ajax({
              url: "/member/updateMember",
              method: "POST",
              contentType: "application/json",
              data : JSON.stringify(member),
              success: (data) => {
                 alert(data);
              },
              error : () => {
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
                 }

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
                     "<tr><td><a href='#' class='modal_history'>" + list[i].buy_history_num + "</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].merchant_uid +"</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].buy_history_date +"</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].name+ "</a></td>"
                     +"<td><a href='#' class='modal_history'>" + list[i].buy_history_current +  "</a></td></tr>");
            }
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
      });
      //구매취소-1
         $("#cancelbtn").click(function(){
            let result = confirm("정말 취소하시겠습니까?");
            if(result){
               if($(".current").text()=="결제완료"){
                  alert("취소 처리 되었습니다.");
                  //취소function
                  let buy_history_num = $(".buy_history_num").val();
                  alert(buy_history_num);
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
      
      //취소하기
      function cancelClass(buy_history_num) {
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
            this.responseText;
         }
         xhttp.open("DELETE", "/noClass/buy_history_num/" + buy_history_num, true);
         xhttp.send();
      }
      
      //리뷰쓸 코드 선택
      $("#writebtn").click(function(){
         $(".selectBox").css("display", "block");
         let class_arr = $(".class_arr").val();
         let class_buy = class_arr.split("-");
         
         for(let i = 0;i<class_buy.length-1;i++){
             $("#selectClass").append("<option value='" + class_buy[i]+"'> "+class_buy[i]+"</option>");
         }
      });
      
      //리뷰쓰러가기
      
      $("#gotoReviewForm").click(function(){
         let class_code = $(".selectBox option:selected").val();
         location.href="/class/reviewForm?class_code=" + class_code;         
         
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
            alert(data);
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
            for(let i = 0; i < data.length; i++){
               $("#myClassListBody").append("<tr>"
                     + "<td>" + data[i].class_subject + "</td><td>" + data[i].class_teacher + "</td>"
                     + "<td>" + data[i].city_date + "</td><td>" + data[i].class_name + "</td>"
                     + "</tr>");
            }
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
         },
         error: () => {
            alert("error");
         }
         
      })
      
      </script>

>>>>>>> branch 'master' of https://github.com/Munjeehyun/penefit.git
</body>
</html>