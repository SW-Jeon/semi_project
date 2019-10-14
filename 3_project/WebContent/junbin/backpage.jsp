<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>backpage.jsp</title>
</head>
<body>
<form method="get" id="frm1" action="${pageContext.request.contextPath}/inventory/list">
	<input type="hidden" name="jNum" value="${jNum}">
</form>
<script type="text/javascript">
	this.document.getElementById("frm1").submit();
</script>
</body>
</html>