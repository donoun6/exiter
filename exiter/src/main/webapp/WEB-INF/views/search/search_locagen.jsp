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
<link rel="stylesheet" href="<c:url value='/resources/css/search/search_locagen.css'/>">
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
          		<h3 class="title theme"><a href="<c:url value='/search/search_theme'/>">테마</a></h3>
          		<h3 class="title loca_gen on"><a href="<c:url value='/search/search_locagen'/>">지역/장르</a></h3>
        	</div>
        	<!-- 선택 -->
        	<div class="loca1-box">
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="전국">전국</label>
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="서울">서울</label>
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="인천/경기">인천/경기</label>
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="대전/충청">대전/충청</label>
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="대구/부산/경상">대구/부산/경상</label>
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="광주/전주/전라">광주/전주/전라</label>
        		<label class="loca1"><input class="city" type="radio" name="loca1" value="강원">강원</label>
        	</div>
        	
        	<c:if test="${not empty cityList}">
        		<div class="loca2-box">
        			<label class="loca2"><input class="city2" type="radio" name="loca2" value="전체" checked>전체</label>
	        		<c:forEach var="city" items="${cityList}">
	        			<label class="loca2"><input class="city2" type="radio" name="loca2" value="${city}">${city}</label>
	        		</c:forEach>
	        		<label class="loca2"><input class="city2" type="radio" name="loca2" value="기타">기타</label>
        		</div>
        	</c:if>
        	
        	<c:if test="${not empty genreList}">
        		<div class="genre-box">
        			<label class="genre-item"><input class="genre" type="radio" name="genre" value="전체" checked>전체</label>
	        		<c:forEach var="genre" items="${genreList}">
	        			<label class="genre-item"><input class="genre" type="radio" name="genre" value="${genre}">${genre}</label>
	        		</c:forEach>
	        		<label class="genre-item"><input class="genre" type="radio" name="genre" value="기타">기타</label>
        		</div>
        	</c:if>
        	
        	<c:if test="${not empty themeList}">
	        	<ul class="search-ul">
			    	<c:forEach var="map" items="${themeList}">
			    		<li class="search-li">
			    			<div class="search-item">
				    			<span class="comName">${map.comName}</span>
				    			<span class="tName">${map.tName}</span>
			    			</div>
			    			<img class="tImg" src="/exiter/resources/images/theme/${map.tImage}" alt="${map.tName}">
			    		</li>
			    	</c:forEach>
			    </ul>
		    </c:if>
		    
        </main>
	</div>
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    	// input checked
    	$(function() {
    		<c:if test="${not empty city}">
    			$('input:radio[name="loca1"]:radio[value="${city}"]').prop('checked', true);
    		</c:if>
    		<c:if test="${not empty city2}">
				$('input:radio[name="loca2"]:radio[value="${city2}"]').prop('checked', true);
			</c:if>
			<c:if test="${not empty genre}">
				$('input:radio[name="genre"]:radio[value="${genre}"]').prop('checked', true);
			</c:if>
    	});
    	
    	// 지역 선택
    	$('.loca1').click(function() {
    		var city = $(this).find('.city').val();
    		// 폼생성
    		var newForm = $('<form></form>');
    		newForm.attr("type","hide");
    		newForm.attr("method","post");
    		newForm.attr("action","checking_loca");
    		// 폼에 요소 추가
    		newForm.append($('<input/>', {type: 'hidden', name: 'loca1', value: city }));
    		// 폼 추가
    		newForm.appendTo('body');
    		newForm.submit();
    	});
    	
    	// 세부지역 선택
    	$('.loca2').click(function() {
    		var city1 = $('input[name=loca1]:checked').val();
    		var city2 = $(this).find('.city2').val();
    		var genre = $('input[name=genre]:checked').val();
    		// 폼생성
    		var newForm = $('<form></form>');
    		newForm.attr("type","hide");
    		newForm.attr("method","post");
    		newForm.attr("action","checking_loca2");
    		// 폼에 요소 추가
    		newForm.append($('<input/>', {type: 'hidden', name: 'loca1', value: city1 }));
    		newForm.append($('<input/>', {type: 'hidden', name: 'loca2', value: city2 }));
    		newForm.append($('<input/>', {type: 'hidden', name: 'genre', value: genre }));
    		// 폼 추가
    		newForm.appendTo('body');
    		newForm.submit();
    	});
    	
    	// 장르 선택
    	$('.genre-item').click(function() {
    		
    	});
    </script>
</body>
</html>