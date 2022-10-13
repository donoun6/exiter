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
        <!-- 상단탭 -->
        <div class="title-tab">
          <h3 class="title find-id ${on}">아이디 찾기</h3>
          <h3 class="title find-pw ${on}">비밀번호 찾기</h3>
        </div>
        <div class="find-wrap">
          <div class="find-box find-id ${on}">
            <form class="findId" id="findId" action="/exiter/user/findId" method="post">
              <label class="find-item uName">
                <input type="text" id="uName" name="uName" placeholder="가입시 등록한 이름 입력">
                <p class="checkMsg" id="checkName"></p>
              </label>
              <label class="find-item uPhone">
                <input type="text" id="uPhone" name="uPhone" class="uPhone" placeholder="가입시 등록한 전화번호 입력" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
                <p class="msg">* ex) 010-0000-0000</p>
                <p class="checkMsg" id="checkPhone"></p>
              </label>
              <input type="button" name="findId" value="아이디 찾기" class="common-btn find-btn findId-btn">
            </form>
          </div>
          <div class="find-box find-pw ${on}">
            <form class="findPw" id="findPw" action="/exiter/user/findPw" method="post">
              <label class="find-item userId">
                <input type="text" id="userId" name="userId" placeholder="찾으실 아이디 입력">
                <p class="checkMsg" id="checkId"></p>
              </label>
              <label class="find-item uName">
                <input type="text" id="uName2" name="uName" placeholder="가입시 등록한 이름 입력">
                <p class="checkMsg" id="checkName2"></p>
              </label>
              <label class="find-item uPhone">
                <input type="text" id="uPhone2" name="uPhone" class="uPhone" placeholder="가입시 등록한 전화번호 입력" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}">
                <p class="msg">* ex) 010-0000-0000</p>
                <p class="checkMsg" id="checkPhone2"></p>
              </label>
              <input type="button" name="findPw" value="비밀번호 찾기" class="common-btn find-btn findPw-btn">
            </form>
          </div>
        </div>
      </main>
      
        <c:if test="${idSuc.length() > 0}">
            <!-- 아이디찾기 성공 팝업창 -->
            <div class="popUp-wrap">
		        <div class="popUp-box">
		        	<div class="popUp-item">
		        		<p>찾으시는 아이디는<br><span>${userId}</span> 입니다.</p>
		        		<div class="btn-box">
			        		<button class="s-btn" onclick="location.href='<c:url value='/user/login'/>'">로그인하기</button>
			        		<button class="s-btn" onclick="location.href='<c:url value='/user/find_IdPw/pw'/>'">비밀번호 찾기</button>
		        		</div>
		        	</div>
		        </div>
	        </div>
        </c:if>
        
        <c:if test="${idErr.length() > 0}">
            <!-- 아이디찾기 실패 팝업창 -->
            <div class="popUp-wrap">
		        <div class="popUp-box">
		        	<div class="popUp-item">
		        		등록된 회원정보가 없습니다.<br>다시 시도해 주세요.
		        		<button class="s-btn" onclick="location.href='<c:url value='/user/find_IdPw/id'/>'">아이디 찾기</button>
		        	</div>
		        </div>
	        </div>
        </c:if>
        
        <c:if test="${pwErr.length() > 0}">
        	<!-- 비밀번호찾기 실패 팝업창 -->
        	<div class="popUp-wrap">
		        <div class="popUp-box">
		        	<div class="popUp-item">
		        		등록된 회원정보가 없습니다.<br>다시 시도해 주세요.
		        		<button class="s-btn" onclick="location.href='<c:url value='/user/find_IdPw/pw'/>'">비밀번호 찾기</button>
		        	</div>
		        </div>
	        </div>
        </c:if>
        
        <c:if test="${deleteUser.length() > 0}">
	    	<!-- 탈퇴회원 팝업창 -->
		    <div class="popUp-wrap">
		    	<div class="popUp-box">
			        <div class="popUp-item">
			        	<p>탈퇴한 회원입니다.</p>
			        	<div class="btn-box">
			        		<button class="s-btn" onclick="location.href='<c:url value='/user/find_IdPw/${find}'/>'">닫기</button>
			        	</div>
			        </div>
			    </div>
		    </div>
	    </c:if>
    </div>
    
    <!-- 푸터 영역 -->
    <jsp:include page="../common/copyright.jsp"></jsp:include>
    
    <!-- 스크립트 영역 -->
    <script type="text/javascript">
    	// 클릭시 on 클래스 추가
    	$(function() {
    		$('.title').click(function() {
    			// 타이틀
    			$('.title').removeClass('on');
    			$('.title').removeClass('id-on');
    			$('.title').removeClass('pw-on');
    			$(this).addClass('on');
    			// 폼 부분
    			$('.find-box').removeClass('on');
    			$('.find-box').removeClass('id-on');
    			$('.find-box').removeClass('pw-on');
    			if($(this).hasClass('find-id')) {
    				$('.find-box.find-id').addClass('on');
    			} else if($(this).hasClass('find-pw')) {
    				$('.find-box.find-pw').addClass('on');
    			}
    		});
    		
    		// 아이디찾기 버튼 클릭시 공백 검사
    		$('.findId-btn').on('click', function() {
    			var uName = $('#uName').val();
    			var uPhone = $('#uPhone').val();
    			var phoneregex = /^\d{3}-\d{3,4}-\d{4}$/;
    			
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
    			$('#findId').submit();
    		});
    		
    		// 공백 없을 때 에러메시지 삭제(아이디 폼)
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
    		// 공백 없을 때 에러메시지 삭제(비밀번호 폼)
    		$('#userId').keyup(function() {
    			var userId = $('#userId').val();
    			if(userId.length > 0) {
    				$('#checkId').hide();
    			}
    		});
    		$('#uName2').keyup(function() {
    			var uName2 = $('#uName2').val();
    			if(uName2.length > 0) {
    				$('#checkName2').hide();
    			}
    		});
    		$('#uPhone2').keyup(function() {
    			var uPhone2 = $('#uPhone2').val();
    			if(uPhone2.length > 0) {
    				$('#checkPhone2').hide();
    			}
    		});
    		
    		$('.findPw-btn').on('click', function() {
    			var userId = $('#userId').val();
    			var uName2 = $('#uName2').val();
    			var uPhone2 = $('#uPhone2').val();
    			var phoneregex = /^\d{3}-\d{3,4}-\d{4}$/;
    			
    			if(userId == null || userId == "") {
    				$('#checkId').show();
    				$('#checkId').text('아이디를 입력해주세요.');
					$('#checkId').removeClass('suc');
					$('#checkId').addClass('err');
					return;
    			}
    			
    			if(uName2 == null || uName2 == "") {
    				$('#checkName2').show();
    				$('#checkName2').text('이름을 입력해주세요.');
					$('#checkName2').removeClass('suc');
					$('#checkName2').addClass('err');
					return;
    			}
    			
    			var phoneregex = phoneregex.exec(uPhone2);
    			if(phoneregex == null || phoneregex == "") {
    				$('#checkPhone2').show();
    				$('#checkPhone2').text('전화번호를 양식에 맞게 입력해주세요.');
					$('#checkPhone2').removeClass('suc');
					$('#checkPhone2').addClass('err');
					return;
    			}
    			
    			// 빈칸 없을 때 제출
    			$('#findPw').submit();
    		});
    	});
    </script>
</body>
</html>