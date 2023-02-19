<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .layout{
    max-width: 600px;
    margin: 0 auto;
}

.qna{
    list-style: none;
    margin: 0;
    padding: 0;
}
.qna > li{
  padding: 10px 0;
  box-sizing: border-box;
}
.qna > li:nth-child(n+2){ /* 아이템 구분 점선 */
  border-top: 1px dashed #aaa;
}
.qna input {
  display: none;
}

.qna label { /* 제목 - 클릭 영역 */
  font-weight: bold;
  color: #000;
  margin: 20px 0 0;
  cursor: pointer;
}
.qna label::before { /* 제목 앞 화살표 */
  display: block;
  content: "";
  width: 0;
  height: 0;
  border: 8px solid transparent;
  border-left: 8px solid green;
  margin: 2px 0 0 8px;
  float: left;
}
.qna input:checked + label::before { /* 내용 펼침 상태 제목 앞 화살표 */
  border: 8px solid transparent;
  border-top: 8px solid green;
  border-bottom: 0;
  margin: 8px 4px 0;
}

.qna div { /* 내용 영역 - 기본 감춤 상태 */
  display: none;
  color: #666;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 10px 0 10px 30px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}
.qna input:checked + label + div { /* 내용 영역 펼침 */
  display: block;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">문의</li>
					<li class="aside_menu"><a href="FAQ">FAQ</a></li>
					<li class="aside_menu"><a href="QnA">Q&A</a></li>
				</ul>
			</aside>
			<div class="content">
				<h2>? FAQ _ 자주묻는 질문 ¿(임시)</h2>
				
		<ul class="qna">
        <li>
            <input type="checkbox" id="qna-1">
            <label for="qna-1">강아지동반 가능한가요?</label>
            <div>
                <p>네! 동반시 미리 연락주시고 마킹이 심한 친구들은 매너 밸트를 꼭 챙겨와주세요.</p>
            </div>
        </li>
        <li>
            <input type="checkbox" id="qna-2">
            <label for="qna-2"> 결제방식은 어떻게 되나요?</label>
            <div>
                <p>앱과 PC에서 카드 / 무통장으로 결제 하실 수 있습니다.</p>
            </div>
        </li>
        <li>
            <input type="checkbox" id="qna-3">
            <label for="qna-3">수업장소와 시간은 어떻게 되나요?</label>
            <div>
                <p>수업소개에 수업장소와 시간이 명시되어 있습니다. 자세히 명시 되어있지 않은 수업의 경우 튜터와 조율하여 유동적으로 결정할 수 있습니다.
				<p>튜터에게 문의하여 시간을 조율해보세요. 개개인의 스케줄에 딱 맞는 시간을 조율할 수 있다는 것이 탈잉의 가장 큰 장점이니까요.</p>
                <p>반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당 주문은 반품처리한 것으로 재 변경됩니다.</p>
            </div>
        </li>
        <li>
            <input type="checkbox" id="qna-4">
            <label for="qna-4">환불 절차는 어떻게 되나요?</label>
            <div>
                <p>“튜터에게 환불 의사 전달 > 환불 신청 > 담당자 확인 후 환불 접수(환불 신청 후 운영 시간 기준 24시간 이내 완료) > 환불 진행 (무통장 재입금 / 카드 결제 취소 : 영업일 기준 5~7일 소요 > 환불 완료” 의 절차로 진행됩니다.</p>
            </div>
        </li>
        <li>
            <input type="checkbox" id="qna-5">
            <label for="qna-5">수업 중간에 사정이 생겨 그만 둘 경우에도 환불이 되나요?</label>
            <div>
                <p>첫 수업 이후 환불에 대해서는 회원가입 및 결제 시 수강생이 동의한 탈잉의 환불 규정에 따라 환불이 진행됩니다.
					자세한 사안은 환불규정을 참고해주세요.</p>
            </div>
        </li>
    </ul>

    </div>
    <script>

        $("#question").click(function(){
            $("#anwser").css("display","block");
        });
        $("#fold").click(function(){
            $("#anwser").css("display","none");
        });
        
    </script>
			
		</section>
	</div>
	<script>
	 $("#blackloupe_img2").click(()=> {
   	  if ($("#divsearch").css("display") == "none") { 
   	        $("#divsearch").css("display", "block");//display :none 일떄
   	    } else {
   	    	 $("#divsearch").css("display", "none"); //display :block 일떄
   	    } 
   });
     $(".title").click(function(){
   	//  alert("click");
   	  if ($(".subtitle").css("display") == "none"){
   		  $(".subtitle").css("display", "block");
   	  }else{
   		  $(".subtitle").css("display", "none");
   	  }
     });
 
		$("#aside_menu_btn").mouseover(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "block");
		})
		$("#aside_menu_btn").mouseout(function() {
			//alert('dd');
			$("#aside_submenu").css("display", "none");
		})
	</script>
</body>
</html>