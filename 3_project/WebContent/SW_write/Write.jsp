<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- write.jsp -->
<div id="main">
		<h1>Q&A</h1>
		<h4>글쓰기</h4>
	<hr>
	<form method="post" action="${cp }/SW_write/write">
		글쓴이<br>
		<input type="text" name="mid "><br>
		제목<br>
		<input type="text" name="title"><br>
		내용<br>
		<textarea rows="5" cols="60" name="writecontent"></textarea><br>
		
		<br>
		<input type="submit" value="글올리기">
		<input type="reset" value="취소">
	</form>
</div>