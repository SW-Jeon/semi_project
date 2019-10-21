<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function aa(gocode,index) {
	var id=document.getElementById(index);
	var bname=id.innerText;
	location.href="${cp}/inventory/detail?gocode="+gocode+"&index="+encodeURI(bname);
	}
</script>
<div id="main">
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="jj" style="text-align: right;">
<a href="${cp }/inventory/list?jnum=100&level=0">최신순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=1">가격높은순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=2">가격낮은순</a>
</div>
<div id="err_wrap" >
	<c:forEach var="vo" items="${list }" varStatus="vs">
		<div id="e">
			<a href="javascript:aa('${vo.gocode}',${vs.index })">
				<img src="${cp }/acc/ear/${vo.goimg }"  border=0  width="300px" height="300px" >
					<div id="price">
					<br>
						<strong class="e1">
							<c:choose>
								<c:when test="${vo.gocode=='e1'}">				
									<span class="name" id="${vs.index }">실버링귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e2'}">				
									<span class="name" id="${vs.index }">블랙드롭귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e3'}">				
									<span class="name" id="${vs.index }">골드드롭귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e4'}">				
									<span class="name" id="${vs.index }">에메랄드귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e5'}">				
									<span class="name" id="${vs.index }">하트귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e6'}">				
									<span class="name" id="${vs.index }">엘레강스귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e7'}">				
									<span class="name" id="${vs.index }">로골하트귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e8'}">				
									<span class="name" id="${vs.index }">블랙크리스탈귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e9'}">				
									<span class="name" id="${vs.index }">심플롱귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e10'}">				
									<span class="name" id="${vs.index }">실버원형귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e11'}">				
									<span class="name" id="${vs.index }">스노우귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e12'}">				
									<span class="name" id="${vs.index }">링귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e13'}">				
									<span class="name" id="${vs.index }">고풍귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e14'}">				
									<span class="name" id="${vs.index }">향수병귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e15'}">				
									<span class="name" id="${vs.index }">시크체인귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e16'}">				
									<span class="name" id="${vs.index }">시크하트귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e17'}">				
									<span class="name" id="${vs.index }">시크더블귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e18'}">				
									<span class="name" id="${vs.index }">시크열쇠귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e19'}">				
									<span class="name" id="${vs.index }">러블리귀걸이</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e20'}">				
									<span class="name" id="${vs.index }">파이널귀걸이</span><br>
								</c:when>
							</c:choose>
									<c:choose>
										<c:when test="${sessionScope.mid=='admin'}">
											<%--운영자로 로그인한 경우 --%>
											<span class="number">${vo.goprice }원</span><!-- 가격 -->
											<span class="pamount" style="color: teal; ">수량:${vo.pamount }</span><!--수량 -->
												<c:if test="${vo.pamount==0}">
														<span class="pamount" style="color: red;">품절</span><!-- 재고가 0이면 품절뜨게 -->
												</c:if>
										</c:when>
									</c:choose>
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
