<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
.dashboard{
    width: 1500px;
    height: 1500px;
    border : 1px solid black;
    display: flex;
}
.dashboard_left{
    width:250px;
    height: 1450px;
    border : 1px solid green;
    display: inline-block;
}
.dashboard-center{
    width:900px;
    height: 1450px;
    border : 1px solid red;
    display: inline-block;
}
.dashboard_right{
    width:350px;
    height : 1450px;
    border : 1px solid green;
    display: inline-block;

}

#dashboard_logo{
    width:250px;
    height: 100px;
    border : 1px solid green;
    display: inline-block;
}
#dashboard_menu{
    width:250px;
    height: 400px;
    border : 1px solid green;
    display: inline-block;
    text-align: center;
}
#dashboard_chart{
    width:900px;
    height: 700px;
    border : 1px solid black;
    display: inline-block;
}
#dashboard_classinfo{
    width:440px;
    height: 500px;
    border : 1px solid black;
    display: inline-block;
}
#dashboard_qna{
    width:440px;
    height: 500px;
    border : 1px solid black;
    display: inline-block;
}
#daxhboard_suggest{
	width:900px;
    height: 230px;
    border : 1px solid black;
    display: inline-block;
}
#dashboard_manager{
    width:340px;
    height : 200px;
    border : 1px solid green;
    display: inline-block;
}
#dashboard_teacherlist{
    width:340px;
    height : 600px;
    border : 1px solid green;
    display: inline-block;
}
ol,li{
 list-style: none;
 font-size: 25px;
 padding: 0;
}
#dashboard_menu a{
margin: 10px;
	padding: 0;
	display: inline-block;
	height: 80px;
	width: 230px;
	text-align: center;
	line-height: 80px;
	border: 1px solid;
	border-radius: 10px;
	cursor: pointer;
	transition: background-color 0.1s ease-in;
}
a{
	color: black;
	text-decoration: none;
	font-size: 20px;
}
a:hover{
	background-color: orange;
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
                <div id ="dashboard_menu">
                <ol>
                  <li><a href="">관리자[대시보드]</a></li>
                  <li><a href="../adminView">관리자[공지사항]</a></li>
                  <li><a href="">관리자[등급변경]</a></li>
                  <li><a href="">관리자[회원리스트]</a></li>
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
                <th>과목명</th><th>강사명</th><th>날짜</th><th>도시코드</th>
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
                <div id ="daxhboard_suggest">
                	제안내역
                <table border="1">
                <tr>
                <th>제안아이디</th><th>제안서제목</th><th>제안서등록일</th>
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
                <th>강사이름</th><th>강사아이디</th>
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
</body>
</html>