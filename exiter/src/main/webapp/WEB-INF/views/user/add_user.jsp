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
          <form class="signUp" id="signUp" action="" method="post">
            <label class="signUp-item userId">
              <input type="text" id="userId" name="userId" placeholder="아이디">
              <p class="msg" id="checkId"></p>
            </label>
            <label class="signUp-item uPasswd1">
              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 비밀번호 입력">
              <p class="msg" id="checkPw"></p>
            </label>
            <label class="signUp-item uPasswd2">
              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인">
              <p class="msg" id="checkPw2"></p>
            </label>
            <label class="signUp-item uName">
              <input type="text" id="uName" name="uName" placeholder="이름">
              <p class="msg" id="checkName"></p>
            </label>
            <label class="signUp-item uPhone">
              <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="전화번호 ex) 010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
              <p class="msg" id="checkPhone"></p>
            </label>
            <input type="button" name="signUp" value="회원가입" class="common-btn signUp-btn">
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
							$('#checkId').removeClass('err');
							$('#checkId').addClass('suc');
							$('#checkId').text('사용 가능한 아이디입니다.');
							$('.signUp-btn').removeAttr('disabled');
						}
					}
				});
			});
    		
    		// 비밀번호 입력 제한 실시간 체크
    		$('#uPasswd1').keyup(function() {
    			var pw1 = $('#uPasswd1').val();
    			if(pw1.length < 8) {
    				$('#checkPw').text('비밀번호는 8자 이상으로 입력해주세요.');
    				$('#checkPw').removeClass('suc');
    				$('#checkPw').addClass('err');
    				$('.signUp-btn').attr('disabled', 'disabled');
    			} else if(pw1.length > 16) {
    				$('#checkPw').text('비밀번호는 16자 이내로 입력해주세요.');
    				$('#checkPw').removeClass('suc');
    				$('#checkPw').addClass('err');
    				$('.signUp-btn').attr('disabled', 'disabled');
    			} else if(pw1.length > 7 && pw1.length < 17) {
    				$('#checkPw').text('사용가능한 비밀번호입니다.');
    				$('#checkPw').removeClass('err');
					$('#checkPw').addClass('suc');
					$('.signUp-btn').removeAttr('disabled');
    			}
    		})
    		
    		// 비밀번호 확인 실시간 체크
    		$('#uPasswd2').keyup(function() {
    			var pw1 = $('#uPasswd1').val();
        		var pw2 = $('#uPasswd2').val();
    			if(pw1 != '' || pw2 != '') {
    				if(pw1 == pw2) {
    					$('#checkPw2').text('비밀번호가 일치합니다.');
						$('#checkPw2').removeClass('err');
						$('#checkPw2').addClass('suc');
						$('.signUp-btn').removeAttr('disabled');
    				} else {
    					$('#checkPw2').text('비밀번호가 일치하지 않습니다.');
    					$('#checkId').removeClass('suc');
        				$('#checkPw2').addClass('err');
        				$('.signUp-btn').attr('disabled', 'disabled');
    				}
    			}
    		});
    		
    		// 회원가입 버튼 클릭시 공백 검사
    		$('.signUp-btn').on("click", function() {
    			var userId = $('#userId').val();
    			var uPasswd1 = $('#uPasswd1').val();
    			var uPasswd2 = $('#uPasswd2').val();
    			var uName = $('#uName').val();
    			var uPhone = $('#uPhone').val();
    			var phoneregex = /^\d{3}-\d{3,4}-\d{4}$/;
    			
    			if(userId == null || userId == "") {
    				$('#checkId').text('아이디를 입력해주세요.');
					$('#checkId').removeClass('suc');
					$('#checkId').addClass('err');
					return;
    			}
    			
    			if(uPasswd1 == null || uPasswd1 == "") {
    				$('#checkPw').text('비밀번호를 입력해주세요.');
    				$('#checkPw').addClass('err');
    				return;
    			}
    			
    			if(uPasswd2 == null || uPasswd2 == "") {
    				$('#checkPw2').text('비밀번호를 한번 더 입력해주세요.');
    				$('#checkPw2').addClass('err');
					return;
    			}
    			
    			if(uName == null || uName == "") {
    				$('#checkName').show();
    				$('#checkName').text('이름을 입력해주세요.');
					$('#checkName').removeClass('suc');
					$('#checkName').addClass('err');
					return;
    			}
    			
    			var phoneregex = phoneregex.exec(uPhone);
    			if(phoneregex == null || phoneregex == "") {
    				$('#checkPhone').show();
    				$('#checkPhone').text('전화번호를 양식에 맞게 입력해주세요.');
					$('#checkPhone').removeClass('suc');
					$('#checkPhone').addClass('err');
					return;
    			}
    			
    			// 빈칸 없을 때 제출
    			$('#signUp').submit();
    		});
    		
    		// 공백 없을 때 에러메시지 삭제
    		$('#uName').keyup(function() {
    			var uName = $('#uName').val();
    			if(uName.length > 0) {
    				$('#checkName').hide();
    			}
    		});
    		$('#uPhone').keyup(function() {
    			var uPhone = $('#uPhone').val();
    			if(uPhone.length > 0) {
    				$('#checkPhone').hide();
    			}
    		});
    	});
    </script>
</body>
</html>