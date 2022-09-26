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
	        	<form class="search-bar" action="index.html" method="post">
			        <input type="text" placeholder="테마검색" id="tName" class="searchBarInput" maxlength="12">
			        <img src="<c:url value='/resources/images/icon/search_FILL0_wght400_GRAD0_opsz48.png'/>" alt="검색이미지" class="search-img">
			    </form>
			    <ul class="search-ul">
			    	<!-- ajax에서 받아온 값 출력 -->
			    </ul>
			    <p class="lastMsg">더이상의 검색결과가 없습니다.</p>
        	</div>
        </main>
	</div>
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- 스크립트 -->
    <script type="text/javascript">
    	$(function() {
    		$('#tName').keyup(function() {
    			var tName = $('#tName').val();
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
				    				+ '<img class="tImg" src="/exiter' + map.tImage + '" alt="' + map.tName + '">';
				    				+ '</li>';
							});
    					}
    					$('.search-ul').html(list);
    				}
    			});
    		});
    	});
    </script>
</body>
</html>