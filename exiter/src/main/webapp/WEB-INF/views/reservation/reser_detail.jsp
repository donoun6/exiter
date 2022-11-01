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
<link rel="stylesheet" href="<c:url value='/resources/css/reservation/reser_detail.css'/>">
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
        	<h3 class="title">예약 상세</h3>
        	<h6 class="t-title">예약한 테마</h6>
        	<div class="theme" onclick="javascript:themeDetail(${reser.getTid()});">
        		<div class="left-box">
        			<p class="tName">${reser.getTName()}</p>
        			<table>
        				<tr>
        					<th>장르</th>
        					<td>${reser.getTCategory()}</td>
        				</tr>
        				<tr>
        					<th>난이도</th>
        					<td>${reser.getTLevel()}</td>
        				</tr>
        				<tr>
        					<th>시간</th>
        					<td>${reser.getTTime()} 분</td>
        				</tr>
        			</table>
        		</div>
        		<div class="right-box">
        			<img alt="${reser.getTName()}" src="/exiter/resources/images/theme/${reser.getTImage()}">
        		</div>
        	</div>
        	
        	<h5 class="info">예약 정보</h5>
        	<div class="reser">
        		<table>
        			<tr>
        				<th>예약일시</th>
        				<td colspan="3">${reser.getRDate()}&nbsp;&nbsp;&nbsp;${reser.getRTime()}</td>
        			</tr>
        			<tr>
        				<th>인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원</th>
        				<td>${reser.getRNum()} 인</td>
        				<th>가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</th>
        				<td>${reser.getRPrice()} 원</td>
        			</tr>
        			<tr>
        				<th>매&nbsp;장&nbsp;명</th>
        				<td colspan="3">${reser.getComName()}
        					<c:if test="${reser.getComPocus().length() > 0}">
        						<span> ${reser.getComPocus()}</span>
        					</c:if>
        				</td>
        			</tr>
        		</table>
        	</div>
        	
        	<h5 class="loca">오시는 길</h5>
        	<div class="company">
        		<div id="map" style="width:100%;height:250px;"></div>
        		<table>
        			<tr>
        				<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
        				<td>${reser.getComAddress2()}, ${reser.getComAddress4()}</td>
        			</tr>
        			<tr>
        				<th>전화번호</th>
        				<td>${reser.getComTel()}</td>
        			</tr>
        		</table>
        	</div>
        	
        	<div class="btn-items">
        		<button class="r-btn" onclick="location.href='<c:url value="/reservation/all_reser_lists"/>'">예약 목록</button>
        		<button class="r-btn cancel-btn">예약 취소</button>
        	</div>
        	
        	<div class="check">
        		<h6>주의사항</h6>
        		<ul class="check-ul">
        			<li class="check-li">
        				* 예약시간은 테마 입장시간입니다. 반드시 15분전에 도착해주세요. 입장시간에 도착할 경우 테마 이용시간이 차감될 수 있습니다.
        			</li>
        			<li class="check-li">
        				* 당일 예약 취소는 불가능합니다. 부득이 방문이 불가능할 때는 매장으로 꼭 전화를 부탁드립니다.
        			</li>
        			<li class="check-li">
        				* 3회이상 예약 확인 전화를 받지 않으실 경우 예약이 취소 될 수 있습니다.
        			</li>
        			<li class="check-li">
        				* 음주 고객님은 입장이 제한 될 수 있습니다.
        			</li>
        		</ul>
        	</div>
        </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    	// 카카오맵 API 사용
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
		geocoder.addressSearch('${reser.getComAddress2()}', function(result, status) {
		
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
		
		// 테마 상세 페이지로 이동
    	function themeDetail(tid) {
    		window.location.href = "/exiter/theme/theme/" + tid;
    	}
    </script>
</body>
</html>