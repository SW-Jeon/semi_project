<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/inventory/earring.jsp</title>
</head>
<style>
#wrab{ margin:0px auto; padding: 20px}
img { display: block; margin: 0px auto; }
#price{text-align: center;}
#e1{width:400px; height:400px; background-color:yellow; float: left; padding:20px; margin-bottom:20px ;margin-right: 20px; }
#e2{width:400px; height:400px; float: left; float: left; padding:20px; margin-bottom:20px ;margin-right: 20px; }
#e3{width:400px; height:400px; float: left; float: left; padding:20px; margin-bottom:20px ;margin-right: 20px; }
#e4{width:400px; height:400px; background-color:yellow; float: left; padding:20px; margin-right: 20px; }
#e5{width:400px; height:400px; float: left; padding:20px; margin-right: 20px; }
#e6{width:400px; height:400px; float: left; padding:20px; margin-right: 20px;}
#page{clear: both; float: left;   margin: 0px auto;}
</style>

<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<h1>귀걸이</h1>
<div id="err_wrap" >
	<c:forEach var="vo" items="${list }">
		<div id="e">
			<a href="" class="">
				<img src="${cp }/acc/ear/${vo.goimg }"  border=0  width="300px" height="300px" >
					<div id="price">
						<strong class="e1">
							<c:choose>
								<c:when test="${vo.gocode=='e1'}">
									<span class="name">실버링귀걸이</span><br>
								</c:when>
							</c:choose>
							<span class="number">${vo.goprice }</span>
						</strong>
					</div>
			</a>
		</div>	
		</c:forEach>
</div>
 

<div id="page"><!-- 페이징처리 -->
	<c:choose>
		<c:when test="${startPageNum>10 }">
			<a href="${cp }/inventory/ear?pageNum=${startPageNum-1}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--현재페이지 색 다르게 표시하기 --%>
				<a href="${cp }/inventory/ear?pageNum=${i}&jnum=${jnum}">
				<span style="color:red;">[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/inventory/ear?pageNum=${i}&jnum=${jnum}">
				<span style="color:#555;">[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>					
	</c:forEach>
	<c:choose>
		<c:when test="${endPageNum<pageCount }">
			<a href="${cp }/inventory/ear?pageNum=${endPageNum+1}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>