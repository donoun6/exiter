<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<nav id="top-nav">
	  <div class="logo-img"><a href="/exiter">E</a></div>
	  <div class="right-img">
	    <div class="undo-img"><a href="<%=request.getHeader("referer")%>"></a></div>
	  </div>
	</nav>
</header>