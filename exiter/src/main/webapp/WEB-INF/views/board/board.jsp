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
<% String userId = (String)session.getAttribute("userId");
if (userId == null){
	response.sendRedirect("/exiter/user/login");
	return;
}%>
	<div id="wrap">
	<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
		<main>
		<h2>커뮤니티</h2>
			<div >
			<ul class="selCate">
				<li class="dd">공지사항</li>
				<li>자유게시판</li>
				<li>일행구하기</li>
				<li>QnA</li>
			</ul>
			<form action="get" class="sleform">
			<input type="hidden" class="sel" value="공지사항">
			</form>
			</div>
			<section id="section">
				<div id="ajaxReturn"></div>
				<div class="side-btn">
				<div class="sc-btn"><div class="sc-img"><a href="<c:url value='/board/boardWrite'/>"></a></div></div>
				<div class="wt-btn"><div class="wt-img"><a href="<c:url value='/board/boardWrite'/>"></a></div></div>
				</div>
			</section>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<!-- script 영역 -->
    <script type="text/javascript">
			$(function(){
			
			$(document).ready(function(){
				if ("${category2}" == "") {
					$( 'li:contains(공지사항)' ).trigger("click");
				}else{
					$('.selCate').addClass('noneTr');
					$( 'li:contains("${category2}")' ).trigger("click");
				}
			})	
				
    		$('li').on("click",function() {
				$('.selCate').removeClass('changed changed1 changed2');
				if($(this).text() == "공지사항"){
					$('.selCate').removeClass('changed');
				}else if($(this).text() == "자유게시판"){
					$('.selCate').addClass('changed');
				}else if($(this).text() == "일행구하기"){
					$('.selCate').addClass('changed1');
				}else if($(this).text() == "QnA"){
					$('.selCate').addClass('changed2');
				}
				if($('.selCate').hasClass('noneTr')){
					setTimeout(function() {
						$('.selCate').removeClass('noneTr');
						}, 500);
				}
    			var category = $(this).text();
    			$.ajax({
    				async: true,
    				type: 'get',
    				data: {category},
    				url: 'ajax',
    				dataType: 'html',
    				contentType: 'application/json; charset=UTF-8',
    				success: function(data) {
    					$("#ajaxReturn").html(data);
    				}
    			});
    		});
    		
		});
    </script>
</body>
</html>