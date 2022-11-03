<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <link rel="shortcut icon" href="<c:url value='exiter.ico'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
  <script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
  <title>main</title>
  <style type="text/css">
  	/* 테마 팝업창 */
@keyframes onAni {
	from {
	bottom: -380px;
	}
	to {
	bottom: 0px;
	}
}

.detail-pop {
    position: fixed;
    bottom: -500px;
    width: calc(100% - 20px);
    height: 260px;
    padding: 20px 0 0 20px;
    border-top-left-radius: 40px;
    border-top-right-radius: 40px;
    background: #f1f1f1;
    z-index: 99;
}

.detail-pop.on {
	animation: onAni 1s linear forwards;
}

#themeAjax {
	display: flex;
    justify-content: space-between;
    align-items: center;
    width: 350px;
    margin-top: 5px;
}

.right-box {
	text-align: right;
}

.left-box .title-box span {
	display: inline-block;
}

.left-box .title-box .comName {
	background: #414aea;
    color: #fff;
    font-size: 16px;
    padding: 4px;
}

.left-box .title-box .tName {
	margin-top: 10px;
    font-size: 25px;
    color: #414aea;
}

.right-box img {
	height: 160px;
    border-radius: 13px;
}

.detail-box table {
	margin-top: 10px;
	color: #1b1b1b;
}

.detail-box table th, .detail-box table td {
	text-align: left;
	padding-top: 2px;
	padding-bottom: 2px;
	font-size: 14px;
}

.detail-box table th {
	width: 20%;
	font-weight: 400;
	color: #737373;
}

.detail-box table td {
	width: 30%;
    padding: 0 5px;
}

.detail-box .s-btn {
    width: 220px;
    height: 50px;
    margin-top: 15px;
    border: 1px solid #414aea;
    outline: 0;
    background: none;
    font-size: 20px;
    font-weight: 700;
    color: #414aea;
    font-family: "twayFly";
    border-radius: 0;
    box-shadow: none;
}
  </style>
</head>
<body>
  <div id="wrap">
    
    <!-- 헤더 -->
    <jsp:include page="common/header.jsp"></jsp:include>
    
    <!-- main -->
    <main>
      <article class="main-img" style="background-image: linear-gradient(to bottom,rgba(27, 27, 27, 0) 5%,rgba(27, 27, 27, 0) ,rgba(27, 27, 27, 1)),url('<c:url value='/resources/images/theme/${randomImg }'/>');"></article>
      <!-- section1-->
      <section id="section" class="section1">
        <h2>많이찾는 테마</h2>
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img.jpg'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img2.png'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img3.jpg'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img4.png'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img5.jpg'/>" alt=""></div>
          </div>
        </div>
      </section>
      <!-- section2-->
      <section id="section" class="section2">
        <h2>최신 등록 테마</h2>
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
          <c:forEach var="newImg" items="${newImg }">
          	<div class="swiper-slide"><img id="img" name="${newImg.TName }" class="${newImg.comName }" src="<c:url value='/resources/images/theme/${newImg.TImage }'/>" alt="${newImg.comPocus}"></div>
          </c:forEach>
          </div>
        </div>
      </section>
      <c:forEach var="getCategory" items="${getCategory }" varStatus="status">
      <section id="section">
      	<h2>장르별 테마 : ${getCategory.TCategory }</h2>
      		<div class="swiper mySwiper">
	          <div class="swiper-wrapper">
			     <c:forEach var="cateImg" items="${cateImg[status.index] }"> <!--status는 상위 forEach의 인덱스 번호를 인용하여 for문식으로 다시한번 돌림  -->
			     <div class="swiper-slide"><img id="img" name="${cateImg.TName }" class="${cateImg.comName }" src="<c:url value='/resources/images/theme/${cateImg.TImage }'/>" alt="${cateImg.comPocus}"></div>
		      </c:forEach>
	          </div>
	        </div>
      	</section>
      </c:forEach>
    </main>
    <div class="detail-pop"></div>
    <!-- footer bottom-nav -->
    <jsp:include page="common/footer.jsp"></jsp:include>
  </div>
  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,
      spaceBetween: 10,
      freeMode: true,
    });
    $(function(){
    	 // 테마 팝업창
    	$("[id*='img']").click(function() {
    		$('.detail-pop').removeClass('on');
    		var company = $(this).attr('class') + " - " + $(this).attr('alt');
    		var tName = $(this).attr('name');
    		var allData = {"company": company, "tName": tName};
    		$.ajax({
    			async: true,
    			type: 'POST',
    			data: JSON.stringify(allData),
    			url: 'search/themeDetail',
    			dataType: 'html',
    			contentType: 'application/json; charset=UTF-8',
    			success: function(data) {
    				$('.detail-pop').html(data);
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
