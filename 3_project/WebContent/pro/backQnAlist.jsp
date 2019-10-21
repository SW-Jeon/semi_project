<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>backQnAlist.jsp</title>
</head>
<body>
<form method="get" id="frm2" action="${cp}/SW_pro/QnAlist">
	<input type="hidden" name="qanum" value="${qanum}">
</form>
<script type="text/javascript">
	this.document.getElementById("frm2").submit();
</script>
</body>
</html>