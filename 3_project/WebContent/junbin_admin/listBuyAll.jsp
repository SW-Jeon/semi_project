<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.title{font-size: 1.2em;  font-weight:bold; text-align:center; padding-left: 5px; background-color: #D8D8D8; }
</style>
<h1>전체 결제정보</h1>
<table border="1" style="width: 95%; text-align: center; margin: auto;">
	<tr>
		<th class="title">상품이미지</th>
		<th class="title">상품명</th>
		<th class="title">색상</th>
		<th class="title">총결제가격</th>
		<th class="title">결제수량</th>
		<th class="title">결제수단</th>
		<th class="title">배송지</th>
		<th class="title">결제일자</th>
		<th class="title">구매상태</th>
		<th class="title">구매자 아이디</th>
	</tr>
<c:forEach var="vo" items="${list }">
	<tr>
		<td><img src="${cp}/acc/${vo.jname}/${vo.goimg}" width="80" height="60"></td>
		<td>${vo.goname}</td>
		<td>${vo.gocolor}</td>
		<td>${vo.cpursumprice}원</td>
		<td>${vo.puramount}개</td>
		<td>${vo.purway}</td>
		<td>${vo.puraddr}</td>
		<td>${vo.purdate}</td>
		<td>
			<input type="text" class="status" value="${vo.purstatus}" disabled="disabled" style="text-align: center;width:80px;font-weight:bold">
		</td>
		<td>${vo.mid}</td>
	</tr>	
</c:forEach>
</table>
<div>
<c:choose>
	<c:when test="${startPageNum>5}">
		<a href="${cp }/admin/purchase?pageNum=${startPageNum-1}&field=${field}&keyword=${keyword}">[이전]</a>
	</c:when>
	<c:otherwise>
		[이전]
	</c:otherwise>
</c:choose>
<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
	<c:choose>
		<c:when test="${pageNum==i}">
			<a href="${cp}/admin/purchase?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:red;">[${i}]</span>
			</a>
		</c:when>
		<c:otherwise>
			<a href="${cp}/admin/purchase?pageNum=${i}&field=${field}&keyword=${keyword}">
				<span style="color:#555;">[${i}]</span>
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:choose>
	<c:when test="${endPageNum<pageCount}">
		<a href="${cp}/admin/purchase?pageNum=${endPageNum+1}&field=${field}&keyword=${keyword}">[다음]</a>
	</c:when>
	<c:otherwise>
		[다음]
	</c:otherwise>
</c:choose>
</div>
<!-- 검색창 -->
<div>
	<form method="post" action="${cp}/admin/purchase">
		<select name="field" style="height:20px;">
			<option value="goname" <c:if test="${field=='goname'}">selected</c:if>
			>상품명</option>
			<option value="purway" <c:if test="${field=='purway'}">selected</c:if>
			>결제수단</option>
			<option value="mid" <c:if test="${field=='mid'}">selected</c:if>
			>구매자 아이디</option>
			<option value="purstatus" <c:if test="${field=='purstatus'}">selected</c:if>
			>구매상태</option>
		</select>
		<input type="text" name="keyword" value="${keyword}">
		<input type="submit" value="검색">
	</form>
</div>
<script>
	var mystr=document.getElementsByClassName("status");
	var cols=["#DF013A","#08088A","red"];
	var index=0;
	var tid;
	tid=setInterval(changeColor,1000);
	function changeColor() {
		for(var i=0;i<mystr.length;i++){	
			mystr[i].style.color=cols[index];
		}
		index++;
		if(index==3) index=0;
	}
</script>







