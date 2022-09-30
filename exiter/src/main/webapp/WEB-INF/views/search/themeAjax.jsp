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
				<br>
				<span class="tName">${theme.getTName()}</span>
			</div>
			<div class="detail-box">
				<table>
					<tr>
						<th>장&nbsp;&nbsp;&nbsp;르</th>
						<td>${theme.getTCategory()}</td>
						<th>시&nbsp;&nbsp;&nbsp;간</th>
						<td>${theme.getTTime()}분</td>
					</tr>
					<tr>
						<th>인&nbsp;&nbsp;&nbsp;원</th>
						<td>${theme.getTNum()}명</td>
						<th>난이도</th>
						<td>${theme.getTLevel()}</td>
					</tr>
				</table>
				<button class="s-btn" onclick="location.href='/exiter/theme/theme/${theme.getTid()}'">상세보기</button>
			</div>
		</div>
		<div class="right-box">
			<img alt="${theme.getTName()}" src="/exiter/resources/images/theme/${theme.getTImage()}">
		</div>
	</div>
</html>