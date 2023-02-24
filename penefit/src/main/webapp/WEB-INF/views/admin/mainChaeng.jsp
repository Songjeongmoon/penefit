<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대시보드</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/reset.css" />
<style>
@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'ChosunGu';
	background-color: #F7F7F7;
}

a {
	text-decoration: none;
	color: black;
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
	background-color: #1C2739;
}

#logo {
	font-weight: bold;
	font-size: 50px;
	text-align: center;
	height: 125px;
	width: 100%;
	display: inline-block;
	line-height: 130px;
	color: white;
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
	color: white;
	box-shadow: 1px 1px 1px 1px gray;
}

.sideMenu:hover {
	color: black;
	background-color: #AACD6E;
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
	color: white;
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
	color: white;
}

.subMenu:hover {
	background-color: #AACD6E;
	transform: scale(1.03, 1.07);
	color: black;
	box-shadow: 2px 2px 2px 2px gray;
}

.article {
	border-radius: 20px;
	position: absolute;
	left: 15%;
	top: 50px;
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
	flex-direction: column;
	align-items: flex-start;
	background-color: #F7F7F7;
	border-radius: 7px;
	margin-top: 30px;
	color: black;
	background-color: white;
	box-shadow: 2px 2px 2px 2px gray;
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

#memberArticle {
	
}

#managerArticle {
	display: none;
}

#qnaArticle {
	display: none;
}

#noticeArticle {
	display: none;
}

#suggestionArticle {
	display: none;
}

#classArticle {
	display: none;
}

#reviewArticle {
	display: none;
}

.subtitle {
	background-color: black;
	width: 100%;
	border-radius: 7px;
	height: 30px;
	line-height: 30px;
	margin-bottom: 20px;
	border-radius: 7px 7px 0 0;
	color: white;
	font-weight: bold;
}

#qnaDetailTbl tr {
	height: 30px;
}

#qnabox1 {
	grid-column: 1/3;
}

#spendtime {
	font-size: 40px;
	font-family: 'SBAggroB';
}

#qnabox2 {
	grid-row: 1/3;
	grid-column: 3/4;
}

#qnabox3 {
	grid-column: 1/3;
}
#reviewbox1 {
	grid-column: 1/3;
}

#reviewbox2 {
	grid-row: 1/3;
	grid-column: 3/4;
}

#reviewbox3 {
	grid-column: 1/3;
}



.outer {
	position: absolute;
	left: 8%;
	bottom: 10%;
	width: 300px;
	height: 20px;
	border-radius: 10px;
	background-color: #F7F7F7;;
}

.inner {
	position: absolute;
	left: 8%;
	bottom: 10%;
	width: 120px;;
	height: 20px;
	border-radius: 10px;
	background-color: blue;
}

#persent {
	font-family: 'SBAggroB';
	margin-top: 20px;
	font-size: 50px;
	position: absolute;
	bottom: 15%;
	left: 14%;
}

.pie-chart1 {
	position: absolute;
	left: 70%; display : inline-block;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	transition: 0.3s;
	display: inline-block;
}
</style>
</head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<div id="container">
		<div id="sideBar">
			<div id="logo">Penefit</div>
			<div id="sideBox">
				<div id="sideMenu1" class="sideMenu">Member</div>
				<div id="sideMenu2" class="sideMenu">Board</div>
				<div id="sideMenu3" class="sideMenu">Class</div>
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
			<div class="box" id="qnabox1">
				<div class="subtitle">&nbsp;&nbsp;신규글</div>
				<div class="content">
					<table style="width: 600px; text-align: center; padding-left: 20px;">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
						<tbody id="qnaNewTbl"></tbody>
					</table>
				</div>
			</div>
			<div class="box" id="qnabox2">
				<div class="subtitle">&nbsp;&nbsp;상세보기</div>
				<div class="content">
					<table id="qnaDetailTbl">
						<tbody id="qnaDetailTbody"></tbody>
					</table>
				</div>
			</div>
			<div class="box" id="qnabox3">
				<div class="subtitle">&nbsp;&nbsp;전체글</div>
				<div class="content">
					<table style="width: 600px; text-align: center; padding-left: 20px;">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
						<tbody id="qnaAllTbl"></tbody>
					</table>
				</div>


			</div>
			<div class="box" id="qnabox4">
				<div class="subtitle">&nbsp;&nbsp;답변율</div>
				<div class="content" id="chartContent">
					<h2 id="persent"></h2>
					<div class="outer"></div>
					<div class="inner"></div>

				</div>

			</div>
			<div class="box" id="qnabox5">
				<div class="subtitle">&nbsp;&nbsp;평균답변속도</div>
				<div class="content" style="margin: 0 auto; position: relative; top: 25px;">
					<h2 id="spendtime"></h2>
				</div>

			</div>
			<div class="box" id="qnabox6">
				<div class="subtitle">&nbsp;&nbsp;문의타입</div>
				<div class="content">
					<h2 id="qnaType"></h2>
					<div class="pie-chart1"></div>
				</div>

			</div>
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
			<div class="box" id="reviewbox1">
				<div class="subtitle">&nbsp;&nbsp;신규리뷰</div>
				<div class="content">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>내용</th>
								<th>점수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="reviewNewTbl"></tbody>
					</table>
				
				
				</div>
			</div>
			<div class="box" id="reviewbox2">
				<div class="subtitle">&nbsp;&nbsp;리뷰상세보기</div>
				<div class="content">


				</div>
			</div>
			<div class="box" id="reviewbox3">
				<div class="subtitle">&nbsp;&nbsp;전체리뷰</div>
				<div class="content">


				</div>


			</div>
			<div class="box" id="reviewbox4">
				<div class="subtitle">&nbsp;&nbsp;금주의 최고평점강의</div>
				<div class="content" id="chartContent">

				</div>

			</div>
			<div class="box" id="reviewbox5">
				<div class="subtitle">&nbsp;&nbsp;금주의 최저평점강의</div>
				<div class="content"">
				
				
				</div>

			</div>
			<div class="box" id="reviewbox6">
				<div class="subtitle">&nbsp;&nbsp;리뷰등록률</div>
				<div class="content">
				
				
				</div>

			</div>
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
        $("#memberArticle").css("display", "grid");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#manager").click(() => {
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "grid");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#qna").click(() => {
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "grid");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
        QnaReplyRate();
        qnaLoadAll()
        qnaLoadNew()
        spendtime();
        qnaType();
      });
      $("#notice").click(() => {
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "grid");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#suggestion").click(() => {
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "grid");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#class").click(() => {
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "grid");
        $("#reviewArticle").css("display", "none");
      });
      $("#review").click(() => {
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "grid");
      });
      
      $(document).on("click","#qnaReplyBtn",function(evt){
    	  let qnaNum = evt.target.parentElement.parentElement.parentElement.children[0].children[1].innerText;
    	  let content = evt.target.parentElement.parentElement.parentElement.children[5].children[1].children[0].value;
    	  let adminid="${member_id}";
    	  let obj={
    			 "qnaNum" : qnaNum,
    			  "content" : content,
    			  "adminid" : adminid
    	  }
    	  let postdata = JSON.stringify(obj);
    	  
    	  
    	  
    	  //답변 등록하기
    	  $.ajax({
    		method : "post",
    		url : "/admin/qnaReplyvalue", 
    		data : {
    			"qnaNum" : qnaNum,
  			 	 "content" : content,
  			 	 "adminid" : adminid
    		}, 
    		success:function(data){
    			qnaLoadAll();
    			qnaLoadNew();
    			QnaReplyRate();
    			spendtime();
    			
    		},
    		error : function(){
    			alert("error");
    		},
    		complete : function(){
    			QnaReplyDetail(qnaNum);
    		}
    	  });
    	  
      })
      //전체 qna 리스트
      function qnaLoadAll(){
    	  $("#qnaAllTbl").empty();
    	  $.ajax({
      		method : "get",
      		url : "/admin/qnaLoadAll", 
      		dataType: 'json',
      		success:function(data){
      			for(let i = 0; i < data.length; i++) {
	      			$("#qnaAllTbl").append(
								"<tr><td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_num+"</a></td>"
								+"<td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_title+"</a></td>"
								+"<td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_status+"</a></td>"
								+"<td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_regdate+"</a></td>"
							+"</tr>");
      			}
      		},
      		error : function(){
      			alert("error");
      		}
      	  })
      }
      
    //신규 qna 리스트
      function qnaLoadNew(){
    	  $("#qnaNewTbl").empty();
    	  $.ajax({
      		method : "get",
      		url : "/admin/qnaLoadNew", 
      		dataType: 'JSON',
      		success:function(data){
      			for(let i = 0; i < data.length; i++) {
	      			$("#qnaNewTbl").append(
								"<tr><td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_num+"</a></td>"
								+"<td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_title+"</a></td>"
								+"<td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_status+"</a></td>"
								+"<td><a onclick='QnaReplyDetail("+data[i].qna_num+")'>"+data[i].qna_regdate+"</a></td>"
							+"</tr>");
      			}
      		},
      		error : function(){
      			alert("error");
      		}
      	  })
      }
    
    
      
      //상세보기
      function QnaReplyDetail(qnaNum) {
    	  const xhttp = new XMLHttpRequest();
    	  xhttp.onload = function() {
    	    let data = this.responseText;
    	    let obj = JSON.parse(data);
    	    let msg;
    	    if(obj.qna_status=='답변대기'){
    	    		msg = "<input type='button' id='qnaReplyBtn' value='답변등록' >";
    	    }else{
    	    	msg = "<input type='button' value='답변완료'>";
    	    	
    	    }
    	    if(obj.reply==null){
    	    	replyMsg = "";
    	    }else{
    	    	replyMsg = obj.reply;
    	    }    	    
    	    $("#qnaDetailTbody").html(
    	    	"<tr><th style='width: 200px;'>Qna번호</th><td style='width: 60%;'>"+obj.qna_num+"</td></tr>"
    	    	+"<tr><th>제목</th><td>"+obj.qna_title+"</td></tr>"
    	    	+"<tr><th>내용</th><td>"+obj.qna_content+"</td></tr>"
    	    	+"<tr><th>작성자</th><td>"+obj.member_id+"</td></tr>"
    	    	+"<tr><th>등록일</th><td>"+obj.qna_regdate+"</td></tr>"
    	    	+"<tr><th id='th'>답변</th><td><textarea name='adminReply'>"+replyMsg+"</textarea></td></tr>"
    	    	+"<tr><td  id='btn' colspan='2'>"+msg+"</td></tr>");
    	    
    	    $("#qnaReplyBtn").css({
    	    		"width" : "100px",
    	    		"border" : "none",
    	    		"border-radius" : "3px", 
    	    		"backgroundColor":"#1C2739", 
    	    		"color" : "white"    	    		
    	    });
    	    $("#btn").css("text-align" ,"center");
    	    $("#btn").css("marging-top" ,"20px;");
    	    $("textarea").css("height","100px");
    	  }
    	  xhttp.open("GET", "adminQnaDetail?qnaNum=" + qnaNum, true);
    	  xhttp.send();
    	}
      
      
      
      //답변율
      
       function QnaReplyRate() {
    	  const xhttp = new XMLHttpRequest();
    	  xhttp.onload = function() {
    	    let data = this.responseText;
    	    $("#persent").text(Math.floor(data) + " %");
    	    let w = 300*data*0.01;
    	    $(".inner").css("width",w);
    	  }
    	  xhttp.open("GET", "/admin/qnaReplyRate", true);
    	  xhttp.send();
    	}
      
     //평균답변시간
       
       function spendtime() {
    	  const xhttp = new XMLHttpRequest();
    	  xhttp.onload = function() {
    	    let data = this.responseText;
    	    const temp1 = data * 10
    	    const temp2 = Math.ceil(temp1)/10;
    	    $("#spendtime").text(temp2 + " 일");
    	  }
    	  xhttp.open("GET", "/admin/spendtime", true);
    	  xhttp.send();
    	}
     
     //문의타입 종류
     function qnaType() {
   	  const xhttp = new XMLHttpRequest();
   	  xhttp.onload = function() {
   	    let data = this.responseText;
   	    let obj = JSON.parse(data);
		alert(data);
		let sum=0;
		for(let i =0;i<obj.length;i++){
			sum = sum + parseInt(obj[i].qty);
		}		
		alert(sum)
   	  }
   	  xhttp.open("GET", "/admin/qnaType", true);
   	  xhttp.send();
   	}
     
     
     //차트만들기
	$(window).ready(function(){
    	var i=1;
    	var func1 = setInterval(function(){
    	    if(i<26){
	            color1(i);
	            i++;
    	    } else if(i<70){
	            color2(i);
	            i++;
	        } else if(i<101){
	            color3(i);
	            i++;
	        } else {
	            clearInterval(func1);
	        }
  	  },10);
	});

	
	function color1(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	    
	}
	function color2(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	function color3(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% 70%, #21f3d6 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}

	
	//=============================리뷰=================================
		//신규리뷰
		//신규 qna 리스트
      function reviewLoadNew(){
    	  $("#reviewNewTbl").empty();
    	  $.ajax({
      		method : "get",
      		url : "/admin/reviewLoadNew", 
      		dataType: 'JSON',
      		success:function(data){
      			for(let i = 0; i < data.length; i++) {
      				$("#reviewNewTbl").append(
      						"<tr><td><a onclick='reviewDetail("+data[i].review_num+")'>"+data[i].review_num+"</a></td>"
							+"<td><a onclick='reviewDetail("+data[i].review_num+")'>"+data[i].member_id"</a></td>"
							+"<td><a onclick='reviewDetail("+data[i].review_num+")'>"+data[i].review_content+"</a></td>"
							+"<td><a onclick='reviewDetail("+data[i].review_num+")'>"+data[i].score+"</a></td>"
							+"<td><a onclick='reviewDetail("+data[i].review_num+")'>"+data[i].review_regdate+"</a></td>"
						+"</tr>");
      				
      			}
      		},
      		error : function(){
      			alert("error");
      		}
      	  })
      }
		
     </script>
</body>

</html>