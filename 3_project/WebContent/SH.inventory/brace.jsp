<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function aa(gocode,index) {
	var 	id=document.getElementById(index);
	var bname=id.innerText;
	location.href="${cp}/inventory/detail?gocode="+gocode+"&index="+encodeURI(bname);
	}
</script>
<div id="main" >
<div id="jj" style="text-align: right;">
<a href="${cp }/inventory/list?jnum=400&level=0">최신순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=400&level=1">가격높은순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=400&level=2">가격낮은순</a>
</div>
<div id="brace_wrap">
	<c:set var="cp" value="${pageContext.request.contextPath }"/>
		<c:forEach var="vo" items="${list }" varStatus="vs">
			<div id="b">
				<a href="javascript:aa('${vo.gocode}',${vs.index })" >
					<img src="${cp }/acc/brace/${vo.goimg }"  border=0  width="300px" height="300px" >
						<div id="price">
						<br>
						<strong class="b1">
							<c:choose>
								<c:when test="${vo.gocode=='b1'}">				
									<span class="name" id="${vs.index }">가죽화이트팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b2'}">				
									<span class="name" id="${vs.index }">레드원석팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b3'}">				
									<span class="name" id="${vs.index }">니트레드블루팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b4'}">				
									<span class="name" id="${vs.index }">주황연두실버팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b5'}">				
									<span class="name" id="${vs.index }">실팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b6'}">				
									<span class="name" id="${vs.index }">심플실버팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b7'}">				
									<span class="name" id="${vs.index }">드롭팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b8'}">				
									<span class="name" id="${vs.index }">로골체인팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b9'}">				
									<span class="name" id="${vs.index }">다크실버체인팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b10'}">				
									<span class="name" id="${vs.index }">스마일실버팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b11'}">				
									<span class="name" id="${vs.index }">레더원석팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b12'}">				
									<span class="name" id="${vs.index }">블링팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b13'}">				
									<span class="name" id="${vs.index }">블루미니원석팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b14'}">				
									<span class="name" id="${vs.index }">터프팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b15'}">				
									<span class="name" id="${vs.index }">심플블랙가죽팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b16'}">				
									<span class="name" id="${vs.index }">패션팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b17'}">				
									<span class="name" id="${vs.index }">이쁜팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b18'}">				
									<span class="name" id="${vs.index }">리얼심플팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b19'}">				
									<span class="name" id="${vs.index }">커플실팔찌</span><br>
								</c:when>
								<c:when test="${vo.gocode=='b20'}">				
									<span class="name" id="${vs.index }">블랙로골팔찌</span><br>
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
						<a href="${cp }/inventory/list?pageNum=${i}&jnum=${jnum}&level=${level}">
							<span style="color:red;">[${i }]</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${cp }/inventory/list?pageNum=${i}&jnum=${jnum}&level=${level}">
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
</div>