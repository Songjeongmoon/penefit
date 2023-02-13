<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css" >
</head>

<body>

<div class="container">
        <div class="box">
            <header>
                <div id="logo_box"><a href="/"><img src="../images/penefit.png" id="logo_img"></a></div>
                <input type="text"	name="search_keyword" id="search_bar"><button id="search_btn"><img src="../images/loupe.png" id="loupe_img"></button>
                <div id="right_header">
                    <div id="icon_box">
                        <a id="goWishlist"><img src="../images/pinkHeart.png"></a>
                        <a id="goMypage"><img src="../images/myinfo.png"></a>
                        <a id="shoppingcart"><img src="../images/shopping-cart.png"></a>
                    </div><br>
                    <div id="log_info">
                    <c:if test="${member_id ==null }">
                    <a href="/member/login">로그인</a> | 
                    <a href="/member/regMember">회원가입</a>
                    </c:if>
                    <c:if test="${member_id !=null }">
                    <a href="/member/infoMember?id=${member_id }/">${member_id }</a>님 | 
                    <a href="/member/logout">로그아웃</a>
                    </c:if>
                    </div>
                </div>
                <nav>
                    <ul>
                        <li>
                            <div class="title">센터</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="#">센터소개</a></div>
                                <div class="subtitle_li"><a href="#">연혁</a></div>
                                <div class="subtitle_li"><a href="#">오시는길</a></div>
                                <div class="subtitle_li"><a href="#">새소식</a></div>

                            </div>
                        </li>
                        <li>
                            <div class="title">클래스</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="/class/classList">클래스과정</a></div>
                                <div class="subtitle_li"><a href="#">수강문의</a></div>
                                <div class="subtitle_li"><a href="#">수강신청</a></div>
                                <div class="subtitle_li"><a href="#">클래스제안</a></div>

                            </div>
                        </li>
                        <li>
                            <div class="title">커뮤니티</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="#">공지사항</a></div>
                                <div class="subtitle_li"><a href="#">수강후기</a></div>
                                <div class="subtitle_li"><a href="#">지역별게시판</a></div>
                                <div class="subtitle_li"><a href="#">클래스별게시판</a></div>
                           
                            </div>
                        </li>
                        <li>
                            <div class="title">문의</div>
                            <div class="subtitle">
                                <div class="subtitle_li"><a href="#">FAQ</a></div>
                                <div class="subtitle_li"><a href="#">Q&A</a></div>
                                <div class="subtitle_li">&nbsp;</div>
                                <div class="subtitle_li">&nbsp;</div>
                            </div>
                        </li>
                    </ul>
                </nav>
            </header>
        </div>

</div>

    <script>
        $(".title").mouseover(function () {
            $(".subtitle").css("display", "block");
            $(".subtitle").mouseover(function () {
                $(".subtitle").css("display", "block");
            })
        })
        $(".title").mouseout(function () {
            $(".subtitle").css("display", "none");
        })
        $(".subtitle").mouseout(function () {
            $(".subtitle").css("display", "none");
        })
        
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
        		location.href="infoMember"
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