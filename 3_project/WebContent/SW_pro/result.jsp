<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- result.jsp -->
<div>
	<c:choose>
		<c:when test="${msg=='success' }">
			<h1>요청하신 작업을 성공하였습니다.</h1>
		</c:when>
		<c:when test="${msg=='fail' }">
			<h1>오류로 인해 작업이 실패하였습니다</h1>
		</c:when>
	</c:choose>
	<a href="${cp }/pro/home">index</a>
</div>