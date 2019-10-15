<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>successBuy.jsp</title>
</head>
<body>
<h1>구매완료 했습니다~!!</h1>
<div id="box"></div>
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
		location.href="${pageContext.request.contextPath}/pro/home";
	},5000);
</script>
</html>