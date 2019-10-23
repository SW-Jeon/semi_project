<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main">
		<h1 style="font-size: 5em;">회원문의</h1>
		<h3 style="font-size: 1.5em;">글보기</h3>
	<hr>
	<table style="width: 60%; height:20%;  text-align: center; margin: auto;">
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">번호</th>
				<td  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.writenum }</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글제목</th>
				<td style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.title}</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글내용</th>
				<td  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.writecontent}</td>
			</tr>
	</table>
	<a href="${cp }/SW_write/delete?writenum=${vo.writenum }" style="text-align: center; text-decoration: none; float:right; margin-right:50px; display: inline-block; font-size: 1.5em;">삭제하기</a>
<c:choose>
	<c:when test="${vo.rewst=='답변완료' }">	
	<table style="width: 60%; height:10%;  text-align: center; margin: auto; border: 5px groove red;">	
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">답변</th>
				<td style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.rewrite}</td>
			</tr>	
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">답변확인상태</th>
				<td  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.rewst}</td>
			</tr>
	</table>
	</c:when>
	<c:otherwise>
		<table style="width: 60%; height:10%;  text-align: center; margin: auto; "></table>
	</c:otherwise>
</c:choose>	
	<br><hr>
 <c:if test="${sessionScope.mid=='admin'}">		
	<form method="post"  action="${cp }/SW_write/Wrewst">
		<table style="display: inline-block;">
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">운영자 답변</th>
				<td><textarea rows="5" cols="60" name="rewrite" style="width: 90%; height: 150px; font-size: large;" name="rewrite"></textarea></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">답변상태</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><input name="rewst" type="radio" checked value="대기중" required>대기중
              	<input name="rewst" type="radio" value="답변완료">답변완료</td>
			</tr>
		</table>
		<input type="hidden" name="writenum" value="${param.writenum }">
		<input type="submit"  value="답변확인" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;">
	</form>
</c:if>		
</div>
