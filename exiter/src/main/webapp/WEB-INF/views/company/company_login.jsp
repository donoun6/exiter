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
  <title>Exiter Company</title>
</head>

<body>
  <!-- header nav -->
  <jsp:include page="../common/company_header.jsp"></jsp:include>
  <!-- side nav -->
  <div id="wrap">
    <div class="login-wrap">
      <form class="login-form" action="index.html" method="post">
        <h1>Exiter</h1>
        <label for="id">ID</label><input type="text" id="id" name="" value="" placeholder="아이디를 입력해주세요."><br>
        <label for="passWord">PassWord</label><input type="passWord" id="passWord" name="" value="" placeholder="비밀번호를 입력해주세요."><br>
        <input type="submit" id="submit" name="" value="Login">
      </form>
      <div class="login-text">
        <span><a href="<c:url value='/company/company_add_user'/>">회원가입</a></span>
        <span><a href="#">계정찾기</a></span>
      </div>
    </div>
  </div>
  <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
</body>

</html>
