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
<!-- Time Picker CDN -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

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
		테마이름 : <form:input path="tName" placeholder="테마 이름을 입력하세요."/><br>
		테마장르 : <form:input path="tCategory" placeholder="카테고리를 입력하세요."/><br>
		난이도 : <input type="number" id="tLevel" name="tLevel" placeholder="0단계"/><br>
		<div class="addForm")>
		최대인원 : <input type="number" id="tNum" name="tNum" placeholder="0명"/><br>
		</div>
		<div class="addForm2")>
		예약시간 : <input type="number" id="trNum" name="trNum" placeholder="추가할 예약시간 갯수"/><br>
		</div>
		테마설명 : <form:input path="tDef"/><br>
		이용시간 : <form:input path="tTime"/><br>
		테마사진 : <input id="file" type="file" name="file"><br>
		<button id="submitBtn" type="submit">등록</button>
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
  <!-- Time Picker CDN -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  <script>
  $(function(){
	  $("#tNum").change(function(){
		  $("[class*='tPrice']").remove();
		  for(var i = 0; i < $("#tNum").val(); i++) {
			  $(".addForm").append(+ i+1 +'인가격 : <input id="tPrice'+ (i+1) +'" class="tPrice'+ (i+1) +'" name="tPrice'+ (i+1) +'" placeholder="25000원">');
		}
	  });
	  
	  $("#trNum").change(function(){
		  $("[class*='trTime']").remove();
		  for(var i = 0; i < $("#trNum").val(); i++) {
			  $(".addForm2").append(+ i+1 +'번째 예약시간<input id="trTime'+ (i+1) +'" class="timepicker trTime'+ (i+1) +'" name="trTime'+ (i+1) +'"/>');
			  <!-- Time Picker-->
				$(document).ready(function(){
					 $('input.timepicker').timepicker({
					  timeFormat: 'h:mm p',
					     interval: 10,
					     minTime: '10',
					     maxTime: '11:00pm',
					     defaultTime: '10',
					     startTime: '10:00',
					     dynamic: false,
					     dropdown: true,
					     scrollbar: true
					 });
			});
		}
	  });
  });
  

  </script>
</body>

</html>
