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
	<div class="popUp-box">
    	<div class="popUp-item">
    		<p>예약이 취소되었습니다.</p>
    		<button class="s-btn" onclick="location.href='<c:url value='/reservation/all_reser_lists'/>'">확인</button>
    	</div>
    </div>
	
	<div id="wrap">
		<!-- header 영역 -->
      	<jsp:include page="../common/header.jsp"></jsp:include>
        <!-- footer 영역 -->
    	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

</body>
</html>