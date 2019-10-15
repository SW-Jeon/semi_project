<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- QnAwrite.jsp -->
<div id="main">
		<h1>Q&A</h1>
		<h4>글쓰기</h4>
	<hr>
	<form method="post" action="${cp }/SW_pro/QnAwrite">
		글쓴이<br>
		<input type="text" name="qaname"><br>
		내용<br>
		<textarea rows="5" cols="60" name="qacontent"></textarea><br>
		비밀번호<br>
		<input type="password" name="qapwd"><br>
		<br>
		<input type="submit" value="글올리기">
		<input type="reset" value="취소">
	</form>
</div>