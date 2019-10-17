<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>successBuy.jsp</title>
</head>
<body style="margin:auto;">
<h1 style="font-size: 5em;">구매완료 했습니다~!!</h1>
<div id="box" style="font-size:3em;font-weight: bold;color: red"></div>
</body>
<script type="text/javascript">
	var tid;
	var index=5;
	goMain();
	tid=setInterval(goMain,1000);
	function goMain() {
		var box=document.getElementById("box");
		box.innerHTML=index + "초 뒤에 메인메뉴로 이동합니다...";
		index--;
	}
	setTimeout(function(){//5초 지났다가 한번만 실행되는 함수
		location.href="${pageContext.request.contextPath}/login.do?islogin='ok'";
	},5000);
</script>
</html>