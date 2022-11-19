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
<link rel="stylesheet" href="<c:url value='/resources/css/board/my_board.css'/>">
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
        	<h1>내가 쓴 게시글</h1>
        	<div class="title-tab">
          		<h3 class="title not_qna on">Board</h3>
          		<h3 class="title qna">QnA</h3>
        	</div>
        	<div class="board-box"></div>
        </main>
    </div>
    
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    	$(function() {
    		$('.not_qna').trigger('click');
    	});
    	
    	// 상단탭 활성화 및 게시글 조회
    	$('.not_qna, .qna').click(function() {
    		$('.title').removeClass('on');
    		$(this).addClass('on');
    		
    		let category = $(this).attr('class').split(/\s+/)[1];
    		
    		// ajax로 게시글 목록 가져오기
    		$.ajax({
    			async: true,
    			type: 'POST',
    			data: category,
    			url: 'getBoards',
    			dataType: 'html',
    			contentType: 'application/json; charset=UTF-8',
    			success: function(data) {
    				$('.board-box').html(data);
    				// 카테고리 css 변경
    		    	let elems = document.querySelectorAll('.category');
    		    	for(let i = 0; i < elems.length; i++) {
    		    		if(elems[i].innerText == '공지사항') {
    		    			elems[i].style.background = "#ff3b3b";
    		    		} else if(elems[i].innerText == '자유게시판') {
    		    			elems[i].style.background = "#956a93";
    		    		} else if(elems[i].innerText == '일행구하기') {
    		    			elems[i].style.background = "#357035";
    		    		} else if(elems[i].innerText == 'QnA') {
    		    			elems[i].style.background = "#5a5ae7";
    		    		}
    		    	}
    		    	// qna 답변여부 css 변경
    		    	let elems2 = document.querySelectorAll('.comCnt');
    		    	for(let i = 0; i < elems2.length; i++) {
    		    		if(elems2[i].innerText == '답변완료') {
    		    			elems2[i].style.color = "rgb(111,140,255)";
    		    		} else if(elems2[i].innerText == '답변대기중') {
    		    			elems2[i].style.color = "gray";
    		    		}
    		    	}
    			}
    		});
    	});
		
    	
    </script>
</body>
</html>