<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div id="content">
<c:choose>
	<c:when test="${requestScope.code=='success' }">
		<h1>요청작업을 성공적으로 수행했습니다..</h1>
	</c:when>
	<c:otherwise>
		<h1>오류로 인해 요청작업을 수행하지 못하였습니다..</h1>
	</c:otherwise>
</c:choose>
<a href="${pageContext.request.contextPath }/pro/home">메인으로</a>
</div>