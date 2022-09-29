<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<div id="themeAjax">
		<div class="left-box">
			<div class="title-box">
				<span class="comName">
					${company}
				</span>
				<span class="tName">${theme.getTName()}</span>
			</div>
			<div class="detail-box">
				<table>
					<tr>
						<th>장르</th>
						<td>${theme.getTCategory()}</td>
						<th>시간</th>
						<td>${theme.getTTime()}</td>
					</tr>
					<tr>
						<th>인원</th>
						<td>${theme.getTNum()}</td>
						<th>난이도</th>
						<td>${theme.getTLevel()}</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="right-box">
			<img alt="${theme.getTName()}" src="/exiter${theme.getTImage()}">
			<button class="s-btn">상세보기</button>
		</div>
	</div>
</html>