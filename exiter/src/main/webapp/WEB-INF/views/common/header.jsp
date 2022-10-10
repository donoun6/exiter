<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
	<style type="text/css">
		/* 로그아웃 팝업 */
		.logout-pop {
		  position: fixed;
		  width: 100%;
		  height: 100%;
		  top: 0;
		  margin: 0 auto;
		  backdrop-filter: blur(3px);
		  z-index: 999;
		}
		
		.popUp-box {
		  width: 100%;
		  height: 100%;
		  display: flex;
		  justify-content: center;
		  align-items: flex-start;
		}
		
		.popUp-item {
			width: 300px;
		    height: 200px;
		    line-height: 25px;
			display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    margin-top: calc(100vw - 100px);
		    background: white;
		    border-radius: 25px;
		    color: #666;
		    font-size: 20px;
		    text-align: center;
		}
		
		.popUp-item p span {
			color: #333;
			font-size: 22px;
		    font-weight: 700;
		}
		
		.s-btn {
			width: 120px;
		    height: 40px;
		    margin-top: 30px;
		    background: #414aea;
			border: 0;
		    border-radius: 25px;
		    font-size: 14px;
		    font-weight: 700;
		    color: white;
		    box-shadow: 0px 2px 10px 0px #999;
		}
		
		.s-btn.cancel {
			background: #737373;
		}
	</style>
</head>
<header>
    <nav id="top-nav">
      <div class="cube">
        <div class="face top"><a href="<c:url value='/'/>">E</a></div>
        <div class="face bottom"><a href="<c:url value='/'/>">E</a></div>
        <div class="face left"><a href="<c:url value='/'/>">E</a></div>
        <div class="face right"><a href="<c:url value='/'/>">E</a></div>
        <div class="face front"><a href="<c:url value='/'/>">E</a></div>
        <div class="face back"><a href="<c:url value='/'/>">E</a></div>
      </div>

      <div class="right-img">
        <div class="search-img"><a href="<c:url value='/search/search_theme'/>"></a></div>
        <c:choose>
        	<c:when test="${sessionScope.userId eq null}">
        		<div class="login-img"><a href="<c:url value='/user/login'/>"></a></div>
        	</c:when>
        	<c:otherwise>
        		<div class="login-img"><a href="<c:url value='/user/logout_pop2'/>"></a></div>
        	</c:otherwise>
        </c:choose>
      </div>
    </nav>
</header>

<!-- 로그아웃 팝업창 -->
<c:if test="${logout.length() > 0}">
	<div class="logout-pop">
  		<div class="popUp-box">
			<div class="popUp-item">
				<p>로그아웃 하시겠습니까?</p>
				<div class="btn-box">
					<button class="s-btn" onclick="location.href='<c:url value='/user/logout'/>'">로그아웃</button>
					<button class="s-btn cancel" onclick="location.href='<c:url value='${correntPage}'/>'">취소</button>
				</div>
			</div>
		</div>
	</div>
</c:if>
