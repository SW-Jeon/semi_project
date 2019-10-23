<%@page import="SH.Inventory_Vo.InventoryVo"%>
<%@page import="SH.Inventory_Dao.InventoryDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String saveDirectory="C:\\Users\\JHTA\\Desktop\\세미\\3_project\\3_project\\WebContent\\acc\\ear";
System.out.println(saveDirectory);
MultipartRequest mr=new MultipartRequest(
		request, //request객체
		saveDirectory,//업로드할  디렉토리 경로
		1024*1024*5,//최대 업로드 크기(byte단위 ->5MB로 설정함)
		"utf-8",// 인코딩방식
		new DefaultFileRenamePolicy()//동일한 파일명이 존재할시 파일명에
		//일련번호를 붙여서 파일생성하는 객체
);
String gocode=mr.getParameter("gocode");
String goname=mr.getParameter("goname");
int goprice=Integer.parseInt(mr.getParameter("goprice"));
String gocolor=mr.getParameter("gocolor");
int jnum=Integer.parseInt(mr.getParameter("jnum"));
String goimg=mr.getOriginalFileName("file1");
int pamount=Integer.parseInt(mr.getParameter("pamount"));
InventoryDao dao=new InventoryDao();
InventoryVo vo=new InventoryVo(gocode,goname,goprice,gocolor,goimg,pamount,jnum,null);
int n=dao.insert(vo);
if(n>0){
	response.sendRedirect(request.getContextPath()+"/pro/home");
	return;
}else{
	response.sendRedirect(request.getContextPath()+"/SH.acc_insert/earinsertform.jsp");
}

%>
경로:<%=saveDirectory %>
<h1>파일 업로드 완료!!!!!!!!</h1>
업로드경로<br>
<%=saveDirectory %><br>
</body>
</html>