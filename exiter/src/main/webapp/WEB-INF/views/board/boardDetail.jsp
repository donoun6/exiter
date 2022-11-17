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
	<link rel="stylesheet"
	href="<c:url value='/resources/css/board/boardDetail.css'/>">
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
				<div class="boardInfo">
				<div class="titleInfo">
					<span class="category">${boardInfo.BCategory }</span>
					<span class="tName">${boardInfo.BTitle }</span>
				</div>
				<div class="userInfo">
				<div>
					<span class="grade">${boardInfo.UGrade }</span>
					<span class="userId">${boardInfo.userId }</span>
				</div>
					<span class="date">${boardInfo.regDate }</span>
				</div>
				</div>
				<div class="boardDef">
					<p>${boardInfo.BDef }</p>
				</div>
				<div class="comLine">댓글</div>
				<c:forEach var="boardComment" items="${boardComment }">
				<div class="commentBox">
					<div class="comUserInfo">
						<div>
							<span>${boardComment.UGrade }</span>
							<span>${boardComment.userId }</span>
						</div>
						<span class="date">${boardComment.regDate }</span>
					</div>
					<div class="comDef">
						<p>${boardComment.bcDef }</p>
					</div>
				</div>
				</c:forEach>
				<input class="h-category" type="hidden" value="${boardInfo.BCategory }">
				<form:form modelAttribute="board" method="post">
					<p>댓글 쓰기</p>
					<input type="hidden" value="${uid }" name="uid">
					<input type="hidden" value="${boardInfo.bid }" name="bid">
					<textarea class="bcDef" name="bcDef" placeholder="회원 간 불편함이 발생하지 않도록 따듯한 댓글 부탁드립니다."></textarea><br>
					<input class="submit" type="submit" value="등록">
				</form:form>
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