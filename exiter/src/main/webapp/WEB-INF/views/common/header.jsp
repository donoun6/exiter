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
        		<div class="login-img"><a href="<c:url value='/user/logout'/>"></a></div>
        	</c:otherwise>
        </c:choose>
      </div>
    </nav>
  </header>
