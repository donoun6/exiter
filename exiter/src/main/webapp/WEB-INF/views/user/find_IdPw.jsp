<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/copyright.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/user/find_IdPw.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
      <!-- header 영역 -->
      <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
      <!-- 메인 영역 -->
      <main>
        <!-- 상단탭 -->
        <div class="title-tab">
          <h3 class="title find-id on">아이디 찾기</h3>
          <h3 class="title find-pw">비밀번호 찾기</h3>
        </div>
        <div class="find-wrap">
          <div class="find-box find-id on">
            <form class="findId" action="findId" method="post">
              <label class="find-item uName">
                <input type="text" id="uName" name="uName" placeholder="가입시 등록한 이름 입력">
              </label>
              <label class="find-item uPhone">
                <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="가입시 등록한 전화번호 입력" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
                <p class="msg">* ex) 010-0000-0000</p>
              </label>
              <input type="submit" name="findId" value="아이디 찾기" class="common-btn find-btn">
            </form>
          </div>
          <div class="find-box find-pw">
            <form class="findPw" action="findPw" method="post">
              <label class="find-item userId">
                <input type="text" id="userId" name="userId" placeholder="찾으실 아이디 입력">
              </label>
              <label class="find-item uName">
                <input type="text" id="uName" name="uName" placeholder="가입시 등록한 이름 입력">
              </label>
              <label class="find-item uPhone">
                <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="가입시 등록한 전화번호 입력" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
                <p class="msg">* ex) 010-0000-0000</p>
              </label>
              <input type="submit" name="findPw" value="비밀번호 찾기" class="common-btn find-btn">
            </form>
          </div>
        </div>
      </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/copyright.jsp"></jsp:include>
    
    <!-- 스크립트 영역 -->
    <script type="text/javascript">
    	// 클릭시 on 클래스 추가
    	$(function() {
    		$('.title').click(function() {
    			// 타이틀
    			$('.title').removeClass('on');
    			$(this).addClass('on');
    			// 폼 부분
    			$('.find-box').removeClass('on');
    			if($(this).hasClass('find-id')) {
    				$('.find-box.find-id').addClass('on');
    			} else if($(this).hasClass('find-pw')) {
    				$('.find-box.find-pw').addClass('on');
    			}
    		});
    	});
    </script>
</body>
</html>