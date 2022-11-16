<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String url = request.getHeader("referer"); %> 
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
	   <% 
	   if ( url.contentEquals("http://localhost:8080/exiter/user/login")){%>  
	  		<div class="undo-img"><a href="<%=request.getHeader("referer")%>"></a></div>
	   <% }else if( url.contentEquals("http://localhost:8080/exiter/board/board") ){%>
		   <div class="undo-img"><a onclick="history.back()"></a></div>
	   <% }else if( url.contains("http://localhost:8080/exiter/board/boardDetail/") ){%>
	   <div class="undo-img"><a onclick="history.go(-2)"></a></div>
  	   <% }else {%>
		  	<div class="undo-img"><a href="<c:url value='/'/>"></a></div>
	   <% } %> 
	  </div>
	</nav>
</header>