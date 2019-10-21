<%@page import="SW_vo.AsWriteVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SW_dao.AsWriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- W_List.jsp -->
<div id="main">
<br>
		<h1 style="font-size: 5em;">상품후기</h1>
		<img src="../images/review.png" >
		<p><a href="${cp}/SW_review/Rwrite" style="font-size: 1.2em; text-align: center; text-decoration: none;display: inline-block; float: left;;">후기남기기</a></p>
		<br><br><hr>
		<table style="width:100%; text-align: center;  margin: auto;">
			<c:forEach var="vo" items="${list }">
			<tr>
				<th>번호</th>
				<th>제목</th><td>${vo.astitle }</td>
				<th>이미지</th>
				<th>리뷰수</th>
			</tr>
<% 
		AsWriteDao dao=AsWriteDao.getInstance();
		ArrayList<AsWriteVo> R_List=dao.R_List();
		for(AsWriteVo vo:R_List){
%>			
				<tr>
				<td>${vo.asnum }</td>
				<td>${vo.astitle }</td>
				<td><a href="${cp }/SW_review/Rdetail?asnum=${vo.asnum}"><img src="upload/<%=vo.getAsimg()%>" width="70" height="140" ></a></td>
				<td>${vo.ashit }</td>
			</tr>
<%		
			}
%>			
			</c:forEach>
		</table>
		<hr>
		<!-- 페이징 처리 -->
		<div>
			<c:choose>
				<c:when test="${startPageNum>10 }">
				<a href="${cp }/SW_review/Rlist?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">이전</a>
				</c:when>
				<c:otherwise>
						이전
				</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${pageNum==i }">
						<a href="${cp }/SW_review/Rlist?pageNum=${i}&field=${field}&keyword=${keyword}">
						<span style="color:red;">${i }</span></a>
				</c:when>
				<c:otherwise>
						<a href="${cp }/SW_review/Rlist?pageNum=${i}&field=${field}&keyword=${keyword}">
						<span style="color:#555;">${i }</span></a>
				</c:otherwise>
			</c:choose>			
		</c:forEach>
		<c:choose>
				<c:when test="${endPageNum<pageCount }">
					<a href="${cp }/SW_review/Rlist?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">다음</a>
				</c:when>
				<c:otherwise>
						다음
				</c:otherwise>
		</c:choose>
		</div>
		<br>
		<!-- 검색창 -->
	<div>
		<form method="post" action="${cp }/SW_review/Rlist">
			<select name="field">
					<option value="astitle" <c:if test="${field=='astitle'}">selected</c:if>>제목</option>
					<option value="ascontent" <c:if test="${field=='ascontent'}">selected</c:if>>글내용</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form>
	</div>
</div>