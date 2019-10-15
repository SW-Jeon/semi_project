<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/inventory/watch.jsp</title>
</head>
<style>
#watch_wrap{ margin:0px auto;  background-color: black;}
img { display: block; margin: 0px auto; }
#price{text-align: center;}
#w{width:400px; height:400px;  float: left; 
padding:20px; margin-bottom:50px ; marmargin-right: 20px; margin-left: 50px; }
#page{clear: both; float: left;   margin: auto;}
</style>
<script type="text/javascript">
	function aa(gocode,index) {
	var 	id=document.getElementById(index);
	var bname=id.innerText;
	location.href="${cp}/inventory/detail?gocode="+gocode+"&index="+bname;
	}
</script>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<br>
<br>
<div id="watch_wrap" >
	<c:forEach var="vo" items="${list }" varStatus="vs">
		<div id="w">
			<a href="javascript:aa('${vo.gocode}',${vs.index })">
				<img src="${cp }/acc/watch/${vo.goimg }"  border=0  width="300px" height="300px" >
					<div id="price">
					<br>
						<strong class="w1">
							<c:choose>
								<c:when test="${vo.gocode=='w1'}">				
									<span class="name" id="${vs.index }">실버스퀘어시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w2'}">				
									<span class="name" id="${vs.index }">실버그린시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w3'}">				
									<span class="name" id="${vs.index }">실버라운드시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w4'}">				
									<span class="name" id="${vs.index }">블랙라운드시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w5'}">				
									<span class="name" id="${vs.index }">골드라운드시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w6'}">				
									<span class="name" id="${vs.index }">dw_레드시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w7'}">				
									<span class="name" id="${vs.index }">dw_블랙시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w8'}">				
									<span class="name" id="${vs.index }">dw_화이트시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w9'}">				
									<span class="name" id="${vs.index }">dw_브라운시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w10'}">				
									<span class="name" id="${vs.index }">dw_블루시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w11'}">				
									<span class="name" id="${vs.index }">dw_골드블랙시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w12'}">				
									<span class="name" id="${vs.index }">실버스퀘어블루시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w13'}">				
									<span class="name" id="${vs.index }">골드스퀘어시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w14'}">				
									<span class="name" id="${vs.index }">브라운스퀘어시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w15'}">				
									<span class="name" id="${vs.index }">dw_실버정사각시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w16'}">				
									<span class="name" id="${vs.index }">dw_블루화이트시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w17'}">				
									<span class="name" id="${vs.index }">dw_블루그린시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w18'}">				
									<span class="name" id="${vs.index }">dw_레드블랙시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w19'}">				
									<span class="name" id="${vs.index }">dw_라이트브라운시계</span><br>
								</c:when>
								<c:when test="${vo.gocode=='w20'}">				
									<span class="name" id="${vs.index }">딥브라운시계</span><br>
								</c:when>
							</c:choose>
							<br>
							<span class="number">${vo.goprice }원</span>
						</strong>
					</div>
			</a>
		</div>	
		</c:forEach>
</div>
 
<div id="page"><!-- 페이징처리 -->
	<c:choose>
		<c:when test="${startPageNum>10 }">
			<a href="${cp }/inventory/list?pageNum=${startPageNum-1}">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		<c:choose>
			<c:when test="${pageNum==i }"><%--현재페이지 색 다르게 표시하기 --%>
				<a href="${cp }/inventory/list?pageNum=${i}&jnum=${jnum}">
				<span style="color:red;">[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/inventory/list?pageNum=${i}&jnum=${jnum}">
				<span style="color:#555;">[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>					
	</c:forEach>
	<c:choose>
		<c:when test="${endPageNum<pageCount }">
			<a href="${cp }/inventory/list?pageNum=${endPageNum+1}">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>