<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//idsearch1.jsp
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	boolean using=false;//사용중인 아이디인지 
	String id=null;
	try{
		con=JdbcUtil.getConn();
		String sql="select RPAD( SUBSTR(id,1,3), LENGTH(id), '*') id " +
				"from myusers where pwd=? and email=?" ;
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,pwd);
		pstmt.setString(2,email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			using=true;
			id=rs.getString("id");
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		JdbcUtil.close(con, pstmt, rs);
	}
	if(using==true){
%>
	<h1>회원님의 아이디:<%=id %></h1>
<%		
	}else{
%>
	<h1>요청하신 정보를 찾지 못했습니다..</h1>
<%
	}
%>
<img src="../images/1.png">













