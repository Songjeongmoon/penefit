<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <style>
      body {
        background-color: #202020;
      }
      #container {
        position: apsolute;
        width: 100%;
        height: 100%;
      }
      #sideBar {
        display: inline-block;
        position: relative;
        width: 15%;
        height: 100vh;
        background-color: rgb(57, 57, 57);
      }
      #logo {
        font-weight: bold;
        font-size: 50px;
        text-align: center;
        height: 125px;
        width: 100%;
        display: inline-block;
        line-height: 130px;
        color: aqua;
      }
      #sideBox {
        border-top: 1px solid red;
      }
      .sideMenu {
        background-color: #232428;
        border-radius: 15px;
        text-align: center;
        width: 77%;
        height: 6vh;
        margin: 0 auto;
        margin-top: 20px;
        line-height: 6vh;
        transition: all 0.1s ease-in;
        cursor: pointer;
        font-size: 1.2em;
        font-weight: bold;
        color: rgb(81, 81, 81);
      }
      .sideMenu:hover {
        color: black;
        background-color: rgb(122, 225, 225);
      }
      #topBar {
        position: absolute;
        display: inline-block;
        width: 85%;
      }
      .subMenu {
        float: left;
        width: 11%;
        height: 3.5vh;
        background-color: rgb(57, 57, 57);
        color: rgb(81, 81, 81);
        margin: 20px 20px 0 20px;
        line-height: 3.5vh;
        text-align: center;
        border-radius: 7px;
        font-size: 16px;
        font-weight: bolder;
        cursor: pointer;
        transition: all 0.15s;
      }
      .subMenu1 {
        margin-left: 50px;
      }
      .subMenu:hover {
        background-color: white;
        transform: scale(1.03, 1.07);
        color: black;
      }
      .article {
        border-radius: 20px;
        position: absolute;
        left: 15%;
        top: 50px;
        display: inline-block;
        width: 85%;
        height: 95%;
        display: grid;
        grid-gap: 15px;
        justify-content: center;
        grid-template-columns: repeat(3, 30%);
        grid-template-rows: repeat(3, 30%);
      }

      .box {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgb(57, 57, 57);
        border-radius: 30px;
        margin-top: 30px;
      }
      #box1 {
        grid-column: 1 / 6;
        grid-row: 1/ 4;
      }
      #ul2 {
        display: none;
      }
      #ul3 {
        display: none;
      }
      #ul4 {
        display: none;
      }
    </style>
  </head>

  <body
    oncontextmenu="return false"
    onselectstart="return false"
    ondragstart="return false"
    onkeydown="return false"
  >
    <div id="container">
      <div id="sideBar">
        <div id="logo">PeNeFit</div>
        <div id="sideBox">
          <div id="sideMenu1" class="sideMenu">Member Management</div>
          <div id="sideMenu2" class="sideMenu">Board Management</div>
          <div id="sideMenu3" class="sideMenu">Class Management</div>
          <div id="sideMenu4" class="sideMenu">Null</div>
        </div>
      </div>

      <div id="topBar">
        <ul id="ul1">
          <li id="member" class="subMenu subMenu1">Member List</li>
          <li id="manager" class="subMenu">Manager List</li>
        </ul>

        <ul id="ul2">
          <li id="qna" class="subMenu subMenu1">QnA List</li>
          <li id="notice" class="subMenu">Notice List</li>
        </ul>

        <ul id="ul3">
          <li id="suggestion" class="subMenu subMenu1">Suggestion List</li>
          <li id="class" class="subMenu">Class List</li>
          <li id="review" class="subMenu">Review List</li>
        </ul>

        <ul id="ul4">
          <li class="subMenu subMenu1">Null</li>
          <li class="subMenu">Null</li>
          <li class="subMenu">Null</li>
          <li class="subMenu">Null</li>
          <li class="subMenu">Null</li>
        </ul>
      </div>

      <div id="memberArticle" class="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>

      <div id="managerArticle" class="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>

      <div id="qnaArticle" class="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>

      <div id="noticeArticle" class="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>

      <div id="suggestionArticle" class="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>

      <div id="classArticle" class="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>

      <div id="reviewArticle" class="article">
        <div id="box11" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>
    </div>

    <script>
      // SubMenu Display
      $("#sideMenu1").click(() => {
        $("#ul1").css("display", "block");
        $("#ul2").css("display", "none");
        $("#ul3").css("display", "none");
        $("#ul4").css("display", "none");
      });
      $("#sideMenu2").click(() => {
        $("#ul1").css("display", "none");
        $("#ul2").css("display", "block");
        $("#ul3").css("display", "none");
        $("#ul4").css("display", "none");
      });
      $("#sideMenu3").click(() => {
        $("#ul1").css("display", "none");
        $("#ul2").css("display", "none");
        $("#ul3").css("display", "block");
        $("#ul4").css("display", "none");
      });
      $("#sideMenu4").click(() => {
        $("#ul1").css("display", "none");
        $("#ul2").css("display", "none");
        $("#ul3").css("display", "none");
        $("#ul4").css("display", "block");
      });

      // Article Display
      $("#member").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
      $("#manager").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
      $("#qna").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
      $("#notice").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
      $("#suggestion").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
      $("#class").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
      $("#review").click(() => {
        $("member").css("display", "none");
        $("manager").css("display", "none");
        $("qna").css("display", "none");
        $("notice").css("display", "none");
        $("suggestion").css("display", "none");
        $("class").css("display", "none");
        $("review").css("display", "none");
      });
    </script>
</body>

</html>