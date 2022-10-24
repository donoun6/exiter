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
        <form:form modelAttribute="reservation">
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
        				<select id="rNum" name="rNum" class="selectTNum" onChange="javascript:checkPrice();">
        				<option class="option" selected disabled>인원선택</option>
        					<c:forEach var="i" begin="0" end="${cnt - 1}">
        						<option class="option" value="${i}">${i + 1}&nbsp;인</option>
        					</c:forEach>
        				</select>
	        		<br>
	        		<span id="tPrice">인원을 선택하세요</span>
	        		<input id="rPrice" name="rPrice" type="hidden" value=""/>
        			</td>
        		</tr>
        	</table>
        	</div>
        	<div class="trTimeBox">
        	<c:forEach var="trTime" items="${trTime }">
        		<div class="trTime">${trTime.trTime }</div>
        	</c:forEach>
        	</div>
			<input type="hidden" name="uid" value="${uid }"/>
			<input type="hidden" name="tid" value="${tid }"/>
			<input type="hidden" id="rTime" name="rTime"/>
			<input type="submit" class="s-btn res" value="예약하기">
			</form:form>
        </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    
	$(function(){
		$('#rDate').change(function() {
			var tid = ${theme.getTid()};
			console.log(tid);
			var date = $('#rDate').val();
			console.log(date);
			var allData = {"tid": tid, "date": date};
			console.log(allData)
			$.ajax({
				async: true,
				type: 'POST',
				data: JSON.stringify(allData),
				url: '${theme.getTid()}/checkReservationTime',
				dataType: 'json',
				contentType: 'application/json; charset=UTF-8',
				success: function(data) {
					console.log(data.length);
				}
			});
		});
	})

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
				var data2 = data.split(",")
				$('#rPrice').val(data2[0]+data2[1])
			}
		});
	}

	
	$(function(){
		$(".trTime").click(function(){
			var data = this.innerText
			$("#rTime").val(data);
		});
	});
    </script>
</body>
</html>