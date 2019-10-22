<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.gocode{width: 200px;}
.jnum{width: 250px;}
</style>
<meta charset="UTF-8">
<title>/SH.acc_insert/neckInsertform.jsp</title>
</head>
<body>
<form action="${cp }/SH.acc_insert/neckinsertOk.jsp" enctype="multipart/form-data" method="post">
		<h1>상품등록페이지</h1>
		코드번호<br>
		<input type="text" name="gocode"  placeholder="목걸이n" class="gocode"><br>
		제품이름 <br>
		<input type="text" name="goname" ><br>
		가격<br>
		<input type="text" name="goprice"   placeholder="숫자만 입력하세요"><br>
		색상<br>
		<input type="text" name="gocolor"  placeholder="영어로 입력하세요"><br>
		이미지<input type="file" name="file1" ><br>
		재고수량<br>
		<input type="text" name="pamount" ><br>
		품목번호<br>
		<input type="text" name="jnum" placeholder="목걸이200"  class="jnum"><br>	
		<input type="submit" value="전송">
		<input type="reset" value="취소">
</form>
</body>
</html>