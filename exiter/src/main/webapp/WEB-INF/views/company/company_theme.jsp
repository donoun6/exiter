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
  <h1>테마관리</h1>
  <div id="wrap">
    <fieldset id="themeFormWrap">
    <h1 style="display: inline-block;">테마추가</h1><span style="color: red;">${err }</span>
  	<form:form modelAttribute="company" method="post" enctype="multipart/form-data" class="themeForm">
		<input type="hidden" name="cid" value="${cid }">
		<label>테마이름 : <form:input path="tName" placeholder="테마이름을 입력하세요."/></label>
		<label>테마장르 : <form:input path="tCategory" placeholder="장르를 입력하세요."/></label>
		<label>난이도 : <input type="number" id="tLevel" name="tLevel" placeholder="0단계"/></label>
		<label>이용시간 : <input id="tTime" name="tTime" type="number" placeholder="60분"/></label><br>
		<div class="addForm">
		<label>최대인원 : <input type="number" id="tNum" name="tNum" placeholder="0명"/></label><br>
		</div>
		<div class="addForm2">
		<label>예약시간 : <input type="number" id="trNum" name="trNum" placeholder="추가할 예약시간 개수"/></label><br>
		</div>
		<label style="width: 350px;">테마사진 : <input id="file" type="file" name="file"></label><br>
		<label>테마설명 : <br><form:textarea path="tDef" style="width: 70vw; height: 100px;"/><br></label><br>
		<div class="btnBox">
		<button id="submitBtn" type="submit">등록</button>
		<button id="submitBtn" type="reset">초기화</button>
		</div>
	</form:form>
	</fieldset>
	<h2>등록테마</h2>
  <table>
  <tr>
    <th>사진</th>
    <th>이름</th>
    <th>장르</th>
    <th>난이도</th>
    <th>최대인원</th>
    <th>이용시간</th>
    <th>가격</th>
    <th>예약시간</th>
    <th>테마설명</th>
    <th>삭제하기</th>
  </tr>
  <c:forEach var="companyInfo" items="${companyInfo }">
  <tr>
  <td><img src="<c:url value='/resources/images/theme/${companyInfo.TImage }'/>" alt=""></td>
  <td><div><p>${companyInfo.TName }</p></div></td>
  <td><div><p>${companyInfo.TCategory }</p></div></td>
  <td><div><p>${companyInfo.TLevel }</p></div></td>
  <td><div><p>${companyInfo.TNum }명</p></div></td>
  <td><div><p>${companyInfo.TTime }분</p></div></td>
  <td><div><p>
  <select class="price" id="${companyInfo.tid }">
  <option>인원별 가격보기</option>
  </select>
  </p></div></td>
  <td><div><p>
  <select class="reservationTime" id="${companyInfo.tid }" style="width: 140px;">
  <option>예약시간 보기</option>
  </select>
  </p></div></td>
  <td><div style="height: auto; padding: 10px 0;"><p>${companyInfo.TDef }</p></div></td>
  <td>
  <div>
  	<form>
  	<input name="tid" type="hidden" value="${companyInfo.tid }">
  	<button type="submit" id="delete">삭제</button>
  	</form>
  </div>
  </td>
  </tr>
  </c:forEach>
</table>
  </div>
  <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
  </main>
  <!-- Time Picker CDN -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  <script>
  $(function(){
	  $("#tNum").change(function(){
		  $("[class*='tpriceDef']").remove();
		  for(var i = 0; i < $("#tNum").val(); i++) {
			  $(".addForm").append('<label class="tpriceDef">'+ (i+1) +'인가격 : <input type="number" id="tPrice'+ (i+1) +'" class="tPrice'+ (i+1) +'" name="tPrice'+ (i+1) +'" placeholder="'+ (i+1) +'0000원"></label>');
		}
	  });
	  
	  $("#trNum").change(function(){
		  $("[class*='trTimeDef']").remove();
		  for(var i = 0; i < $("#trNum").val(); i++) {
			  $(".addForm2").append('<label class="trTimeDef">'+ (i+1) +'번째 예약시간 : <input style="width: 150px;" id="trTime'+ (i+1) +'" class="timepicker trTime'+ (i+1) +'" name="trTime'+ (i+1) +'"/></label>');
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
	  
		$('.price').click(function() {
			$("[class*='pDef']").remove();
			var tid = $(this).attr('id');
			var select = $(this);
			$.ajax({
				async: true,
				type: 'POST',
				data: tid, //id가 comId인 input태그의 value값을 비동기통신 데이터로 전달
				url: "company_theme/getPrice",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
					for(var i = 0; i < data.length; i++){
						var price = data[i].tprice.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
						select.append('<option class="pDef">'+ (i+1) + '인 : '  + price +'원</option>');
					}
				},
				error: function(data) {

				}
			});
		});
		
		$('.reservationTime').click(function() {
			$("[class*='rtDef']").remove();
			var tid = $(this).attr('id');
			var select = $(this);
			$.ajax({
				async: true,
				type: 'POST',
				data: tid, //id가 comId인 input태그의 value값을 비동기통신 데이터로 전달
				url: "company_theme/getReservationTime",
				dataType: "json",
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
					for(var i = 0; i < data.length; i++){
						select.append('<option class="rtDef">'+ (i+1) + '번째 : '  + data[i].trTime+'</option>');
					}
				},
				error: function(data) {

				}
			});
		});
		
  });
  </script>
</body>

</html>
