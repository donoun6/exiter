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
<link rel="stylesheet" href="<c:url value='/resources/css/company/company_reservation.css'/>">
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
        <li><a href="#">예약확인</a></li>
        <li><a href="#">QnA</a></li>
        <li><a href="<c:url value='/company/company_info'/>">정보변경</a></li>
        <li><a href="<c:url value='/company/company_logout'/>">로그아웃</a></li>
      </ul>
    </nav>
  </aside>
  <!-- main section -->
  <main>
    <h1>예약관리</h1>
  	<div id="wrap">
  	<form id="selDate">
  		<input type="date" id="date" name="date" value="${date }">
  	</form>
  	<table class="theme">
  <tr style="border-bottom: 2px solid;">
    <th>사진</th>
    <th>이름</th>
    <th>장르</th>
    <th>난이도</th>
    <th>최대인원</th>
    <th>이용시간</th>
    <th>예약정보</th>
  </tr>
  <c:forEach items="${getTheme }" var="getTheme" varStatus="status">
  <tr>
  <td><img src="<c:url value='/resources/images/theme/${getTheme.TImage }'/>" alt=""></td>
  <td style="width: 20%;"><div><p>${getTheme.TName }</p></div></td>
  <td><div><p>${getTheme.TCategory }</p></div></td>
  <td><div><p>${getTheme.TLevel }</p></div></td>
  <td><div><p>${getTheme.TNum }명</p></div></td>
  <td><div><p>${getTheme.TTime }분</p></div></td>
  <td class="dropBtn"><div class="img"></div></td>
  </tr>
  <tr >
  <td colspan="7" style="padding: 0; overflow: hidden; border-bottom: none;">
  <table class="hidden">
  	<tr>
  		<th>아이디</th>
  		<th>이름</th>
  		<th>전화번호</th>
  		<th>테마</th>
  		<th>예약날짜</th>
  		<th>예약시간</th>
  		<th>예약인원</th>
  		<th>금액</th>
  		<th>예약일자</th>
  		<th>예약취소</th>
  	</tr>
  	<c:forEach var="reservationInfo" items="${reservationInfo[status.index] }">
  		<tr>
  			<td>${reservationInfo.userId }</td>
  			<td>${reservationInfo.UName }</td>
  			<td>${reservationInfo.UPhone }</td>
  			<td>${reservationInfo.UName }</td>
  			<td>${reservationInfo.RDate }</td>
  			<td>${reservationInfo.RTime }</td>
  			<td>${reservationInfo.RNum }명</td>
  			<td>${reservationInfo.RPrice }원</td>
  			<td>${reservationInfo.regDate }</td>
  			<td><button>예약취소</button></td>
  		</tr>
  	</c:forEach>
  </table>
  </td>
  </tr>
  </c:forEach>
  </table>
  	</div>
      <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
  </main>
    <!-- 스크립트 영역 -->
    <script type="text/javascript">
    	$(function() {
    		$('.dropBtn').click(function(){
    			$(this).parent().next().children().children().toggleClass("show");
    			$(this).children().toggleClass("change");
    		});
    		
    		$('#date').change(function(){
    			$('#selDate').submit();
    		});
    	});
    </script>
</body>

</html>
