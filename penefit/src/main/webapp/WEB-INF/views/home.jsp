<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
</head>

<body>

	<%@include file="header.jsp"%>

	<div class="box">
		<section>
			<div class="searchbox">
				<input type="text" name="search_keyword" id="search_bar">
				<button id="search_btn">
					<img src="../images/loupe.png" id="loupe_img">
				</button>
			</div>
			<div class="banner">
				<img src="../images/mainbanner1.png">
				<button class="infomore">자세히보기</button>
			</div>
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