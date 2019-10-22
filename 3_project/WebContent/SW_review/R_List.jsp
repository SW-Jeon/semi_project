<%@page import="SW_vo.AsWriteVo"%>
<%@page import="SW_dao.AsWriteDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- W_List.jsp -->
<style>
.title{font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; background-color: #D8D8D8; }
.con{ font-size: 1.2em; }
</style>
<div id="main">
<br>
		<h1 style="font-size: 4em;">상품후기</h1>
		<br><hr>
			<table style="width: 95%; height:200px; text-align: center; margin: auto;">
			<tr>
				<th class="title">번호</th>
				<th class="title">제목</th>
				<th class="title">이미지</th>
				<th class="title">리뷰수</th>
			</tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
<% 
		AsWriteDao dao=AsWriteDao.getInstance();
		ArrayList<AsWriteVo> list=dao.R_List();
		for(AsWriteVo vo:list){
%>			
		   <tr>
				<td class="con"><%=vo.getAsnum() %></td>
				<td class="con"><%=vo.getAstitle() %></td>
				<td class="con"><a href="${cp }/SW_review/Rdetail?asnum=${vo.asnum}"><img src="upload/<%=vo.getAsimg() %>" width="100" height="150" ></a></td>
				<td class="con"><%=vo.getAshit() %><%=vo.getAsimg() %></td>
		</tr>
<%		
			}
%>			
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