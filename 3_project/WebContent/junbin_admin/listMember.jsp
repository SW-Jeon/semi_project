<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.title{font-size: 1.2em;  font-weight:bold; text-align:center; padding-left: 5px; background-color: #D8D8D8; }
</style>
<h1>전체회원 정보</h1>
<table border="1" style="width: 95%; text-align: center; margin: auto;">
	<tr>
		<th class="title">아이디</th>
		<th class="title">비밀번호</th>
		<th class="title">이름</th>
		<th class="title">이메일</th>
		<th class="title">주소</th>
		<th class="title">휴대폰번호</th>
		<th class="title">성별</th>
		<th class="title">가입상태</th>
	</tr>
<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.mid}</td>
		<td>${vo.mpwd}</td>
		<td>${vo.mname}</td>
		<td>${vo.memail}</td>
		<td>${vo.maddr}</td>
		<td>${vo.mphone}</td>
		<td>${vo.mgen}</td>
		<td>
			<c:choose>
				<c:when test="${vo.mdelup=='1'}">
					<span style="color:blue;font-weight:bold;font-family:고딕체">등록</span>
				</c:when>
				<c:otherwise>
					<span style="color:red;font-weight:bold;font-family:고딕체">탈퇴</span>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</c:forEach>
</table>
<div>
<c:choose>
	<c:when test="${startPageNum>5}">
		<a href="${cp}/admin/member?pageNum=${startPageNum-1}">[이전]</a>
	</c:when>
	<c:otherwise>
		[이전]
	</c:otherwise>
</c:choose>
<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
	<c:choose>
		<c:when test="${pageNum==i}">
			<a href="${cp}/admin/member?pageNum=${i}">
				<span style="color:red">[${i}]</span>
			</a>
		</c:when>
		<c:otherwise>
			<a href="${cp}/admin/member?pageNum=${i}">
				<span style="color:#555">[${i}]</span>
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:choose>
	<c:when test="${endPageNum<pageCount}">
		<a href="${cp}/admin/member?pageNum=${endPageNum+1}">[다음]</a>
	</c:when>
	<c:otherwise>
		[다음]
	</c:otherwise>
</c:choose>
</div>











