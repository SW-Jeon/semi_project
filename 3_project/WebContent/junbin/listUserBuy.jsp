<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.title{font-size: 1.2em;  font-weight:bold; text-align:center; padding-left: 5px; background-color: #D8D8D8; }

</style>
<h2><span style="color:blue">${mid }</span>님의 주문내역</h2>
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
		<th class="title">구매여부 선택</th>
		<th class="title">구매상태</th>
		<th class="title">후기작성</th>
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
			<input type="button" class="btn1" value="구매확정" onclick="javascript:admitOk('${vo.purnum}','${pageNum}')">
			<input type="button" class="btn2" value="구매취소" onclick="javascript:admitCancle('${vo.purnum}','${pageNum}','${vo.puramount}','${vo.gocode}')">
		</td>
		<td>
			<input type="text" class="status" value="${vo.purstatus}" disabled="disabled" style="text-align: center;width:80px;font-weight:bold">
		</td>
	<c:choose>	
		<c:when test="${vo.purstatus=='구매확정'}">		
			<td><a href="${cp }/SW_review/Rwrite?purnum=${vo.purnum}" style="color:#0000FF;text-decoration:none;">후기작성</a></td>
		</c:when>
		<c:otherwise>
			<td><a href="" style="color:darkgray; text-decoration:none;">후기작성</a></td>
		</c:otherwise>
	</c:choose>
	</tr>
</c:forEach>	
</table>
<!-- 페이징처리 작업추가 -->
<div>
<c:choose>
	<c:when test="${startPageNum>5}">
		<a href="${cp }/my/allbuy?pageNum=${startPageNum-1}">[이전]</a>
	</c:when>
	<c:otherwise>
		[이전]
	</c:otherwise>
</c:choose>
<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
	<c:choose>
		<c:when test="${pageNum==i}">
			<a href="${cp}/my/allbuy?pageNum=${i}">
				<span style="color:red;">[${i}]</span>
			</a>
		</c:when>
		<c:otherwise>
			<a href="${cp}/my/allbuy?pageNum=${i}">
				<span style="color:#555;">[${i}]</span>
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:choose>
	<c:when test="${endPageNum<pageCount}">
		<a href="${cp}/my/allbuy?pageNum=${endPageNum+1}">[다음]</a>
	</c:when>
	<c:otherwise>
		[다음]
	</c:otherwise>
</c:choose>
</div>
<script>
	var mystr=document.getElementsByClassName("status");
	var btn1=document.getElementsByClassName("btn1");
	var btn2=document.getElementsByClassName("btn2");
	for(var i=0;i<mystr.length;i++){
		if(mystr[i].value=='구매확정' || mystr[i].value=='구매취소'){
			btn1[i].disabled=true;
			btn2[i].disabled=true;
		}
	}
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
	function admitOk(purnum,pagenum) {
		var input=confirm('구매확정 하시겠습니까?');
		if(input){
			alert('구매확정되었습니다!');
			location.href="${cp}/user/updateOk?purnum="+purnum+"&pageNum="+pagenum;
		}
	}
	function admitCancle(purnum,pagenum,puramount,gocode) {
		var input=confirm('구매취소 및 환불 하시겠습니까?');
		if(input){
			alert('구매가 취소되었습니다..');
			location.href="${cp}/user/updateCancel?purnum="+purnum+"&pageNum="+pagenum+"&puramount="+puramount+"&gocode="+gocode;
		}
	}
</script>






