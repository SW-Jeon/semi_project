<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- list.jsp -->
<div id="main">
<hr>
	<h1>발자국</h1>
	<hr>
		<table style="width:100%;">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>글내용</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.num }</td>
				<td>${vo.writer }</td>
				<td>>${vo.title }</td>
				<td>${vo.content }</td>
			</tr>
			</c:forEach>
		</table>
			
	<div><!-- 페이징처리 -->	
	<c:choose>
			<c:when test="${startPageNum>4 }">
				<a href="${cp }/SW_pro/list?pageNum=${startPageNum-1}&ck=${ck}&keyword=${keyword}">이전</a>
			</c:when>
			<c:otherwise>이전</c:otherwise>
			
	</c:choose>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${pageNum==i }">
					<a href="${cp }/SW_pro/list?pageNum=${i}&ck=${ck}&keyword=${keyword}">
					<span style="color:darkblue;">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/SW_pro/list?pageNum=${i}&ck=${ck}&keyword=${keyword}">
					<span style="color:#555;">${i }</span></a>
				</c:otherwise>
			</c:choose>
	</c:forEach>
	
	<c:choose>
			<c:when test="${endPageNum<pageCount }">
				<a href="${cp }/SW_pro/list?pageNum=${endPageNum+1}&ck=${ck}&keyword=${keyword}">다음</a>
			</c:when>
			<c:otherwise>다음</c:otherwise>
	</c:choose>
	</div>
	
	<!-- 검색창 -->
	<div>
		<form method="post" action="${cp }/SW_pro/list">
			<input type="checkbox" name="ck" value="writer" <c:if test="${field=='writer'}">selected</c:if>>작성자
			<input type="checkbox" name="ck" value="title" <c:if test="${field=='title'}">selected</c:if>>제목
			<input type="checkbox" name="ck" value="content" <c:if test="${field=='content'}">selected</c:if>>내용
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
	<hr>
	<p><button type="button" class="Btn" onClick="location.href='${cp }/SW_pro/write'">글쓰기</button> | <button type="button" class="Btn" onClick="location.href='${cp }/pro/home'">Home</button></p>
</div>