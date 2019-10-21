<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
<form method="get" action="${pageContext.request.contextPath}/purchase/insert" onsubmit="return validate()" style="display: inline-block;">
<h1>주문서</h1>
<hr>
<h3>1. 주문상품 정보</h3>
<table border="1" width="600" style="text-align: center">
	<tr>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>가격</th>
		<th>주문수량</th>
		<th>최종결제금액</th>
	</tr>
	<tr>
		<c:set var="name" value=""/>
		<c:choose>
			<c:when test="${jNum=='100' }">
				<c:set var="name" value="ear"/>
			</c:when>
			<c:when test="${jNum=='200' }">
				<c:set var="name" value="neck"/>
			</c:when>
			<c:when test="${jNum=='300' }">
				<c:set var="name" value="watch"/>
			</c:when>
			<c:otherwise>
				<c:set var="name" value="brace"/>
			</c:otherwise>
		</c:choose>
		<td><img src="${pageContext.request.contextPath}/acc/${name}/${goImg}" width="100"></td>
		<td>${goName}</td>
		<td>${goPrice}</td>
		<td>${vo.orderamount}</td>
		<td>${vo.orderprice}</td>
	</tr>
</table><br>
<hr>
<h3 style="display:inline">2.배송지 정보 입력</h3>
<span style="color:red;font-size:12px">(*필수입력)</span>
<br><br>
<table border="1" width="600">
	<tr>
		<th>* 이름</th>
		<td><!-- 기훈이가 해야됨(membervo mvo 필요) -->${mvo.mname}</td>
	</tr>
	<tr>
		<th>* 주소</th>
		<td><!-- 기훈이가 해야됨(membervo mvo 필요) -->${mvo.maddr}</td>
	</tr>
	<tr>
		<th>* 연락처</th>
		<td><!-- 기훈이가 해야됨(membervo mvo 필요) -->${mvo.mphone}</td>
	</tr>
	<tr>
		<th>* 이메일</th>
		<td><!-- 기훈이가 해야됨(membervo mvo 필요) -->${mvo.memail}</td>
	</tr>
	<tr>
		<th>배송메시지</th>
		<td style="text-align:left">
			<input type="text" id="msg" name="msg" size="60" placeholder="배송 메시지를 입력하세요" onmouseover="getinfo()">
			<div id="result" onmouseover="getinfo()" onmouseout="delinfo()">
				<p class="tag"><a href="javascript:insert('배송전, 연락바랍니다.')" onmouseover="getTag(event)" onmouseout="delTag(event)">배송전, 연락바랍니다.</a></p>
				<p class="tag"><a href="javascript:insert('부재시, 전화주시거나 또는 문자 남겨주세요.')" onmouseover="getTag(event)" onmouseout="delTag(event)">부재시, 전화주시거나 또는 문자 남겨주세요.</a></p>
				<p class="tag"><a href="javascript:insert('부재시, 경비실에 맡겨주세요.')" onmouseover="getTag(event)" onmouseout="delTag(event)">부재시, 경비실에 맡겨주세요.</a></p>
			</div>
		</td>
	</tr>
</table><br>
<hr>
<h3>3.결제정보 입력</h3>
<div id="buyDiv">
	<fieldset>
		<legend style="text-align: center;font-size:20px">결제수단</legend>
		<label><input type="radio" name="buyway" value="카드" onclick="getWay()">카드</label>
		<label><input type="radio" name="buyway" value="무통장입금" onclick="getWay()">무통장입금</label>
		<label><input type="radio" name="buyway" value="기타" onclick="getWay()">기타</label>
	</fieldset>
</div>
<div id="cardinfo">
	<div id="card1" style="display:inline-block;text-align: center;margin-left:20px;margin-top:10px;padding-left:50px">
		<img src="${pageContext.request.contextPath}/acc/카드이미지/card1.png" style="width:200px;height:100px"><br><strong><span style="font-size: 20px;">신한카드</span></strong></div>
	<div id="card2" style="display:inline-block;text-align: center;padding-left:50px">
		<img src="${pageContext.request.contextPath}/acc/카드이미지/card2.jpg" style="width:200px;height:100px"><br><strong><span style="font-size: 20px;">Kb국민카드</span></strong></div>
	<div id="details"><h3>결제방식</h3></div>
</div>
<div id="nodeposit">
	<strong><span>입금은행</span></strong>
	<select name="bank" size="1" style="height: 25px">
		<option value="은행을 선택해 주세요">은행을 선택해 주세요</option>
		<option value="농협">농협</option>
		<option value="국민은행">국민은행</option>
		<option value="기업은행">기업은행</option>
		<option value="우리은행">우리은행</option>
		<option value="신한은행">신한은행</option>
		<option value="하나은행">하나은행</option>
	</select><hr>
	<ul style="list-style: none">
		<li><font color="red">2019년 10월 18일</font> 까지 미입금 시 자동 취소 처리 됩니다.</li>
		<li>입금하실 은행을 선택하신 후, 오른쪽 <font color="red"><결제하기></font> 버튼을 클릭합니다.</li>
	</ul>
</div>
<br>
<hr>
<h3>4.결제하기</h3>
<div id="final">
	<span id="cprice" style="color:red;font-size:30px;font-family:sans-serif;"></span>
	<br>
		<input type="hidden" id="allamount" name="allamount" value="">
		<input type="hidden" name="ordernum" value="${ordernum}">
		<input type="hidden" name="name" value="${name}">
		<input type="hidden" name="goImg" value="${goImg}">
		<input type="hidden" name="goName" value="${goName}">
		<input type="hidden" name="orderamount" value="${vo.orderamount}">
		<input type="hidden" name="orderprice" value="${vo.orderprice}">
		<input type="hidden" name="mid" value="${sessionScope.mid}">
		<input type="hidden" name="mName" value="${mvo.mname}">
		<input type="hidden" name="mEmail" value="${mvo.memail}">
		<input type="hidden" name="mAddr" value="${mvo.maddr}">
		<input type="hidden" name="mPhone" value="${mvo.mphone}">
		<input type="hidden" name="mGen" value="${mvo.mgen}">
		<input type="hidden" name="goCode" value="${goCode}">
		<input type="submit" value="결제하기" style="font-size: 15px;color:red;font-weight: bold">
	
	<a href="${pageContext.request.contextPath}/demand/delete?ordernum=${vo.ordernum}&jNum=${jNum}">
	<input type="button" value="주문취소" style="font-size: 15px;color:red;font-weight: bold">
	</a>
</div>
</form>
<script type="text/javascript">
	function getinfo() {
		var result=document.getElementById("result");
		result.style.display="block";
	}
	function delinfo() {
		var result=document.getElementById("result");
		result.style.display="none";
	}
	function getTag(e) {
		var target=e.target;
		target.style.backgroundColor="#E6E6E6";
	}
	function delTag(e) {
		var target=e.target;
		target.style.backgroundColor="white";
	}
	function insert(msg) {
		var text=document.getElementById("msg");
		var result=document.getElementById("result");
		text.value=msg;
		result.style.display="none";
	}
	function getWay() {
		var cardinfo=document.getElementById("cardinfo");
		var nodeposit=document.getElementById("nodeposit");
		var buywaybtn=document.getElementsByName("buyway");
		var details=document.getElementById("details");
		var bank=document.getElementsByName("bank")[0];
		var str="";
		for(var i=0;i<buywaybtn.length;i++){
			if(buywaybtn[i].checked==true && buywaybtn[i].value=='카드'){
				bank[0].selected='selected';
				nodeposit.style.display="none";
				cardinfo.style.display="block";
				break;
			}else if(buywaybtn[i].checked==true && buywaybtn[i].value=='무통장입금'){
				str="<h3>결제방식</h3>";
				details.innerHTML=str;
				cardinfo.style.display="none";
				nodeposit.style.display="block";
			}
		}
	}
	var card1=document.getElementById("card1");
	var card2=document.getElementById("card2");
	card1.addEventListener('mouseover',function(e){
		this.style.opacity="0.5";
	});
	card1.addEventListener('mouseout',function(e){
		this.style.opacity="1";
	});
	card2.addEventListener('mouseover',function(e){
		this.style.opacity="0.5";
	});
	card2.addEventListener('mouseout',function(e){
		this.style.opacity="1";
	});
	var card1=document.getElementById("card1");
	var card2=document.getElementById("card2");
	var str="";
	card1.addEventListener('click',function(e){
		var text=this.firstChild.nextSibling.nextSibling.nextSibling.firstChild.innerText;
		var details=document.getElementById("details");
		str+="<h3 style='display:inline'>결제카드 종류 : </h3><h4 style='display:inline;color:red'>"+text +"</h4><br><br>";
		str+="<h3 style='display:inline'>할부선택 : </h3>";
		str+="<select name='hal' style='height:25px'>" +
			 "<option value='할부기간 선택'>할부기간 선택</option>" +
			 "<option value='일시불'>일시불</option>" + 
			 "<option value='2개월(무이자)'>2개월(무이자)</option>" +
			 "<option value='3개월(무이자)'>3개월(무이자)</option></select>";
		str+="<input type='hidden' name='cardname' value='신한카드'>";
		details.innerHTML=str;
		str="";
	});
	card2.addEventListener('click',function(e){
		var text=this.firstChild.nextSibling.nextSibling.nextSibling.firstChild.innerText;
		var details=document.getElementById("details");
		str+="<h3 style='display:inline'>결제카드 종류 : </h3><h4 style='display:inline;color:red'>"+text +"</h4><br><br>";
		str+="<h3 style='display:inline'>할부선택 : </h3>";
		str+="<select name='hal' style='height:25px'>" +
			 "<option value='할부기간 선택'>할부기간 선택</option>" +
			 "<option value='일시불'>일시불</option>" + 
			 "<option value='2개월(무이자)'>2개월(무이자)</option>" +
			 "<option value='3개월(무이자)'>3개월(무이자)</option></select>";
		str+="<input type='hidden' name='cardname' value='Kb국민카드'>";
		details.innerHTML=str;
		str="";
	});
	//천단위 콤마찍어주는 함수
	function getChangeNum(price) {
		var rePrice="";
		for(var i=1;i<=price.length;i++){
			if(i>1 && (i%3)==1){
				rePrice=price.charAt(price.length-i)+","+rePrice;
			}else{
				rePrice=price.charAt(price.length-i)+rePrice;
			}
		}
		document.getElementById("cprice").innerHTML=rePrice+'원';
	}
	getChangeNum('${vo.orderprice}');
	//천단위 값 넘겨주기
	function changePrice(){
		var allamount=document.getElementById("allamount");
		var cprice=document.getElementById("cprice");
		//alert(cprice.innerText);
		allamount.value=cprice.innerText;
	}
	changePrice();
	
	//유효성 검사 함수
	function validate() {
		var msg=document.getElementById("msg");
		if(msg.value==""){
			alert("배송메시지를 입력하세요.");
			return false;
		}
		var buyway=document.getElementsByName("buyway");
		var isCnt=0;
		for(var i=0;i<buyway.length;i++){
			if(buyway[i].checked==true){
				isCnt++;
			}
		}
		if(isCnt==0){
			alert("결제정보를 선택하세요!");
			return false;
		}
		if(buyway[0].checked==true){
			var details=document.getElementById("details");
			var text=details.firstChild.innerHTML;
			if(text=='결제방식'){
				alert("결제할 카드를 선택해주세요!");
				return false;
			}
			var hal=document.getElementsByName("hal")[0];
			if(hal.value=='할부기간 선택'){
				alert("할부기간 선택을 해주세요!");
				return false;
			}
		}else if(buyway[1].checked==true){
			var bank=document.getElementsByName("bank")[0];
			if(bank.value=='은행을 선택해 주세요'){
				alert("입금할 은행을 선택해주세요!");
				return false;
			}
		}
		return true;
	}
</script>
</div>