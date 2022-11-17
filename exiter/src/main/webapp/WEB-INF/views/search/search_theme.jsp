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
<link rel="stylesheet" href="<c:url value='/resources/css/search/search_theme.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
		<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
        <main>
        	<!-- 상단탭 -->
        	<div class="title-tab">
          		<h3 class="title theme on"><a href="<c:url value='/search/search_theme'/>">테마</a></h3>
          		<h3 class="title loca_gen"><a href="<c:url value='/search/search_locagen'/>">지역/장르</a></h3>
        	</div>
        	
        	<!-- 검색 -->
        	<div class="search-theme">
	        	<form class="search-bar" method="post">
			        <input type="text" placeholder="테마검색" id="tName" class="searchBarInput" maxlength="12">
			        <img src="<c:url value='/resources/images/icon/search.png'/>" alt="검색이미지" class="search-image">
			    </form>
			    <ul class="search-ul">
			    	<!-- ajax에서 받아온 값 출력 || 처음 접근시 전체 목록 출력-->
			    	<c:forEach var="map" items="${allThemeList}">
			    		<li class="search-li">
			    			<div class="search-item">
			    				<span class="comName">${map.comName}</span>
			    				<span class="tName">${map.tName}</span>
			    			</div>
			    			<img class="tImg" src="/exiter/resources/images/theme/${map.tImage}" alt="${map.tName}">
			    		</li>
		    		</c:forEach>
			    </ul>
        	</div>
        	
        	<!-- 상세 팝업창 -->
        	<div class="detail-pop"></div>
        </main>
	</div>
	
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- 스크립트 -->
    <script type="text/javascript">
    	$(function() {
    		
    		// 테마 검색
    		$('#tName').keyup(function() {
    			var tName = $('#tName').val();
    			
    			// 공백일 경우 임의로 '+' 지정
    			if(tName == "") {
    				tName = "+";
    			}
    			
    			$.ajax({
    				async: true,
    				type: 'POST',
    				data: tName,
    				url: 'checkTName',
    				dataType: 'json',
    				contentType: 'application/json; charset=UTF-8',
    				success: function(data) {
    					let list = "";
    					for(let i = 0; i < data.length; i++) {
    						let map = data[i];
    						$(map).each(function() {
								list += '<li class="search-li">'
						    		+ '<div class="search-item">'
				    				+ '<span class="comName">' + map.comName + '</span>'
				    				+ '<span class="tName">' + map.tName + '</span></div>'
				    				+ '<img class="tImg" src="/exiter/resources/images/theme/' + map.tImage + '" alt="' + map.tName + '">';
				    				+ '</li>';
							});
    					}
    					$('.search-ul').html(list);
    				},
    				error: function(data) {

    				}
    			});
    		});
    		
    		// 엔터키 이벤트 제거
    		$('#tName').keydown(function() {
    			if(event.keyCode === 13) {
    				event.preventDefault();
    			}
    		});
    		
    		// 테마 팝업창
    		$('.search-ul').on('click', '.search-li', function() {
    			$('.detail-pop').removeClass('on');
    			var company = $(this).find('.comName').text();
    			var tName = $(this).find('.tName').text();
    			var allData = {"company": company, "tName": tName};
    			$.ajax({
    				async: true,
    				type: 'POST',
    				data: JSON.stringify(allData),
    				url: 'themeDetail',
    				dataType: 'html',
    				contentType: 'application/json; charset=UTF-8',
    				success: function(data) {
    					$('.detail-pop').html(data);
    					if($('.search-ul').outerHeight() > 500) {
    						$('.search-ul').css('padding-bottom', '350px');
    					}
    					if($('.title-box').outerHeight() > 80) {
    						$('.detail-pop').css('height', '285px');
    					} else {
    						$('.detail-pop').css('height', '260px');
    					}
    					$('.detail-pop').addClass('on');
    				}
    			});
    		});
    		
    		// detail-pop 클래스에 on 삭제
    		$('main').click(function() {
    			$('.detail-pop').removeClass('on');
    			$('.search-ul').css('padding-bottom', '150px');
    		});
    	});
    </script>
</body>
</html>