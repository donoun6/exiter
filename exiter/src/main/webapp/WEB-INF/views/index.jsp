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
</head>
<body>
  <div id="wrap">
    
    <!-- 헤더 -->
    <jsp:include page="common/header.jsp"></jsp:include>
    
    <!-- main -->
    <main>
      <article class="main-img"></article>
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
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img.jpg'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img2.png'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img3.jpg'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img4.png'/>" alt=""></div>
            <div class="swiper-slide"><img src="<c:url value='/resources/images/theme/img5.jpg'/>" alt=""></div>
          </div>
        </div>
      </section>
      <section id="section" class="section3">
        <h2>인기 장르 테마</h2>
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
    </main>
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
  </script>
</body>
</html>
