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
<link rel="stylesheet" href="<c:url value='/resources/css/theme/theme.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
		<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
        <main>
        	<div class="title">
        		<h5 class="info">테마 정보</h5>
				<h3 class="tName">${theme.getTName()}</h3>
				<span class="companyName">${company.getComName()}</span>
       			<span class="companyPocus">${company.getComPocus()}</span>
       		</div>
        	<div class="theme-info">
        		<div class="left-box">
        			<table class="theme-detail">
        				<tr>
        					<th>장르</th>
        					<td>${theme.getTCategory()}</td>
        				</tr>
        				<tr>
        					<th>난이도</th>
        					<td>${theme.getTLevel()}</td>
        				</tr>
        				<tr>
        					<th>시간</th>
        					<td>${theme.getTTime()}&nbsp;분</td>
        				</tr>
        				<tr>
        					<th>최대인원</th>
        					<td>${theme.getTNum()}&nbsp;명</td>
        				</tr>
        				<tr>
        					<th>가격</th>
        					<td>${tPrice}&nbsp;원<br><span>(1인 기준)</span></td>
        				</tr>
        			</table>
        		</div>
        		<div class="right-box">
        			<img alt="${theme.getTName()}" src="/exiter/resources/images/theme/${theme.getTImage()}">
        		</div>
        	</div>
        	<div class="def-box">${theme.getTDef()}</div>
        	<div class="company-info">
        		<h5 class="info">카페 정보</h5>
        		<span class="comName"><<&nbsp;${company.getComName()}&nbsp;>></span>
        		<span class="comPocus">${company.getComPocus()}</span>
        		<p class="comAddr">${company.getComAddress1()} ${company.getComAddress2()} ${company.getComAddress3()} ${company.getComAddress4()}</p>
        		<p class="comTel">${company.getComTel()}</p>
        	</div>
        </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>