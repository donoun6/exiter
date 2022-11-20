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
        	<!-- 댓글 목록 -->
        	<div class="coms-wrap">
        		<c:choose>
        			<c:when test="${not empty mcList}">
		        		<ul class="coms-ul">
		        			<c:forEach var="mc" items="${mcList}">
		        				<li class="coms-li">
		        					<input type="checkbox" id="${mc.bcid}" class="check-item">
		        					<div class="right-box" onclick="javascript:boardDetail(${mc.bid});">
			        					 <p class="def">${mc.bcDef}</p>
			        					 <c:choose>
			        					 	<c:when test="${not empty mc.BTime}">
			        					 		<p class="date">${mc.BTime}</p>
			        					 	</c:when>
			        					 	<c:otherwise>
			        					 		<p class="date">${mc.regDate}</p>
			        					 	</c:otherwise>
			        					 </c:choose>
			        					 <p class="title">${mc.BTitle}<span class="com-cnt">[${mc.bcCnt}]</</span></p>
		        					</div>
		        				</li>
		        			</c:forEach>
		        		</ul>
		        		<!-- 전체 삭제 -->
		        		<div class="all-check">
		        			<div class="check-wrap"><input type="checkbox" class="all-check-item"><span class="all-span">전체 선택</span></div>
		        			<div class="all-delete">선택 삭제</div>
		        		</div>
        			</c:when>
        			<c:otherwise>
        				<p class="empty-li">작성하신 댓글이 없습니다.</p>
        			</c:otherwise>
        		</c:choose>
        	</div>
        </main>
    </div>
    
    <!-- 선택삭제 팝업창 -->
    <div class="delete-pop">
    	<div class="popUp-box">
	        <div class="popUp-item">
	        	<p>댓글을 삭제하시겠습니까?</p>
	        	<div class="btn-box">
	        		<button class="s-btn d-btn" onclick="javascript:comCheckDelete();">삭제</button>
	        		<button class="s-btn d-btn cancel">취소</button>
	        	</div>
	        </div>
	    </div>
    </div>
    <div class="check-pop">
    	<div class="popUp-box">
	        <div class="popUp-item">
	        	<p>삭제할 댓글을 선택해주세요.</p>
	        	<div class="btn-box">
	        		<button class="s-btn d-btn cancel">확인</button>
	        	</div>
	        </div>
	    </div>
    </div>
    
    <!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- script 영역 -->
    <script type="text/javascript">
    	// 해당 게시글로 이동
    	function boardDetail(bid) {
    		window.location.href = "/exiter/board/boardDetail/" + bid;
    	}
    	
    	let elems = document.querySelectorAll('.category');
    	for(let i = 0; i < elems.length; i++) {
    		if(elems[i].innerText == '공지사항') {
    			elems[i].style.background = "rgb(255, 59, 59)";
    		} else if(elems[i].innerText == '자유게시판') {
    			elems[i].style.background = "rgb(149, 106, 147)";
    		} else if(elems[i].innerText == '일행구하기') {
    			elems[i].style.background = "rgb(53, 112, 53)";
    		} else if(elems[i].innerText == 'qna') {
    			elems[i].style.background = "rgb(90, 90, 231)";
    		}
    	}
    	
    	// 체크박스 전체 선택
    	$('.all-check-item').click(function() {
    		if($('.all-check-item').is(":checked")) {
    			$('.check-item').prop("checked", true);
    		} else {
    			$('.check-item').prop("checked", false);
    		}
    	});
    	
    	// 삭제 팝업창 띄우기
    	$('.all-delete').click(function() {
    		let elems = document.querySelectorAll('.check-item');
    		for(let i = 0; i < elems.length; i++) {
    			if(elems[i].checked) {
    				$('.delete-pop').addClass('on');
    				return;
    			}
    		}
    		$('.check-pop').addClass('on');
    	});
    	
    	// 삭제 팝업창 닫기
    	$('.d-btn.cancel').click(function() {
    		$('.delete-pop').removeClass('on');
    		$('.check-pop').removeClass('on');
    	});
    	
    	// 삭제 컨트롤러 이동
    	function comCheckDelete() {
    		let deleteList = [];
    		let elems = document.querySelectorAll('.check-item');
    		for(let i = 0; i < elems.length; i++) {
    			if(elems[i].checked) {
    				deleteList.push(elems[i].id);
    			}
    		}
    		// 폼생성
    		var newForm = $('<form></form>');
    		newForm.attr("type","hide");
    		newForm.attr("method","post");
    		newForm.attr("action","comCheckDelete");
    		// 폼에 요소 추가
    		newForm.append($('<input/>', {type: 'hidden', name: 'deleteList', value: deleteList }));
    		// 폼 추가
    		newForm.appendTo('body');
    		newForm.submit();
    	}
    </script>
</body>
</html>