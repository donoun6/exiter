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
        					<td>
        						<select class="selectTNum" onChange="javascript:checkPrice();">
        							<c:forEach var="i" begin="0" end="${cnt - 1}">
        								<!-- <option value="<c:out value='${i}'/>"><c:out value='${i + 1}'/>&nbsp;명</option> -->
        								<option class="option" value="${i}">${i + 1}&nbsp;인</option>
        							</c:forEach>
        						</select>
	        					<br>
	        					<span id="tPrice">${tPrice}&nbsp;원</span>
        					</td>
        				</tr>
        			</table>
        		</div>
        		<div class="right-box">
        			<img alt="${theme.getTName()}" src="/exiter/resources/images/theme/${theme.getTImage()}">
        		</div>
        	</div>
        	<div class="def-box">${theme.getTDef()}</div>
        	<button class="s-btn res" onclick="location.href='/exiter/theme/reservation/${theme.getTid()}'">예약하기</button>
        	<div class="company-info">
        		<h5 class="info">카페 정보</h5>
        		<span class="comName">${company.getComName()}</span>
        		<span class="comPocus">${company.getComPocus()}</span>
        		<div id="map" style="width:100%;height:250px;"></div>
        		<table>
        			<tr>
        				<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
        				<td>${company.getComAddress2()}, ${company.getComAddress4()}</td>
        			</tr>
        			<tr>
        				<th>전화번호</th>
        				<td>${company.getComTel()}</td>
        			</tr>
        		</table>
        	</div>
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
    			url: 'checkTPrice',
    			dataType: 'text',
    			contentType: 'application/json; charset=UTF-8',
    			success: function(data) {
    				$('#tPrice').html(data + "&nbsp;원");
    			}
    		});
    	}
    	
    	// 주소로 지도api 가져오기
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${company.getComAddress2()}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
    </script>
</body>
</html>