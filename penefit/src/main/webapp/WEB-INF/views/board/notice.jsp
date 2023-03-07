<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

<style>
#aside_submenu {
   display: none;
   width: 100px;
}

h2 {
   text-align: center;
   font-size: 35px;
   margin-bottom: 20px;
   font-weight: bold;
}

#notice_tbl {
   text-align: center;
   width: 950px;
   margin: 0 auto;
   border-collapse: collapse;
   border-bottom: 2px solid #BBB09F;
}

#notice_tbl th {
   background-color: #DBD5CB;
   height: 35px;
}

#notice_tbl tr {
   border-bottom: thin solid #BBB09F;

}

#listBox{
   display:relative;
}

.pageBox{
   margin:0 auto;
   position:absolute;
   top : 720px;
   left : 450px;
   
}

</style>
</head>
<body>

<<<<<<< HEAD

   <%@ include file="../header.jsp"%>
   <div class="box">
      <section>
         <aside>
            <ul>
               <li class="aside_title">커뮤니티</li>
               <li class="aside_menu"><a href="/board/notice?pageNum=1&start=1">공지사항</a></li>
               <li class="aside_menu"><a href="/board/cityBoardview?pageNum=1&start=1">지역별게시판</a></li>
            </ul>

=======
	<%@ include file="../header.jsp"%>
	<div class="box">
		<section>
			<aside>
				<ul>
					<li class="aside_title">커뮤니티</li>
					<li class="aside_menu"><a href="/board/notice?pageNum=1&start=1">공지사항</a></li>
					<li class="aside_menu"><a href="/board/cityBoardview?pageNum=1&start=1">지역별게시판</a></li>
				</ul>
>>>>>>> branch 'master' of https://github.com/Songjeongmoon/penefit.git

         </aside>
         <div class="content" id="listBox">
            <h2>공지사항</h2>
            <c:set var="start" value="${pstart }" />
            <c:set var="end" value="${pstart + 4 }" />

<<<<<<< HEAD


            <c:if test="${notice_count % 10 gt 0 }">
               <c:set var="count" value="${notice_count / 10 + 1 }" />
            </c:if>
=======
				<c:if test="${notice_count % 10 gt 0 }">
					<c:set var="count" value="${notice_count / 10 + 1 }" />
				</c:if>
>>>>>>> branch 'master' of https://github.com/Songjeongmoon/penefit.git

            <c:if test="${notice_count % 10 eq 0 }">
               <c:set var="count" value="${notice_count / 10 }" />
            </c:if>


         <%--    &nbsp;&nbsp;&nbsp;<h4>총 ${notice_count }건</h4> --%>
            <table id="notice_tbl">
               <thead>
                  <tr>
                     <th>번호</th>
                     <th style="width: 250px;">제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>조회수</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="nlist" items="${nlist }">
                     <tr>
                        <td>${nlist.notice_num }</td>
                        <td><a href="notice_detail?notice_num=${nlist.notice_num }">${nlist.notice_title }</a></td>
                        <td>${nlist.member_id }</td>
                        <td>${nlist.notice_regdate }</td>
                        <td>${nlist.notice_viewcnt }</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         <div class="pageBox">
         <c:if test="${start ne 1 }">
            <a href="/board/notice?pageNum=${start - 5}&start=${start - 5}">[이전]</a>
         </c:if>
            <c:forEach var="pageNum" begin="${start }" end="${end }">
               <c:if test="${pageNum lt count  }">
                  <a href="/board/notice?pageNum=${pageNum }&start=${start}">${pageNum }</a>&nbsp;&nbsp;
               </c:if>
            </c:forEach>
            <c:if test="${start + 5 lt count }">
               <a href="/board/notice?pageNum=${start + 5}&start=${start + 5}">[다음]</a>
            </c:if>
            </div>
         </div>
      </section>
   </div>
   <script>
      $("#aside_menu_btn").mouseover(function() {
         //alert('dd');
         $("#aside_submenu").css("display", "block");
      })
      $("#aside_menu_btn").mouseout(function() {
         //alert('dd');
         $("#aside_submenu").css("display", "none");
      })
      
      
      
   
   </script>

</body>
</html>