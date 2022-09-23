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
<link rel="stylesheet" href="<c:url value='/resources/css/user/find_IdPw.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
      <!-- header 영역 -->
      <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
      <!-- 메인 영역 -->
      <main>
        <h3 class="subtitle">비밀번호 변경</h3>
        <p class="msg changeMsg">* 비밀번호 찾기에서는 비밀번호 변경만 가능합니다.</p>
        <form class="change-Pw" id="change-Pw" action="changePw" method="post">
        	<label class="change-item uPasswd1">
              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 새 비밀번호 입력">
              <p class="checkMsg" id="checkPw"></p>
            </label>
            <label class="change-item uPasswd2">
              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인">
              <p class="checkMsg" id="checkPw2"></p>
            </label>
            <input type="button" name="change" value="비밀번호 변경" class="common-btn change-btn">
        </form>
        
        <!-- 비밀번호 변경 성공 팝업창 -->
        <c:if test="${pwSuc.length() > 0}">
	        <div class="popUp-box">
	        	<div class="popUp-item">
	        		<p>비밀번호가 변경되었습니다.</p>
	        		<button class="s-btn" onclick="location.href='<c:url value='/user/login'/>'">로그인하기</button>
	        	</div>
	        </div>
        </c:if>
        <!-- 비밀번호 변경 실패 팝업창 -->
        <c:if test="${pwErr.length() > 0}">
	        <div class="popUp-box">
	        	<div class="popUp-item">
	        		<p>현재 비밀번호와 동일합니다.<br>다시 입력해주세요.</p>
	        		<button class="s-btn" onclick="location.href='<c:url value='/user/success_findPw'/>'">되돌아가기</button>
	        	</div>
	        </div>
        </c:if>
      </main>
    </div>
    <!-- 푸터 영역 -->
    <jsp:include page="../common/copyright.jsp"></jsp:include>
    
    <script type="text/javascript">
    	$(function() {
    		// 비밀번호 입력 제한 실시간 체크
    		$('#uPasswd1').keyup(function() {
    			var pw1 = $('#uPasswd1').val();
    			if(pw1.length < 8) {
    				$('#checkPw').text('비밀번호는 8자 이상으로 입력해주세요.');
    				$('#checkPw').removeClass('suc');
    				$('#checkPw').addClass('err');
    				$('.change-btn').attr('disabled', 'disabled');
    			} else if(pw1.length > 16) {
    				$('#checkPw').text('비밀번호는 16자 이내로 입력해주세요.');
    				$('#checkPw').removeClass('suc');
    				$('#checkPw').addClass('err');
    				$('.change-btn').attr('disabled', 'disabled');
    			} else if(pw1.length > 7 && pw1.length < 17) {
    				$('#checkPw').text('사용가능한 비밀번호입니다.');
    				$('#checkPw').removeClass('err');
					$('#checkPw').addClass('suc');
					$('.change-btn').removeAttr('disabled');
    			}
    		});
    		
    		// 비밀번호 확인 실시간 체크
    		$('#uPasswd2').keyup(function() {
    			var pw1 = $('#uPasswd1').val();
        		var pw2 = $('#uPasswd2').val();
    			if(pw1 != '' || pw2 != '') {
    				if(pw1 == pw2) {
    					$('#checkPw2').text('비밀번호가 일치합니다.');
						$('#checkPw2').removeClass('err');
						$('#checkPw2').addClass('suc');
						$('.change-btn').removeAttr('disabled');
    				} else {
    					$('#checkPw2').text('비밀번호가 일치하지 않습니다.');
    					$('#checkId').removeClass('suc');
        				$('#checkPw2').addClass('err');
        				$('.change-btn').attr('disabled', 'disabled');
    				}
    			}
    		});
    		
    		// 비밀번호 변경 버튼 클릭시 공백 검사
    		$('.change-btn').on('click', function() {
    			var uPasswd1 = $('#uPasswd1').val();
    			var uPasswd2 = $('#uPasswd2').val();
    			
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
    			
    			// 빈칸 없을 때 제출
    			$('#change-Pw').submit();
    		});
    	});
    </script>
</body>
</html>