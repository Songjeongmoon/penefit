<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.class_detail img {
	width: 400px;
	height: 400px;
	margin-right: 20px;
}

.class_detail {
	margin-top: 30px;
	width: 800px;
	display: flex;
	margin: 0 auto;
}

#class_detail_img {
	display: inline-block;
}

#class_subject {
	font-weight: bold;
	font-size: 26px;
	margin-top: 30px;
}

#class_price {
	margin-bottom: 20px;
}

#kakao, #heart img {
	border-radius: 45%;
	width: 30px;
	height: 30px;
}

#heart, #kakao {
	display: inline;
}

#kakao {
	position: relative;
	left: -15px;
}

#heart img:hover {
	cursor: pointer;
}

.detail_box {
	position: absolute;
	display: none;
	width: 800px;
	margin: 0 quto;
}

#detail_box1 {
	display: block;
}

#class_memlit, #class_memcnt {
	display: inline;
}

#addCart, #expired {
	width: 350px;
	height: 40px;
	color: white;
	background-color: #75BD43;
	border: none;
	border-radius: 7px;
	line-height: 40px;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	display: inline;
	position: absolute;
	top: 350px;
}

#expired {
	background-color: gray;
	cursor: default;
}

#detailMenu {
	margin: 0 auto;
	width: 800px;
	height: 40px;
	position: absolute;
	margin-top: 20px;
	top: 450px;
}

#detailMenu ul {
	margin: 0 auto;
	margin-left: 12px;
}

#detailMenu li {
	width: 190px;
	height: 30px;
	line-height: 32px;
	list-style-type: none;
	display: inline-block;
	float: left;
	text-align: center;
	border: 1px #BBB09F solid;
	border-collapse: collapse;
}

#detailMenu li:hover {
	border: none;
	background-color: #BBB09F;
	line-height: 32px;
	color: white;
	width: 192px;
	height: 32px;
}

#detail_box1 {
	position: absolute;
	margin-top: 20px;
	top: 500px;
}

#detailview {
	width: 800px;
	height: 100%;
	margin-bottom: 200px;
}

.oneDetail {
	width: 400px;
	border: 1px solid red;
	height: 400px;
	display: flex;
	flex-wrap: wrap;
	margin: 5px 5px;
	margin-right: 10px;
	align-items: flex-start;
}

#class_detail_img {
	margin: 0 auto;
}

#detail_box2 {
	display: none;
	position: relative;
	top: 480px;
	overflow: hidden;
	border: 1px solid green;
	left:250px;
}

#class_detail_info {
	width: 400px;
}

.oneDetail div {
	font-size: 15px;
}

.oneDetail span:nth-of-type(3) {
	font-size: 15px;
}

.oneDetail span:nth-of-type(4) {
	font-size: 15px;
}

.oneDetail span:nth-of-type(5) {
	font-size: 15px;
}

#detail_box2 .arrow {
	width: 30px;
	height: 35px;
	position: relative;
	top: 60px;
}

/*swiper*/
.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper-wrapper {
	border: 1px solid blue;
	padding : 30px;
	width: 700px;
	overflow: hidden;
	position: relative;
	left : 40px;
	
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
					<br>
					<hr>
					<br>
					<div id="class_day">일 자 : ${cvo.class_date }</div>
					<br>
					<div id="class_memcnt">인 원 : ${cvo.class_memcnt } /</div>
					<div id="class_memlit">${cvo.class_memlit }</div>
					<div id="class_price">가 격 : ${cvo.class_price }원</div>
					<div id="heart">
						<img src="../images/blankHeart.png" class="heart_img">
					</div>
					<div style="display: inline;">
						<a id="kakaotalk-sharing-btn" href="javascript:;"><img id="kakao" src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png" alt="카카오톡 공유 보내기 버튼" /> </a>
					</div>
					<div>
						<c:if test="${cvo.class_memlit<=cvo.class_memcnt || status =='마감'}">
							<button type="button" id="expired">마감된 클래스입니다</button>
						</c:if>
						<c:if test="${cvo.class_memlit>cvo.class_memcnt  && status =='진행'}">
							<button type="button" id="addCart">장바구니에 담기</button>
						</c:if>
					</div>
				</div>


				<div id="detailMenu">
					<ul>
						<li id="detail_box1_btn"><label for="detail_box1_btn">상세설명</label></li>
						<li id="detail_box2_btn"><label for="detail_box2_btn">클래스후기</label></li>
						<li id="detail_box3_btn"><label for="detail_box3_btn">위치설명</label></li>
						<li id="detail_box4_btn"><label for="detail_box4_btn">취소약관</label></li>
					</ul>
				</div>
				<div class="detail_box" id="detail_box1">
					<img src="../images/${fn:split(cvo.suggest_photo,'-')[1]}" style="width: 800px; height: 5000px;"> <img src="../images/${fn:split(cvo.suggest_photo,'-')[2]}" style="width: 800px; height: 5000px;">
				</div>

				<!--      <div class="detail_box" id="detail_box2" >
            <img src="../images/leftarrow.png" class="arrow">
               <c:forEach var="r" items="${rvo }">
                  <div class="oneDetail">
                     <div><img src="../images/${r.review_photo }" class="review_img" style="width: 90px;height: 90px;"></div>
                     <div style="align-items: flex-start;">${r.review_content }</div>
                     <div>${r.member_id }</div> 
                     <div>${r.review_regdate }</div>
                     <div>${r.score }</div>
                  </div>
               </c:forEach>
            <img src="../images/rightarrow.png" class="arrow">
         </div> -->

				<div class="detail_box" id="detail_box3"></div>
			</div>
		</section>

		<div class="detail_box" id="detail_box2">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<c:forEach var="r" items="${rvo }">
						<div class="oneDetail">
							<img src="../images/${r.review_photo }" class="review_img" style="width: 200px; height: 200px;">
							<div style="align-items: flex-start;">${r.review_content }</div>
							<div>${r.member_id }</div>
							<div>${r.review_regdate }</div>
							<div>${r.score }</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

	<%-- <%@ include file="../footer.jsp"%> --%>

	<script>
		$("swiper-button-next").click(function(){
			$(".swiper-wrapper").css("left","-100%");
		})
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

		$("#detail_box1_btn").click(function() {
			$(".detail_box:not(#detail_box1)").css("display", "none");
			$("#detail_box1").css("display", "block");
		});
		$("#detail_box2_btn").click(function() {
			$(".detail_box:not(#detail_box2)").css("display", "none");
			$("#detail_box2").css("display", "flex");
		});
		$("#detail_box3_btn").click(function() {
			$(".detail_box:not(#detail_box3)").css("display", "none");
			$("#detail_box3").css("display", "block");
		});

		var swiper = new Swiper(".detail_box2", {
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>
</body>
</html>