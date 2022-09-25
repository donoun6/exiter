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
			        <input type="text" placeholder="테마검색" class="searchBarInput" maxlength="12">
			        <img src="<c:url value='/resources/images/icon/search_FILL0_wght400_GRAD0_opsz48.png'/>" alt="검색이미지" class="search-img">
			    </form>
			    <ul class="search-ul">
			    	<li class="search-li">
			    		<div class="search-item">
			    			<span class="comName">홍대어드벤처점</span>
			    			<span class="tName">미스터리</span>
			    		</div>
			    		<img class="tImg" src="<c:url value='/resources/images/theme/img2.png'/>" alt="미스터리">
			    	</li>
			    	<li class="search-li">
			    		<div class="search-item">
			    			<span class="comName">홍대어드벤처점</span>
			    			<span class="tName">퀘스트 : 여정의 시작</span>
			    		</div>
			    		<img class="tImg" src="<c:url value='/resources/images/theme/img4.png'/>" alt="퀘스트:여정의 시작">
			    	</li>
			    	<li class="search-li">
			    		<div class="search-item">
			    			<span class="comName">대구점</span>
			    			<span class="tName">사명 : 투쟁의 노래</span>
			    		</div>
			    		<img class="tImg" src="<c:url value='/resources/images/theme/img.jpg'/>" alt="사명:투쟁의 노래">
			    	</li>
			    	<li class="search-li">
			    		<div class="search-item">
			    			<span class="comName">대구점</span>
			    			<span class="tName">펭귄키우기</span>
			    		</div>
			    		<img class="tImg" src="<c:url value='/resources/images/theme/img6.jpg'/>" alt="펭귄키우기">
			    	</li>
			    	<li class="search-li">
			    		<div class="search-item">
			    			<span class="comName">대구점</span>
			    			<span class="tName">우리 아빠</span>
			    		</div>
			    		<img class="tImg" src="<c:url value='/resources/images/theme/img3.jpg'/>" alt="우리아빠">
			    	</li>
			    </ul>
        	</div>
        </main>
	</div>
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>