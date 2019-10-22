<%@page import="SW_vo.AsWriteVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SW_dao.AsWriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
		<h1 style="font-size: 5em;">상품후기</h1>
		<img src="${cp }/images/review.png" >
	<hr>
	<table style="width: 60%; height:30%;  text-align: center; margin: auto;">
				<c:forEach var="vo" items="${list }">
			<tr>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.asimg }</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">번호</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.asnum }</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글제목</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.astitle  }</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글내용</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo. ascontent }</td>
			</tr>
			
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글쓴이</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.mid  }</td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">조회수</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" >${vo.ashit }</td>
			</tr>		
						</c:forEach>	
	</table>
</div>


