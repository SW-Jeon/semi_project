<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="main">
	<div id="mypageLeft">
		<ul>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/go/serch'">나의정보내역</button></li>
			<hr>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/go/serch'">나의결제내역</button></li>
			<hr>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/cart/go'">장바구니 조회</button></li>
			<hr>
		</ul>
	</div>
	<div id="mypageContent">
		<jsp:include page="${myPageContent }" />
	</div>
</div>