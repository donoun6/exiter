<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/user/mypage.css'/>">
<title>mypage</title>
</head>
<body>
<div id="wrap">
 	<!-- header 영역 -->
    <jsp:include page="../common/header.jsp"></jsp:include> 
    
    <div class="content">
      <div class="top-container">
      </div>
      <div class="mypage-container">
        <!--상단-->
          <div class="name-box">
            <div class="name">
              ${uName }
              <span class="id">${userId }</span>
            </div>
            <div class="profile">
              <img src="<c:url value='/resources/images/icon/key.png'/>" alt="man" style="rotate: -35deg;">
            </div>
          </div>

          <div class="top-list-box">
            <div class="top-list">
              <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
              <span class="material-symbols-outlined">stars</span>
              <p>등급</p>
              <p>${uGrade }</p>
            </div>
            <div class="top-list">
              <span class="material-symbols-outlined">book_online</span>
              <p>예약횟수</p>
              <p>3번</p>
            </div>
          </div>


        <div class="middle-box">
          <h5>현재 예약중인 테마</h5>
        </div>

        <div class="bottom-box">
          <div class="reservation">
            <h5>예약내역</h5>
            <p><span>0</span>&nbsp;건</p>
          </div>
          <div class="record">
            <h5>내기록확인</h5>
            <p><span>-</span></p>
          </div>
          <div class="ranking">
            <h5>랭킹</h5>
            <p><span>-</span>&nbsp;위</p>
          </div>
        </div>

        <table class="bottom-list-box">
          <tr><td>내가 쓴 게시글</td></tr>
          <tr><td>내가 쓴 댓글</td></tr>
          <tr><td>내 리뷰</td></tr>
          <tr><td>1:1 문의</td></tr>
          <tr><td><a href="<c:url value='/user/update_userInfo'/>">회원정보 변경</a></td></tr>
          <tr><td><a href="<c:url value='/user/logout_pop'/>">로그아웃</a></td></tr>
        </table>
		
		<p class="delete_user"><a href="<c:url value=''/>">탈퇴하기</a></p>
      </div>
    </div>
    
    <!-- 로그아웃 팝업창 -->
    <c:if test="${myPageLogout.length() > 0}">
	    <div class="logout-pop">
	    	<div class="popUp-box">
		        <div class="popUp-item">
		        	<p>로그아웃 하시겠습니까?</p>
		        	<div class="btn-box">
		        		<button class="s-btn" onclick="location.href='<c:url value='/user/logout'/>'">로그아웃</button>
		        		<button class="s-btn cancel" onclick="location.href='<c:url value='/user/mypage'/>'">취소</button>
		        	</div>
		        </div>
		    </div>
	    </div>
    </c:if>
    
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>