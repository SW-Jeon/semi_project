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
				<td width="150">조회수</td><td width="600">${vo.qRecontent}</td>
			</tr>
			<tr>
				<td width="150">조회수</td><td width="600">${vo.qaHit}</td>
			</tr>
	</table>
	</div>