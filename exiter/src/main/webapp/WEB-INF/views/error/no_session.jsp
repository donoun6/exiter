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
<link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/error.css'/>">
<title>Exiter</title>
</head>
<body>
	<!-- 누가 error/no_session 페이지 예쁘게 꾸며주실 분... 제발 건드려주세요! -->
	<div id="wrap">
		<!-- header 영역 -->
      	<jsp:include page="../common/header.jsp"></jsp:include>
        <!-- footer 영역 -->
    	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	
	<!-- <c:if test="${session eq 'no'}"> -->
        <div class="popUp-box">
        	<div class="popUp-item">
        		<p>로그인을 해주세요.</p>
        		<button class="s-btn" onclick="location.href='<c:url value='/user/login'/>'">로그인하기</button>
        	</div>
        </div>
    <!-- </c:if> -->
    
    
    <!-- 
    컨트롤러에서 session에 등록된 userId 확인후 존재하지 않으면 이 페이지로 이동 예정
    if (session == null) {
		model.addAttribute("session", "no");
		return "error/no_session";
	}
	
	if(session.getAttribute("userId") == null) {
		model.addAttribute("session", "no");
		return "error/no_session";
	}
    -->
</body>
</html>