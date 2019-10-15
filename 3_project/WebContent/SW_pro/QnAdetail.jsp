<%@page import="SW.qna_controller.HitListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
		<h1>Q&A</h1>
		<h3>글보기</h3>
	<hr>
	<table style="display: inline-block; ">
			<tr>
				<td width="150">번호  |</td><td width="600" >${vo.qanum }</td>
			</tr>
			<tr>
				<td width="150">글내용  |</td><td width="600">${vo.qacontent}</td>
			</tr>
			<tr>
				<td width="150">글쓴이  |</td><td width="600">${vo.qaname}</td>
			</tr>
<c:if test="${ adminid=='admin'}">	
			<tr>
				<td width="150">답변  |</td><td width="600">${vo.qarecontent}</td>
			</tr>
</c:if>		
			<tr>
				<td width="150">답변확인상태  |</td><td width="600">${vo.reqst}</td>
			</tr>
			<tr>
				<td width="150">조회수  |</td><td width="600">${vo.qahit}</td>
			</tr>
			<tr>
				<td width="150">삭제  |</td><td width="600"><a href="${cp }/SW_pro/delete?qanum=${vo.qanum }">삭제</a></td>
			</tr>
	</table>
	<br><hr>
	<form method="post"  action="${cp }/SW_pro/QnAreqst">
		<table style="display: inline-block;">
			<tr>
				<td width="30">운영자 답변</td><td width="500"><textarea rows="5" cols="60" name="qarecontent"></textarea></td>
			</tr>
			<tr>
				<td width="30">답변상태</td><td width="500"><input type="text" name="reqst "><br></td>
			</tr>
			<tr>
				<td width="30"><input type="submit"  value="답변확인" style="margin-left: 300px; margin-top: 50px;"></td>
			</tr>
		</table>
	</form>
</div>