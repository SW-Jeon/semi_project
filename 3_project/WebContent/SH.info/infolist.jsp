<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/SH.info/infolist.jsp</title>
<style>
ul{list-style:none; }
.head{width: 900px; height: 40px; float: left;}
.body{width: 900px; height: 40px; float: left;}
.no{width:40px; height: 40px; float: left; text-align: center;}
.head_title{width: 800px; height: 40px; float: left; text-align: center;}
.num{width:40px; height: 40px; float: left; text-align: center; clear: both; }
.body_title{width: 800px; height: 40px; float: left; }
.del{width:60px; height: 40px; float: left; text-align: center;}
</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="wrap">

	<ul class="head">
		<li class="no">No</li><li class="head_title">제목</li>	
	</ul>
	<c:forEach var="vo" items="${requestScope.list }">
		<ul class="body">
			<li class="num">${vo.infonum}</li>
			<li class="body_title">&nbsp;&nbsp;&nbsp;${vo.infotitle }</li>
			<li class="del"><a href="${cp }/info/delete?infonum=${vo.infonum}">삭제</a></li>
		</ul>
	</c:forEach>
	<a href="${cp }/SH.info/infoinsert.jsp">글쓰기</a>
</div>
</body>
</html>