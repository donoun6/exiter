<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
  <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/copyright.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/company/company.css'/>">
  <script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
  <title>Exiter Company main</title>
</head>
<% String comId = (String)session.getAttribute("comId");
if (comId == null){
	response.sendRedirect("company/company_login");
	return;
}%>
<body>
  <!-- header nav -->
	   <jsp:include page="../common/company_header.jsp"></jsp:include>
  <!-- side nav -->
  <aside>
    <nav id="aside-nav">
      <ul>
      ${comId } 님
        <li><a href="<c:url value='/company'/>">사업자메인</a></li>
        <li><a href="<c:url value='/company/company_theme'/>">테마관리</a></li>
        <li><a href="<c:url value='/company/company_reservation'/>">예약확인</a></li>
        <li><a href="#">QnA</a></li>
        <li><a href="<c:url value='/company/company_info'/>">정보변경</a></li>
        <li><a href="<c:url value='/company/company_logout'/>">로그아웃</a></li>
      </ul>
    </nav>
  </aside>
  <!-- main section -->
  <main>
    <div id="main-wrap">
      <section class="section1">
      <div>
      <span>등록테마</span>
      <span><a href='<c:url value="/company/company_theme"/>'>+테마관리</a></span>
      </div>
      	<table>
		  <tr>
		    <th style="border-left: none;">사진</th>
		    <th style="width: 30%;">이름</th>
		    <th style="width: 20%;">장르</th>
		    <th>난이도</th>
		    <th>이용시간</th>
		  </tr>
		  <c:forEach var="companyInfo" items="${companyInfo }">
		  <tr>
		  	<td><img src="<c:url value='/resources/images/theme/${companyInfo.TImage }'/>" alt=""></td>
		  	<td><div><p>${companyInfo.TName }</p></div></td>
		  	<td><div><p>${companyInfo.TCategory }</p></div></td>
		  	<td><div><p>${companyInfo.TLevel }</p></div></td>
		  	<td><div><p>${companyInfo.TTime }분</p></div></td>
		  </tr>
		  </c:forEach>
  		</table>
      </section>
      <section class="section2">
        <div>
      <span>최근 예약정보</span>
      <span><a href="<c:url value='/company/company_reservation'/>">+예약확인</a></span>
      </div>
      	<table>
		  <tr>
		    <th>아이디</th>
		    <th>이름</th>
		    <th style="width: 20%;">전화번호</th>
		    <th style="width: 25%;">테마</th>
		    <th>예약날짜</th>
		    <th>예약시간</th>
		  </tr>
		  <c:forEach var="reservationInfo" items="${reservationInfo }">
		  <tr>
		  	<td><div><p>${reservationInfo.userId }</p></div></td>
		  	<td><div><p>${reservationInfo.UName }</p></div></td>
		  	<td><div><p>${reservationInfo.UPhone }</p></div></td>
		  	<td><div><p>${reservationInfo.TName }</p></div></td>
		  	<td><div><p>${reservationInfo.RDate }</p></div></td>
		  	<td><div><p>${reservationInfo.RTime }</p></div></td>
		  </tr>
		  </c:forEach>
  		</table>
      </section>
      <section class="section3">
        그래프
      </section>
    </div>
      <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
  </main>
</body>

</html>
