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
				<li>공지사항</li>
				<li>자유게시판</li>
				<li>일행구하기</li>
				<li>QnA</li>
			</ul>
			</div>
			<section id="section">
				<div class="table-wrap">
					<table>
						<c:forEach var="boardInfo1" items="${boardInfo1 }"> 
							<tr>
								<td>
									<div class="boardInfo">
										<a href="/exiter/board/boardDetail/${boardInfo1.bid }"></a>
										<h1 class="title">${boardInfo1.BTitle }</h1>
										<p class="def">${boardInfo1.BDef }</p>
										<div class="user">
											<span class="grade">${boardInfo1.UGrade }</span>
											<span class="id">${boardInfo1.userId }</span>
											<span class="date">${boardInfo1.regDate }</span>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="table-wrap">
					<table>
						<c:forEach var="boardInfo2" items="${boardInfo2 }"> 
							<tr>
								<td>
									<div class="boardInfo">
										<a href="/exiter/board/boardDetail/${boardInfo2.bid }"></a>
										<h1 class="title">${boardInfo2.BTitle }</h1>
										<p class="def">${boardInfo2.BDef }</p>
										<div class="user">
											<span class="grade">${boardInfo2.UGrade }</span>
											<span class="id">${boardInfo2.userId }</span>
											<span class="date"> ${boardInfo2.regDate }</span>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="table-wrap">
					<table>
						<c:forEach var="boardInfo3" items="${boardInfo3 }"> 
							<tr>
								<td>
									<div class="boardInfo">
										<a href="/exiter/board/boardDetail/${boardInfo3.bid }"></a>
										<h1 class="title">${boardInfo3.BTitle }</h1>
										<p class="def">${boardInfo3.BDef }</p>
										<div class="user">
											<span class="grade">${boardInfo3.UGrade }</span>
											<span class="id">${boardInfo3.userId }</span>
											<span class="date">${boardInfo3.regDate }</span>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="table-wrap">
					<table>
						<c:forEach var="boardInfo4" items="${boardInfo4 }"> 
							<tr>
								<td>
									<div class="boardInfo">
										<a href="/exiter/board/boardDetail/${boardInfo4.bid }"></a>
										<h1 class="title">${boardInfo4.BTitle }</h1>
										<p class="def">${boardInfo4.BDef }</p>
										<div class="user">
											<!-- <span class="grade">${boardInfo4.UGrade }</span>  -->
											<span class="id">${boardInfo4.userId }</span>
											<span class="date">${boardInfo4.regDate }</span>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
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
			$('li').click(function(){
				$('.selCate').removeClass('changed changed1 changed2');
				if($(this).text() == "공지사항"){
					$('.selCate').removeClass('changed');
					$('#section').css("margin-left","0")
				}else if($(this).text() == "자유게시판"){
					$('.selCate').addClass('changed');
					$('#section').css("margin-left","-100%")
				}else if($(this).text() == "일행구하기"){
					$('.selCate').addClass('changed1');
					$('#section').css("margin-left","-200%")
				}else if($(this).text() == "QnA"){
					$('.selCate').addClass('changed2');
					$('#section').css("margin-left","-300%")
				}
			});
		});
    </script>
</body>
</html>