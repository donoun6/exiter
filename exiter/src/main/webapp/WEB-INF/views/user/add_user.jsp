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
<link rel="stylesheet" href="<c:url value='/resources/css/user/add_user.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
      <!-- header 영역 -->
      <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
      <!-- 메인 영역 -->
      <main>
        <h3 class="title">회원가입</h3>
        <div class="signUp-box">
          <form class="signUp" action="" method="post">
            <label class="signUp-item userId">
              <input type="text" id="userId" name="userId" placeholder="아이디">
              <p class="msg" id="checkId"></p>
            </label>
            <label class="signUp-item uPasswd1">
              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 비밀번호 입력">
              <p class="msg" id="checkPw"></p>
            </label>
            <label class="signUp-item uPasswd2">
              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인" minlength="8" maxlength="16">
              <p class="msg suc" id="pwSuccess">비밀번호가 일치합니다.</p>
              <p class="msg err" id="pwError">비밀번호가 일치하지 않습니다.</p>
            </label>
            <label class="signUp-item uName">
              <input type="text" id="uName" name="uName" placeholder="이름">
            </label>
            <label class="signUp-item uPhone">
              <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="전화번호 ex) 010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
            </label>
            <input type="submit" name="signUp" value="회원가입" class="common-btn signUp-btn">
          </form>
        </div>
        
        <!-- 회원가입 성공 팝업창 -->
        <c:if test="${success.length() > 0}">
	        <div class="popUp-box">
	        	<div class="popUp-item">
	        		회원가입 되었습니다.
	        		<button class="s-btn" onclick="location.href='<c:url value='/user/login'/>'">로그인하기</button>
	        	</div>
	        </div>
        </c:if>
      </main>
      <!-- 푸터 copyright 영역 -->
      <jsp:include page="../common/copyright.jsp"></jsp:include>
    </div>
    
    <script type="text/javascript">
    	$(function() {
    		// 아이디 실시간 중복 체크(ajax 활용)
			$('#userId').keyup(function() {
				var userId = $('#userId').val();
				$.ajax({
					async: true,
					type: 'POST',
					data: userId,
					url: "checkId",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					success: function(data) {
						if(data.cnt > 0) {
							// 아이디가 존재할 경우
							$('#checkId').text('이미 사용중인 아이디입니다.');
							$('#checkId').removeClass('suc');
							$('#checkId').addClass('err');
							$('.signUp-btn').attr('disabled', 'disabled');
						} else {
							// 아이디가 존재하지 않을 경우
							$('#checkId').text('사용 가능한 아이디입니다.');
							$('#checkId').removeClass('err');
							$('#checkId').addClass('suc');
							$('.signUp-btn').removeAttr('disabled');
						}
					}
				});
			});
    		
    		// 비밀번호 입력 제한 실시간 체크
    		var pw1 = $('#uPasswd1').val();
    		var pw2 = $('#uPasswd2').val();
    		$('#uPasswd1').keyup(function() {
    			var pw1 = $('#uPasswd1').val();
    			if(pw1.length < 8) {
    				$('#checkPw').text('비밀번호는 8자 이상으로 입력해주세요.');
    				$('#checkPw').addClass('err');
    				$('.signUp-btn').attr('disabled', 'disabled');
    			} else if(pw1.length > 16) {
    				$('#checkPw').text('비밀번호는 16자 이내로 입력해주세요.');
    				$('#checkPw').addClass('err');
    				$('.signUp-btn').attr('disabled', 'disabled');
    			} else {
    				$('#checkPw').text('사용가능한 비밀번호입니다.');
    				$('#checkPw').removeClass('err');
					$('#checkPw').addClass('suc');
    				$('.signUp-btn').removeAttr('disabled');
    			}
    		})
    		
    		// 비밀번호 확인 실시간 체크
    		$('#pwSuccess').hide();
    		$('#pwError').hide();
    		$('#uPasswd2').keyup(function() {
    			var pw1 = $('#uPasswd1').val();
        		var pw2 = $('#uPasswd2').val();
    			if(pw1 != '' || pw2 != '') {
    				if(pw1 == pw2) {
    					$('#pwSuccess').show();
    					$('#pwError').hide();
    					$('.signUp-btn').removeAttr('disabled');
    				} else {
    					$('#pwSuccess').hide();
    					$('#pwError').show();
    					$('.signUp-btn').attr('disabled', 'disabled');
    				}
    			}
    		});
    	});
    </script>
</body>
</html>