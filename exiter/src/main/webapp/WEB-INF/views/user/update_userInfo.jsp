<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/user/update_userInfo.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>Exiter</title>
</head>
<body>
	<div id="wrap">
		<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
        <main class="main">
        	<h3 class="title">회원정보 변경</h3>
	        <div class="update-box">
	          <form class="update" id="update" action="update_userInfo" method="post">
	            <label class="update-item userId">아이디<span>*해당정보는 변경이 불가능합니다.</span>
	              <input type="text" id="userId" name="userId" placeholder="아이디" readonly value="${user.userId}">
	            </label>
	            <label class="update-item uPasswd1">비밀번호
	              <input type="password" id="uPasswd1" name="uPasswd1" placeholder="8~16자리 비밀번호 입력" value="${user.getUPasswd()}" onfocus="this.value=''; return true">
	              <p class="checkMsg" id="checkPw"></p>
	            </label>
	            <label class="update-item uPasswd2">비밀번호 확인
	              <input type="password" id="uPasswd2" name="uPasswd2" placeholder="비밀번호 확인" value="${user.getUPasswd()}" onfocus="this.value=''; return true">
	              <p class="checkMsg" id="checkPw2"></p>
	            </label>
	            <label class="update-item uName">이름<span>*해당정보는 변경이 불가능합니다.</span>
	              <input type="text" id="uName" name="uName" placeholder="이름" readonly value="${user.getUName()}">
	            </label>
	            <label class="update-item uPhone">전화번호
	              <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="전화번호 ex) 010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}"  value="${user.getUPhone()}" onfocus="this.value=''; return true">
	              <p class="msg">* ex) 010-0000-0000</p>
	              <p class="checkMsg" id="checkPhone"></p>
	            </label>
	            <input type="button" name="update" value="정보수정" class="common-btn update-btn">
	          </form>
	          
	          <!-- 비밀번호 변경 성공 팝업창 -->
	          <c:if test="${suc.length() > 0}">
		          <div class="popUp-box">
		        	  <div class="popUp-item">
		        		  <p>회원정보가 변경되었습니다.</p>
		        	  	  <button class="s-btn" onclick="location.href='<c:url value='/user/mypage'/>'">확인</button>
		        	  </div>
		          </div>
	          </c:if>
	        </div>
        </main>
	</div>
	<!-- 푸터 영역 -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <!-- 스크립트 영역 -->
    <script type="text/javascript">
	 	// 비밀번호 입력 제한 실시간 체크
		$('#uPasswd1').keyup(function() {
			var pw1 = $('#uPasswd1').val();
			if(pw1.length < 8) {
				$('#checkPw').text('비밀번호는 8자 이상으로 입력해주세요.');
				$('#checkPw').removeClass('suc');
				$('#checkPw').addClass('err');
				$('.update-btn').attr('disabled', 'disabled');
			} else if(pw1.length > 16) {
				$('#checkPw').text('비밀번호는 16자 이내로 입력해주세요.');
				$('#checkPw').removeClass('suc');
				$('#checkPw').addClass('err');
				$('.update-btn').attr('disabled', 'disabled');
			} else if(pw1.length > 7 && pw1.length < 17) {
				$('#checkPw').text('사용가능한 비밀번호입니다.');
				$('#checkPw').removeClass('err');
				$('#checkPw').addClass('suc');
				$('.update-btn').removeAttr('disabled');
			}
			
			// main 길이 초과시 padding-bottom css 적용
			if($('.main').outerHeight() > 785) {
				$('.main').css('padding-bottom', '80px');
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
					$('.update-btn').removeAttr('disabled');
				} else {
					$('#checkPw2').text('비밀번호가 일치하지 않습니다.');
					$('#checkId').removeClass('suc');
					$('#checkPw2').addClass('err');
					$('.update-btn').attr('disabled', 'disabled');
				}
			}
			// main 길이 초과시 padding-bottom css 적용
			if($('.main').outerHeight() > 785) {
				$('.main').css('padding-bottom', '80px');
			}
		});
		
		// 회원가입 버튼 클릭시 공백 검사
		$('.update-btn').on("click", function() {
			var uPasswd1 = $('#uPasswd1').val();
			var uPasswd2 = $('#uPasswd2').val();
			var uPhone = $('#uPhone').val();
			var phoneregex = /^\d{3}-\d{3,4}-\d{4}$/;
			
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
			
			var phoneregex = phoneregex.exec(uPhone);
			if(phoneregex == null || phoneregex == "") {
				$('#checkPhone').show();
				$('#checkPhone').text('전화번호를 양식에 맞게 입력해주세요.');
				$('#checkPhone').removeClass('suc');
				$('#checkPhone').addClass('err');
				return;
			}
			
			// main 길이 초과시 padding-bottom css 적용
			if($('.main').outerHeight() > 785) {
				$('.main').css('padding-bottom', '80px');
			}
			
			// 빈칸 없을 때 제출
			$('#update').submit();
		});
		
		// 공백 없을 때 에러메시지 삭제
		$('#uPhone').keyup(function() {
			var uPhone = $('#uPhone').val();
			if(uPhone.length > 0) {
				$('#checkPhone').hide();
			}
		});	
    </script>
</body>
</html>