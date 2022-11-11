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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
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
        	<div class="swiper mySwiper1">
	        	<div class="swiper-wrapper loca1-box">
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="전국">전국</label>
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="서울">서울</label>
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="인천/경기">인천/경기</label>
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="대전/충청">대전/충청</label>
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="대구/부산/경상">대구/부산/경상</label>
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="광주/전주/전라">광주/전주/전라</label>
	        		<label class="swiper-slide loca1"><input class="city" type="radio" name="loca1" value="강원">강원</label>
	        	</div>
        	</div>
        	
        	<c:if test="${not empty cityList}">
	        	<div class="swiper mySwiper2">
	        		<div class="swiper-wrapper loca2-box">
	        			<label class="swiper-slide loca2 total"><input class="city2" type="radio" name="loca2" value="전체" checked>전체</label>
		        		<c:forEach var="city" items="${cityList}">
		        			<label class="swiper-slide loca2"><input class="city2" type="radio" name="loca2" value="${city}">${city}</label>
		        		</c:forEach>
		        		<label class="swiper-slide loca2"><input class="city2" type="radio" name="loca2" value="기타">기타</label>
	        		</div>
	        	</div>
        	</c:if>
        	
        	<c:if test="${not empty genreList}">
	        	<div class="swiper mySwiper3">
	        		<div class="swiper-wrapper genre-box">
	        			<label class="swiper-slide genre-item total"><input class="genre" type="radio" name="genre" value="전체" checked>전체</label>
		        		<c:forEach var="genre" items="${genreList}">
		        			<label class="swiper-slide genre-item"><input class="genre" type="radio" name="genre" value="${genre}">${genre}</label>
		        		</c:forEach>
		        		<label class="swiper-slide genre-item"><input class="genre" type="radio" name="genre" value="기타">기타</label>
	        		</div>
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
		    
		    <!-- 상세 팝업창 -->
        	<div class="detail-pop"></div>
        </main>
	</div>
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- Swiper JS -->
  	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
  	
    <!-- script 영역 -->
    <script type="text/javascript">
	    function findIndex(name) {
			const elems = document.querySelectorAll(name);
			for(let i = 0 ; i < elems.length; i++) {
				const classes = elems[i].classList;
				console.log(classes[2]);
				if(classes.contains('on')) {
					console.log(i);
					var swiperSetting = {
			 		  slidesPerView: 'auto',
			 		  spaceBetween: 10,
			 		  freeMode: true,
			 		  initialSlide: i,
			 		};
					return swiperSetting;
				}
			}
		}
    
    	// swiper
    	var swiper = new Swiper(".mySwiper1", {
	      slidesPerView: 'auto',
	      spaceBetween: 10,
	      freeMode: true,
	    });
    	var swiper = new Swiper(".mySwiper2", {
  	      slidesPerView: 'auto',
  	      spaceBetween: 10,
  	      freeMode: true,
  	    });
    	var swiper = new Swiper(".mySwiper3", {
  	      slidesPerView: 'auto',
  	      spaceBetween: 10,
  	      freeMode: true,
  	    });
    	
    	$(function() {
    		// input checked
    		<c:if test="${not empty city}">
    			$('input:radio[name="loca1"]:radio[value="${city}"]').prop('checked', true);
    			$('input:radio[name="loca1"]:radio[value="${city}"]').parent().addClass('on');
    			var swiper = new Swiper(".mySwiper1", findIndex('.loca1'));
    			<c:if test="${empty city2}">
    				$('input:radio[name="loca2"]:checked').parent().addClass('on');
    			</c:if>
    			<c:if test="${empty genre}">
    				$('input:radio[name="genre"]:checked').parent().addClass('on');
    			</c:if>
    		</c:if>
    		<c:if test="${not empty city2}">
				$('input:radio[name="loca2"]:radio[value="${city2}"]').prop('checked', true);
				$('input:radio[name="loca2"]:radio[value="${city2}"]').parent().addClass('on');
				var swiper = new Swiper(".mySwiper2", findIndex('.loca2'));
			</c:if>
			<c:if test="${not empty genre}">
				$('input:radio[name="genre"]:radio[value="${genre}"]').prop('checked', true);
				$('input:radio[name="genre"]:radio[value="${genre}"]').parent().addClass('on');
				var swiper = new Swiper(".mySwiper3", findIndex('.genre-item'));
			</c:if>

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
	    	
	    	// 세부지역 및 장르 선택
	    	$('.loca2, .genre-item').click(function() {
	    		var city1 = $('input[name=loca1]:checked').val();
	    		var city2 = $('input[name=loca2]:checked').val();
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
			});
    	});

    </script>
</body>
</html>