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
        <h3 class="subtitle">비밀번호 찾기</h3>
        <p class="msg changeMsg">* 비밀번호 찾기에서는 비밀번호 변경만 가능합니다.</p>
        <form class="change-Pw" action="changePw" method="post">
        	<label class="change-item uPasswd1">
              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 새 비밀번호 입력" minlength="8" maxlength="16">
            </label>
            <label class="change-item uPasswd2">
              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인" minlength="8" maxlength="16">
            </label>
            <input type="submit" name="change" value="비밀번호 변경" class="common-btn change-btn">
        </form>
        <!-- 나중에 비밀번호찾기 활성화되는 걸로 바꾸기 -->
      </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/copyright.jsp"></jsp:include>
</body>
</html>