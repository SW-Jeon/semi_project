<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  home.jsp -->
<c:choose>
	<c:when test="${empty sessionScope.mid}">
		<div id="content">
			<br>
			<h1>방문을 환영합니다.</h1>
		</div>
	</c:when>
	<c:otherwise>
		<div id="main">
			<br>
			<h1>방문을 환영합니다.</h1>
		</div>
	</c:otherwise>
</c:choose>
