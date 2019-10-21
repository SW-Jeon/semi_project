<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  home.jsp -->
<c:choose>
	<c:when test="${empty sessionScope.mid}">
		<div id="content">
			<div id="home_text"
				style="color: red; font-style: inherit; text-align: left;">
				###히트상품###</div>
			<!-- 이미지 뿌려야함 -->
			<script type="text/javascript">
				function aa(gocode, index) {
					var id = document.getElementById(index);
					var bname = id.innerText;
					location.href = "${cp}/inventory/detail?gocode=" + gocode
							+ "&index=" + encodeURI(bname);
				}
			</script>
			<div id="mainlist_wrap">
				<c:set var="cp" value="${pageContext.request.contextPath }" />
				<c:forEach var="vo" items="${list }" varStatus="vs">
					<div id="mainimg">
						<a href="javascript:aa('${vo.gocode}',${vs.index })"> <c:choose>
								<c:when test="${vo.jnum==100 }">
									<img src="${cp }/acc/ear/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
								<c:when test="${vo.jnum==200 }">
									<img src="${cp }/acc/neck/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
								<c:when test="${vo.jnum==300 }">
									<img src="${cp }/acc/watch/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
								<c:when test="${vo.jnum==400 }">
									<img src="${cp }/acc/brace/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
							</c:choose>
							<div id="price">
								<strong class="b1"> <c:choose>
										<c:when test="${vo.gocode=='e1'}">
											<!-- 상품명 -->
											<span class="name" id="${vs.index }">실버링귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e2'}">
											<span class="name" id="${vs.index }">블랙드롭귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e3'}">
											<span class="name" id="${vs.index }">골드드롭귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e4'}">
											<span class="name" id="${vs.index }">에메랄드귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e5'}">
											<span class="name" id="${vs.index }">하트귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e6'}">
											<span class="name" id="${vs.index }">엘레강스귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e7'}">
											<span class="name" id="${vs.index }">로골하트귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e8'}">
											<span class="name" id="${vs.index }">블랙크리스탈귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e9'}">
											<span class="name" id="${vs.index }">심플롱귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e10'}">
											<span class="name" id="${vs.index }">실버원형귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e11'}">
											<span class="name" id="${vs.index }">스노우귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e12'}">
											<span class="name" id="${vs.index }">링귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e13'}">
											<span class="name" id="${vs.index }">고풍귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e14'}">
											<span class="name" id="${vs.index }">향수병귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e15'}">
											<span class="name" id="${vs.index }">시크체인귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e16'}">
											<span class="name" id="${vs.index }">시크하트귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e17'}">
											<span class="name" id="${vs.index }">시크더블귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e18'}">
											<span class="name" id="${vs.index }">시크열쇠귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e19'}">
											<span class="name" id="${vs.index }">러블리귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e20'}">
											<span class="name" id="${vs.index }">파이널귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n1'}">
											<span class="name" id="${vs.index }">레드십자가목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n2'}">
											<span class="name" id="${vs.index }">심플드롭목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n3'}">
											<span class="name" id="${vs.index }">레드원석목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n4'}">
											<span class="name" id="${vs.index }">파스텔내추럴목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n5'}">
											<span class="name" id="${vs.index }">로골목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n6'}">
											<span class="name" id="${vs.index }">옥색목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n7'}">
											<span class="name" id="${vs.index }">크리스탈스퀘어목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n8'}">
											<span class="name" id="${vs.index }">심플스퀘어목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n9'}">
											<span class="name" id="${vs.index }">넥라인목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n10'}">
											<span class="name" id="${vs.index }">심플러블리목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n11'}">
											<span class="name" id="${vs.index }">동전목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n12'}">
											<span class="name" id="${vs.index }">바다목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n13'}">
											<span class="name" id="${vs.index }">사파이어목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n14'}">
											<span class="name" id="${vs.index }">마수리목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n15'}">
											<span class="name" id="${vs.index }">변형십자가목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n16'}">
											<span class="name" id="${vs.index }">USB목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n17'}">
											<span class="name" id="${vs.index }">시크블랙목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n18'}">
											<span class="name" id="${vs.index }">엘레강스목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n19'}">
											<span class="name" id="${vs.index }">하트볼드체인목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n20'}">
											<span class="name" id="${vs.index }">우드목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w1'}">
											<span class="name" id="${vs.index }">실버스퀘어시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w2'}">
											<span class="name" id="${vs.index }">실버그린시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w3'}">
											<span class="name" id="${vs.index }">실버라운드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w4'}">
											<span class="name" id="${vs.index }">블랙라운드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w5'}">
											<span class="name" id="${vs.index }">골드라운드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w6'}">
											<span class="name" id="${vs.index }">dw_레드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w7'}">
											<span class="name" id="${vs.index }">dw_블랙시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w8'}">
											<span class="name" id="${vs.index }">dw_화이트시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w9'}">
											<span class="name" id="${vs.index }">dw_브라운시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w10'}">
											<span class="name" id="${vs.index }">dw_블루시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w11'}">
											<span class="name" id="${vs.index }">dw_골드블랙시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w12'}">
											<span class="name" id="${vs.index }">실버스퀘어블루시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w13'}">
											<span class="name" id="${vs.index }">골드스퀘어시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w14'}">
											<span class="name" id="${vs.index }">브라운스퀘어시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w15'}">
											<span class="name" id="${vs.index }">dw_실버정사각시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w16'}">
											<span class="name" id="${vs.index }">dw_블루화이트시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w17'}">
											<span class="name" id="${vs.index }">dw_블루그린시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w18'}">
											<span class="name" id="${vs.index }">dw_레드블랙시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w19'}">
											<span class="name" id="${vs.index }">dw_라이트브라운시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w20'}">
											<span class="name" id="${vs.index }">딥브라운시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b1'}">
											<span class="name" id="${vs.index }">가죽화이트팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b2'}">
											<span class="name" id="${vs.index }">레드원석팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b3'}">
											<span class="name" id="${vs.index }">니트레드블루팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b4'}">
											<span class="name" id="${vs.index }">주황연두실버팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b5'}">
											<span class="name" id="${vs.index }">실팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b6'}">
											<span class="name" id="${vs.index }">심플실버팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b7'}">
											<span class="name" id="${vs.index }">드롭팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b8'}">
											<span class="name" id="${vs.index }">로골체인팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b9'}">
											<span class="name" id="${vs.index }">다크실버체인팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b10'}">
											<span class="name" id="${vs.index }">스마일실버팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b11'}">
											<span class="name" id="${vs.index }">레더원석팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b12'}">
											<span class="name" id="${vs.index }">블링팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b13'}">
											<span class="name" id="${vs.index }">블루미니원석팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b14'}">
											<span class="name" id="${vs.index }">터프팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b15'}">
											<span class="name" id="${vs.index }">심플블랙가죽팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b16'}">
											<span class="name" id="${vs.index }">패션팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b17'}">
											<span class="name" id="${vs.index }">이쁜팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b18'}">
											<span class="name" id="${vs.index }">리얼심플팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b19'}">
											<span class="name" id="${vs.index }">커플실팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b20'}">
											<span class="name" id="${vs.index }">블랙로골팔찌</span>
											<br>
										</c:when>
									</c:choose> <c:choose>
										<c:when test="${sessionScope.mid=='admin'}">
											<%--운영자로 로그인한 경우 --%>
											<span class="number">${vo.goprice }원</span>
											<!-- 가격 -->
											<span class="pamount">수량:${vo.pamount }</span>
											<!--수량 -->
										</c:when>
									</c:choose>
								</strong>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div id="main">
			<div id="home_text"
				style="color: red; font-style: inherit; text-align: left;">
				###히트상품###</div>
			<!-- 이미지 뿌려야함 -->
			<script type="text/javascript">
				function aa(gocode, index) {
					var id = document.getElementById(index);
					var bname = id.innerText;
					location.href = "${cp}/inventory/detail?gocode=" + gocode
							+ "&index=" + encodeURI(bname);
				}
			</script>
			<div id="mainlist_wrap">
				<c:set var="cp" value="${pageContext.request.contextPath }" />
				<c:forEach var="vo" items="${list }" varStatus="vs">
					<div id="mainimg">
						<a href="javascript:aa('${vo.gocode}',${vs.index })"> <c:choose>
								<c:when test="${vo.jnum==100 }">
									<img src="${cp }/acc/ear/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
								<c:when test="${vo.jnum==200 }">
									<img src="${cp }/acc/neck/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
								<c:when test="${vo.jnum==300 }">
									<img src="${cp }/acc/watch/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
								<c:when test="${vo.jnum==400 }">
									<img src="${cp }/acc/brace/${vo.goimg }" border=0 width="280px"
										height="280px">
								</c:when>
							</c:choose>
							<div id="price">
								<strong class="b1"> <c:choose>
										<c:when test="${vo.gocode=='e1'}">
											<!-- 상품명 -->
											<span class="name" id="${vs.index }">실버링귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e2'}">
											<span class="name" id="${vs.index }">블랙드롭귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e3'}">
											<span class="name" id="${vs.index }">골드드롭귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e4'}">
											<span class="name" id="${vs.index }">에메랄드귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e5'}">
											<span class="name" id="${vs.index }">하트귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e6'}">
											<span class="name" id="${vs.index }">엘레강스귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e7'}">
											<span class="name" id="${vs.index }">로골하트귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e8'}">
											<span class="name" id="${vs.index }">블랙크리스탈귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e9'}">
											<span class="name" id="${vs.index }">심플롱귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e10'}">
											<span class="name" id="${vs.index }">실버원형귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e11'}">
											<span class="name" id="${vs.index }">스노우귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e12'}">
											<span class="name" id="${vs.index }">링귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e13'}">
											<span class="name" id="${vs.index }">고풍귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e14'}">
											<span class="name" id="${vs.index }">향수병귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e15'}">
											<span class="name" id="${vs.index }">시크체인귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e16'}">
											<span class="name" id="${vs.index }">시크하트귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e17'}">
											<span class="name" id="${vs.index }">시크더블귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e18'}">
											<span class="name" id="${vs.index }">시크열쇠귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e19'}">
											<span class="name" id="${vs.index }">러블리귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='e20'}">
											<span class="name" id="${vs.index }">파이널귀걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n1'}">
											<span class="name" id="${vs.index }">레드십자가목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n2'}">
											<span class="name" id="${vs.index }">심플드롭목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n3'}">
											<span class="name" id="${vs.index }">레드원석목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n4'}">
											<span class="name" id="${vs.index }">파스텔내추럴목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n5'}">
											<span class="name" id="${vs.index }">로골목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n6'}">
											<span class="name" id="${vs.index }">옥색목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n7'}">
											<span class="name" id="${vs.index }">크리스탈스퀘어목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n8'}">
											<span class="name" id="${vs.index }">심플스퀘어목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n9'}">
											<span class="name" id="${vs.index }">넥라인목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n10'}">
											<span class="name" id="${vs.index }">심플러블리목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n11'}">
											<span class="name" id="${vs.index }">동전목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n12'}">
											<span class="name" id="${vs.index }">바다목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n13'}">
											<span class="name" id="${vs.index }">사파이어목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n14'}">
											<span class="name" id="${vs.index }">마수리목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n15'}">
											<span class="name" id="${vs.index }">변형십자가목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n16'}">
											<span class="name" id="${vs.index }">USB목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n17'}">
											<span class="name" id="${vs.index }">시크블랙목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n18'}">
											<span class="name" id="${vs.index }">엘레강스목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n19'}">
											<span class="name" id="${vs.index }">하트볼드체인목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='n20'}">
											<span class="name" id="${vs.index }">우드목걸이</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w1'}">
											<span class="name" id="${vs.index }">실버스퀘어시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w2'}">
											<span class="name" id="${vs.index }">실버그린시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w3'}">
											<span class="name" id="${vs.index }">실버라운드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w4'}">
											<span class="name" id="${vs.index }">블랙라운드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w5'}">
											<span class="name" id="${vs.index }">골드라운드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w6'}">
											<span class="name" id="${vs.index }">dw_레드시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w7'}">
											<span class="name" id="${vs.index }">dw_블랙시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w8'}">
											<span class="name" id="${vs.index }">dw_화이트시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w9'}">
											<span class="name" id="${vs.index }">dw_브라운시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w10'}">
											<span class="name" id="${vs.index }">dw_블루시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w11'}">
											<span class="name" id="${vs.index }">dw_골드블랙시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w12'}">
											<span class="name" id="${vs.index }">실버스퀘어블루시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w13'}">
											<span class="name" id="${vs.index }">골드스퀘어시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w14'}">
											<span class="name" id="${vs.index }">브라운스퀘어시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w15'}">
											<span class="name" id="${vs.index }">dw_실버정사각시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w16'}">
											<span class="name" id="${vs.index }">dw_블루화이트시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w17'}">
											<span class="name" id="${vs.index }">dw_블루그린시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w18'}">
											<span class="name" id="${vs.index }">dw_레드블랙시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w19'}">
											<span class="name" id="${vs.index }">dw_라이트브라운시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='w20'}">
											<span class="name" id="${vs.index }">딥브라운시계</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b1'}">
											<span class="name" id="${vs.index }">가죽화이트팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b2'}">
											<span class="name" id="${vs.index }">레드원석팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b3'}">
											<span class="name" id="${vs.index }">니트레드블루팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b4'}">
											<span class="name" id="${vs.index }">주황연두실버팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b5'}">
											<span class="name" id="${vs.index }">실팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b6'}">
											<span class="name" id="${vs.index }">심플실버팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b7'}">
											<span class="name" id="${vs.index }">드롭팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b8'}">
											<span class="name" id="${vs.index }">로골체인팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b9'}">
											<span class="name" id="${vs.index }">다크실버체인팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b10'}">
											<span class="name" id="${vs.index }">스마일실버팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b11'}">
											<span class="name" id="${vs.index }">레더원석팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b12'}">
											<span class="name" id="${vs.index }">블링팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b13'}">
											<span class="name" id="${vs.index }">블루미니원석팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b14'}">
											<span class="name" id="${vs.index }">터프팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b15'}">
											<span class="name" id="${vs.index }">심플블랙가죽팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b16'}">
											<span class="name" id="${vs.index }">패션팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b17'}">
											<span class="name" id="${vs.index }">이쁜팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b18'}">
											<span class="name" id="${vs.index }">리얼심플팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b19'}">
											<span class="name" id="${vs.index }">커플실팔찌</span>
											<br>
										</c:when>
										<c:when test="${vo.gocode=='b20'}">
											<span class="name" id="${vs.index }">블랙로골팔찌</span>
											<br>
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
		</div>
	</c:otherwise>
</c:choose>
