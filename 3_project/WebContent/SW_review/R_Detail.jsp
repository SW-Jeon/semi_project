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
<% 
		AsWriteDao dao=AsWriteDao.getInstance();
		ArrayList<AsWriteVo> list=dao.R_List();
		for(AsWriteVo vo:list){
%>		
			<tr>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><%=vo.getAsimg() %></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">번호</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><%=vo.getAsnum() %></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글제목</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><%=vo.getAstitle() %></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글내용</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><%=vo.getAscontent() %></td>
			</tr>
			
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글쓴이</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><%=vo.getMid() %></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">조회수</th>
				<td width="600"  style="width: 90%; height: 50px; font-size: large; padding-left: 10px;" ><%=vo.getAshit() %></td>
			</tr>
<%		
			}
%>			
			<tr>
				<td width="30"><a href="${cp }/SW_review/Rupdate?asnum=${vo.asnum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">수정하기</a></td>
				<td width="30"><a href="${cp }/SW_review/Rdelete?asnum=${vo.asnum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">삭제하기</a></td>
			</tr>
	</table>
	<br><hr>
		
</div>


