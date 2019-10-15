<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/inventory/neck.jsp</title>
</head>
<style>
#neck_wrap{ margin:0px auto;  background-color: black;}
img { display: block; margin: 0px auto; }
#price{text-align: center;}
#n{width:400px; height:400px;  float: left; 
padding:20px; margin-bottom:50px ; marmargin-right: 20px; margin-left: 140px; }
#page{clear: both; float: left;  margin-left: 550px;}
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
<div id="neck_wrap" >
	<c:forEach var="vo" items="${list }" varStatus="vs">
		<div id="n">
			<a href="javascript:aa('${vo.gocode}',${vs.index })" ><!-- 스크립트로 넘겨서 페이지 이동 -->
				<img src="${cp }/acc/neck/${vo.goimg }"  border=0  width="300px" height="300px" >
					<div id="price">
					<br>
						<strong class="n1">
							<c:choose>
								<c:when test="${vo.gocode=='n1'}">				
									<span class="name" id="${vs.index }">레드십자가목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n2'}">				
									<span class="name" id="${vs.index }">심플드롭목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n3'}">				
									<span class="name" id="${vs.index }">레드원석목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n4'}">				
									<span class="name" id="${vs.index }">파스텔내추럴목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n5'}">				
									<span class="name" id="${vs.index }">로골목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n6'}">				
									<span class="name" id="${vs.index }">옥색목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n7'}">				
									<span class="name" id="${vs.index }">크리스탈스퀘어목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n8'}">				
									<span class="name" id="${vs.index }">심플스퀘어목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n9'}">				
									<span class="name" id="${vs.index }">넥라인목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n10'}">				
									<span class="name" id="${vs.index }">심플러블리목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n11'}">				
									<span class="name" id="${vs.index }">동전목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n12'}">				
									<span class="name" id="${vs.index }">바다목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n13'}">				
									<span class="name" id="${vs.index }">사파이어목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n14'}">				
									<span class="name" id="${vs.index }">마수리목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n15'}">				
									<span class="name" id="${vs.index }">변형십자가목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n16'}">				
									<span class="name" id="${vs.index }">USB목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n17'}">				
									<span class="name" id="${vs.index }">시크블랙목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n18'}">				
									<span class="name" id="${vs.index }">엘레강스목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n19'}">				
									<span class="name" id="${vs.index }">하트볼드체인목걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='n20'}">				
									<span class="name" id="${vs.index }">우드목걸이</span><br>
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