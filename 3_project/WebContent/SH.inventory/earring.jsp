<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <style>
p {
	margin-top:35px;
    line-height: 2.0em
}
h1 {
	margin-top:50px;
    font-size: 3.0em;
    line-height: 40px
}
a {
    text-decoration: none;
    color: rgba(74, 92, 110, 0.92)
}
a:hover {
    color: #fff;
}
.name{color: gray;}
.number{color: gray;}

@keyframes anima {
    from {
        margin-top: -50px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        -khtml-opacity: 0;
        opacity: 0
    }
    to {
        margin: auto;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=100);
        -moz-opacity: 1;
        -khtml-opacity: 1;
        opacity: 1
    }
}

@-webkit-keyframes anima {
    from {
        margin-left: -20px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        -khtml-opacity: 0;
        opacity: 0
    }
    to {
        margin-left: 10px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=100);
        -moz-opacity: 1;
        -khtml-opacity: 1;
        opacity: 1
    }
}
.pic {
    max-width: 300px;
    max-height: 300px;
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
}
.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d
}
.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(44, 62, 80, 0.92);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0;
}
.pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)
}
.pic:hover .pic-image {
    -webkit-transform: scale(0.9);
    -moz-transform: scale(0.9);
    -o-transform: scale(0.9);
    -ms-transform: scale(0.9);
    transform: scale(0.9)
}
.pic-title {
    font-size: 1.8em
}
a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}
.pic:hover .left-to-right
 {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 0.6;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}
.left-to-right {
    top: 0;
    right: 50%
}
.pic:hover .left-to-right {
    right: 0;
    top: 0
}
@media screen and (max-width: 560px) {
    .pic {
        max-width: 450px;
        max-height: 450px;
        display: block;
        -webkit-animation: none;
        -moz-animation: none;
        -o-animation: none;
        -ms-animation: none;
        animation: none;
        margin: 10px auto
    }
}
</style>
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
<c:choose>
<c:when test="${sessionScope.mid=='admin'}">
<a href="${cp }/SH.acc_insert/earinsertform.jsp">상품등록</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=0">최신순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=1">가격높은순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=2">가격낮은순</a>
</c:when>
<c:otherwise>
<a href="${cp }/inventory/list?jnum=100&level=0">최신순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=1">가격높은순</a>
&nbsp;
<a href="${cp }/inventory/list?jnum=100&level=2">가격낮은순</a>
</c:otherwise>
</c:choose>
</div>
<div id="err_wrap" >
	<c:forEach var="vo" items="${list }" varStatus="vs">
		<div id="e">
			<a href="javascript:aa('${vo.gocode}',${vs.index })"> <!-- 상세페이지로넘어갈 자바스크립트 -->
				<article class="htmleaf-container">
					<section class="wrapper cl">
						<div class="pic">
							<img src="${cp }/acc/ear/${vo.goimg }"  border=0  width="300px" height="300px" class="pic-image" alt="Pic">
								<span class="pic-caption left-to-right">
									<h1 class="pic-title">상세페이지</h1>
					 				<p>상세페이지로 이동합니다</p>
					 			</span>
						</div>
					</section>
				</article>							
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
								<c:when test="${vo.gocode=='e21'}">				
									<span class="name" id="${vs.index }">${vo.goname}</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e22'}">				
									<span class="name" id="${vs.index }">${vo.goname }</span><br>
								</c:when>
								<c:when test="${vo.gocode=='e23'}">				
									<span class="name" id="${vs.index }">${vo.goname }</span><br>
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
										<c:otherwise>
											<br>
											<span class="number">${vo.goprice }원</span><!-- 가격 -->
										</c:otherwise>
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
