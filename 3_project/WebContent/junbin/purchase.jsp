<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div id="main">
<h1 style="font-size: 5em;">최종결제정보</h1>
<hr>
<h3>1. 결제상품 내역</h3>
<table border="1" width="600" style="text-align: center;border-collapse: collapse;">
	<tr>
		<td colspan="2"><img src="${pageContext.request.contextPath}/acc/${name}/${goImg}" width="300"></td>
	</tr>
	<tr>
		<th>*상품종류</th>
		<td>${name}</td>
	</tr>
	<tr>
		<th>*상품명</th>
		<td><!--상품명-->대박목걸이</td>
	</tr>
	<tr>
		<th>*결제수량</th>
		<td>${orderamount}개</td>
	</tr>
	<tr>
		<th>*결제가격</th>
		<td>${allamount}</td>
	</tr>
	<tr>
		<th>*결제방식</th>
		<td>${buyway}<br>
			<c:choose>
				<c:when test="${bank=='은행을 선택해 주세요'}">
					카드이름: ${cardname}<br>
					할부정보: ${hal}
				</c:when>
				<c:otherwise>
					입금은행: ${bank}
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<th>*배송지 정보</th>
		<td>${mvo.maddr}</td>
	</tr>
	<tr>
		<th>*배송메시지</th>
		<td>${msg}</td>
	</tr>
	<tr>
		<th>*운송장번호</th>
		<td><span id="renum"></span></td>
	</tr>
</table><br><hr>
<h3>2. 주문자 정보</h3>
<table border="1" width="600" style="text-align: center;border-collapse: collapse;">
	<tr>
		<th>*주문자 아이디</th>
		<td>${mid}</td>
	</tr>
	<tr>
		<th>*이름</th>
		<td>${mvo.mname}</td>
	</tr>
	<tr>
		<th>*휴대폰번호</th>
		<td>${mvo.mphone}</td>
	</tr>
	<tr>
		<th>*이메일</th>
		<td>${mvo.memail}</td>
	</tr>
</table><br><hr>
<div id="buydiv" style="text-align: center; margin:auto;">
	<form method="get" action="${pageContext.request.contextPath}/purchase/buy">
		<input type="hidden" name="ordernum" value="${ordernum}">
		<input type="hidden" name="pursumprice" value="${orderprice}">
		<input type="hidden" name="purway" value="${buyway}">
		<input type="hidden" name="puramount" value="${orderamount}">
		<input type="hidden" name="puraddr" value="${mvo.maddr}">
		<input type="submit" value="결제하기" style="width:200px;font-size: 25px;background-color: skyblue;font-family: 궁서체;font-weight: bolder">
		<input type="button" value="취소하기" style="width:150px;font-size: 20px;background-color: skyblue;font-family: 돋움체" onclick="history.go(-1);">
	</form>
</div>
<script type="text/javascript">
	var renum=document.getElementById("renum");
	var re = Math.floor(Math.random() * 100000000000) + 10000000000;
	if(re>100000000000) re=re-10000000000;
	renum.innerHTML=re;
</script>
</div>


