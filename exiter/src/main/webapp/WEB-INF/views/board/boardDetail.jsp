<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/board.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>board</title>
</head>
<body>
	<div id="wrap">
	<!-- header 영역 -->
        <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
        <!-- 메인 영역 -->
		<main>
			<h2>커뮤니티</h2>
			<section id="section">
				<c:forEach var="boardInfo" items="${boardInfo }"> 
				<p>${boardInfo.BTitle }</p>
				<p>${boardInfo.BCategory }</p>
				<span>${boardInfo.UGrade }</span>
				<span>${boardInfo.userId }</span>
				<span>${boardInfo.regDate }</span>
				<p>${boardInfo.BDef }</p>
				<input class="h-category" type="hidden" value="${boardInfo.BCategory }">
				<form:form modelAttribute="board" method="post">
					<input type="hidden" value="${uid }" name="uid">
					<input type="hidden" value="${boardInfo.bid }" name="bid">
					<input type="text" name="bcDef">
					<input type="submit">
				</form:form>
				</c:forEach>
				<c:forEach var="boardComment" items="${boardComment }">
				<span>${boardComment.UGrade }</span>
				<span>${boardComment.userId }</span>
				<span>${boardComment.regDate }</span><br>
				<span>${boardComment.bcDef }</span><br>
				</c:forEach>
			</section>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	    <script type="text/javascript">
			$(function(){
    		$(document).ready(function(){
    			var category2 = $('.h-category').val();
    			$.ajax({
    				async: true,
    				type: 'get',
    				data: {category2},
    				url: 'http://localhost:8080/exiter/board/ajax',
    				dataType: 'json',
    				contentType: 'application/json; charset=UTF-8',
    				success: function(data) {
    					console.log("dd")
    				}
    			});
    		});
		});
    </script>
</body>
</html>