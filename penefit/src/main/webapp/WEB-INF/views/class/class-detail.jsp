<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style>
.class_detail img {
	width: 400px;
	height: 400px;
}

.class_detail {
	border: 1px solid red;
	width: 1000px;
	display: flex;
	margin: 0 auto;
}

#class_detail_img {
	display: inline-block;
	border: 3px solid green;
}

#class_detail_info {
	width: 550px;
}

#class_subject {
	font-weight: bold;
	font-size: 30px;
}

#kakao, #heart img {
	border-radius: 45%;
	width: 30px;
	height: 30px;
}

#heart img:hover {
	cursor: pointer;
}
.detail_box{
	position:absolute;
	display:none;
	width: 900px;
	border: 2px solid pink;
}
#detail_box1{
	display:block;
}

</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<c:set var="class_code" scope="page" value="${cvo.class_code }" />
	<div class="box">
		<section>
			<div class="class_detail">
				<div id="class_detail_img">
					<img src="../images/${fn:split(cvo.suggest_photo,'-')[0]}">
				</div>
				<div id="class_detail_info">
					<div id="class_subject">${cvo.class_subject }</div>
					<div id="class_teacher">${cvo.class_teacher }</div>
					<div id="class_day">${cvo.class_date }</div>
					<div id="class_info">${cvo.class_info }</div>
					<div id="class_memlit">정원수 : ${cvo.class_memlit }</div>
					<div id="class_memcnt">현재 신청인원 : ${cvo.class_memcnt }</div>
					<div id="class_price">${cvo.class_price }</div>
					<div id="heart">
						<img src="../images/blankHeart.png" class="heart_img">
					</div>
					<div>
						<a id="kakaotalk-sharing-btn" href="javascript:;"><img
							id="kakao"
							src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
							alt="카카오톡 공유 보내기 버튼" /> </a>
					</div>
					<div>
						<c:if test="${cvo.class_memlit<=cvo.class_memcnt || status =='마감'}"><button type="button" >마감된 클래스입니다</button></c:if>
						<c:if test="${cvo.class_memlit>cvo.class_memcnt  && status =='진행'}"><button type="button" id="addCart" >장바구니에 담기</button></c:if>
					</div>
				</div>


			</div>
			<div>
				<ul>
					<li id="detail_box1_btn"><label for="detail_box1_btn">상세설명</label></li>
					<li id="detail_box2_btn"><label for="detail_box2_btn">클래스후기</label></li>
					<li id="detail_box3_btn"><label for="detail_box3_btn">위치설명</label></li>
					<li id="detail_box4_btn"><label for="detail_box4_btn">취소약관</label></li>
				</ul>
			</div>
			<div class="detail_box" id="detail_box1">
				<img src="../images/01.jpg" style="width: 800px;">
			</div>
			<div class="detail_box" id="detail_box2">
				${rvo.review_content }
				${rvo.member_id }
				${rvo.review_regdate }
				${rvo.score }
			</div>
			<div class="detail_box" id="detail_box3"></div>
		</section>
	</div>
	<%-- <%@ include file="../footer.jsp"%> --%>
	<script>
		//세션에서 로그인 아이디 받아오기
		let member_id = "${member_id}";
		let class_code = "${class_code}";

		//로그인된 아이디가 았으면 위시리스트를 받아온다.
		if (member_id != "") {
			wishlist();
			$(".heart_img").click(function() {
				if ($(".heart_img").attr("src") == "../images/blankHeart.png") {
					$(".heart_img").attr("src", "../images/pinkHeart.png");
					addWishlist();
				} else {
					$(".heart_img").attr("src", "../images/blankHeart.png");
					deleteWishlist();
				}

			});
		} else {

			$(".heart_img").click(function() {
				alert("이용하기 위해서는 로그인이 필요합니다.");
				location.href = "/member/login";
			});

		}

		//위시리스트 받아오기 ajax
		function wishlist() {
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				if (data == 1) {
					$(".heart_img").attr("src", "../images/pinkHeart.png");
				} else {
					$(".heart_img").attr("src", "../images/blankHeart.png");
				}
			}
			xhttp.open("GET", "/checkWishlist?class_code=" + class_code
					+ "&member_id=" + member_id, true);
			xhttp.send();
		}

		//위시리스트 추가 ajax
		function addWishlist() {

			const xhttp = new XMLHttpRequest();
			const obj_wish = {
				class_code : class_code,
				member_id : member_id
			}
			const json_wish = JSON.stringify(obj_wish);

			xhttp.onload = function() {
				let data = this.responseText;
				alert("위시리스트에 추가 되었습니다.");
			}
			xhttp.open("POST", "/addWishlist", true);
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(json_wish);
		}

		//위시리스트 제거 ajax
		function deleteWishlist() {
			alert(class_code);
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function() {
				let data = this.responseText;
				alert("위시리스트에서 삭제 되었습니다.");
			}
			xhttp.open("DELETE", "/deleteWishlist/class-code/" + class_code,
					true);
			xhttp.send();
		}

		//장바구니에 담기
		$("#addCart").click(function() {
			//alert("장바구니 버튼 클릭!");
			location.href = "shoppingcart?class_code=" + class_code;
		});
		
		
		
		$("#detail_box1_btn").click(function(){
			$(".detail_box:not(#detail_box1)").css("display", "none");
	         $("#detail_box1").css("display", "block");
		});
		$("#detail_box2_btn").click(function(){
			$(".detail_box:not(#detail_box2)").css("display", "none");
	         $("#detail_box2").css("display", "block");
		});
		$("#detail_box3_btn").click(function(){
			$(".detail_box:not(#detail_box3)").css("display", "none");
	         $("#detail_box3").css("display", "block");
		});
		
		
		</script>
</body>
</html>