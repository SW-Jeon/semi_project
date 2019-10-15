<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/SH.info/infoinsert.jsp</title>
</head>
<body>
<h1>글쓰기</h1>
<form action="<c:url value='/info/insert'/>" method="post">
	<table>
		<tr>
			<td><input type="hidden" name="num" value="${param.num}" readonly="readonly"><td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="infotitle"><td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="30" cols="100" name="infocontent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록">&nbsp;&nbsp;<input type="reset" value="지우기"></td>
		</tr>
		
	</table>
</form>
</body>
</html>