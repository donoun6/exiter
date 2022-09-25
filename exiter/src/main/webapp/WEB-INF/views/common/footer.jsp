<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
	<nav id="bottom-nav">
	  <div><img src="<c:url value='/resources/images/icon/home_FILL0_wght400_GRAD0_opsz48.png'/>" alt=""><a href="<c:url value='/'/>"><span>홈</span></a></div>
	  <div><img src="<c:url value='/resources/images/icon/search_FILL0_wght400_GRAD0_opsz48.png'/>" alt=""><a href="<c:url value='/search/search'/>"><span>검색</span></a></div>
	  <div><img src="<c:url value='/resources/images/icon/person_add_FILL0_wght400_GRAD0_opsz48.png'/>" alt=""><a href="<c:url value='/user/add_user'/>"><span>회원가입</span></a></div>
	  <div><img src="<c:url value='/resources/images/icon/login_FILL0_wght400_GRAD0_opsz48.png'/>" alt=""><a href="<c:url value='/user/login'/>"><span>로그인</span></a></div>
	  <div class="hidden"><img src="<c:url value='/resources/images/icon/account.png'/>" alt=""><a href="<c:url value='/user/mypage'/>"><span>마이페이지</span></a></div>
	</nav>
</footer>
<script>
	<% 
		if (session.getAttribute("userId") != null) {
	%>
	document.querySelector(".hidden").style.display = "block";
	document.querySelector("#bottom-nav div:nth-of-type(4)").classList.add("hidden");
	<% 
		} else {
	%>
	document.querySelector("#bottom-nav div:nth-of-type(4).hidden").style.display = "block";
	document.querySelector("#bottom-nav div:nth-of-type(5)").classList.add("hidden");
	<%
		}
	%>
</script>
