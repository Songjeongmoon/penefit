<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
h2 {
	text-align: center;
}

table {
	width: 1100px;
	margin: 0 auto;
}

.cart_img {
	width: 100px;
	height: 100px;
}

.delete_img {
	width: 30px;
	height: 30px;
}

#checkbar {
	width: 1100px;
	margin: 0 auto;
}
#cartbox{
	border: 1px solid black;
	width: 1100px;
	margin: 0 auto;
}
#payZone{
	float: right;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="box">
		<section>
			<h2>장바구니</h2>
			<div id="cartbox">
				<div id="checkbar">
					<input type="checkbox" id="checkAll"><label for="checkAll">전체선택</label>
					| <label for="deleteAll" id="deleteAll">전체삭제</label> | <label
						for="deleteSome" id="deleteSome">선택삭제</label>
				</div>
				<table border="1">
					<thead>
						<tr>
							<th>순서</th>
							<th>체크박스</th>
							<th>클래스사진</th>
							<th>클래스명</th>
							<th>강사명</th>
							<th>일시</th>
							<th>금액</th>
							<th>인원</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
				<div id="payZone">
				<div>
					<div class="sub">
					<span class="sub">상품금액 </span>
				</div>
				<div class="price">
					<span class="price" id="price">0 원</span>
				</div>
				</div>
				<div><button id="pay_btn"
								onclick="requestPay({{ auth()->check() }})">결제하기</button></div>
				</div>
			</div>
		</section>

	</div>
	<%@ include file="footer.jsp"%>

	<script>
	//체크박스로 전체 선택
	$(document).on('click', '#checkAll', function() {
		if ($('#checkAll').is(':checked')) {
			$('.checking').prop('checked', true);
		} else {
			$('.checking').prop('checked', false);

		}
	});
	//전부 클릭이면 -->전체선택에 체크 / 아니면 -->전체선택에 체크해제
	$(document).on("click", ".checking", function(evt) {
		if($("input:checkbox[class='checking']:checked").length==$("input:checkbox[class='checking']").length){
			$('#checkAll').prop('checked', true);
		}else{
			$('#checkAll').prop('checked', false);
		}
	});
	
	//목록가져오기
	getList();
	function getList() {
		$("#tbody").empty();
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		    let data = this.responseText;
		    let list= JSON.parse(data);
			for(let i = 0; i<list.length;i++){
				$("#tbody").append("<tr><td>"
						+ list[i].shopping_cart_num +"</td><td>"
						+ "<input type='checkbox' class='checking'></td><td>"
						+ "<a href='class/class-detail?class_code=" + list[i].class_code + "'><img class='list_img' src='images/"+list[i].suggest_photo+"' class='cart_img' style='width:100px; height:100px;'></a></td><td>"
						+ "<a href='class/class-detail?class_code=" + list[i].class_code + "'>" +list[i].class_subject+"</td><td>"
						+ "<a href='class/classList-search?keyword=" + list[i].class_teacher + "'>" + list[i].class_teacher+"</td><td>"
						+ list[i].class_date +"</td><td>"
						+ list[i].class_price +"</td><td>"
						+ list[i].class_memcnt + "&#47;" + list[i].class_memlit +"</td><td>"
						+ "<a><img src='../images/delete.png' class='delete_img'></a></td></tr>"
				);
				
			}
			
		    
		    }
		  xhttp.open("GET", "shoppingcartList", true);
		  xhttp.send();
	}
	$(document).on("click", ".delete_img", function(evt) {
		let cartNum=evt.target.parentElement.parentElement.parentElement.children[0].innerText;
		alert(cartNum);
		deleteCart(cartNum);
	})
	
	//1개 삭제하기
	function deleteCart(cartNum) {
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		    this.responseText;
		    getList();
		    alert("삭제되었습니다.");
		    }
		  xhttp.open("DELETE", "deleteCart/cartNum/" + cartNum, true);
		  xhttp.send();
		}
	
	//전체 삭제
	$("#deleteAll").click(function(){
		deleteAllCart();
	})
	
	function deleteAllCart() {
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		    this.responseText;
		    getList();
		    alert("삭제되었습니다.");
		    }
		  xhttp.open("DELETE", "allCart", true);
		  xhttp.send();
		}
	
	
	//선택 삭제
	let checkArr = [];
		//체크박스를 전체 확인하면서 체크된것을 삭제
	$("#deleteSome").click(function(){
		$("input[class='checking']").each(function(){
		    if( $(this).is(":checked") == true ){
		    	cartNum=this.parentElement.parentElement.children[0].innerText;
		    	deleteSomeCart(cartNum);
		    }
		  });	
		getList();
		alert("삭제되었습니다.");
	})
		function deleteSomeCart(cartNum) {
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		    this.responseText;
		    }
		  xhttp.open("DELETE", "deleteCart/cartNum/" + cartNum, true);
		  xhttp.send();
		}
	
	
	$("#testbtn").click(function(){
		alert("test start");
		$("input[class='checking']").each(function(){
		    if( $(this).is(":checked") == true ){
				alert(this.parentElement.parentElement.children[0].innerText);
				checkArr.push(this.parentElement.parentElement.children[0].innerText);
		    }
		  });
		alert(checkArr);
	})
	
	//선택된 것 삭제

	//1차 금액계산
	
	//체크 변경시 금액계산

	</script>

	<script>
		//아임포트  결제 API
		//1. 객체 초기화하기 : 	주문 페이지에서 가맹점 식별코드를 이용하여 IMP 객체를 초기화 합니다.
			const IMP = window.IMP; // 생략 가능
  			IMP.init("imp13816725"); // 예: imp00000000a
  			
  		//2. 결제요청하기
  		
  		function requestPay() {
    IMP.request_pay({
      pg: "inicis",
      pay_method: "card",
      merchant_uid: "ORD" + new Date().getTime(),   // 주문번호
      name: "TEST",
      amount: 64900,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직
      } else {
        // 결제 실패 시 로직
      }
    });
  }
			
			//3. redirect 결제창 결과처리
			IMP.request_pay({
			  /* 결제 요청 객체를 채워주세요. */
			  m_redirect_url: "{리디렉션 될 URL}"
			}, /* callback */); // 리디렉션 방식의 경우 callback은 실행되지 않습니다.
			
			//4. 결제정보 수신하기
			app.use(bodyParser.json());
  // "{서버의 결제 정보를 받는 가맹점 endpoint}" POST 요청 수신부
  app.post("/payments/complete", async (req, res) => {
    try {
      // req의 body에서 imp_uid, merchant_uid 추출
      const { imp_uid, merchant_uid } = req.body; 
    } catch (e) {
      res.status(400).send(e);
    }
  });
  
  //5. 결제정보를 조회하기 
  app.use(bodyParser.json());
    app.post("/payments/complete", async (req, res) => {
      try {
        // req의 body에서 imp_uid, merchant_uid 추출
        const { imp_uid, merchant_uid } = req.body; 
        ...
        // 액세스 토큰(access token) 발급 받기
        const getToken = await axios({
          url: "https://api.iamport.kr/users/getToken",
          method: "post", // POST method
          headers: { "Content-Type": "application/json" }, 
          data: {
            imp_key: "imp_apikey", // REST API 키
            imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f" // REST API Secret
          }
        });
        const { access_token } = getToken.data.response; // 인증 토큰
        ...
        // imp_uid로 포트원 서버에서 결제 정보 조회
        const getPaymentData = await axios({
          // imp_uid 전달
          url: `https://api.iamport.kr/payments/${imp_uid}`, 
          // GET method
          method: "get", 
          // 인증 토큰 Authorization header에 추가
          headers: { "Authorization": access_token } 
        });
        const paymentData = getPaymentData.data.response; // 조회한 결제 정보
        ...
      } catch (e) {
        res.status(400).send(e);
      }
    });
	</script>

</body>
</html>