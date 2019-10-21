<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- /SH.info/infolist.jsp -->
<style>
.title{font-size: 1.3em; font-weight: bold;}
</style>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<div id="main">
	<h1 style="font-size: 5em;">공지사항</h1>
	<hr>
	<table style="width: 100%; text-align: center; margin: auto;">
		<tr>
			<th class="title">No.</th>
			<th class="title">제목</th>
		</tr>
			<tr height="3" bgcolor="#dddddd">
			<td colspan="4"></td>
		</tr>
		<c:forEach var="vo" items="${requestScope.list }">
			<tr>
				<td>${vo.infonum }</td>
				<td><a href="${cp }/info/detail?infonum=${vo.infonum}">${vo.infotitle }</a></td>
			</tr>
		</c:forEach>
	</table>
	
		<c:choose>
			<c:when test="${sessionScope.mid=='admin'}">
				<%--운영자로 로그인한 경우 --%>
			<p><a href="${cp }/info/insert" style="float: right; color: red;">글쓰기</a></p>
			</c:when>
		</c:choose>
	<br>
	<p><a href="${cp }/pro/home" style="float: right; color: red;">메인으로</a></p>
</div>

