<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--/SH.info/infoinsert.jsp -->
<div id="main">
<h1 style="font-size: 5em;">글쓰기</h1>
<form action="${cp }/info/insert" method="post">
	 	<table  style="width:85%; height:30%;  border-style: groove; " >
		<tr>
			<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">제목</th>
			<td><input type="text" name="infotitle" style="width: 90%; height: 50px; font-size: 1.5em;" placeholder="제목(33자이내)" required autofocus ></td>
		</tr>
		<tr>
			<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; ">내용</th>
			<td><textarea rows="30" cols="100" name="infocontent" style="width: 90%; height: 200px; font-size: 1.5em;" placeholder="내용을 적어주세요." required></textarea></td>
		</tr>
	</table>
		<input type="hidden" name="num" value="${param.num}" readonly="readonly">
		<input type="submit" value="등록" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;">
		<input type="reset" value="지우기" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;">
	</form>
</div>
