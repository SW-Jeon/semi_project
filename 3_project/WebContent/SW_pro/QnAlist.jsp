<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- QnAlist.jsp -->
<style>
.title{font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; background-color: #D8D8D8; }
.con{ font-size: 1.2em;}
</style>
<div id="main">
<br>
		<h1 style="font-size: 5em;">Q&A</h1>
		<h2>궁금하신 사항을 문의해주세요.</h2>
		<hr>
		<table style="width: 95%; text-align: center; margin: auto;">
			<tr>
				<th class="title">번호</th>
				<th class="title">글내용</th>
				<th class="title">글쓴이</th>
				<th class="title">답변확인</th>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td class="con">${vo.qanum }</td>
				<td class="con"><a href="${cp }/SW_pro/QnAdetail?qanum=${vo.qanum}">${vo.qacontent }</a></td>
				<td class="con">${vo.qaname }</td>
				<td class="con">${vo.reqst }</td>
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
	<br>
		<!-- 검색창 -->
	<div>
		<form method="post" action="${cp }/SW_pro/QnAlist">
			<select name="field">
					<option value="qaname" <c:if test="${field=='qaname'}">selected</c:if>>글쓴이</option>
					<option value="qacontent" <c:if test="${field=='qacontent'}">selected</c:if>>글내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<p><a href="${cp}/SW_pro/QnAwrite" style="font-size: 1.2em; text-align: center; text-decoration: none;display: inline-block; float: right;">문의하기</a></p>
</div>