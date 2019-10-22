<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- W_List.jsp -->
<style>
.title{font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; background-color: #D8D8D8; }
.con{ font-size: 1.2em; }
</style>
<div id="main">
<br>
		<h1 style="font-size: 5em;">회원문의</h1>
		<h4>궁금하신 사항을 문의해주세요.</h4>
		<p><a href="${cp}/SW_write/write" style="font-size:1.2em; color:red; font-weight:bold; text-align: center; text-decoration: none;display: inline-block; float: left;">글쓰기</a></p>
		<br><hr>
		<table style="width: 95%; text-align: center; margin: auto;">
			<tr>
				<th class="title">번호</th>
				<th class="title">제목</th>
				<th class="title">글쓴이</th>
				<th class="title">답변확인</th>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td class="con">${vo.writenum }</td>
				<td class="con"><a href="${cp }/SW_write/Wdetail?writenum=${vo.writenum}">${vo.title}</a></td>
				<td class="con">${vo.mid }</td>
				<td class="con">${vo.rewst }</td>
			</tr>
			</c:forEach>
		</table>
		<hr>
		<!-- 페이징 처리 -->
		<div>
			<c:choose>
				<c:when test="${startPageNum>10 }">
				<a href="${cp }/SW_write/Wlist?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">이전</a>
				</c:when>
				<c:otherwise>
						이전
				</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${pageNum==i }">
						<a href="${cp }/SW_write/Wlist?pageNum=${i}&field=${field}&keyword=${keyword}">
						<span style="color:red;">${i }</span></a>
				</c:when>
				<c:otherwise>
						<a href="${cp }/SW_write/Wlist?pageNum=${i}&field=${field}&keyword=${keyword}">
						<span style="color:#555;">${i }</span></a>
				</c:otherwise>
			</c:choose>			
		</c:forEach>
		<c:choose>
				<c:when test="${endPageNum<pageCount }">
					<a href="${cp }/SW_write/Wlist?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">다음</a>
				</c:when>
				<c:otherwise>
						다음
				</c:otherwise>
		</c:choose>
		</div>
		<br>
		<!-- 검색창 -->
	<div>
		<form method="post" action="${cp }/SW_write/Wlist">
			<select name="field">
					<option value="mid" <c:if test="${field=='mid'}">selected</c:if>>글쓴이</option>
					<option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
					
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
	</div>