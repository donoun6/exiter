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
<link rel="stylesheet" href="<c:url value='/resources/css/company/company_theme.css'/>">
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
  <h1>테마관리</h1>
  <div id="wrap">
    <div id="themeFormWrap">
  	<form:form modelAttribute="company" method="post" enctype="multipart/form-data" class="themeForm">
		<input type="hidden" name="cid" value="${cid }">
		테마이름 : <form:input path="tName" placeholder="테마명을 입력하세요."/>
		테마카테고리 : <form:input path="tCategory" placeholder="카테고리를 입력하세요."/>
		난이도 : <input type="number" id="tLevel" name="tLevel" placeholder="0단계"/>
		최대인원 : <input type="number" id="tNum" name="tNum" placeholder="0명"/>
		가격 : <input id="tPrice" name="tPrice" placeholder="1인 기준 ex)25000원">
		테마설명 : <form:input path="tDef"/>
		이용시간 : <form:input path="tTime"/>
		테마사진 : <input type="file" name="file"><br>
		<form:input path="tImage" type="hidden" value="dd" />
		<button type="submit">등록</button>
	</form:form>
  </div>
  <div id="themeWrap">
    <h1>등록테마</h1>
  		<c:forEach var="companyInfo" items="${companyInfo }">
			<h1>${companyInfo }</h1>
		</c:forEach>
  </div>
  </div>
  </main>
  <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
</body>

</html>
