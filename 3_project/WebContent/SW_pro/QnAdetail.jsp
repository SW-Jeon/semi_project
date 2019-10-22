<%@page import="SW.qna_controller.HitListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
		<h1>Q&A</h1>
		<h3>글보기</h3>
	<hr>
	<table style="width: 60%; height:30%;  text-align: center; margin: auto;">
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">번호</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.qanum }</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글내용</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.qacontent}</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글쓴이</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.qaname}</td>
			</tr>
			
			<tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">조회수</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.qahit}</td>
			</tr>
			<tr>
				<td width="20"><a href="${cp }/SW_pro/update?qanum=${vo.qanum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">수정하기</a></td>
				<td width="20"><a href="${cp }/SW_pro/delete?qanum=${vo.qanum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">삭제하기</a></td>
			</tr>
	</table>
<c:choose>
	<c:when test="${vo.reqst=='답변완료' }">	
	<table style="width: 60%; height:10%;  text-align: center; margin: auto; border: 5px groove red;">	
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">>답변</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.qarecontent}</td>
			</tr>

			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">답변확인상태</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.reqst}</td>
			</tr>
	</table>
	</c:when>
	<c:otherwise>
		<table style="width: 60%; height:10%;  text-align: center; margin: auto; "></table>
	</c:otherwise>
</c:choose>		
	<br><hr>
<c:if test="${sessionScope.mid=='admin'}">		
	<form method="post"  action="${cp }/SW_pro/QnAreqst">
		<table style="display: inline-block;">
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">운영자 답변</th>
				<td><textarea rows="5" cols="60" name="ascontent" style="width: 90%; height: 150px; font-size: large;" name="qarecontent" required autofocus></textarea></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">답변 상태</th>
				<td width="30"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >
				<input name="reqst" type="radio" checked value="대기중" required>대기중
                <input name="reqst" type="radio" value="답변완료">답변완료</td>
			</tr>
		</table>
		<input type="hidden" name="qanum" value="${param.qanum }">
		<input type="submit"  value="답변확인" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;">
	</form>
</c:if>	
</div>