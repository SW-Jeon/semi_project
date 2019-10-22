<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="date" style="border:2px solid green;width:1000px;margin:auto">
<h1>
	<a href="${cp}/admin/stats?cday=${day-1}" style="color:hotpink">[이전날]</a> ${year}년 ${month}월 ${day}일
	<%
		Calendar cal=Calendar.getInstance();
		int currentDay=cal.get(Calendar.DAY_OF_MONTH);
		int inputDay=(Integer)request.getAttribute("day");
		if(currentDay<=inputDay){
	%>	
			<span style="color:hotpink">[다음날]</span>
	<% 
		}else{
	%>
			<a href="${cp}/admin/stats?cday=${day+1}" style="color:hotpink">[다음날]</a>
	<%
		}
	%>  
</h1>
<h3>금일전체 매출액 : ${dc.format(dayAll)}원</h3>
</div>








