<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<style>
@font-face {
   font-family: 'SBAggroB';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

@font-face {
   font-family: 'GongGothicMedium';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}
#footer {
   text-align: center;
   color: gray;
   
   
}

#footer a {
   color: gray;
}

footer {
   border-top: thin #DBD5CB solid;
   margin-top: 50px;
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: center;
}
.prev, .next {
   cursor: pointer;
   position: relative;
   width: auto;
   padding: 16px;
   margin-top: -22px;
   color: white;
   font-weight: bold;
   font-size: 40px;
   transition: 0.6s ease;
   border-radius: 0 3px 3px 0;
}

.pnbtn {
   display: inline;
   position: relative;
   left: 930px;
   top: -80px;
}

.rightnow1 {
   display: inline-block;
   width: 200px;
   height: 35px;
   line-height: 38px;
   background-color: #f0f0f0;
   border-radius: 30px;
   font-size: 20px;
   text-align: center;
   font-family: 'GongGothicMedium';
   position: relative;
   top : -300px;
   left : 580px;
   box-shadow: 1px 1px 1px gray;
}

.rightnow1:hover {
   cursor: pointer;
}

.youtube {
   margin: 0 auto;
   display: inline-flex;
}

.youtube ifram {
   width: 600px;
   margin: 0 20px;
}

#banner1 img {
   position: absolute;
   top: 800px;
   height: 600px;
}
#listBox1, #listBox2{
   margin: 0 auto;
   position: relative;
   left:50px;
   width: 1300px;
   margin-bottom: 80px;
   margin-top: 50px;
}
h1 {
   font-family: 'SBAggroB';
   z-index: 1;
   font-size: 35px;
   text-align: center;
   color: #F99417;
   text-shadow: 1px 1px 1px gray;
   margin-bottom: 20px;
}

#banner2btn {
   width: 170px;
   height: 40px;
   border-radius: 20px;
   position: absolute;
   background-color: #F99417;
   color: white;
   font-size: 25px;
   border: none;
   line-height: 40px;
   top: 1260px;
   left: 910px;
}

#banner1info {
   animation: slide 2s;
}

@
keyframes slide {from { right :-100px;
   
}

.slideshow-container {
   max-width: 1000px;
   position: relative;
   margin: auto;
   margin-top: 120px;
   text-align: center;
   margin: 0 auto;
   background-color: black;
}

/* effect */
.fade {
   -webkit-animation-name: fade;
   -webkit-animation-duration: 1.5s;
   animation-name: fade;
   animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
   from {opacity: .4
}

to {
   opacity: 1
}

}
@
keyframes fade {
   from {opacity: .4
}

to {
   opacity: 1
}

}

/* Next & previous buttons */

/* Position the "next button" to the right */
.next {
   right: 0;
   border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
   background-color: rgba(0, 0, 0, 0.8);
}

.bannerbox{
   display: inline;
}

</style>
<body>

   <%@include file="header.jsp"%>
   <div class="box">
      <div class="bannerbox">
         <div class="slideshow-container">

            <div class="mySlideDiv fade active">
               <img src="../images/pbann1.jpg">
            </div>

            <div class="mySlideDiv fade">
               <img src="../images/pbann2.jpg">
            </div>

            <div class="mySlideDiv fade">
               <img src="../images/pbann3.jpg">
            </div>
            <div class="mySlideDiv fade">
               <img src="../images/pbann4.jpg">
            </div>

         </div>
         <div class="pnbtn">
            <a class="prev" onclick="prevSlide()">&#10094;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="next" onclick="nextSlide()">&#10095;</a>
         </div>
         <div class="rightnow1">?????????????????? Go!</div>
      </div>
<div data-aos="fade-up"
     data-aos-duration="3000">

         <div  id="listBox1" >
         <h1>????????? ?????? OPEN!!</h1>
            <c:forEach var="c" items="${newlist }">
               <div class="class_one">
                  <a href="/class/class-detail?class_code=${c.class_code }"><img src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a>
                  <p>
                     <a href="/class/class-detail?class_code=${c.class_code }">${c.class_subject }</a>
                  </p>
                  <p>${c.class_teacher }</p>
               </div>   
            </c:forEach>
         </div>
         </div>
         <div data-aos="fade-up"
     data-aos-duration="3000">
         
         <div  id="listBox2">
         <h1>???????????? ????????????!</h1>
            <c:forEach var="c" items="${recolist }">
               <div class="class_one">
                  <a href="/class/class-detail?class_code=${c.class_code }"><img src="../images/${fn:split(c.suggest_photo,'-')[0]}"></a>
                  <p>
                     <a href="/class/class-detail?class_code=${c.class_code }">${c.class_subject }</a>
                  </p>
                  <p>${c.class_teacher }</p>
               </div>   
            </c:forEach>
         </div>
         </div>
         
   <footer>
      <div class="box">
         <div id="footer">
            <br>
            <br>
            <p>
               <a href="/">Home&nbsp;&nbsp;</a> <a href="/centerinfo/centerinfo">About&nbsp;&nbsp;</a> <a href="/board/FAQ">FAQ&nbsp;&nbsp;</a> <a href="#">Pricing</a>
            </p>
            <p>?? Copyright Penefit. All Rights Reserved</p>
         </div>
      </div>
   </footer>
   </div>
   <script>
      $(document).ready(function() {
         $(".mySlideDiv").not(".active").hide(); //?????? ?????? ??? ????????? div??? ????????? ????????? ??????

         setInterval(nextSlide, 4000); //4???(4000)?????? ?????? ??????????????? ?????????
      });

      //?????? ????????????
      function prevSlide() {
         $(".mySlideDiv").hide(); //?????? div ??????
         var allSlide = $(".mySlideDiv"); //?????? div ????????? ????????? ??????
         var currentIndex = 0; //?????? ????????? ??????????????? ????????? ??????

         //??????????????? ?????? active???????????? ?????? div??? ?????? index ??????
         $(".mySlideDiv").each(function(index, item) {
            if ($(this).hasClass("active")) {
               currentIndex = index;
            }

         });

         //????????? ????????? div??? index
         var newIndex = 0;

         if (currentIndex <= 0) {
            //?????? ??????????????? index??? 0??? ?????? ????????? ??????????????? ??????(????????????)
            newIndex = allSlide.length - 1;
         } else {
            //?????? ??????????????? index?????? ??? ??? ?????? ?????? ??? index ??????
            newIndex = currentIndex - 1;
         }

         //?????? div?????? active ????????? ??????
         $(".mySlideDiv").removeClass("active");

         //????????? ????????? index?????? ??????????????? active ????????? ?????? ??? show()
         $(".mySlideDiv").eq(newIndex).addClass("active");
         $(".mySlideDiv").eq(newIndex).show();

      }

      //?????? ????????????
      function nextSlide() {
         $(".mySlideDiv").hide();
         var allSlide = $(".mySlideDiv");
         var currentIndex = 0;

         $(".mySlideDiv").each(function(index, item) {
            if ($(this).hasClass("active")) {
               currentIndex = index;
            }

         });

         var newIndex = 0;

         if (currentIndex >= allSlide.length - 1) {
            //?????? ???????????? index??? ????????? ????????? 0????????? ??????(????????????)
            newIndex = 0;
         } else {
            //?????? ??????????????? index?????? ??? ??? ?????? ????????? ??? index ??????
            newIndex = currentIndex + 1;
         }

         $(".mySlideDiv").removeClass("active");
         $(".mySlideDiv").eq(newIndex).addClass("active");
         $(".mySlideDiv").eq(newIndex).show();

      }
      
   </script>
   <script>
  AOS.init();
</script>
</body>
</html>