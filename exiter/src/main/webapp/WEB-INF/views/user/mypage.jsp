<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/copyright.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/user/mypage.css'/>">
<title>mypage</title>
</head>
<body>
    <div class="content">
      <div class="top-container">
      </div>
      <div class="mypage-container">
        <!--상단-->
          <div class="name-box">
            <div class="name">
              윤정짱
              <span class="id">dbswjsWkd</span>
            </div>
            <div class="profile">
              <img src="./img/key.png" alt="man">
            </div>
          </div>

          <div class="top-list-box">
            <div class="top-list">
              <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
              <span class="material-symbols-outlined">stars</span>
              <p>등급</p>
              <p>방린이</p>
            </div>
            <div class="top-list">
              <span class="material-symbols-outlined">book_online</span>
              <p>예약횟수</p>
              <p>3번</p>
            </div>
          </div>


        <div class="middle-box">
          현재 예약중인 테마를 띄울까?
        </div>

        <div class="bottom-box">
          <div class="reservation">
            <img src="./img/booking.png" alt="booking">
            <h4>예약내역</h4>
          </div>
          <div class="record">
            <img src="./img/record.png" alt="booking">
            <h4>내기록확인</h4>
          </div>
          <div class="ranking">
            <img src="./img/ranking.png" alt="booking">
            <h4>랭킹</h4>
          </div>
        </div>

        <table class="bottom-list-box">
          <tr><td>내 게시글</td></tr>
          <tr><td>내 리뷰</td></tr>
          <tr><td>댓글</td></tr>
          <tr><td>1:1 문의</td></tr>
          <tr><td>회원정보 변경</td></tr>
        </table>

      </div>
    </div>
</body>
</html>