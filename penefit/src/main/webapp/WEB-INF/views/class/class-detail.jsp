<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('7fc4637ef75ce5e0c13bf113d0284ba6'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script
	src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js"
	integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>


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
	<c:set var="member_id" scope="session" value="chaeng" />
	<c:set var="class_code" scope="page" value="${cvo.class_code }" />

	로그인아이디 : ${member_id } 님
	<div class="box">
		<section>
			<div class="class_detail">
				<div id="class_detail_img">
					<img src="../images/${cvo.class_photo }">
				</div>
				<div id="class_detail_info">
					<div id="class_code">클래스 코드${cvo.class_code }</div>
					<div id="class_subject">${cvo.class_subject }</div>
					<div id="class_teacher">${cvo.class_teacher }</div>
					<div id="class_day">${cvo.class_day }</div>
					<div id="class_time">${cvo.class_time }</div>
					<div id="class_info">${cvo.class_info }</div>
					<div id="class_memlit">정원수 : ${cvo.class_memlit }</div>
					<div id="class_memcnt">현재 신청인원 : ${cvo.class_memcnt }</div>
					<div id="class_price">${cvo.class_price }</div>
					<div id="heart">
						<img src="../images/blankHeart.png" class="heart_img">
					</div>
					<div id="">
						<a id="kakaotalk-sharing-btn" href="javascript:;"><img
							id="kakao"
							src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
							alt="카카오톡 공유 보내기 버튼" /> </a>
					</div>
					<div>장바구니 버튼</div>
				</div>
			</div>







		</section>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		/* function loginWithKakao() {
		    Kakao.Auth.authorize({
		      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
		      state: 'sendme_feed',
		      scope: 'talk_message', // 앱 동의 항목 설정 및 사용자 동의 필요
		    });
		  }

		  function sendToMe() {
		    Kakao.API.request({
		      url: '/v2/api/talk/memo/default/send',
		      data: {
		        template_object: {
		          object_type: 'feed',
		          content: {
		            title: '딸기 치즈 케익',
		            description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
		            image_url:
		              'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
		            link: {
		              // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
		              mobile_web_url: 'https://developers.kakao.com',
		              web_url: 'https://developers.kakao.com',
		            },
		          },
		          social: {
		            like_count: 286,
		            comment_count: 45,
		            shared_count: 845,
		          },
		          buttons: [
		            {
		              title: '웹으로 보기',
		              link: {
		                mobile_web_url: 'https://developers.kakao.com',
		                web_url: 'https://developers.kakao.com',
		              },
		            },
		            {
		              title: '앱으로 보기',
		              link: {
		                mobile_web_url: 'https://developers.kakao.com',
		                web_url: 'https://developers.kakao.com',
		              },
		            },
		          ],
		        },
		      },
		    })
		      .then(function(res) {
		        alert('success: ' + JSON.stringify(res));
		      })
		      .catch(function(err) {
		        alert('error: ' + JSON.stringify(err));
		      });
		  }

		  // 아래는 데모를 위한 UI 코드입니다.
		  displayToken()
		  function displayToken() {
		    var token = getCookie('authorize-access-token');

		    if(token) {
		      Kakao.Auth.setAccessToken(token);
		      document.querySelector('#token-result').innerText = 'login success, ready to send a message';
		      document.querySelector('button.api-btn').style.visibility = 'visible';
		    }
		  }

		  function getCookie(name) {
		    var parts = document.cookie.split(name + '=');
		    if (parts.length === 2) { return parts[1].split(';')[0]; }
		  }
		 */
		 
		 //세션에서 로그인 아이디 받아오기
		let member_id = "${member_id}";
		let class_code = "${class_code}";
		
		//로그인된 아이디가 았으면 위시리스트를 받아온다.
		if (member_id != "") {
			//alert("위시리스트 받아오기!");
			wishlist();
			$(".heart_img").click(function(){
				if($(".heart_img").attr("src")=="../images/blankHeart.png"){
					$(".heart_img").attr("src", "../images/pinkHeart.png");
					addWishlist();
				}else{
					$(".heart_img").attr("src", "../images/blankHeart.png");
					deleteWishlist();
				}
				
			});
		}else{
			$(".heart_img").src("../images/blankHeart.png");
		}

		//위시리스트 받아오기 ajax
		function wishlist() {
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
		   let data= this.responseText;
		   if(data==1){
			   $(".heart_img").attr("src", "../images/pinkHeart.png");
		   }else{
			   $(".heart_img").attr("src", "../images/blankHeart.png");
		   }
		    }
		  xhttp.open("GET", "checkWishlist?class_code="+class_code+"&member_id="+member_id, true);
		  xhttp.send();
		}
		
		//위시리스트 추가 ajax
		function addWishlist() {
			  const xhttp = new XMLHttpRequest();
			  xhttp.onload = function() {
			   let data= this.responseText;
			    }
			  xhttp.open("GET", "addWishlist?class_code="+class_code+"&member_id="+member_id, true);
			  xhttp.send();
			}
		
		//위시리스트 제거 ajax
		function deleteWishlist() {
			  const xhttp = new XMLHttpRequest();
			  xhttp.onload = function() {
			   let data= this.responseText;
			    }
			  xhttp.open("GET", "deleteWishlist?class_code="+class_code+"&member_id="+member_id, true);
			  xhttp.send();
			}
		
		
	</script>
</body>
</html>