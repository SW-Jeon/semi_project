<%@page import="SW_vo.AsWriteVo"%>
<%@page import="SW_dao.AsWriteDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- W_List.jsp -->
<div id="main">
<br>
		<h1 style="font-size: 5em;">상품후기</h1>
		<img src="${cp }/images/review.png" >
		<br><br><hr>
		<table style="width:100%; text-align: center;  margin: auto;">
			<c:forEach var="vo" items="${list }">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이미지</th>
				<th>리뷰수</th>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
<% 
		AsWriteDao dao=AsWriteDao.getInstance();
		ArrayList<AsWriteVo> list=dao.R_List();
		for(AsWriteVo vo:list){
%>			
		   <tr>
		   
				<td><%=vo.getAsnum() %></td>
				<td><%=vo.getAstitle() %></td>
				<td><a href="${cp }/SW_review/Rdetail?asnum=${vo.asnum}"><img src="upload/<%=vo.getAsimg()%>" width="70" height="140" ></a></td>
				<td><%=vo.getAshit() %></td>
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