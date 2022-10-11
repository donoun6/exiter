<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        		<div class="login-img"><a href="<c:url value='/user/logout_pop3'/>"></a></div>
        	</c:otherwise>
        </c:choose>
      </div>
    </nav>
</header>

<!-- 로그아웃 팝업창 -->
<c:if test="${logoutH.length() > 0}">
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
