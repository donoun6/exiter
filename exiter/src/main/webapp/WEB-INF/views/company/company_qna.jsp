<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="<c:url value='/resources/css/company/company.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/company/company_qna.css'/>">
  <script type="text/javascript" src="<c:url value='/resources/js/common/jquery.js'/>"></script>
  <title>Exiter Company Qna</title>
</head>
<% String comId = (String)session.getAttribute("comId");
if (comId == null){
	response.sendRedirect("company/company_login");
	return;
}%>
<body>
  <!-- header nav -->
	   <jsp:include page="../common/company_header.jsp"></jsp:include>
  <!-- side nav -->
  <aside>
    <nav id="aside-nav">
      <ul>
      ${comId } 님
        <li><a href="<c:url value='/company'/>">사업자메인</a></li>
        <li><a href="<c:url value='/company/company_theme'/>">테마관리</a></li>
        <li><a href="<c:url value='/company/company_reservation'/>">예약확인</a></li>
        <li><a href="<c:url value='/company/company_qna'/>">QnA</a></li>
        <li><a href="<c:url value='/company/company_info'/>">정보변경</a></li>
        <li><a href="<c:url value='/company/company_logout'/>">로그아웃</a></li>
      </ul>
    </nav>
  </aside>
  <!-- main section -->
  <main>
  <h1>QnA</h1>
  <div id="wrap">
<table class="theme">
  <tr style="border-bottom: 2px solid;">
    <th>No</th>
    <th>답변여부</th>
    <th style="width: 40%">내용</th>
    <th style="width: 15%;">작성자</th>
    <th style="width: 15%;">전화번호</th>
    <th>등록일자</th>
    <th>+</th>
  </tr>
  <c:forEach items="${qnaInfo }" var="qnaInfo" varStatus="status">
  <tr>
  <td>${status.count}</td>
  <td>답변대기중</td>
  <td><div><p>${qnaInfo.BDef }</p></div></td>
  <td><div><p>${qnaInfo.UGrade } ${qnaInfo.userId }</p></div></td>
  <td><div><p>${qnaInfo.UPhone }</p></div></td>
  <td><div><p>${qnaInfo.regDate }</p></div></td>
  <td class="dropBtn"><div class="img"></div></td>
  </tr>
  <tr >
  <td colspan="7" style="padding: 0; overflow: hidden; border-bottom: none;">
  <table class="hidden">
  <tr style="border-bottom: 2px solid #aaa;">
  		<td class ="deDef" colspan="3">${qnaInfo.BDef }</td>
  	</tr>
  	<tr style="background: rgb(243, 243, 243); border-bottom: 2px solid #aaa;">
  		<td style="width: 7%;"><div class="comInfo">담당자</div></td>
  		<td style="padding: 20px; text-align: left;">내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용용내용내용내용내용내용내용</td>
  		<td style="width: 10%"><div class="comInfo">등록일자</div></td>
  	</tr>
  	<tr>
  		<td colspan="3" style="background: rgb(243, 243, 243); border-bottom: 2px solid #aaa; padding: 20px 40px;">
  			<form:form modelAttribute="board" method="post">
  				<textarea class="bcDef" name="bcDef" placeholder="답변내용을 작성하세요."></textarea>
  				<input type="hidden" value="${cid }" name="cid">
				<input type="hidden" value="${qnaInfo.bid }" name="bid">
  				<input class="addBtn" type="submit" value="등록">
  			</form:form>
  		</td>
  	</tr>
  </table>
  </td>
  </tr>
  </c:forEach>
  </table>
  </div>
      <!-- footer -->
  <jsp:include page="../common/copyright.jsp"></jsp:include>
  </main>
   <script type="text/javascript">
    	$(function() {
    		$('.dropBtn').click(function(){
    			$(this).parent().next().children().children().toggleClass("show");
    			$(this).children().toggleClass("change");
    		});
    		
    		$('#date').change(function(){
    			$('#selDate').submit();
    		});
    	});
    </script>
</body>

</html>
