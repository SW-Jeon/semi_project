<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- /SH.info/infodetail.jsp -->
<div id="main">
		<h1 style="font-size: 5em;">공지사항</h1>
		<hr>
	<table>
		<tr>
			<th>No</th>
			<td><input type="text" name="infotitle" value="${vo.infonum }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="infotitle" value="${vo.infotitle }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="30" cols="100" readonly="readonly"> ${vo.infocontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<c:choose >
				<c:when test="${sessionScope.id=='admin'}"><%--운영자로 로그인한 경우 --%>
					<a href="${cp }/info/delete?infonum=${vo.infonum}">삭제</a>	
					<a href="${cp }/info/update?infonum=${vo.infonum}">수정</a>
				</c:when>			
			</c:choose>		
				<a href="${cp }/info/list">목록으로</a>
			</td>
		</tr>
	</table>

</div>