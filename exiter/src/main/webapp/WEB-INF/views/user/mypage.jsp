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
<link rel="stylesheet" href="<c:url value='/resources/css/user/mypage.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>mypage</title>
</head>
<body>
<div id="wrap">
 	<!-- header 영역 -->
    <jsp:include page="../common/header.jsp"></jsp:include> 
    
    <div class="content">
      <div class="top-container">
      </div>
      <div class="mypage-container">
        <!--상단-->
          <div class="name-box">
            <div class="name">
              ${uName}
              <span class="id">${userId}</span>
            </div>
            <div class="profile">
               <c:if test="${newUGrade.length() > 0}">
              		<img src="<c:url value='/resources/images/icon/${newUGrade}.png'/>" alt="${newUGrade}">
              	</c:if>
              	<c:if test="${newUGrade.length() == 0}">
	              	<img src="<c:url value='/resources/images/icon/${preUGrade}.png'/>" alt="${preUGrade}">
	            </c:if>
            </div>
          </div>

          <div class="top-list-box">
            <div class="top-list">
              <img class="mark" src="<c:url value='/resources/images/icon/mark.png'/>" alt="mark">
              <p>등급</p>
              <p class="grade">
              	<c:if test="${newUGrade.length() > 0}">
              		${newUGrade}
              	</c:if>
              	<c:if test="${newUGrade.length() == 0}">
	              	${preUGrade}
	            </c:if>
              </p>
            </div>
            <div class="top-list">
              <img class="mark" src="<c:url value='/resources/images/icon/count.png'/>" alt="count">
              <p>예약횟수</p>
              <p class="reser-cnt">
              	<a href="<c:url value='/reservation/all_reser_lists'/>">
              		${reserCnt}&nbsp;번</p>
              	</a>
            </div>
          </div>


        <div class="reser-box">
        	<div class="reser-tap">
        		<h5>현재 예약중인 테마</h5>
        		<a href="<c:url value='/reservation/after_reser_list'/>">+</a>
        	</div>
        	<c:if test="${not empty reser}">
        		<div class="reser-item" onclick="javascript:reserDetail(${reser.getRid()});">
		        	<div class="reser-detail">
		        		<p class="r-date">${reser.getRDate()}&nbsp;&nbsp;&nbsp;${reser.getRTime()}</p>
			        	<p class="theme">${reser.getTName()}</p><p class="category">${reser.getTCategory()}</p>
			        	<p class="company">${reser.getComName()} ${reser.getComPocus()}</p>
		        	</div>
		        	<div class="reser-img">
		        		<img alt="${reser.getTName()}" src="/exiter/resources/images/theme/${reser.getTImage()}">
		        	</div>
	        	</div>
        	</c:if>
        	<c:if test="${empty reser}">
        		<p class="not-reser">현재 예약중인 테마가 없습니다.</p>
        	</c:if>
        </div>
        
        <div class="bottom-box">
          <div class="reservation">
          	<a href="<c:url value='/reservation/all_reser_lists'/>">
	            <h5>예약내역</h5>
	            <p><span>${reserCnt}</span>&nbsp;건</p>
	        </a>
          </div>
          <div class="record">
          	<a href="<c:url value='/common/get_ready'/>">
	            <h5>내기록확인</h5>
	            <p><span>-</span></p>
            </a>
          </div>
          <div class="ranking">
          	<a href="<c:url value='/common/get_ready'/>">
	            <h5>랭킹</h5>
	            <p><span>-</span>&nbsp;위</p>
            </a>
          </div>
        </div>

        <table class="bottom-list-box">
          <tr><td><a href="<c:url value='/common/get_ready'/>">내가 쓴 게시글</a></td></tr>
          <tr><td><a href="<c:url value='/common/get_ready'/>">내가 쓴 댓글</a></td></tr>
          <tr><td><a href="<c:url value='/user/update_userInfo'/>">회원정보 변경</a></td></tr>
          <tr><td><a href="<c:url value='/user/logout_pop'/>">로그아웃</a></td></tr>
        </table>
		
		<p class="delete_user"><span>탈퇴하기</span></p>
      </div>
    </div>
    
    <c:if test="${myPageLogout.length() > 0}">
    	<!-- 로그아웃 팝업창 -->
	    <div class="logout-pop">
	    	<div class="popUp-box">
		        <div class="popUp-item">
		        	<p>로그아웃 하시겠습니까?</p>
		        	<div class="btn-box">
		        		<button class="s-btn" onclick="location.href='<c:url value='/user/logout'/>'">로그아웃</button>
		        		<button class="s-btn cancel" onclick="location.href='<c:url value='/user/mypage'/>'">취소</button>
		        	</div>
		        </div>
		    </div>
	    </div>
    </c:if>
    
    <!-- 탈퇴하기 팝업창 -->
    <div class="delete"></div>
    
    <c:if test="${deleteSuc.length() > 0}">
    	<!-- 탈퇴완료 팝업창 -->
	    <div class="delete-pop">
	    	<div class="popUp-box">
		        <div class="popUp-item">
		        	<p>탈퇴되었습니다.</p>
		        	<div class="btn-box">
		        		<button class="s-btn" onclick="location.href='<c:url value='/'/>'">확인</button>
		        	</div>
		        </div>
		    </div>
	    </div>
    </c:if>
    
    <c:if test="${popUp.length() > 0}">
    	<!-- 준비중 팝업창 -->
    	<div class="popUp-wrap">
	    	<div class="popUp-box">
		        <div class="popUp-item">
		        	<p>준비중입니다.</p>
		        	<div class="btn-box">
		        		<button class="s-btn" onclick="location.href='<c:url value='${correntPage}'/>'">확인</button>
		        	</div>
		        </div>
		    </div>
	    </div>
    </c:if>
    
    <c:if test="${newUGrade.length() > 0}">
    	<!-- 등급변경 팝업창 -->
    	<div class="popUp-wrap check-pop">
	    	<div class="popUp-box">
		        <div class="popUp-item">
		        	<p>등급이 변경되었습니다!</p>
		        	<p>${preUGrade} -> ${newUGrade}</p>
		        	<div class="btn-box">
		        		<button class="s-btn check-btn">확인</button>
		        	</div>
		        </div>
		    </div>
	    </div>
    </c:if>
    
    <!-- 등급 정보 팝업창 -->
    <div class="popUp-wrap grade-wrap">
    	<div class="popUp-box grade-box">
	        <div class="popUp-item grade-items">
	        	<p class="title">엑시터 등급표</p>
	        	<p class="grade-item">
	        		<span><img src="<c:url value='/resources/images/icon/방린이.png'/>" alt="방린이">방린이</span>
	        		<span class="def">이용완료 테마 30회 미만</span>
	        	</p>
	        	<p class="grade-item">
	        		<span><img src="<c:url value='/resources/images/icon/방소년.png'/>" alt="방소년">방소년</span>
	        		<span class="def">이용완료 테마 30회 이상</span>
	        	</p>
	        	<p class="grade-item">
	        		<span><img src="<c:url value='/resources/images/icon/방으른.png'/>" alt="방으른">방으른</span>
	        		<span class="def">이용완료 테마 60회 이상</span>
	        	</p>
	        	<p class="grade-item">
	        		<span><img src="<c:url value='/resources/images/icon/엑시터.png'/>" alt="엑시터">엑시터</span>
	        		<span class="def">이용완료 테마 100회 이상</span>
	        	</p>
	        	<div class="btn-box">
	        		<button class="s-btn grade-btn">닫기</button>
	        	</div>
	        </div>
	    </div>
    </div>
    
    
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- 스크립트 영역 -->
    <script type="text/javascript">
    	$(function() {
    		// 테마 제목 두줄일 경우 css 수정
    	 	if($('.theme').outerHeight() > 40) {
    	 		$('.reser-box').css('height', '190px');
    	 		$('.reser-img img').css('height', '130px');
    	 		$('.category').css('margin-left', '0px');
    	 	}
    	});
    	
	 	// 예약 상세 페이지로 이동
		function reserDetail(rid) {
			window.location.href = "/exiter/reservation/reser_detail/" + rid;
		}
 		
	 	// 탈퇴 팝업창
    	$('.delete_user').on('click', 'span', function() {
    		var userId = '${userId}';
    		$.ajax({
    			async: true,
    			type: 'POST',
    			url: 'deleteUserCheck',
    			dataType: 'html',
    			contentType: 'application/json; charset=UTF-8',
    			success: function(data) {
    				$('.delete').html(data);
    			},
    			error: function(error) {
    				console.log(error);
    			}
    		});
    	});
	 	
	 	// 팝업창 닫기
	 	$('.check-btn').click(function() {
	 		$('.check-pop').css('display', 'none');
	 	});
	 	
	 	// 등급정보 팝업창 여닫기
	 	$('.profile, .grade').click(function() {
	 		$('.grade-wrap').css('display', 'block');
	 	});
	 	$('.grade-btn').click(function() {
	 		$('.grade-wrap').css('display', 'none');
	 	});
    </script>
</body>
</html>