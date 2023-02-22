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
}
.dashboard_chart{
    width:900px;
    height: 700px;
    border : 1px solid black;
    display: inline-block;
}
.dashboard_class{
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
    height: 220px;
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
}
#dashboard_todayclasslist{
margin-top: 10px;
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
                <div class="dashboard_chart">
                    <div id="chart_div">
                    </div>
                </div>
                <div class="dashboard_class">
                	<div id="dashboard_classlist">
                	오늘의 클래스 <%=request.getAttribute("classTodayCount") %>건<br>
                	예정된 클래스 <%=request.getAttribute("classActiveCount") %>건<br>
                	지난 클래스 <%=request.getAttribute("classEndCount") %>건<br>
                	</div>
	                <div id="dashboard_todayclasslist">
	                    오늘의 클래스 리스트
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
	                <button onclick="location.href='' ">클래스리스트로가기></button>

	                
	                </div>
	                
                </div>
                <div id="dashboard_qna">
                   QNA미답변 건수 <%=request.getAttribute("qnaCount") %>건<br>
                     <table border="1">
	                <tr>
	                <th>문의아이디</th><th>제목</th><th>내용</th><th>등록일</th>
	                </tr>
	                <c:forEach var="qlist" items="${qlist }">
	                <tr>
	                <td>${qlist.member_id }</td>
	                <td>${qlist.qna_title }</td>
	                <td>${qlist.qna_content }</td>
	                <td>${qlist.qna_regdate }</td>
	                </tr>
	                </c:forEach>
	                </table><br>
           			<button onclick="location.href='' ">QNA리스트로가기></button>
                </div>
                <div id ="daxhboard_suggest">
                	승인대기중인 제안 <%=request.getAttribute("suggestCunt") %>건<br>
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
                <button onclick="location.href='' ">제안서 승인페이지로가기></button>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</body>
</html>