<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2><span style="color:blue">${mid }</span>님의 주문내역</h2>
<table border="1" width="1200"  style="text-align: center;border: none;">
	<tr>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>색상</th>
		<th>총결제가격</th>
		<th>결제수량</th>
		<th>결제수단</th>
		<th>배송지</th>
		<th>결제일자</th>
		<th>구매여부 선택</th>
		<th>구매상태</th>
		<th>후기작성</th>
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
			<input type="button" class="btn1" value="구매확정">
			<input type="button" class="btn2" value="구매취소">
		</td>
		<td>
			<input type="text" class="status" value="결제완료" disabled="disabled" style="text-align: center;width:80px;font-weight:bold">
		</td>
		<td><a href="" style="color:#0000FF;text-decoration:underline">후기작성</a></td>
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
	for(var i=0;i<myst.length;i++){
		if(myst[i].value=='구매확정' || myst[i].value=='구매취소'){
			btn1[i].disabled=true;
			btn2[i].disabled=true;
		}
	}
	for(var i=0;i<btn1.length;i++){
		btn1[i].addEventListener('click',function(e){
			var input=confirm('구매확정 하시겠습니까?');
			if(input){
				alert('구매확정되었습니다!');
				//location.href="";
			}
		});
		btn2[i].addEventListener('click',function(e){
			var input=confirm('구매취소 및 환불 하시겠습니까?');
			if(input){
				alert('구매가 취소되었습니다..');
				//location.href="";
			}
		});
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
</script>






