<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String url = request.getHeader("referer"); %> 
<header>
	<nav id="top-nav">
	  <div class="logo-img"><a href="/exiter">E</a></div>
	  <div class="right-img">
	  <% if ( url.contains("http://localhost:8080/exiter/user/login")){%>  		
	  		<div class="undo-img"><a href="<%=request.getHeader("referer")%>"></a></div>
	   <% }else {%>
		  	<div class="undo-img"><a href="/exiter"></a></div>
	   <% } %> 
	  </div>
	</nav>
</header>