<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="style.css">
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

#kakaobox, #heart {
	
}

#kakao, #heart img {
	border-radius: 45%;
	width: 30px;
	height: 30px;
}

#heart img:hover {
	cursor: pointer;
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
					<div id="class_code">클래스 코드${cvo.class_code }</div>
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
						<button type="button" id="addCart">장바구니에 담기</button>
					</div>
				</div>
			</div>

		</section>
	</div>
	<%@ include file="../footer.jsp"%>
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
			xhttp.open("DELETE", "/deleteWishlist/class-code/" + class_code, true);
			xhttp.send();
		}

		//장바구니에 담기
		$("#addCart").click(function() {
			//alert("장바구니 버튼 클릭!");
			location.href = "shoppingcart?class_code=" + class_code;
		});
	</script>
</body>
</html>