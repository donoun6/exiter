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
        	<h3 class="title">회원정보 수정</h3>
	        <div class="update-box">
	          <form class="update" id="update" action="update_userInfo" method="post">
	            <label class="update-item userId">
	              <input type="text" id="userId" name="userId" placeholder="아이디" readonly value="${user.userId}">
	              <p class="msg" id="checkId"></p>
	            </label>
	            <label class="update-item uPasswd1">
	              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 비밀번호 입력" value="${user.getUPasswd()}">
	              <p class="msg" id="checkPw"></p>
	            </label>
	            <label class="update-item uPasswd2">
	              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인" value="${user.getUPasswd()}">
	              <p class="msg" id="checkPw2"></p>
	            </label>
	            <label class="update-item uName">
	              <input type="text" id="uName" name="uName" placeholder="이름" readonly value="${user.getUName()}">
	              <p class="msg" id="checkName"></p>
	            </label>
	            <label class="update-item uPhone">
	              <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="전화번호 ex) 010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}"  value="${user.getUPhone()}">
	              <p class="msg" id="checkPhone"></p>
	            </label>
	            <input type="button" name="update" value="정보수정" class="common-btn update-btn">
	          </form>
	        </div>
        </main>
	</div>
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>