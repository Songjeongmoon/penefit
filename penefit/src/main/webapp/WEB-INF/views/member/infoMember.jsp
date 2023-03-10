<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<style>
.mypageTitle {
	text-align: center;
	margin-bottom: 10PX;
}

.meminfo {
	width: 550px;
	height: 800px;
	margin: 0 auto;
	margin-top: 30px;
	border-radius: 7px;
	padding: 10px;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
}

.mem_info {
	margin-top: 60px;
	margin-left: 110px;
}

input[type=text] {
	width: 300px;
	height: 40px;
	font-size: 14px;
	margin-top: 5px;
	margin-bottom: 10px;
}

#modal_history {
	position: absolute;
	width: 450px;
	height: 600px;
	border: 2px solid black;
	background-color: white;
	z-index: 300;
	border-radius: 10px;
	display: inline-block;
	padding: 20px;
	top: 20%;
	left: 38%;
}

.selectBox {
	display: none;
	text-align: center;
	margin-top: 10px;
	position: absolute;
	left: 100px;
}

#selectClass {
	height: 40px;
	display: none;
	position: absolute;
}

#gotoReviewForm {
	height: 40px;
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 90px;
	position: absolute;
	left: 200px;
}

#modal_history_case, #customerModalCase {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.8);
	z-index: 300;
	display: none;
}

#modal_qna_case {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	display: none;
	background: rgba(0, 0, 0, 0.8);
	z-index: 600;
}

#history_content th {
	background-color: #DBD5CB;
	height: 35px;
}

#history_content {
	margin: 0 auto;
	text-align: center;
	width: 1000px;
}

#history_content tr {
	height: 40px;
}

#modal_qna {
	position: absolute;
	width: 450px;
	height: 500px;
	border: 2px solid black;
	background-color: white;
	z-index: 300;
	border-radius: 10px;
	display: inline-block;
	padding: 20px;
	left: 40%;
	top: 20%;
}

input[type='button'] {
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
	width: 130px;
	height: 40px;
	line-height: 40px;
	font-weight: bold;
	margin-top: 10px;
}

#delMemBtn {
	background-color: gray;
}

h2 {
	text-align: center;
	font-size: 35px;
	margin-bottom: 30px;
}

table {
	margin: 0 auto;
	border: none;
}

h4 {
	text-align: center;
	font-weight: bold;
	font-size: 35px;
	margin-bottom: 30px;
}

#modalClose {
	position: absolute;
	background-color: rgba(0, 0, 0, 0);
	border: none;
	left: 450px;
	bottom: 590px;
	font-size: 40px;
}

#cancelbtn, #writebtn, #closebtn {
	width: 150px;
	height: 40px;
	background-color: #75BD43;
	border-radius: 7px;
	border: none;
	box-shadow: 2px 2px 2px 2px #DBD5CB;
}

#closebtn {
	position: absolute;
	left: 160px;
	bottom: 30px;
}

#history_detail tr {
	height: 35px;
}

#history_detail th {
	width: 100px;
}

.aside_menu:hover {
	cursor: pointer;
}

#sugTbl {
	width: 900px;
	text-align: center;
}

#sugTbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

#myclasstbl {
	width: 900px;
}

#myclasstbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

.mypageTitle {
	text-align: center;
	font-size: 35px;
	margin-bottom: 30px;
}

#myclasstbl {
	text-align: center;
}

#reviewTbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

#reviewTbl {
	text-align: center;
}

#qnatbl {
	width: 900px;
	text-align: center;
}

#qnatbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

#classMemberTbl th {
	background-color: #DBD5CB;
	height: 35px;
	margin-top: 20px;
}

#qna_reply, #qna_detail {
	width: 400px;
}

#qna_reply th {
	text-align: center;
}

#qna_detail th {
	text-align: center;
}

#qna_reply {
	text-align: left;
}

#qna_reply tr:nth-of-type(2) {
	text-align: left;
	height: 150px;
	overflow: scroll;
}

.pageBtn {
	width: 30px;
	margin: 0 3px;
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

#history_backBtn {
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

#history_frontBtn {
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

#customerModal {
	position: absolute;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 600px;
	height: 800px;
	left: 50%; top : 50%;
	z-index: 400;
	padding: 20px;
	top: 50%;
	border-radius: 10px;
}

#infoCloseBtn {
	display: inline-block;
	position: relative;
	cursor: pointer;
	z-index: 1;
}

.myClassInfo {
	cursor: pointer;
}

#classListBackBtn, #pageBtnBox, #classListFrontBtn, .pageBtn {
	display: inline-block
}
#delMemModal{
	display: none;
	border-radius: 10px;
	border: 2px solid black;
	position: absolute;
	width: 600px;
	height: 100px;
	background-color: white;
	left: 50%;
	transform:translateX(-50%);
	z-index: 1000;
	
}
#delMemberBtn{
	border: 1px solid black;
	background-color: white;
	border-radius: 5px;
	width: 50px;
	height: 30px;
	color: red;
	transition: all ease-in 0.05s;
}
#delMemberBtn:hover{
	transform: scale(1.1, 1.1);
	background-color: blue;
}

</style>
</head>

<body>

	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">???????????????</li>
					<li class="aside_menu" id="myinfoLabel">??? ??????</li>
					<li class="aside_menu" id="myHistoryLabel"><a href="#">????????????</a></li>
					<li class="aside_menu" id="myReviewLabel"><a href="#">????????????</a></li>
					<li class="aside_menu" id="aside_menu_btn">?????? ?????????
						<div id="aside_submenu">
							<p id="mySuggestLabel">&nbsp;&nbsp;????????????</p>
							<p>
							<p id="myClassLabel">&nbsp;&nbsp;???????????????</p>
							<p>
							<p>&nbsp;&nbsp;???????</p>
						</div>
					</li>
					<li class="aside_menu" id="myInquiryLabel">?????? ????????????</li>
				</ul>

			</aside>
			<div class="content" id="myinfo">
				<h2>??? ?????? ??????</h2>
				<div class="meminfo">
					<div class="mem_info">
						<div id="mem_maintitle"></div>


						<div id="mem_id">
							?????????<br> <input type="text" name="member_id" value="${member_id }" readonly>
						</div>
						<div id="mem_pw">
							????????????<br> <input type="text" name="member_pw" value="${memberinfo.member_pw }">
						</div>
						<div id="mem_name">
							??????<br> <input type="text" name="member_name" value="${memberinfo.member_name }" readonly>
						</div>
						<div id="mem_tel">
							????????????<br> <input type="text" name="member_tel" value="${memberinfo.member_tel }">
						</div>
						<div id="postnum">
							????????????<br> <input type="text" name="postnum" value="${memberinfo.postnum }" /> <input type="button" onclick="execution_daum_address()" value="????????????" />
						</div>
						<div id="mem_address">
							??????<br> <input type="text" name="member_address" value="${memberinfo.member_address }">
						</div>
						<div id="mem_addressdetail">
							????????????<br> <input type="text" name="member_addressdetail" value="${memberinfo.member_addressdetail }" />
						</div>
						<div id="mem_grade">
							<br> <input type="hidden" name="member_grade" value="${memberinfo.member_grade }">
						</div>

						<div id="mem_buttons">
							<input type="button" name="mem_update" value="????????????" onclick="UpdateMem()"> <input type="button" name="mem_delete" value="????????????" id="delMemBtn" onclick="delMem()">
						</div>
					</div>
				</div>
			</div>
			<div id="delMemModal">
				<div>?????? ?????????????????? ???????????? ???????????? ??? ??????????????? ???????????????.</div>
				<input type = "text" id ="delMemCheck">
				<button id="delMemberBtn">??????</button>
			</div>
			<div class="content" id="purchaseHistory">
				<h2 class="mypageTitle">????????????</h2>
				<!-- ?????????????????? ?????? -->
				<div id="modal_history_case">
					<div id="modal_history">
						<h4>??????????????????</h4>
						<button type="button" id="modalClose">???</button>

						<table id="history_detail">
							<!-- ???????????? ???????????? -->
						</table>
						<div style="text-align: center; margin-top: 20px;">
							<button type="button" id="cancelbtn">??????????????????</button>
							<button type="button" id="writebtn">??????</button>
						</div>
						<div class="selectBox">
							<select id="selectClass">

							</select>
							<button type="button" id="gotoReviewForm">??????</button>
						</div>
					</div>
				</div>

				<!-- ??????????????? -->
				<table id="history_content">
					<thead>
						<tr>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>??????</th>
						</tr>
					</thead>
					<tbody id="historyTbody">
						<!-- ??????????????? -->
					</tbody>
				</table>
				<br>
				<div id="page" style="text-align: center;">
					<input type="hidden" name="history_startNum" value="1">
					<button type="button" id="history_backBtn" style="width: 40px;">??????</button>
					<div id="history_pages" style="display: inline;"></div>
					<button type="button" id="history_frontBtn" style="width: 40px;">??????</button>
				</div>

			</div>

			<div class="content" id="myReview">
				<h2>?????? ??????</h2>
				<table id="reviewTbl" style="width: 800px;">
					<thead>
						<tr>
							<th>?????????</th>
							<th colspan="2">???????????????</th>
							<th>??????</th>
						</tr>
					</thead>

					<tbody id="reviewBody"></tbody>

				</table>
				<div id="page" style="text-align: center;">
					<input type="hidden" name="review_startNum" value="1">
					<button type="button" id="review_backBtn" style="width: 40px;">??????</button>
					<div id="review_pages" style="display: inline;"></div>
					<button type="button" id="review_frontBtn" style="width: 40px;">??????</button>
				</div>

			</div>

			<div class="content" id="myClassSuggest">
				<h2 class="mypageTitle">?????????????????????</h2>
				<table id="sugTbl">
					<thead>
						<tr>
							<th>??????</th>
							<th style="width: 300px;">??????</th>
							<th>??????</th>
							<th>?????????</th>
							<th>?????????</th>
							<th>??????</th>
							<th>?????????</th>
						</tr>
					</thead>

					<tbody id="suggestionBody"></tbody>

				</table>
				<div id="page" style="text-align: center;">
					<input type="hidden" name="suggest_startNum" value="1">
					<button type="button" id="suggest_backBtn" style="width: 40px;">??????</button>
					<div id="suggest_pages" style="display: inline;"></div>
					<button type="button" id="suggest_frontBtn" style="width: 40px;">??????</button>
				</div>
			</div>
			<div class="content" id="myClassList">
				<h2 class="mypageTitle">???????????????</h2>
				<table id="myclasstbl">
					<thead>
						<tr>
							<th style="width: 500px">??????</th>
							<th>??????</th>
							<th>????????????</th>
							<th>??????</th>
						</tr>
					</thead>

					<tbody id="myClassListBody"></tbody>

				</table>
				<input type="hidden" name="classListStartNum" value="1"> <input type="hidden" name="classListMaxPage">
				<div style="text-align: center;">
					<div id="classListBackBtn">??????</div>
					<div id="pageBtnBox"></div>
					<div id="classListFrontBtn">??????</div>
				</div>
			</div>
			<div class="content" id="myInquiry">
				<h2 class="mypageTitle">????????????</h2>
				<table id="qnatbl">
					<thead>
						<tr>
							<th>????????????</th>
							<th>?????????</th>
							<th>??????</th>
							<th>?????????</th>
						</tr>
					</thead>
					<tbody id="qnaTbody">
						<!--  -->
					</tbody>
				</table>
				<div id="page" style="text-align: center;">
					<input type="hidden" name="qna_startNum" value="1">
					<button type="button" id="qna_backBtn" style="width: 40px;">??????</button>
					<div id="qna_pages" style="display: inline;"></div>
					<button type="button" id="qna_frontBtn" style="width: 40px;">??????</button>
				</div>
				<div id="modal_qna_case">
					<div id="modal_qna">
						<h4>??????????????????</h4>
						<table id="qna_detail">
							<!-- ?????? ???????????? -->
						</table>
						<table id="qna_reply">
							<!-- ?????? ?????? -->
							<tr>
								<th>?????? ??????</th>
							</tr>
							<tr>
								<td id="qna_reply_content" style="height: 200px;"></td>
							</tr>
						</table>
						<button type="button" id="closebtn">?????? ????????????</button>

					</div>
				</div>

			</div>
		</section>
	</div>

	<div id="customerModalCase">
		<div id="customerModal">
			<div id="infoCloseBtn" style="float: right;">[X]</div>
			<h3 style="text-align: center; font-size: 35px;">????????????</h3>
			<br>
			<table style="width: 500px;" id="classMemberTbl">
				<thead>
					<tr>
						<th>?????????</th>
						<th>??????</th>
						<th>????????????</th>
					</tr>
				</thead>
				<tbody id="customerInfo"></tbody>

			</table>
		</div>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
               /* ?????? ?????? ?????? */
               function execution_daum_address() {

                  new daum.Postcode({
                     oncomplete: function (data) {
                        // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ???????????????.
                        // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                        // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                        var addr = ''; // ?????? ??????
                        var extraAddr = ''; // ???????????? ??????

                        //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                        if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                           addr = data.roadAddress;
                        } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                           addr = data.jibunAddress;
                        }

                        // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                        if (data.userSelectedType === 'R') {
                           // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                           // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                           if (data.bname !== '' && /[???|???|???]$/g.test(data.bname)) {
                              extraAddr += data.bname;
                           }
                           // ???????????? ??????, ??????????????? ?????? ????????????.
                           if (data.buildingName !== '' && data.apartment === 'Y') {
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                           }
                           // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                           if (extraAddr !== '') {
                              extraAddr = ' (' + extraAddr + ')';
                           }
                           // ???????????? ???????????? ???????????? ????????? ?????????
                           addr += extraAddr;

                        } else {
                           addr += ' ';
                        }

                        // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                        document.querySelector("input[name='postnum']").value = data.zonecode;
                        document.querySelector("input[name='member_address']").value = addr;

                        $("input[name='member_addressdetail']").attr("readonly", false);
                        $("input[name='member_addressdetail']").focus();

                     }
                  }).open();
               }


               $("#aside_menu_btn").mouseover(function () {
                  $("#aside_submenu").css("display", "block");
               });
               $("#aside_menu_btn").mouseout(function () {
                  $("#aside_submenu").css("display", "none");
               });
               //??????????????? ?????? div display ??????
               $(document).ready(function () {
                  $(".content:not(#myinfo)").css("display", "none");
                  $("#myinfo").css("display", "block");
               });
               $("#myinfoLabel").click(function () {
                  $(".content:not(#myinfo)").css("display", "none");
                  $("#myinfo").css("display", "block");
               });
               $("#myHistoryLabel").click(function () {
                  $(".content:not(#purchaseHistory)").css("display", "none");
                  $("#purchaseHistory").css("display", "block");
                  $("#modal_history_case").css("display", "none");
                  //???????????? ????????????
                  getHistory();
                  history_page();
               });
               $("#myInquiryLabel").click(function () {
                  $(".content:not(#myInquiry)").css("display", "none");
                  $("#myInquiry").css("display", "block");
                  qnaList();
                   qna_page();
               });
               $("#myReviewLabel").click(function () {
                  $(".content:not(#myReview)").css("display", "none");
                  $("#myReview").css("display", "block");
                  reviewList();
                   review_page() ;
               });
               $("#mySuggestLabel").click(function () {
                  $(".content:not(#myClassSuggest)").css("display", "none");
                  $("#myClassSuggest").css("display", "block");
                  suggestList();
                  suggest_page();
               });
               $("#myClassLabel").click(function () {
                  $(".content:not(#myClassList)").css("display", "none");
                  $("#myClassList").css("display", "block");
                  
               });



               function UpdateMem(){
                   const updateid= $("input[name='member_id']").val();
                   const updatepw= $("input[name='member_pw']").val();
                   const updatename= $("input[name='member_name']").val();
                   const updatetel= $("input[name='member_tel']").val();
                   const updatepostnum= $("input[name='postnum']").val();
                   const updateaddress= $("input[name='member_address']").val();
                   const updateaddressdetail= $("input[name='member_addressdetail']").val();
                   const updategrade= $("input[name='member_grade']").val();
                   
                   if(updateid == "" || updatepw == "" || updatename == "" || 
                		   updatetel == "" || updatepostnum == "" || updateaddress == "" || 
                		   updateaddressdetail == "" || updategrade == ""){
                	   alert("????????? ???????????????.");
                	   return false;
                   }
                   let member={
                     "member_id" : updateid,
                     "member_pw" : updatepw,
                     "member_name" : updatename,
                     "member_tel" : updatetel,
                     "postnum" : updatepostnum,
                     "member_address" : updateaddress,
                     "member_addressdetail" : updateaddressdetail,
                     "member_grade" : updategrade
                   }
                   $.ajax({
                      url: "/member/updateMember",
                      method: "PUT",
                      contentType: "application/json",
                      data : JSON.stringify(member),
                      success: (data) => {
                    	  alert(data);
                      },
                      error: () => {
                         alert("error");
                      }
                   });
                   
                    
                }

               function delMem() {
            	   $("#delMemModal").css("display", "block");
               }

               
               
               //???????????? ????????????
               function getHistory() {
                  $("#historyTbody").empty();
                  $("#history_backBtn").hide();
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     let data = this.responseText;
                     let list = JSON.parse(data);
                     for (let i = 0; i < list.length; i++) {
                        $("#historyTbody").append(
                           "<tr class='tr'><td><a href='#' class='modal_history'>" + list[i].buy_history_num + "</a></td>"
                           + "<td><a href='#' class='modal_history'>" + list[i].merchant_uid + "</a></td>"
                           + "<td><a href='#' class='modal_history'>" + list[i].buy_history_date + "</a></td>"
                           + "<td><a href='#' class='modal_history'>" + list[i].name + "</a></td>"
                           + "<td><a href='#' class='modal_history'>" + list[i].buy_history_current + "</a></td></tr>");

                     }
                     $("#historyTbody td").css("border-bottom", "thin solid #BBB09F").css("height","20px");
                     $("#historyTbody a").css("color", "black");
                     $("#historyTbody a").css("text-decoration", "none");
                  }
                  xhttp.open("GET", "/historyList?pageNum=1", true);
                  xhttp.send();

               }

               $(".content").on("click", function (event) {
            	   $("#historyTbody").removeAttr("style");
                  let e = event.target.className;
                  if (e == "pageBtn") {
                     let pageNum = event.target.textContent;

                     $.ajax({
                        url: "/historyList",
                        method: "get",
                        dataType: "json",
                        data: {
                           pageNum: pageNum,
                        },
                        success: (data) => {
                           $("#historyTbody").empty();
                           for (let i = 0; i < data.length; i++) {
                              $("#historyTbody").append(
                                 "<tr class='tr'><td><a href='#' class='modal_history'>" + data[i].buy_history_num + "</a></td>"
                                 + "<td><a href='#' class='modal_history'>" + data[i].merchant_uid + "</a></td>"
                                 + "<td><a href='#' class='modal_history'>" + data[i].buy_history_date + "</a></td>"
                                 + "<td><a href='#' class='modal_history'>" + data[i].name + "</a></td>"
                                 + "<td><a href='#' class='modal_history'>" + data[i].buy_history_current + "</a></td></tr>");
                              $("#historyTbody td").css("border-bottom", "thin solid #BBB09F").css("height","20px");
                              $("#historyTbody a").css("color", "black");
                              $("#historyTbody a").css("text-decoration", "none");
                           }
                        },
                        error: () => {
                           alert("Error [??????]");
                        }


                     })

                  }


               })

               $("#history_backBtn").click(() => {
                  $("#history_pages").empty();
                  let start = $("input[name=history_startNum]").val();
                  start = Number(start) - 5;
                  $("input[name=history_startNum]").val(start);

                  if (start < 1) {
                     start = 1;
                     $("input[name='history_startNum']").val(start);
                     $("#history_backBtn").css("display", "none");
                     
                  }
                  for (let i = start; i < start + 5; i++) {
                     if (i <= history_max()) {
                        $("#history_frontBtn").css("display", "inline-block");
                        $("#history_pages").append("<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>");

                     } else {
                        $("#history_frontBtn").css("display", "none");
                     }
                  }
               });


               function history_max() {
                  let maxPage;
                  $.ajax({
                     url: "/member/historymaxPage",
                     method: "get",
                     async: false,
                     success: function (data) {
                        maxPage = data;
                     },
                     error: function () {
                        alert("error!");
                     }
                  })
                  return maxPage;
               }
               
               function history_page() {
                  //ajax??? ????????????
				$("#history_pages").empty();
                  let maxPage = history_max();
                  //startnum ??? maxpage?????? ????????? ???????????? ???????????????
                  for (let startNum = 1; startNum < 6; startNum++) {
                     //?????? if???      else:??????????????? ???????????? display none
                     if (startNum < maxPage) {
                        $("#history_pages").append(
                           "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + startNum + "</button>"
                        )
                     } else {

                        $("#history_frontBtn").css("display", "none");

                     }
                  }


               }
               $("#history_frontBtn").click(() => {
                  $("#history_backBtn").show();
                  let start = $("input[name=history_startNum]").val();
                  start = Number(start) + 5;
                  $("input[name=startNum]").val(start);
                  let end = start+4;

                  if(end > history_max()){
                	  end=(history_max()+1);
                  }
                  
                  $("#history_pages").empty();
                  for (let i = start; i <end; i++) {

                     if (i < history_max()) {
                        $("#history_pages").append(
                           "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                        );
                     }
                     else {
                        $("#history_pages").append(
                              "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                           );
                        $("#history_frontBtn").css("display", "none");
                     }
                  }
                  $("#review_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#review_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
               });

               //??????????????? ????????? ?????????
               $(document).on("click", ".modal_history", function (evt) {
                  $("#modal_history_case").css("display", "block");
                  $(".content").css("z-index", "500");
                  let buy_history_num = evt.target.parentElement.parentElement.children[0].innerText;
                  getOneHistory(buy_history_num);
               });
               //?????? ???????????? ??????
               $("#modalClose").click(function () {
                  $("#modal_history_case").css("display", "none");
                  $(".content").css("z-index", "50");
                  $(".selectBox").css("display", "none");
                  $("#selectClass").css("display", "none");
               });
               //????????????-1
               $("#cancelbtn").click(function () {
                  let result = confirm("?????? ?????????????????????????");
                  if (result) {
                     if ($(".current").text() == "????????????") {
                        alert("?????? ?????? ???????????????.");
                        //??????function
                        let buy_history_num = $(".buy_history_num").val();
                        cancelClass(buy_history_num);
                        $("#modal_history_case").css("display", "none");
                        $(".content").css("z-index", "50");
                        $(".selectBox").css("display", "none");
                        $("#selectClass").css("display", "none");
                        getHistory();
                        history_page();
                     } else if ($(".current").text() == "????????????") {
                        alert("?????? ????????? ???????????????.");
                     } else if ($(".current").text() == "??????????????????") {
                        alert("???????????? ?????? ???????????? ???????????????.");
                     } else {
                        let msg;
                        if ($(".current").text() == "????????????") {
                           msg = "?????? : ????????????\n";
                        } else {
                           msg = "?????? : ????????????\n";
                        }
                        alert(msg + "????????? ????????? ??? ???????????????. ");
                     }

                  }
               });

               //?????????????????? ????????????
               function getOneHistory(buy_history_num) {
                  $("#history_detail").empty();
                  $("#history_backBtn").css("display", "none");
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     let data = this.responseText;
                     let json = JSON.parse(data);

                     $("#history_detail").html("<tr><th>????????????</th><td class='merchant_uid'>" + json.merchant_uid + "</td></tr>"
                        + "<input type ='hidden' class = 'buy_history_num' value=" + json.buy_history_num + ">"
                        + "<input type ='hidden' class = 'class_arr' value=" + json.class_arr + ">"
                        + "<tr><th>????????????</th><td>" + json.pay_method + "</td></tr>"
                        + "<tr><th>????????????</th><td>" + json.amount + " ???</td></tr>"
                        + "<tr><th>????????????</th><td>" + json.buy_history_date + "</td></tr>"
                        + "<tr><th>????????????</th><td>" + json.buyer_name + "</td></tr>"
                        + "<tr><th>?????????</th><td>" + json.buyer_email + "</td></tr>"
                        + "<tr><th>?????????</th><td>" + json.buyer_tel + "</td></tr>"
                        + "<tr><th>??????</th><td>" + json.buyer_addr + "</td></tr>"
                        + "<tr><th>??????</th><td class='current'>" + json.buy_history_current + "</td></tr>"
                        + "<tr><th>??????</th><td>" + json.name + "</td></tr>"
                     );

                  }

                  xhttp.open("GET", "/OneHistory/buy_history_num/" + buy_history_num, true);
                  xhttp.send();

               }

               
               function history_max() {
                  let maxPage;
                  $.ajax({
                     url: "/member/historymaxPage",
                     method: "get",
                     async: false,
                     success: function (data) {
                        maxPage = data;
                     },
                     error: function () {
                        alert("error!");
                     }
                  })
                  return maxPage;
               }
               
               
               //????????????
               
               function reviewList() {
                  $("#reviewBody").empty();
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     let data = this.responseText;
                     let json = JSON.parse(data);
                     for (let i = 0; i < json.length; i++) {
                        $("#reviewBody").append("<tr>"
                           + "<td style='width : 100px;'>" + json[i].review_regdate + "</td>"
                           + "<td><a href='/class/class-detail?class_code=" + json[i].class_code + "'><img src='../images/" + json[i].review_photo + "' style='width:100px; height:100px;'></a></td>"
                           + "<td><a href='/class/class-detail?class_code=" + json[i].class_code + "'>" + json[i].class_subject + "</a></td>"
                           + "<td>" + json[i].review_content + "</td><tr>");
                     }
                     $("td").css({
                        "border-bottom": "thin solid #BBB09F",
                     });
                     $("td:nth-of-type(4)").css({
                        "width": "300px",
                        "height": "100px",
                     });
                     $("a").css("color", "black");
                     $("a").css("text-decoration", "none");
                  }
                  xhttp.open("GET", "/myReviewList?pageNum=1", true);
                  xhttp.send();
               }

               
               
               

               $(".content").on("click", function (event) {
                  let e = event.target.className;
                  if (e == "pageBtn") {
                  $("#reviewBody").empty();
                     let pageNum = event.target.textContent;
                     $.ajax({
                        url: "/myReviewList",
                        method: "get",
                        dataType: "json",
                        data: {
                           pageNum: pageNum
                        },
                        success: (data) => {
                           
                           for (let i = 0; i < data.length; i++) {
                              $("#reviewBody").append("<tr>"
                                 + "<td style='width : 100px;'>" + data[i].review_regdate + "</td>"
                                 + "<td><a href='/class/class-detail?class_code=" + data[i].class_code + "'><img src='../images/" + data[i].review_photo + "' style='width:100px; height:100px;'></a></td>"
                                 + "<td><a href='/class/class-detail?class_code=" + data[i].class_code + "'>" + data[i].class_subject + "</a></td>"
                                 + "<td>" + data[i].review_content + "</td><tr>");
                           }
                           $("td").css({
                              "border-bottom": "thin solid #BBB09F",
                           });
                           $("td:nth-of-type(4)").css({
                              "width": "300px",
                              "height": "100px",
                           });
                           $("a").css("color", "black");
                           $("a").css("text-decoration", "none");
                        },
                        error: () => {
                           alert("Error [??????]");
                        }


                     })

                  }


               })


               function review_max() {
                  let maxPage;
                  $.ajax({
                     url: "/reviewmaxPage",
                     method: "get",
                     async: false,
                     success: function (data) {
                        maxPage = data;
                     },
                     error: function () {
                        alert("error!");
                     }
                  })
                  return maxPage;
               }
               
               function review_page() {
                  //ajax??? ????????????
                  $("#review_pages")
                  let start = $("input[name=review_startNum]").val();
                  let startNum = Number(start);
                  let maxPage = review_max();
                  let endPage = startNum+4;
                  
                  if(startNum == 1){
                     $("#review_backBtn").hide();
                  }
                  if(endPage > maxPage){
                     endPage=(maxPage+1);
                  }
                  if(maxPage < 6){
                	  $("#review_frontBtn").hide();
                   }
                  for (let i = startNum; i < endPage; i++) {
                     $("#review_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
                  $("#review_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#review_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })


               }
               //?????? ?????? ????????????
               $("#review_frontBtn").click(() => {
                  $("#review_backBtn").show();
                  $("#review_pages").empty();
                  let start = $("input[name=review_startNum]").val();
                  let startNum = Number(start) +5;
                  $("input[name=review_startNum]").val(startNum);
                  
                  let maxPage = review_max();

                  let endPage = startNum+5;
                     if(endPage>maxPage){
                        endPage=maxPage;
                        $("#review_frontBtn").hide();
                     }
                  for (let i = startNum; i < endPage+1; i++) {
                     
                     $("#review_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
                  $("#review_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#review_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
               });

               //?????? ?????? ????????????
               $("#review_backBtn").click(() => {
                  $("#review_frontBtn").show();
                  $("#review_pages").empty();
                  let start = $("input[name=review_startNum]").val();
                  let startNum = Number(start) -5;

                  
                  if(startNum == 1){
                     $("#review_backBtn").hide();
                  }
                  $("input[name=review_startNum]").val(startNum);
                  
                  
                  let maxPage = review_max();
                  let endPage = startNum+4;
                  
                  for (let i = startNum; i < endPage+1; i++) {
                     
                     $("#review_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
               });
               
               
               
               
               
               
               
               //????????????
               function cancelClass(buy_history_num) {
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     this.responseText;
                  }
                  xhttp.open("DELETE", "/noClass/buy_history_num/" + buy_history_num, true);
                  xhttp.send();
               }
               let result;
               //????????? ?????? ??????
               $("#writebtn").click(function () {
                  $("#selectClass").empty();
                  $(".selectBox").css("display", "block");
                  $("#selectClass").css("display", "block");
                  let buy_history_num = $(".buy_history_num").val();
                  let class_arr = $(".class_arr").val();
                  let class_buy = class_arr.split("-");

                  for (let i = 0; i < class_buy.length - 1; i++) {
                     if (reviewCheck(buy_history_num, class_buy[i]) == 0) {
                        $("#selectClass").append("<option value='" + class_buy[i] + "'> " + class_buy[i] + "</option>");
                     }
                  }
               });


               //??????????????????


               function reviewCheck(buy_history_num, class_code) {

                  $.ajax({

                     method: "Get",
                     url: "/classAndReviewList",
                     async: false,
                     data: {
                        "buy_history_num": buy_history_num,
                        "class_code": class_code
                     },
                     success: function (data) {
                        result = data;
                     },
                     error: function () {
                        alert("??????");
                     }

                  });

                  return result;
               }

               //??????????????????

               $("#gotoReviewForm").click(function () {
                  let class_code = $(".selectBox option:selected").val();
                  let buy_history_num = $(".buy_history_num").val();
                  location.href = "/class/reviewForm?class_code=" + class_code + "&buy_history_num=" + buy_history_num;

               });


               //qna????????? ????????????
               function qnaList() {
                  $("#qnaTbody").empty();
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     let data = this.responseText;
                     let json = JSON.parse(data);
                     for (let i = 0; i < json.length; i++) {
                        $("#qnaTbody").append("<tr><td class='viewReply'>" + json[i].qna_num + "</td>"
                           + "<td class='viewReply'>" + json[i].qna_title + "</td>"
                           + "<td class='viewReply'>" + json[i].qna_status + "</td>"
                           + "<td class='viewReply'>" + json[i].qna_regdate + "</td></tr>"
                        )
                     }
                     $("td").css({
                        "border-bottom": "thin solid #BBB09F",
                        "height": "30px"
                     });
                     $("a").css("color", "black");
                     $("a").css("text-decoration", "none");
                  }
                  xhttp.open("GET", "/qnaList?pageNum=1", true);
                  xhttp.send();
               }

               //qna ?????????
               
               $(".content").on("click", function (event) {
                  let e = event.target.className;
                  if (e == "pageBtn") {
                  $("#qnaTbody").empty();
                     let pageNum = event.target.textContent;
                     $.ajax({
                        url: "/qnaList",
                        method: "get",
                        dataType: "json",
                        data: {
                           pageNum: pageNum
                        },
                        success: (data) => {
                           
                           for (let i = 0; i < data.length; i++) {
                              $("#qnaTbody").append("<tr><td class='viewReply'>" + data[i].qna_num + "</td>"
                                    + "<td class='viewReply'>" + data[i].qna_title + "</td>"
                                    + "<td class='viewReply'>" + data[i].qna_status + "</td>"
                                    + "<td class='viewReply'>" + data[i].qna_regdate + "</td></tr>"
                                 )
                           }
                           $("td").css({
                              "border-bottom": "thin solid #BBB09F",
                              "height" :"30px"
                           });
                           $("a").css("color", "black");
                           $("a").css("text-decoration", "none");
                        },
                        error: () => {
                           alert("Error [??????]");
                        }


                     })

                  }


               })

               //???????????? ???????????????
               function qna_max() {
                  let maxPage;
                  $.ajax({
                     url: "/qnamaxPage",
                     method: "get",
                     async: false,
                     success: function (data) {
                        maxPage = data;
                     },
                     error: function () {
                        alert("error!");
                     }
                  })
                  return maxPage;
               }
               
               //???????????? ???????????????
               function qna_page() {
                  $("#qna_pages").empty();
                  //ajax??? ????????????
                  let start = $("input[name=qna_startNum]").val();
                  let startNum = Number(start);
                  let maxPage = qna_max();
                  let endPage = startNum+4;
                  
                  if(startNum == 1){
                     $("#qna_backBtn").hide();
                  }
                  if(endPage > maxPage){
                     endPage=(maxPage+1);
                  }
                  if(maxPage<6){
                	  $("#qna_frontBtn").hide();
                  }
                  for (let i = startNum; i < endPage; i++) {
                     $("#qna_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
                  $("#qna_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#qna_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })


               }
               //?????? ???????????? ????????????
               $("#qna_frontBtn").click(() => {
                  $("#qna_backBtn").show();
                  $("#qna_pages").empty();
                  let start = $("input[name=qna_startNum]").val();
                  let startNum = Number(start) +5;
                  $("input[name=qna_startNum]").val(startNum);
                  
                  let maxPage = qna_max();

                  let endPage = startNum+5;
                     if(endPage>maxPage){
                        endPage=maxPage;
                        $("#qna_frontBtn").hide();
                     }
                  for (let i = startNum; i < endPage+1; i++) {
                     
                     $("#qna_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
                  $("#qna_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#qna_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
               });

               //?????? ???????????? ????????????
               $("#qna_backBtn").click(() => {
                  $("#qna_frontBtn").show();
                  $("#qna_pages").empty();
                  let start = $("input[name=qna_startNum]").val();
                  let startNum = Number(start) -5;

                  
                  if(startNum == 1){
                     $("#qna_backBtn").hide();
                  }
                  $("input[name=qna_startNum]").val(startNum);
                  
                  
                  let maxPage = qna_max();
                  let endPage = startNum+4;
                  
                  for (let i = startNum; i < endPage+1; i++) {
                     
                     $("#qna_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
               });
               
               
               
               
               //????????????
               $(document).on("click", ".viewReply", function (evt) {
                  $("#modal_qna_case").css("display", "block");
                  $(".content").css("z-index", "500");
                  let qna_num = evt.target.parentElement.children[0].innerText;
                  $("#qna_detail").empty();;
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     let data = this.responseText;
                     let obj = JSON.parse(data);
                     $("#qna_detail").append("<tr><th>??????</th><td class='viewReply'>" + obj.qna_title + "</td></tr>"
                        + "<tr><th>??????</th><td class='viewReply'>" + obj.qna_content + "</td></tr>"
                        + "<tr><th>??????</th><td class='viewReply'>" + obj.qna_status + "</td></tr>"
                        + "<tr><th>?????????</th><td class='viewReply'>" + obj.qna_regdate + "</td></tr>");
                     qnaReply(qna_num);
                     $("td").css("border-bottom", "thin solid #BBB09F");
                     $("a").css("color", "black");
                     $("a").css("text-decoration", "none");
                  }
                  xhttp.open("GET", "/qnaOneList/qna_num/" + qna_num, true);
                  xhttp.send();
               })

               $("#closebtn").click(function () {
                  $("#modal_qna_case").css("display", "none");
               });

               //???????????? ????????????


               function qnaReply(qna_num) {
                  const xhttp = new XMLHttpRequest();
                  xhttp.onload = function () {
                     let data = this.responseText;
                     $("#qna_reply_content").text(data);
                  }
                  xhttp.open("GET", "/qnaReply/qna_num/" + qna_num, true);
                  xhttp.send();
               }

               $("#closebtn").click(function () {
                  $("#modal_qna_case").css("display", "none");
                  $(".content").css("z-index", "50");
               });

               $.ajax({
                  url: "/class/list/my",
                  method: "POST",
                  dataType: "json",
                  data: {
                     member_id: "${member_id}"
                  },
                  success: (data) => {
                     $("#myClassListBody").empty();
                     for (let i = 0; i < data.length; i++) {
                        $("#myClassListBody").append("<tr>"
                           + "<td>" + data[i].class_subject + "</td><td>" + data[i].class_teacher + "</td>"
                           + "<td>" + data[i].city_date + "</td><td>" + data[i].class_name + "</td>"
                           + "</tr>");
                     }
                     $("td").css("border-bottom", "thin solid #BBB09F");
                     $("a").css("color", "black");
                     $("a").css("text-decoration", "none");
                  },
                  error: () => {
                     alert("error");
                  }

               })

   
               function suggestList(){
                  //????????????
                  $("#suggest_pages").empty();
                  $("#suggestionBody").empty();
                  $.ajax({
                     url: "/class/suggestion-list",
                     method: "POST",
                     dataType: "json",
                     data: {
                        member_id: "${member_id}",
                        pageNum : 1
                     },
                     success: (data) => {
                        for (let i = 0; i < data.length; i++) {
                           $("#suggestionBody").append("<tr>"
                              + "<td>" + data[i].type + "</td><td>" + data[i].suggest_title + "</td>"
                              + "<td>" + data[i].city_code + "</td><td>" + data[i].class_time + "</td>"
                              + "<td>" + data[i].price + "</td><td>" + data[i].maxCnt + "</td>"
                              + "<td>" + data[i].suggest_regdate + "</td>"
                              + "</tr>");
                        }
                        $("td").css("border-bottom", "thin solid #BBB09F");
                        $("a").css("color", "black");
                        $("a").css("text-decoration", "none");
                     },
                     error: () => {
                        alert("error");
                     }

                  })
               }
               


               //???????????? ?????????
                  $(".content").on("click", function (event) {
                  let e = event.target.className;
                  if (e == "pageBtn") {
                  $("#suggestionBody").empty();
                     let pageNum = event.target.textContent;
                     $.ajax({
                        url: "/class/suggestion-list",
                        method: "POST",
                        dataType: "json",
                        data: {
                           member_id: "${member_id}",
                           pageNum : pageNum
                        },
                        success: (data) => {
                           for (let i = 0; i < data.length; i++) {
                              $("#suggestionBody").append("<tr>"
                                 + "<td>" + data[i].type + "</td><td>" + data[i].suggest_title + "</td>"
                                 + "<td>" + data[i].city_code + "</td><td>" + data[i].class_time + "</td>"
                                 + "<td>" + data[i].price + "</td><td>" + data[i].maxCnt + "</td>"
                                 + "<td>" + data[i].suggest_regdate + "</td>"
                                 + "</tr>");
                           }
                           $("td").css("border-bottom", "thin solid #BBB09F");
                           $("a").css("color", "black");
                           $("a").css("text-decoration", "none");
                        },
                        error: () => {
                           alert("error");
                        }


                     })

                  }


               })


               function suggest_max() {
                  let maxPage;
                  $.ajax({
                     url: "/suggestmaxPage",
                     method: "get",
                     async: false,
                     success: function (data) {
                        maxPage = data;
                     },
                     error: function () {
                        alert("error!");
                     }
                  })
                  return maxPage;
               }
               
               function suggest_page() {
                  //ajax??? ????????????
                  let start = $("input[name=suggest_startNum]").val();
                  let startNum = Number(start);
                  let maxPage = suggest_max();
                  let endPage = startNum+4;
                  
                  if(startNum == 1){
                     $("#suggest_backBtn").hide();
                  }
                  if(endPage > maxPage){
                     endPage=(maxPage+1);
                  }
                  if(maxPage<6){
                	  $("#suggest_frontBtn").hide();
                  }
                  for (let i = startNum; i < endPage; i++) {
                     $("#suggest_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
                  $("#suggest_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#suggest_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })


               }
               //?????? ?????? ????????????
               $("#suggest_frontBtn").click(() => {
                  $("#suggest_backBtn").show();
                  $("#suggest_pages").empty();
                  let start = $("input[name=suggest_startNum]").val();
                  let startNum = Number(start) +5;
                  $("input[name=suggest_startNum]").val(startNum);
                  
                  let maxPage = suggest_max();

                  let endPage = startNum+5;
                     if(endPage>maxPage){
                        endPage=maxPage;
                        $("#suggest_frontBtn").hide();
                     }
                  for (let i = startNum; i < endPage+1; i++) {
                     
                     $("#suggest_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
                  $("#suggest_frontBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
                  $("#suggest_backBtn").css({
                     "width": "40px",   
                     "margin": "0 3px",   
                     "border": "none",
                     "background-color": "rgba(0, 0, 0, 0)"
                  })
               });

               //?????? ?????? ????????????
               $("#suggest_backBtn").click(() => {
                  $("#suggest_frontBtn").show();
                  $("#suggest_pages").empty();
                  let start = $("input[name=suggest_startNum]").val();
                  let startNum = Number(start) -5;

                  
                  if(startNum == 1){
                     $("#suggest_backBtn").hide();
                  }
                  $("input[name=suggest_startNum]").val(startNum);
                  
                  
                  let maxPage = suggest_max();
                  let endPage = startNum+4;
                  
                  for (let i = startNum; i < endPage+1; i++) {
                     
                     $("#suggest_pages").append(
                     "<button type ='button' class='pageBtn' name ='pageBtn' style='width: 30px;   margin: 0 3px;   border: none;   background-color: rgba(0, 0, 0, 0);'>" + i + "</button>"
                     )
                  }
               });

		$("body").click((event) => {
			if(event.target.id == "myClassLabel" || event.target.className == "myClassPageBtn"){
				let page = event.target.textContent;
				let no = 0;
				if(isNaN(page)){
					page = 1;
					no = 1;
				}
				
				$("#myClassListBody").empty();
				$.ajax({
					url: "/class/list/my",
					method: "GET",
					dataType: "json",
					data: {
						startNum: page,
						member_id: "${member_id}"
					},
					success: (data) => {
						if(data.length == 0){
							alert("???????????? ???????????? ????????????.");
							return false;
						}
						for(let i = 0; i < data.length; i++){						
							$("#myClassListBody").append("<tr>"
									+ "<input type = 'hidden' value = '" + data[i].class_code + "' ></input>"
									+ "<td class = 'myClassInfo'>" + data[i].class_subject + "</td>"
									+ "<td>" + data[i].class_teacher + "</td>"
									+ "<td>" + data[i].class_date + "</td>"
									+ "<td>" + data[i].city_code + "</td>"
									+ "</tr>");
							  
						}
						 $("td").css({
                             "border-bottom": "thin solid #BBB09F",
                             "height" :"30px"
                          });
					},
					error: () => {
						alert("???????????? ???????????? ??????????????????.");
					},
					complete: () => {
						if(no == 1){	
							$("#classListBackBtn").css("display", "none");
							$("#pageBtnBox").empty();
							$.ajax({
								url: "/class/list/max",
								method: "GET",
								data: {
									member_id: "${member_id}"
								},
								success: (data) => {
									$("input[name='classListMaxPage']").val(data);
									for(let i = 1; i < 6; i++){
										if(i <= data){
											$("#pageBtnBox").append("<div class='pageBtn'>" + i + "</div>");
										} else{
											$("#classListFrontBtn").css("display", "none");											
										}
									}
								},
								error: () => {
									alert("[error] ???????????? ??????????????? ?????????????????????.");
								}
								
							})
						}
					}
				})
			}
		})
		
		
		$("#pageBtnBox").click((event) => {
			if(event.target.className == "pageBtn"){
				let page = event.target.textContent;
				$.ajax({
					url: "/class/list/my",
					method: "GET",
					dataType: "json",
					data: {
						startNum: page,
						member_id: "${member_id}"
					},
					success: (data) => {
						$("#myClassListBody").empty();
						if(data.length == 0){
							alert("???????????? ???????????? ????????????.");
							return false;
						}
						for(let i = 0; i < data.length; i++){						
							$("#myClassListBody").append("<tr>"
									+ "<input type = 'hidden' value = '" + data[i].class_code + "' ></input>"
									+ "<td class = 'myClassInfo'>" + data[i].class_subject + "</td>"
									+ "<td>" + data[i].class_teacher + "</td>"
									+ "<td>" + data[i].class_date + "</td>"
									+ "<td>" + data[i].city_code + "</td>"
									+ "</tr>");
						}
						   $("td").css({
	                              "border-bottom": "thin solid #BBB09F",
	                              "height" :"30px"
	                           });
					},
					error: () => {
						alert("???????????? ???????????? ??????????????????.");
					}
				})
			}
		})
		
		$("#classListFrontBtn").click(() => {
			$("#pageBtnBox").empty();
			let startNum = $("input[name='classListStartNum']").val();
			let maxPage = $("input[name='classListMaxPage']").val();
			startNum = Number(startNum) + 5;
			$("input[name='classListStartNum']").val(startNum);
			$("#classListBackBtn").css("display", "inline-block");
			for(let i = startNum; i < startNum + 5; i++){
				if(i <= maxPage){
					$("#pageBtnBox").append("<div class='pageBtn'>" + i + "</div>");
				} else{
					$("#classListFrontBtn").css("display", "none");											
				}
			}
		})
		
		$("#classListBackBtn").click(() => {
			$("#pageBtnBox").empty();
			let startNum = $("input[name='classListStartNum']").val();
			let maxPage = $("input[name='classListMaxPage']").val();
			startNum = Number(startNum) - 5;
			if(startNum){
				$("#classListBackBtn").css("display", "none");
			}
			$("#classListFrontBtn").css("display", "inline-block");
			for(let i = startNum; i < startNum + 5; i++){
				if(i <= maxPage){
					$("#pageBtnBox").append("<div class='pageBtn'>" + i + "</div>");
				}
			}
		})
		
		
		$("#myClassListBody").click((event) => {
			if(event.target.className == "myClassInfo"){
				$("#customerInfo").empty();
				let code = event.target.previousElementSibling.value;
				$.ajax({
					url: "/class/list/my/member",
					method: "GET",
					dataType: "json",
					data: {
						class_code: code
					},
					success: (data) => {
						$("#customerModalCase").css("display", "block");
						if(data.length == 0){
							$("#customerInfo").append("0??? ?????????.");
							return false;
						}
						for(let i = 0; i < data.length; i++){						
							$("#customerInfo").append("<tr>"
									+ "<td>" + data[i].member_id + "</td>"
									+ "<td>" + data[i].member_name + "</td>"
									+ "<td>" + data[i].member_tel + "</td>"
									+ "</tr>")
						}
						   $("td").css({
	                              "border-bottom": "thin solid #BBB09F",
	                              "height" :"30px"
	                           });
					},
					error: () => {
						alert("[error] ????????? ???????????? ?????????????????????.");
					}
				
				})
			}
		})
		
		$("#infoCloseBtn").click(() => {
			$("#customerModalCase").css("display", "none");
		})
		
		$("#delMemberBtn").click(() => {
			if($("#delMemCheck").val() == "${member_id}"){
				const memberid = $("input[name='member_id']").val();
                

                $.ajax({
                   url: "deleteMember",
                   method: "DELETE",
                   data: {
                      "member_id": memberid
                   },
                   success: (data) => {
                      alert(data);
                      $("#delMemModal").css("display", "none");
                      location.href = "/";
                      
                   },

                });
			}
		})
		
	</script>
</body>

</html>