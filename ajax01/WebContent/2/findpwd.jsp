<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //findpwd.jsp
	String id=request.getParameter("id");
	String pwd=null;
	if(id!=null && id.equals("admin")){
		pwd="1234";
	}
	//XML로 결과 응답하기
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.println("<result>");
	if(pwd==null){
		pw.println("<code>fail</code>");
	}else{
		pw.println("<code>success</code>");
		pw.println("<pwd>" + pwd + "</pwd>");
	}
	pw.println("</result>");
	//http://localhost:8081/ajax01/2/findpwd.jsp?id=admin
%>









