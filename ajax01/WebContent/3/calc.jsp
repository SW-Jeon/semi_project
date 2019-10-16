<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num1=Integer.parseInt(request.getParameter("num1"));
	int num2=Integer.parseInt(request.getParameter("num2"));
	String oper=request.getParameter("oper");
	int num3=0;
	switch(oper){
	case "1":num3=num1+num2;break;
	case "2":num3=num1-num2;break;
	case "3":num3=num1*num2;break;
	case "4":num3=num1/num2;break;
	}
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.println("<result>");
	pw.println("<num3>" + num3 +"</num3>");
	pw.println("</result>");
%>


