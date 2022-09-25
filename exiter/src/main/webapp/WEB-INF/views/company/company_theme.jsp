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
  <title>Exiter Company theme</title>
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
        <li><a href="#">사업자메인</a></li>
        <li><a href="<c:url value='/company/company_theme'/>">테마관리</a></li>
        <li><a href="#">예약확인</a></li>
        <li><a href="#">QnA</a></li>
        <li><a href="#">정보변경</a></li>
        <li><a href="<c:url value='/company/company_logout'/>">로그아웃</a></li>
      </ul>
    </nav>
  </aside>
  <!-- main section -->
  <main>
	
  </main>
  <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
</body>

</html>
