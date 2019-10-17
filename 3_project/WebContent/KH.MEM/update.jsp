<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<h1>회원정보수정</h1>
<form method="post" action="${cp }/update">
	아이디 <input type="text" name="id" value="${vo.id }" readonly="readonly"><br>
	비밀번호 <input type="password" name="pwd" value="${vo.pwd }"><br>
	이메일 <input type="text" name="email" value="${vo.email }"><br>
	<input type="submit" value="저장">
	<input type="reset" value="취소">
	
</form>
</body>
</html>