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
.insert{width:80px; height: 40px; float: left; text-align: center; clear: both; }
.main{width:80px; height: 40px; float: left; text-align: center;}
.button{width: 900px; height: 40px; float: left;}
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
			<li class="body_title">&nbsp;&nbsp;&nbsp;<a href="${cp }/info/detail?infonum=${vo.infonum}">${vo.infotitle }</li></a>
		</ul>
	</c:forEach>
		<ul class="button">	
			<c:choose >
				<c:when test="${sessionScope.id=='admin'}"><%--운영자로 로그인한 경우 --%>
					<li class="insert"><a href="${cp }/info/insert">글쓰기</a></li>
				</c:when>			
			</c:choose>
				<li class="main"><a href="${cp }/pro/home">메인으로</a><li>	
		</ul>
</div>
</body>
</html>