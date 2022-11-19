<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<div class="table-wrap">
		<table>
			<c:if test="${not empty board}">
				<c:forEach var="mb" items="${mbList}">
					<tr>
						<td>
							<div class="boardInfo">
								<a href="/exiter/board/boardDetail/${mb.bid}"></a>
								<span class="category">${mb.BCategory}</span>
								<span class="title">${mb.BTitle}</span>
								<p class="def">${mb.BDef}</p>
								<span class="date">${mb.regDate}</span>
								<div class="img-box"><div class="com-img"></div>
									<c:if test="${mb.bcUpdate}">
										<span class="redDot">●</span>
									</c:if>
									<span class="comCnt">댓글 ${mb.bcCnt}</span>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${not empty qna}">
				<c:forEach var="mb" items="${mbList}">
					<tr>
						<td>
							<div class="boardInfo">
								<a href="/exiter/board/boardDetail/${mb.bid}"></a>
								<span class="category">${mb.BCategory}</span>
								<span class="title">${mb.BTitle}</span>
								<p class="def">${mb.BDef}</p>
								<span class="date">${mb.regDate}</span>
								<div class="com-box"></div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</html>