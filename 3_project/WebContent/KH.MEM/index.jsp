<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
</head>
<body>
<ul>
	<li><a href="${pageContext.request.contextPath }/users/join.jsp">회원가입</a></li>


<c:choose>
	<c:when test="${not empty sessionScope.id}">
	
		<li>
		<span style="color:red; font-size: 12px">${id }님 반갑습니다</span>
		<a href="${pageContext.request.contextPath }/users/logout">로그아웃</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="${pageContext.request.contextPath }/login.do">로그인</a></li>
		</c:otherwise>
	</c:choose>

 
</ul>

</body>
</html>