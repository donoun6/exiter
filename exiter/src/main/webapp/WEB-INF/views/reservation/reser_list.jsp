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
        	<ul class="reser-wrap">
        		<c:forEach var="reser" items="${reserList}">
        			<li class="reser-item">
        				<div class="left-box">
        					<p class="theme">${reser.TName} <span>${reser.TCategory}</span></p>
	        				<p class="r-price">${reser.RNum}인 ${reser.RPrice}원</p>
	        				<p class="r-date">${reser.RDate} ${reser.RTime}</p>
	        				<p class="company">${reser.comName} ${reser.comPocus}</p>
        				</div>
        				<div class="right-box">
		        			<img alt="${reser.TName}" src="/exiter/resources/images/theme/${reser.TImage}">
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