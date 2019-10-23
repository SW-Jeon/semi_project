<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<hr>
<div id="date" style="border:2px solid green;width:1000px;margin:auto">
<h1>
	<a href="${cp}/admin/stats?cday=${day-1}&cmonth=${month}" style="color:hotpink">[이전날]</a> <${year}년 ${month}월 ${day}일>
	<%
		Calendar cal=Calendar.getInstance();
		int currentMonth=cal.get(Calendar.MONTH)+1;
		int currentDay=cal.get(Calendar.DAY_OF_MONTH);
		int inputMonth=(Integer)request.getAttribute("month");
		int inputDay=(Integer)request.getAttribute("day");
		if(currentDay<=inputDay && currentMonth<=inputMonth){
	%>	
			<span style="color:hotpink">[없음]</span>
	<% 
		}else{
	%>
			<a href="${cp}/admin/stats?cday=${day+1}&cmonth=${month}" style="color:hotpink">[다음날]</a>
	<%
		}
	%>  
</h1>
<h3>
	전체매출액 : <span style="color:red;font-weight:bold">${dc.format(allSum)}원</span><br>
	해당일 전체매출액 : <span style="color:red;font-weight:bold">${dc.format(dayAll)}원</span>
</h3>
</div>
<div id="statsMon">
<form method="post" action="${cp}/admin/stats">



</form>
</div>








