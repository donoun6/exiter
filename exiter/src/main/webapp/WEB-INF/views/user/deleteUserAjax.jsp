<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<div class="delete-pop">
		<div class="popUp-box">
	        <div class="popUp-item">
	        	<p>정말로 탈퇴 하시겠습니까?</p>
	        	<div class="btn-box">
	        		<button class="s-btn" onclick="location.href='<c:url value='/user/deleteUser'/>'">탈퇴하기</button>
	        		<button class="s-btn cancel" onclick="location.href='<c:url value='/user/mypage'/>'">취소</button>
	        	</div>
	        </div>
	    </div>
	</div>
</html>