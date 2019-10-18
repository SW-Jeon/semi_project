<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<table border="1" width="600" height="600" style="overflow: auto;margin-top:10px;">
<c:set var="cnt" value="0"/>
<c:forEach var="vo" items="${list }">
	<c:choose>
		<c:when test="${cnt mod 3 != 0}">
			<td>
				<a href="javascript:aa('${vo.gocode}','${vo.cartname}')">
					<img class="ab" src="${vo.cartimg}" width="350px" height="300px">
					<span style="color:red;font-weight:bold;font-family:궁서체;font-size:16px;">${vo.cartname }</span>
				</a>
			</td>
			<c:set var="cnt" value="${cnt+1}"/>
		</c:when>
		<c:otherwise>
		</tr>
		<tr>
			<td>
				<a href="javascript:aa('${vo.gocode}','${vo.cartname}')">
					<img class="ab" src="${vo.cartimg}" width="350px" height="300px">
					<span style="color:red;font-weight:bold;font-family:궁서체;font-size:16px;">${vo.cartname }</span>
				</a>
			</td>
			<c:set var="cnt" value="${cnt+1}"/>
		</c:otherwise>
	</c:choose>
</c:forEach>
</table>
<!-- 페이징처리 -->
<div id="cartPage">
<c:choose>
	<c:when test="${startPageNum>5}">
		<a href="${cp }/cart/list?pageNum=${startPageNum-1}">[이전]</a>
	</c:when>
	<c:otherwise>
		[이전]
	</c:otherwise>
</c:choose>
<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
	<c:choose>
		<c:when test="${pageNum==i}"><%--현재페이지 색 다르게 표시하기 --%>
			<a href="${cp}/cart/list?pageNum=${i}">
				<span style="color:red;">[${i }]</span>
			</a>
		</c:when>
		<c:otherwise>
			<a href="${cp}/cart/list?pageNum=${i}">
				<span style="color:#555;">[${i }]</span>
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:choose>
	<c:when test="${endPageNum<pageCount }">
		<a href="${cp }/cart/list?pageNum=${endPageNum+1}">[다음]</a>
	</c:when>
	<c:otherwise>
		[다음]
	</c:otherwise>
</c:choose>
</div>
<script type="text/javascript">
	function aa(gocode,cartname) {
		location.href="${cp}/inventory/detail?gocode="+gocode+"&index="+encodeURI(cartname);
	}
	var img=document.getElementsByClassName("ab");
	for(var i=0;i<img.length;i++){
		img[i].addEventListener('mouseover',function(e){
			e.target.style.border="3px solid green";
		});
		img[i].addEventListener('mouseout',function(e){
			e.target.style.border="none";
		});
	}
</script>




