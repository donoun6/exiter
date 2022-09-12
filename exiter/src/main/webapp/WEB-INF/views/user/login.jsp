<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/user/login.css'/>">
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
      <!-- header 영역 -->
      <header>
        <div class="logo-img"><a href="<c:url value='/'/>">E</a></div>
      </header>
      <main>
        <h3 class="title">로그인</h3>
        <div class="login-box">
          <form class="login" action="" method="post">
            <label class="login-item userId">
              <input type="text" id="userId" name="userId" placeholder="아이디">
            </label>
            <label class="login-item passwd">
              <input type="password" id="passwd" name="passwd" placeholder="비밀번호" minlength="8" maxlength="16">
              <p class="msg">* 8~16자리 비밀번호 입력</p>
            </label>
            <input type="submit" name="login" value="로그인" class="g-btn login-btn">
          </form>
          <div class="sign-up">
            EXITER 회원이 아닌가요? <a href="<c:url value='add_user'/>">지금 가입하세요!</a>
          </div>
          <div class="find-idpw">
            아이디/비밀번호를 잊으셨나요? <a href="#">아이디/비밀번호 찾기</a>
          </div>
        </div>
      </main>
      <!-- 푸터 영역 -->
      <footer>
        Copyright &copy; 엑시터 2022
      </footer>
    </div>
</body>
</html>