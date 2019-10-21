<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
	<div id="mypageLeft">
	<c:choose>
		<c:when test="${mid=='admin'}">
			<ul>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/admin/member'">회원관리</button></li>
			<hr>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}'">회원결제내역</button></li>
			<hr>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}'">매출/통계</button></li>
			<hr>
		</ul>
		</c:when>
		<c:otherwise>
		<ul>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/go/info'">나의정보내역</button></li>
			<hr>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/go/allbuy'">나의결제내역</button></li>
			<hr>
			<li><button type="button" class="menuBtn" onClick="location.href='${cp}/cart/go'">장바구니 조회</button></li>
			<hr>
		</ul>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="mypageContent">
		<jsp:include page="${myPageContent }" />
	</div>
</div>