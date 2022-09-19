<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/copyright.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/user/login.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
      <!-- header 영역 -->
      <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
      <!-- 메인 영역 -->
      <main>
        <h3 class="title">로그인</h3>
        <div class="login-box">
          <form class="login" id="login" action="" method="post">
            <label class="login-item userId">
              <input type="text" id="userId" name="userId" placeholder="아이디">
              <p class="checkMsg" id="checkId"></p>
            </label>
            <label class="login-item passwd">
              <input type="password" id="uPasswd" name="uPasswd" placeholder="비밀번호">
              <p class="msg">* 8~16자리 비밀번호 입력</p>
              <p class="checkMsg" id="checkPw"></p>
            </label>
            <input type="button" name="login" value="로그인" class="common-btn login-btn">
          </form>
          <div class="sign-up">
            EXITER 회원이 아닌가요? <a href="<c:url value='add_user'/>">지금 가입하세요!</a>
          </div>
          <div class="find-idpw">
            아이디/비밀번호를 잊으셨나요? <a href="<c:url value='find_IdPw'/>">아이디/비밀번호 찾기</a>
          </div>
        </div>
      </main>
      <!-- 푸터 copyright 영역 -->
      <jsp:include page="../common/copyright.jsp"></jsp:include>
    </div>
    
    <script type="text/javascript">
    	$(function() {
    		// 아이디 비밀번호 유효성 검사
    		$('.login-btn').on('click', function() {
    			var userId = $('#userId').val();
    			var uPasswd = $('#uPasswd').val();
    			
    			if(userId == null || userId == "") {
    				// 아이디 공백 확인
    				$('#checkId').text('아이디를 입력하세요.');
					$('#checkId').removeClass('suc');
					$('#checkId').addClass('err');
					return;
    			} else if(userId.length > 0) {
    				// 아이디 유무 확인
    				$.ajax({
        				async: true,
    					type: 'POST',
    					data: userId,
    					url: "checkId",
    					dataType: "json",
    					contentType: "application/json; charset=UTF-8",
    					success: function(data) {
    						if(data.cnt == 0) {
    							// 아이디가 존재하지 않을 경우
    							$('#checkId').text('아이디가 존재하지 않습니다.');
    							$('#checkId').addClass('err');
    							return;
    						} else {
    							// 아이디가 존재할 경우
    							return;
    						}
    					}
    				});
        		}
    			if (uPasswd == null || uPasswd == "") {
    				// 비밀번호 공백 확인
    				$('#checkPw').text('비밀번호를 입력해주세요.');
					$('#checkPw').addClass('err');
					return;
    			} else if (uPasswd.length < 8) {
    				// 비밀번호 조건
    				$('#checkPw').text('비밀번호는 8자 이상으로 입력해주세요.');
    				$('#checkPw').addClass('err');
    				
    			} else if (uPasswd.length > 16) {
    				// 비밀번호 조건
    				$('#checkPw').text('비밀번호는 16자 이내로 입력해주세요.');
    				$('#checkPw').addClass('err');
    			} else if (uPasswd.length > 7 && uPasswd.length < 17) {
    				// 아이디, 비밀번호 유효성 검사
    				var allData = {"userId": userId, "uPasswd": uPasswd};
    				$.ajax({
        				async: true,
    					type: 'POST',
    					data: JSON.stringify(allData),
    					url: "checkIdPw",
    					dataType: "json",
    					contentType: "application/json; charset=UTF-8",
    					success: function(data) {
    						console.log(data.cnt);
    						if(data.cnt == 0) {
    							// 비밀번호가 틀린 경우(아이디는 위에서 1차로 검사 끝냄)
    							$('#checkPw').addClass('err');
    							$('#checkPw').text('비밀번호가 틀렸습니다.');
    						} else {
    							// 비밃번호 맞은 경우
    							console.log(uPasswd)
    							$('#checkPw').text('');
    							$('#login').submit();
    						}
    					}
        			});	
    			}
    		});
    		
    		// 다시 입력시 에러메시지 삭제
    		$('#userId').keyup(function() {
    			$('#checkId').text('');
    			$('#checkId').removeClass('err');
    		});
    		$('#uPasswd').keyup(function() {
    			$('#checkPw').text('');
    			$('#checkPw').removeClass('err');
    		});
    		
    	});
    </script>
</body>
</html>