<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/footers/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>

<link rel = "stylesheet" type = "text/css" href = "/css/style.css">

<style>
#headerbox {
	height: 200px;
}
</style>
</head>

<body>
	<div class="container">
		<div class="box" id="headerbox">
			<header>
				<div id="logo_box">
					<a href="/"><img src="../images/logo.png" id="logo_img"></a>
				</div>
				<div id="log_info">


					<c:if test="${member_id ==null }">
						<a href="/member/login">로그인</a> |
                            <a href="/member/regMember">회원가입</a> |
                        </c:if>
					<c:if test="${member_id !=null }">
                    	${member_id }님 | 
                    <a href="/member/logout">로그아웃</a> | 
                    </c:if>
					<a id="goWishlist">위시리스트</a> | <a id="shoppingcart">장바구니</a> | <a
						id="goMypage">마이페이지</a>
				</div>

				<div id="navbox" class="box">
					<ul>
						<li>
							<div class="title">센터소개</div>
							<div class="subtitle">
								<div class="subtitle_li">
									<a href="#">센터소개</a>
								</div>
								<div class="subtitle_li">
									<a href="#">연혁</a>
								</div>

							</div>
						</li>
						<li>
							<div class="title">클래스</div>
							<div class="subtitle">
								<div class="subtitle_li">
									<a href="/class/classList-ongoing">클래스과정</a>
								</div>
								<div class="subtitle_li">
									<a href="/class/suggestion">클래스제안</a>
								</div>

							</div>
						</li>
						<li>
							<div class="title">커뮤니티</div>
							<div class="subtitle">
								<div class="subtitle_li">
									<a href="/board/notice">공지사항</a>
								</div>
								<div class="subtitle_li">
									<a href="/board/cityBoardview">지역별게시판</a>
								</div>

							</div>
						</li>
						<li>
							<div class="title">문의</div>
							<div class="subtitle">
								<div class="subtitle_li">
									<a href="/board/FAQ">FAQ</a>
								</div>
								<div class="subtitle_li">
									<a href="/board/QnA">Q&A</a>
								</div>
							</div>
						</li>

					</ul>
</div>

					<button class="headerBotton">
						<img src="../images/blackloupe.png" class="icon"
							id="blackloupe_img2">
					</button>
			</header>
		</div>

	</div>

	<div class="box">
		<div id="iconsearch">
			<div class="searchbox" id="divsearch">
				<input type="text" name="search_keyword" id="search_bar">
				<button id="search_btn">
					<img src="../images/loupe.png" id="loupe_img1">
				</button>
			</div>
		</div>
	</div>
	
<script src = "/js/javascript.js"></script>
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


//검색버튼 클릭시 검색창으로 이동
$("#search_btn").click(function(){
	search();
});
//검색창에서 엔터시 검색창으로 이동
$("#search_bar").keydown(function(evt){
	if(evt.keyCode ==13){
		search();
	}
})
function search(){
	let keyword=$("#search_bar").val();
	let url = "class/classList-search?keyword=" + keyword;
	location.href=url;
}

//위시리스트는 회원만 이용가능
$("#goWishlist").click(function(){
	let member_id = "${member_id}";
	if(member_id!=""){
		location.href="../wishlist"
	}else{
		alert("회원만 이용가능한 서비스 입니다.");
		location.href="../member/login"
	}
});

//마이페이지는 회원만 이용가능
$("#goMypage").click(function(){
	let member_id = "${member_id}";
	if(member_id!=""){
		location.href="/member/infoMember?id=${member_id }/"
	}else{
		alert("회원만 이용가능한 서비스 입니다.");
		location.href="../member/login"
	}
});

//장바구니는 회원만 이용가능
$("#shoppingcart").click(function(){
	let member_id = "${member_id}";
	if(member_id!=""){
		location.href="/shoppingcart1"
	}else{
		alert("회원만 이용가능한 서비스 입니다.");
		location.href="../member/login"
	}
});  
</script>
</body>

</html>