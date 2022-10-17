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
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reservation.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e25790592795ff07edd8f6732b8500b&libraries=services"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
		<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
        <main>
        <div class="title">
        		<h5 class="info">예약 하기</h5>
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
        			</table>
        		</div>
        		<div class="right-box">
        			<img alt="${theme.getTName()}" src="/exiter/resources/images/theme/${theme.getTImage()}">
        		</div>
        	</div>
        	<div class ="selBox">
        	<table>
        		<tr>
        			<th>날짜</th>
        			<td><input type="date" id="rDate" name="rDate"/></td>
        		</tr>
        		<tr>
        			<th>가격</th>
        			<td>
        				<select class="selectTNum" onChange="javascript:checkPrice();">
        					<c:forEach var="i" begin="0" end="${cnt - 1}">
        						<option class="option" value="${i}">${i + 1}&nbsp;인</option>
        					</c:forEach>
        				</select>
	        		<br>
	        		<span id="tPrice">${tPrice}&nbsp;원</span>
        			</td>
        		</tr>
        	</table>
        	</div>
        	<div class="trTimeBox">
        	<c:forEach var="trTime" items="${trTime }">
        		<div class="trTime">${trTime.trTime }</div>
        	</c:forEach>
        	</div>
        	<button class="s-btn res" onclick="location.href='/exiter/theme/reservation/${theme.getTid()}'">예약하기</button>
        	
        <!-- 
        	
			<form:form modelAttribute="reservation">
			<input type="hidden" name="uid" value="${uid }"/>
			<input type="hidden" name="tid" value="${tid }"/>
			<form:input path="rPrice"/>
			<input type="date" id="rDate" name="rDate"/>
			<form:input path="rTime"/>
			<form:input path="rNum"/>
			<input type="submit">
			</form:form> -->
        </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
	// 인원별 가격 확인
	function checkPrice() {
		var tid = ${theme.getTid()};
		var index2 = parseInt($('.selectTNum option:selected').val());
		var allData = {"tid": tid, "index2": index2};
		$.ajax({
			async: true,
			type: 'POST',
			data: JSON.stringify(allData),
			url: '/exiter/theme/theme/checkTPrice',
			dataType: 'text',
			contentType: 'application/json; charset=UTF-8',
			success: function(data) {
				$('#tPrice').html(data + "&nbsp;원");
			}
		});
	}
    </script>
</body>
</html>