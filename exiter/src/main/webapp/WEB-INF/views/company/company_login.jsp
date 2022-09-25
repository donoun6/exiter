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
<link rel="stylesheet" href="<c:url value='/resources/css/common/copyright.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/company/company_login.css'/>">
  <script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
  <title>Exiter Company login</title>
</head>

<body>
<% String comId = (String)session.getAttribute("comId");
if (comId != null){
	response.sendRedirect("/exiter/company");
	return;
}%>
  <!-- header nav -->
  <jsp:include page="../common/company_header.jsp"></jsp:include>
  <!-- side nav -->
  <div id="wrap">
    <div class="login-wrap">
      <form:form class="login-form" modelAttribute="company" method="post">
        <h1>Exiter</h1>
        <span class="err"> ${err1 }</span>
        <label for="id">ID</label><form:input type="text" id="id" path="comId" value="" placeholder="아이디를 입력해주세요."/><br>
        <span class="err"> ${err }</span>
        <label for="passWord">PassWord</label><form:input type="passWord" id="passWord" path="comPasswd" value="" placeholder="비밀번호를 입력해주세요."/><br>
        <span class="err"> ${err0 }</span><br>
        <input type="submit" id="submit" name="" value="Login">
      </form:form>
      <div class="login-text">
        <span><a href="<c:url value='/company/company_signUp'/>">회원가입</a></span>
        <span><a href="#">계정찾기</a></span>
      </div>
    </div>
  </div>
  <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
</body>

</html>
