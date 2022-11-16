<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<body>
	<div class="table-wrap">
		<table>
			<c:forEach var="boardInfo" items="${boardInfo }" varStatus="status"> 
				<tr>
					<td>
						<div class="boardInfo">
							<a href="/exiter/board/boardDetail/${boardInfo.bid }"></a>
							<h1 class="title">${boardInfo.BTitle }</h1>
							<p class="def">${boardInfo.BDef }</p>
							<div class="user">
								<span class="grade">${boardInfo.UGrade }</span>
								<span class="id">${boardInfo.userId }</span>
								<span class="date">${boardInfo.regDate }</span>
							</div>
							<div class="img-box"><div class="com-img"></div><span>댓글 ${list[status.index] }</span></div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div> 
</body>
</html>