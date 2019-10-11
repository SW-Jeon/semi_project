<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- delete.jsp -->
<div>
	<h1>삭제하기(비밀번호 확인)</h1>
	<hr>
	<form method="post" action="${cp }/SW_pro/delete">
		<input type="hidden" name="qaNum" value="${param.qaNum }" >
		비밀번호 확인:	<input type="password" name="qaPwd" >
		<br>
		<input type="submit" value="삭제">
	</form>
</div>