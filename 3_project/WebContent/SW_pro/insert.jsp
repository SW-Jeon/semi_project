<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--insert.jsp-->
<div id="main">
	<hr>
	<h1>글쓰기</h1>
	<hr>
	<form method="post" action="${cp }/SW_pro/insert">
		글쓴이<br>
		<input type="text" name="writer"><br>
		제목<br>
		<input type="text" name="title"><br>
		내용<br>
		<textarea rows="5" cols="60" name="content"></textarea><br>
		비밀번호<br>
		<input type="password" name="pwd"><br>
		<br>
		<input type="submit" value="글올리기">
		<input type="reset" value="취소">
	</form>
</div>