<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


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

#cartbox {
	border: 1px solid black;
	width: 1100px;
	margin: 0 auto;
}

#payZone {
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
						for="deleteSome" id="deleteSome">선택삭제</label> | <label
						for="deleteExpired" id="deleteExpired">구매불가능 강의삭제</label>
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
							<span class="price" id="price"></span>
						</div>
					</div>
					<div>
						<button onclick="requestPay()">결제하기</button>
						<!-- 결제하기 버튼 생성 -->
					</div>
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
				calcPrice();
			} else {
				$('.checking').prop('checked', false);
				sum=0;
				$("#price").text(0);
				

			}
			
		});
		//전부 클릭이면 -->전체선택에 체크 / 아니면 -->전체선택에 체크해제
		$(document)
				.on(
						"click",
						".checking",
						function(evt) {
							if ($("input:checkbox[class='checking']:checked").length == $("input:checkbox[class='checking']").length) {
								$('#checkAll').prop('checked', true);
							} else {
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
				let list = JSON.parse(data);
				for (let i = 0; i < list.length; i++) {
					let suggest_photo = list[i].suggest_photo.split('-', 1);
					if(list[i].class_memcnt>=list[i].class_memlit || list[i].statusMsg =="마감"){
						$("#tbody")
						.append(
								"<tr><td>"
										+ list[i].shopping_cart_num
										+ "</td><td>"
										+ "<input type='hidden' class='classC' value='"+list[i].class_code+ "'><input type='checkbox'  disabled='disabled'></td><td>"
										+ "<a href='class/class-detail?class_code="
										+ list[i].class_code
										+ "'><img class='list_img' src='images/"+suggest_photo+"' class='cart_img' style='width:100px; height:100px;'></a></td><td>"
										+ "<a href='class/class-detail?class_code="
										+ list[i].class_code
										+ "'>"
										+ list[i].class_subject
										+ "</td><td>"
										+ "<a href='class/classList-search?keyword="
										+ list[i].class_teacher
										+ "'>"
										+ list[i].class_teacher
										+ "</td><td>"
										+ list[i].class_date
										+ "</td><td>"
										+ list[i].class_price
										+ "</td><td>"
										+ list[i].class_memcnt
										+ "&#47;"
										+ list[i].class_memlit
										+ "</td><td>"
										+ "<a><img src='../images/delete.png' class='delete_img'></a></td></tr>");

			}
					else{
						$("#tbody")
						.append(
								"<tr><td>"
										+ list[i].shopping_cart_num
										+ "</td><td>"
										+ "<input type='hidden' class='classC' value='"+list[i].class_code+ "'><input type='checkbox' class='checking'></td><td>"
										+ "<a href='class/class-detail?class_code="
										+ list[i].class_code
										+ "'><img class='list_img' src='images/"+suggest_photo+"' class='cart_img' style='width:100px; height:100px;'></a></td><td>"
										+ "<a href='class/class-detail?class_code="
										+ list[i].class_code
										+ "'>"
										+ list[i].class_subject
										+ "</td><td>"
										+ "<a href='class/classList-search?keyword="
										+ list[i].class_teacher
										+ "'>"
										+ list[i].class_teacher
										+ "</td><td>"
										+ list[i].class_date
										+ "</td><td>"
										+ list[i].class_price
										+ "</td><td>"
										+ list[i].class_memcnt
										+ "&#47;"
										+ list[i].class_memlit
										+ "</td><td>"
										+ "<a><img src='../images/delete.png' class='delete_img'></a></td></tr>");

			}
					}
					
				calcPrice();

			}
			xhttp.open("GET", "shoppingcartList", true);
			xhttp.send();
		}
		$(document)
				.on(
						"click",
						".delete_img",
						function(evt) {
							let cartNum = evt.target.parentElement.parentElement.parentElement.children[0].innerText;
							alert(cartNum);
							deleteCart(cartNum);
						})

		//1개 삭제하기
		function deleteCart(cartNum) {
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				this.responseText;
				getList();
				calcPrice();
				alert("삭제되었습니다.");
			}
			xhttp.open("DELETE", "deleteCart/shopping-cart-num/" + cartNum,
					true);
			xhttp.send();
		}

		//전체 삭제
		$("#deleteAll").click(function() {
			deleteAllCart();
		})

		function deleteAllCart() {
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				this.responseText;
				getList();
				calcPrice();
				alert("삭제되었습니다.");
			}
			xhttp.open("DELETE", "allCart", true);
			xhttp.send();
		}
		
		
		//구매 불가능 품목
		$("#deleteExpired").click( ()=>{
							$("input[ disabled='disabled']").each(
								function() {
									if($(this).is(":disabled") == true) {
										cartNum = this.parentElement.parentElement.children[0].innerText;
										deleteSomeCart(cartNum);
									}
								}
							)
							location.reload();
							alert("삭제되었습니다.");
							});
		
		
		//선택 삭제
		let checkArr = [];
		//체크박스를 전체 확인하면서 체크된것을 삭제
		$("#deleteSome")
				.click(
						function() {
							$("input[class='checking']")
									.each(
											function() {
												if ($(this).is(":checked") == true) {
													cartNum = this.parentElement.parentElement.children[0].innerText;
													deleteSomeCart(cartNum);
												}
											});
							location.reload();
							alert("삭제되었습니다.");
						});
		function deleteSomeCart(cartNum) {
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				this.responseText;
			}
			xhttp.open("DELETE", "deleteCart/shopping-cart-num/" + cartNum,
					true);
			xhttp.send();
		}

		//1차 금액계산
		let sum;
		calcPrice();
		function calcPrice() {
			sum = 0;
			$("input[class='checking']")
					.each(
							function() {
								if ($(this).is(":checked") == true) {
									//금액을 계산한다.
									let pricee = this.parentElement.parentElement.children[6].innerText;
									let price = parseInt(pricee);
									sum += price;
									$("#price").text(sum);
								}
							});
		}

		//체크 변경시 금액계산
		$(document).on("click", ".checking", function() {
			calcPrice();
		});

		//아임포트  결제 API
		//1. 객체 초기화하기 : 	주문 페이지에서 가맹점 식별코드를 이용하여 IMP 객체를 초기화 합니다.
		const IMP = window.IMP; // 생략 가능
		IMP.init("imp13816725"); // 예: imp00000000a

		//2. 결제요청하기
		function requestPay() {
			let today = new Date();
			let date = "ORD";
			let randomStr = Math.random().toString(36).substring(2, 9)
					.toUpperCase();
			let order_num = date.concat(today.getFullYear(),
					today.getMonth() + 1, today.getDate(), '-', randomStr);
			IMP.request_pay({
				pg : "html5_inicis",
				pay_method : "card",
				merchant_uid : order_num, // 주문번호
				name : "Penefit 클래스 결제의 건",
				amount : sum, // 숫자 타입
				buyer_email : "",
				buyer_name : "${memberinfo.member_name}",
				buyer_tel : "${memberinfo.member_tel}",
				buyer_addr : "${memberinfo.member_address}",
				buyer_postcode : ""
			}, function(rsp) { // callback
				if (rsp.success) {
					// 결제 성공 시 로직
					var msg = '결제가 완료되었습니다.';
					sendParam(sum,rsp.imp_uid,rsp.merchant_uid,rsp.pay_method,rsp.pg_provider,rsp.pg_tid,rsp.bank_name,rsp.card_name,rsp.card_quota,rsp.card_number,rsp.name,rsp.currency,rsp.buyer_name,rsp.buyer_email,rsp.buyer_tel,rsp.buyer_addr);
					

				} else {
					// 결제 실패 시 로직
					var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
				}
				 alert(msg);
			});
			
			}
		
		
		function sendParam(sum,imp_uid,merchant_uid,pay_method,pg_provider,pg_tid,bank_name,card_name,card_quota,card_number,name,currency,buyer_name,buyer_email,buyer_tel,buyer_addr ){
			class_arr=[];
			classCode_arr=[];
			$("input[class='checking']").each(function() {
						if ($(this).is(":checked") == true) {
							cartNum = this.parentElement.parentElement.children[0].innerText;
							class_arr.push(cartNum);
							let cl_code = this.parentElement.parentElement.children[1].children[0].value;
							classCode_arr.push(cl_code);
						}
					});
			
			const his_obj = {
					class_arr : class_arr,
			    	sum : sum,
			    	imp_uid:imp_uid,
			    	merchant_uid:merchant_uid,
			    	pay_method:pay_method,
			    	pg_provider:pg_provider,
			    	pg_tid:pg_tid,
			    	bank_name:bank_name,
			    	card_name:card_name,
			    	card_quota:card_quota,
			    	card_number:card_number,
			    	name:name,
			    	currency:currency,
			    	buyer_name:buyer_name,
			    	buyer_email:buyer_email,
			    	buyer_tel:buyer_tel,
			    	buyer_addr:buyer_addr,
			    	classCode_arr:classCode_arr
			} 
			
			const json_obj = JSON.stringify(his_obj);

			
			$.ajax({
			    url: "/hitory", // 요청 할 주소
			    method : "POST", // GET, PUT
			    contentType : "application/json",
			    data: json_obj
			    ,success : function(){
			    	location.reload();
			    }, error : function(){
			    	alert("error");
			    }
			});
		}
		
		
	</script>

</body>
</html>