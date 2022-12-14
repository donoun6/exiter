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
<% String userId = (String)session.getAttribute("userId");
if (userId == null){
	response.sendRedirect("/exiter/user/login");
	return;
}%>
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
        			<td><input type="date" id="rDate" name="rDate" /></td>
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
			<input type="hidden" name="cid" value="${cid }"/>
			<input type="hidden" id="rTime" name="rTime"/>
			<span class="err">해당정보를 모두 입력해주세요.</span>
			<button type="button" class="s-btn res" >예약하기</button>
			<div class="reservation-pop">
	    		<div class="popUp-box">
		        	<div class="popUp-item">
		        		<p>예약 하시겠습니까?</p>
		        		<span class="rDateInfo"></span>
		        		<span class="rTimeInfo"></span>
		        		<span class="rNumInfo"></span>
		        		<span class="rPriceInfo"></span>
		        		<div class="btn-box">
		        			<button type="submit" class="s-btn"	>예약하기</button>
		        			<button type="button" class="s-btn cancel">취소</button>
		        		</div>
		        	</div>
		    	</div>
	    </div>
			</form:form>
        </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    
    var now_utc = Date.now() // 지금 날짜를 밀리초로
 // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
 	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
 // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
 	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
 	document.getElementById("rDate").setAttribute("min", today); //min 오늘 이후 max 오늘 이전
    
	$(function(){
		$('#rDate').change(function() {
			$("#rTime").val("end");
			var tid = ${theme.getTid()};
			var date = $('#rDate').val();
			var allData = {"tid": tid, "date": date};
			$.ajax({
				async: true,
				type: 'POST',
				data: JSON.stringify(allData),
				url: '${theme.getTid()}/checkReservationTime',
				dataType: 'json',
				contentType: 'application/json; charset=UTF-8',
				success: function(data) {
					$('.trTime').removeClass("end");
					var nowday = new Date();
					
					var year = nowday.getFullYear();
					var month = ('0' + (nowday.getMonth() + 1)).slice(-2);
					var day = ('0' + (nowday.getDate())).slice(-2);
					
					var hours = Number(('0' + nowday.getHours()).slice(-2));
					var minutes = Number(('0' + nowday.getMinutes()).slice(-2));
					
					var dateString = year + '-' + month + '-' + day;
					
					for (var i = 0; i < $('.trTime').length; i++){
						if ($('#rDate').val() == dateString) {
							$(function(){
								$(".end").click(function(){
									var data = "end"
									$("#rTime").val(data);
									
								});
							});
							if($('.trTime')[i].innerText.split(' ')[1] == "AM") {
								var h = Number($('.trTime')[i].innerText.split(':')[0]);
								var m = Number($('.trTime')[i].innerText.split(':')[1].split(' ')[0]);
								if ( hours == h ) {
									if( minutes > m ) {
										$('.trTime').eq(i).addClass("end");
									}
								}
								if(hours > h) {
									$('.trTime').eq(i).addClass("end");
								}
							}
							if($('.trTime')[i].innerText.split(' ')[1] == "PM") {
								var h = Number($('.trTime')[i].innerText.split(':')[0])+12 == 24 ? Number($('.trTime')[i].innerText.split(':')[0]) : Number($('.trTime')[i].innerText.split(':')[0])+12;
								var m = Number($('.trTime')[i].innerText.split(':')[1].split(' ')[0]);
								if ( hours == h ) {
									if( minutes > m ) {
										$('.trTime').eq(i).addClass("end");
									}
								}
								if(hours > h) {
									$('.trTime').eq(i).addClass("end");
								}
								
							}
						}
						for(var j = 0; j < data.length; j++) {
							if ($('.trTime')[i].innerText == data[j]) {
								$('.trTime').eq(i).addClass("end");
								$(function(){
									$(".end").click(function(){
										var data = "end"
										$("#rTime").val(data);
										
									});
								});
							}
						}
					}
				}
			});
		});
	})

	// 인원별 가격 확인
	function checkPrice() {
		$("#rTime").val("end");
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
		
		$('.res').click(function(){
			if ($('#rNum').val() == null || $('#rDate').val() == "" || $('#rTime').val() == "end" || $('#rTime').val() == "") {
				$('.err').attr("style","display:block")
				$('.reservation-pop').attr("style","display:none")
			}else {
				var rnum = parseInt($('#rNum').val());
				$('.err').attr("style","display:none")
				$('.reservation-pop').attr("style","display:block")
				$('.rDateInfo').text(" 날짜 : " + $('#rDate').val())
				$('.rTimeInfo').text(" 시간 : " + $('#rTime').val())
				$('.rNumInfo').text(" 인원 : " + (rnum+1))
				$('.rPriceInfo').text(" 가격 : " + $('#tPrice').text())
			}
		});
		
		$('.cancel').click(function(){
			$('.reservation-pop').attr("style","display:none")
		});
	});
    </script>
</body>
</html>