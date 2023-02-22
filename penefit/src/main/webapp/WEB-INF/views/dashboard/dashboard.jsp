<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
     <script
      src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/css/reset.css" />
    <style>
      body {
        background-color: #232428;
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
        background-color: rgb(0, 0, 0);
      }
      #logo {
        height: 125px;
        width: 100%;
        display: inline-block;
      }
      #sideBox {
        border-top: 1px solid red;
      }
      .sideMenu {
        background-color: rgba(0, 0, 0, 0.573);
        border-radius: 15px;
        text-align: center;
        width: 77%;
        height: 70px;
        margin: 0 auto;
        margin-top: 20px;
        line-height: 80px;
        transition: all 0.1s ease-in;
        cursor: pointer;
        font-size: 23px;
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
      #topBar > ul {
        display: flex;
        flex-direction: row;
      }
      .subMenu {
        width: 180px;
        height: 40px;
        background-color: rgba(0, 0, 0, 0.573);
        color: rgb(81, 81, 81);
        margin: 20px 20px 0 20px;
        line-height: 43px;
        text-align: center;
        border-radius: 7px;
        font-size: 18px;
        font-weight: bolder;
        cursor: pointer;
        transition: all 0.15s;
      }
      #subMenu1 {
        margin-left: 100px;
      }
      .subMenu:hover {
        background-color: white;
        transform: scale(1.03, 1.07);
        color: black;
      }
      #article {
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
        grid-template-rows: repeat(3, 370px);
      }

      .box {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgb(255, 255, 255);
        border-radius: 30px;
        margin-top: 30px;
      }
      #box1 {
        grid-column: 1 / 3;
        grid-row: 1/ 3;
      }
    </style>
</head>

<body>
    <div id="container">
      <div id="sideBar">
        <div id="logo">img</div>
        <div id="sideBox">
          <div class="sideMenu">Notice</div>
          <div class="sideMenu">InfoSelector</div>
          <div class="sideMenu">ClassManager</div>
          <div class="sideMenu">AdmitSong</div>
        </div>
      </div>

      <div id="topBar">
        <ul>
          <li id="subMenu1" class="subMenu">Suggestion</li>
          <li class="subMenu">Class</li>
          <li class="subMenu">Product</li>
          <li class="subMenu">User</li>
          <li class="subMenu">Infomation</li>
        </ul>
      </div>

      <div id="article">
        <div id="box1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
      </div>
    </div>

  </body>

</html>