<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reser_list.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
		<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
        <main class="main">
        	<h3 class="title">예약내역</h3>
        	<ul class="reser-wrap after">
        		<h5 class="sub-title">현재 예약중인 테마</h5>
        		<c:forEach var="after" items="${afterList}">
        			<li class="reser-item">
        				<div class="left-box">
        					<p class="theme">${after.TName} <span>${after.TCategory}</span></p>
	        				<p class="r-price">${after.RNum}인&nbsp;&nbsp;&nbsp;${after.RPrice}원</p>
	        				<p class="r-date">${after.RDate}&nbsp;&nbsp;&nbsp;${after.RTime}</p>
	        				<p class="company">${after.comName} ${after.comPocus}</p>
        				</div>
        				<div class="right-box">
		        			<img alt="${after.TName}" src="/exiter/resources/images/theme/${after.TImage}">
		        		</div>
        			</li>
        		</c:forEach>
        	</ul>
        	
        	<ul class="reser-wrap before">
        		<h5 class="sub-title">완료된 테마</h5>
        		<c:forEach var="before" items="${beforeList}">
        			<li class="reser-item">
        				<div class="left-box">
        					<p class="theme">${before.TName} <span>${before.TCategory}</span></p>
	        				<p class="r-price">${before.RNum}인&nbsp;&nbsp;&nbsp;${before.RPrice}원</p>
	        				<p class="r-date">${before.RDate}&nbsp;&nbsp;&nbsp;${before.RTime}</p>
	        				<p class="company">${before.comName} ${before.comPocus}</p>
        				</div>
        				<div class="right-box">
		        			<img alt="${before.TName}" src="/exiter/resources/images/theme/${before.TImage}">
		        		</div>
        			</li>
        		</c:forEach>
        	</ul>
        </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>