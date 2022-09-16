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
<link rel="stylesheet" href="<c:url value='/resources/css/user/add_user.css'/>">
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
      <!-- header 영역 -->
      <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
      <!-- 메인 영역 -->
      <main>
        <h3 class="title">회원가입</h3>
        <div class="signUp-box">
          <form class="signUp" action="" method="post">
            <label class="signUp-item userId">
              <input type="text" id="userId" name="userId" placeholder="아이디">
            </label>
            <label class="signUp-item uPasswd1">
              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 비밀번호 입력" minlength="8" maxlength="16">
            </label>
            <label class="signUp-item uPasswd2">
              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인" minlength="8" maxlength="16">
            </label>
            <label class="signUp-item uName">
              <input type="text" id="uName" name="uName" placeholder="이름">
            </label>
            <label class="signUp-item uPhone">
              <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="전화번호 ex) 010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
            </label>
            <input type="submit" name="signUp" value="회원가입" class="common-btn signUp-btn">
          </form>
        </div>
      </main>
      <!-- 푸터 copyright 영역 -->
      <jsp:include page="../common/copyright.jsp"></jsp:include>
    </div>
</body>
</html>