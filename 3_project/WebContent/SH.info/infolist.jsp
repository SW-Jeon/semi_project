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
.head{width: 840px; height: 40px; float: left;}
.body{width: 840px; height: 40px; float: left;}
.no{width:40px; height: 40px; float: left; text-align: center;}
.head_title{width: 800px; height: 40px; float: left; text-align: center;}
.num{width:40px; height: 40px; float: left; text-align: center; clear: both; }
.body_title{width: 800px; height: 40px; float: left; }
</style>
</head>
<body>
<div id="wrap">

	<ul class="head">
		<li class="no">No</li><li class="head_title">제목</li>	
	</ul>
	<c:forEach var="vo" items="${requestScope.list }">
		<ul class="body">
			<li class="num">${vo.infonum}</li><li class="body_title">&nbsp;${vo.infotitle }</li>
		</ul>
	</c:forEach>
</div>
</body>
</html>