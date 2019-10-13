<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
		<h1>Q&A</h1>
		<h3>글보기</h3>
	<hr>
	<table style="display: inline-block;">
			<tr>
				<td width="150">번호</td><td width="600">${vo.qaNum }</td>
			</tr>
			<tr>
				<td width="150">글내용</td><td width="600">${vo.qaContent}</td>
			</tr>
			<tr>
				<td width="150">글쓴이</td><td width="600">${vo.qaName}</td>
			</tr>
			<tr>
				<td width="150">조회수</td><td width="600">${vo.qaHit}</td>
			</tr>
			<tr>
				<td width="150">삭제</td><td width="600"><a href="${cp }/SW_pro/Delete?num=${vo.num }">삭제</a></td>
			</tr>
	</table>
	<br><hr>
	<form method="post"  action="${cp }/SW_pro/QnAreQst">
		<table style="display: inline-block;">
			<tr>
				<td width="30">운영자 답변</td><td width="500"><textarea rows="5" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td width="30">답변상태</td><td width="500"><input type="text" name="writer"><br></td>
			</tr>
			<tr>
				<td width="30"><input type="submit"  value="답변확인" style="margin-left: 300px; margin-top: 50px;"></td>
			</tr>
		</table>
	</form>
	
	</div>