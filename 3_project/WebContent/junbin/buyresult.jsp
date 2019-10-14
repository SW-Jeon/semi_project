<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content">
	<c:choose>
		<c:when test="${code=='success'}">
			<h1>작업을 성공적으로 완료했습니다!</h1>
		</c:when>
		<c:otherwise>
			<h1>작업을 실패했습니다...</h1>
		</c:otherwise>
	</c:choose>
</div>