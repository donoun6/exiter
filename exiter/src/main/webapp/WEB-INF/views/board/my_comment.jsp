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
<link rel="stylesheet" href="<c:url value='/resources/css/board/my_comment.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>myBoard</title>
</head>
<body>
	<div id="wrap">
		<!-- header 영역 -->
	    <jsp:include page="../common/header.jsp"></jsp:include> 
    
    	<!-- 메인 영역 -->
        <main>
        	<!-- 상단탭 -->
        	<h1>내가 쓴 댓글</h1>
        	
        </main>
    </div>
    
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    	

    </script>
</body>
</html>