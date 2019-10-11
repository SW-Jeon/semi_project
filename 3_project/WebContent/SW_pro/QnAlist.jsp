<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- QnAlist.jsp.jsp -->
<div id="main">
		<h1>QnA</h1>
		<hr>
		<table style="width:100%;">
			<tr>
				<th>번호</th>
				<th>글내용</th>
				<th>글쓴이</th>
				<th>답변확인</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="vo" items="${QnAlist }">
			<tr>
				<td>${vo.qaNum }</td>
				<td>${vo.qaContent }</td>
				<td>>${vo.qaName }</td>
				<td>>${vo.reQst }</td>
				<td>>${vo.qaHit }</td>
			</tr>
			</c:forEach>
		</table>
		
	<div><!-- 페이징처리 -->
		<c:choose>
				<c:when test="${startPageNum>10 }">
					<a href="${cp }/SW_pro/QnAlist?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">이전</a>
				</c:when>
				<c:otherwise>
						이전
				</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${pageNum==i }">
						<a href="${cp }/SW_pro/QnAlist?pageNum=${i}&field=${field}&keyword=${keyword}">
						<span style="color:red;">${i }</span></a>
					</c:when>
					<c:otherwise>
						<a href="${cp }/SW_pro/QnAlist?pageNum=${i}&field=${field}&keyword=${keyword}">
						<span style="color:#555;">${i }</span></a>
					</c:otherwise>
				</c:choose>
		</c:forEach>
		
		<c:choose>
				<c:when test="${endPageNum<pageCount }">
					<a href="${cp }/SW_pro/QnAlist?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">다음</a>
				</c:when>
				<c:otherwise>
						다음
				</c:otherwise>
		</c:choose>
	</div>
	<hr>
		<!-- 검색창 -->
	<div>
		<form method="post" action="${cp }/SW_pro/QnAlist">
			<select name="field">
					<option value="qaName" <c:if test="${field=='qaName'}">selected</c:if>>글쓴이</option>
					<option value="qaContent" <c:if test="${field=='qaContent'}">selected</c:if>>글내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
</div>