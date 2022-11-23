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
				<c:if test="${boardInfo.uid  eq uid}">
					<form class="deletForm" style="background: none; border: none; position: relative;">
						<input type="hidden" name="d-bid" value="${boardInfo.bid }">
						<button style="position: absolute;right: 0;top: -10px;width: 70px;height: 30px;border-radius: 10px;background: #464646;color: white;font-family: &quot;twayFly&quot;;border: none;">삭제</button>
					</form>
				</c:if>
				<div class="comLine">댓글 ${boardCommentCnt}개</div>
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
						<p style="margin-top: 10px;width: 80%;">${boardComment.bcDef }</p>
					</div>
					<c:if test="${boardComment.uid  eq uid}">
						<form style="background: none; border: none; position: relative; margin: 0; padding: 0;">
							<input type="hidden" name="d-bcid" value="${boardComment.bcid }">
						    <button style="position: absolute;right: 0;top: -20px;background: gray;width: 60px;height: 25px;border-radius: 10px;color: white;border: none;font-family: &quot;twayFly&quot;;">삭제</button>
					    </form>
					</c:if>
				</div>
				</c:forEach>
				<c:forEach var="qnaComment" items="${qnaComment }">
				<div class="commentBox">
					<div class="comUserInfo">
						<div>
							<span>${qnaComment.comPocus }-</span>
							<span>${qnaComment.comName } 담당자</span>
						</div>
						<span class="date">${qnaComment.regDate }</span>
					</div>
					<div class="comDef">
						<pre>${qnaComment.bcDef }</pre>
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
    			if(category2 == "QnA"){
					$('.category').css("background","#5a5ae7");
					$('.comLine').remove();
					$('#board').remove();
					$('.boardDef').addClass("qnaDef")
					$('.deletForm').remove();
				}
    			if(category2 == "공지사항"){
					$('.category').css("background","#ff3b3b");
				}
    			if(category2 == "자유게시판"){
					$('.category').css("background","#956a93");
				}
    			if(category2 == "일행구하기"){
					$('.category').css("background","#357035");
				}
    			
    			$.ajax({
    				async: true,
    				type: 'get',
    				data: {category2},
    				url: 'http://localhost:8080/exiter/board/ajax',
    				dataType: 'json',
    				contentType: 'application/json; charset=UTF-8',
    				success: function(data) {
    					
    				}
    			});
    		});
		});
    </script>
</body>
</html>