<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
	<nav id="bottom-nav">
		<c:choose>
			<c:when test="${sessionScope.userId eq null}">
				<div><img src="<c:url value='/resources/images/icon/home.png'/>" alt=""><a href="<c:url value='/'/>"><span>홈</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/search.png'/>" alt=""><a href="<c:url value='/search/search_theme'/>"><span>검색</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/signUp.png'/>" alt=""><a href="<c:url value='/user/add_user'/>"><span>회원가입</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/login_logout.png'/>" alt=""><a href="<c:url value='/user/login'/>"><span>로그인</span></a></div>
			</c:when>
			<c:otherwise>
				<div><img src="<c:url value='/resources/images/icon/home.png'/>" alt=""><a href="<c:url value='/'/>"><span>홈</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/search.png'/>" alt=""><a href="<c:url value='/search/search_theme'/>"><span>검색</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/board.png'/>" alt=""><a href="<c:url value='/board/board'/>"><span>커뮤니티</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/account.png'/>" alt=""><a href="<c:url value='/user/mypage'/>"><span>마이페이지</span></a></div>
				<div><img src="<c:url value='/resources/images/icon/login_logout.png'/>" alt=""><a href="<c:url value='/user/logout'/>"><span>로그아웃</span></a></div>
			</c:otherwise>
		</c:choose>
	</nav>
</footer>
