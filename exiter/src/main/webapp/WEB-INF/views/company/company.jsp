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
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
        	 ['Task', 'Hours per Day'],
        	 <c:forEach var="companyInfo" items="${companyInfo }" varStatus="status">
             ['${companyInfo.TName }', ${reservationCount[status.index] }],
        	</c:forEach>
        ]);

        var options = {
          title: '테마별 예약 횟수',
          fontName: 'twayFly',
          fontSize: 16,
          chartArea:{left:100,bottom:20, width:'100%',height:'80%'},
          titleTextStyle: {
        	  fontName: 'twayFly', 
              fontSize: 34,
              bold: false,
          },
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      google.charts.setOnLoadCallback(drawVisualization2);
      
      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Reservation','Line'],
          <c:forEach var="yearMonth" items="${yearMonth }" varStatus="status">
          ['${yearMonth }',  ${yearMonthCount[status.index] }, ${yearMonthCount[status.index] }],
          </c:forEach>
        ]);

        var options = {
          title : '월별 예약 현황',
          fontName: 'twayFly',
          vAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {1: {type: 'line'}},
          titleTextStyle: {
        	  fontName: 'twayFly', 
              fontSize: 21,
              bold: false,
          }
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }

      function drawVisualization2() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Day', 'Reservation','Line'],
          ['2004/05',  165, 614.6],
          ['2005/06',  135, 682],
          ['2006/07',  157, 623],
          ['2007/08',  139, 609.4],
          ['2008/09',  136, 569.6]
        ]);

        var options = {
          title : '일별 예약 현황',
          fontName: 'twayFly',
          vAxis: {title: 'Day'},
          seriesType: 'bars',
          series: {1: {type: 'line'}},
          titleTextStyle: {
        	  fontName: 'twayFly', 
              fontSize: 21,
              bold: false,
          }
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
      }
    </script>
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
      <span>${comId } 님</span>
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
      <div style="width: 50%; height: 100%; position: relative;">
      <div id="piechart" style="width: 100%;height: 90%; box-sizing: border-box; padding: 5% 0 0 10%;"></div>
      </div>
      <div style="width: 50%; box-sizing: border-box; height: 100%; position: relative; padding-right: 1%; padding-left: 2%;">
      <div id="chart_div" style="margin-top: 50px;"></div>
        <div id="chart_div2" style="margin-top: 10px;"></div>
      </div>
      </section>
    </div>
      <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
  </main>
</body>

</html>
