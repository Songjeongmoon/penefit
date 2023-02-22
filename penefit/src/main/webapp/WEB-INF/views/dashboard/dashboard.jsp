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
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: content-box;
            font-family: 'ChosunGu';
        }

        a {
            text-decoration: none;
            color: black;
        }

        .dashboard {
            width: 1500px;
            height: 1500px;
            border: 1px solid black;
            display: flex;
        }

        .dashboard_left {
            width: 250px;
            height: 1450px;
            border: 1px solid green;
            display: inline-block;
        }

        .dashboard-center {
            width: 900px;
            height: 1450px;
            border: 1px solid red;
            display: inline-block;
        }

        .dashboard_right {
            width: 350px;
            height: 1450px;
            border: 1px solid green;
            display: inline-block;

        }

        #dashboard_logo {
            width: 250px;
            height: 100px;
            border: 1px solid green;
            display: inline-block;
        }

        #dashboard_menu {
            width: 250px;
            border: 1px solid green;
            display: inline-block;
            text-align: center;
        }

        #dashboard_chart {
            width: 900px;
            height: 700px;
            border: 1px solid black;
            display: inline-block;
        }

        #dashboard_classinfo {
            width: 440px;
            height: 500px;
            border: 1px solid black;
            display: inline-block;
        }

        #dashboard_qna {
            width: 440px;
            height: 500px;
            border: 1px solid black;
            display: inline-block;
        }

        #daxhboard_suggest {
            width: 900px;
            height: 230px;
            border: 1px solid black;
            display: inline-block;
        }

        #dashboard_manager {
            width: 340px;
            height: 200px;
            border: 1px solid green;
            display: inline-block;
        }

        #dashboard_teacherlist {
            width: 340px;
            height: 600px;
            border: 1px solid green;
            display: inline-block;
        }

        #menuOl, #menuOl>li {
            list-style: none;
            font-size: 25px;
            padding: 0;
        }

        #dashboard_menu .menuBox {
            padding: 0;
            display: inline-block;
            width: 100%;
            text-align: center;
            border: 1px solid;
            cursor: pointer;
            transition: background-color 0.1s ease-in;
        }


        .menuLink>li {
            list-style: none;
            padding: 0;
            text-align: center;

        }

        
        .menuLink {
            display: none;
        }

        .menuLink a {
            width: 150px;
            display: inline-block;
            transition: background-color 0.1s ease-in;
            border-radius: 10px;
        }
        .menuLink a:hover {
	    	background-color: skyblue;
	    }
 
    
    </style>
</head>

<body>
    <div class="DashBoard">
        <div class="dashboard">
            <div class="dashboard_left">
                <div id="dashboard_logo">
                    로고
                </div>
                <div id="dashboard_menu">
                    <ol id="menuOl">
                        <li>
                            <div class="menuBox">
                                <div class="title" id="homebtn">홈</div>
                            </div>
                        </li>

                        <li>
                            <div class="menuBox">
                                <div class="title" id="boardbtn">게시글관리</div>
                                <ol class="menuLink" id="boardbox">
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                </ol>
                            </div>
                        </li>

                        <li>
                            <div class="menuBox">
                                <div class="title" id="memberbtn">회원관리</div>
                                <ol class="menuLink" id="memberbox">
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                </ol>
                            </div>
                        </li>

                        <li>
                            <div class="menuBox">
                                <div class="title" id="classbtn">클래스관리</div>
                                <ol class="menuLink" id="classbox">
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                    <li><a href="">dd</a></li>
                                </ol>
                            </div>
                        </li>

                    </ol>
                </div>
            </div>
            <div class="dashboard-center">
                <div id="dashboard_chart">
                    차트
                </div>
                <div id="dashboard_classinfo">
                    오늘의 클래스
                    <table border="1">
                        <tr>
                            <th>과목명</th>
                            <th>강사명</th>
                            <th>날짜</th>
                            <th>도시코드</th>
                        </tr>
                        <c:forEach var="clist" items="${clist }">
                            <tr>
                                <td>${clist.class_subject }</td>
                                <td>${clist.class_teacher }</td>
                                <td>${clist.class_date }</td>
                                <td>${clist.city_code }</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div id="dashboard_qna">
                    문의내역

                </div>
                <div id="daxhboard_suggest">
                    제안내역
                    <table border="1">
                        <tr>
                            <th>제안아이디</th>
                            <th>제안서제목</th>
                            <th>제안서등록일</th>
                        </tr>
                        <c:forEach var="slist" items="${slist }">
                            <tr>
                                <td>${slist.member_id }</td>
                                <td>${slist.suggest_title }</td>
                                <td>${slist.suggest_regdate }</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="dashboard_right">
                <div id="dashboard_manager">
                    관리자 ${member_id }님

                </div>
                <div id="dashboard_teacherlist">
                    강사목록
                    <table border="1">
                        <tr>
                            <th>강사이름</th>
                            <th>강사아이디</th>
                        </tr>
                        <c:forEach var="tlist" items="${tlist }">
                            <tr>
                                <td>${tlist.member_id }</td>
                                <td>${tlist.member_name }</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#homebtn").click(function () {
            $("#boardbox").hide();
            $("#memberbox").hide();
            $("#classbox").hide();
        });
        $("#boardbtn").click(function () {
            if ($("#boardbox").css("display") == "none") {
                $("#boardbox").show();
                $("#memberbox").hide();
                $("#classbox").hide();
            } else {
                $("#boardbox").hide();
            }
        });
        $("#memberbtn").click(function () {
            if ($("#memberbox").css("display") == "none") {
                $("#boardbox").hide();
                $("#memberbox").show();
                $("#classbox").hide();
            } else {
                $("#memberbox").hide();
            }
        });
        $("#classbtn").click(function () {
            if ($("#classbox").css("display") == "none") {
                $("#boardbox").hide();
                $("#memberbox").hide();
                $("#classbox").show();
            } else {
                $("#classbox").hide();
            }
        });
        $(".menuLink").mouseleave(function () {
                $(".menuLink").hide();
        });
        


    </script>
</body>

</html>