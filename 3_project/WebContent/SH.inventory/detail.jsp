<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/SH.inventory/detail.jsp</title>
<style>
* {box-sizing: border-box;}
#wrab{margin: 0px auto; }
#detail{ float: left; width: 500px; height: 600px; margin-left: 100px; border: 1px solid black; }
.img-zoom-container {
  position: relative;
}
#myresult{ float: left; margin-left: 50px;}
#myimage{ float: left; margin-left: 50px;}

.img-zoom-lens {
  position: absolute;
  /*set the size of the lens:*/
  width: 40px; 
  height: 40px;
}

.img-zoom-result {
  border: 1px solid #d4d4d4;
  /*set the size of the result div:*/
  width: 300px;
  height: 300px;
}
.img-zoom-box{float: left;}
</style>

<script>
function imageZoom(imgID, resultID) {
  var img, lens, result, cx, cy;
  img = document.getElementById(imgID);
  result = document.getElementById(resultID);
  /*create lens:*/
  lens = document.createElement("DIV");
  lens.setAttribute("class", "img-zoom-lens");
  /*insert lens:*/
  img.parentElement.insertBefore(lens, img);
  /*calculate the ratio between result DIV and lens:*/
  cx = result.offsetWidth / lens.offsetWidth;
  cy = result.offsetHeight / lens.offsetHeight;
  /*set background properties for the result DIV:*/
  result.style.backgroundImage = "url('" + img.src + "')";
  result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
  /*execute a function when someone moves the cursor over the image, or the lens:*/
  lens.addEventListener("mousemove", moveLens);
  img.addEventListener("mousemove", moveLens);
  /*and also for touch screens:*/
  lens.addEventListener("touchmove", moveLens);
  img.addEventListener("touchmove", moveLens);
 
  function moveLens(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image:*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    /*calculate the position of the lens:*/
    x = pos.x - (lens.offsetWidth / 2);
    y = pos.y - (lens.offsetHeight / 2);
    /*prevent the lens from being positioned outside the image:*/
    if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
    if (x < 0) {x = 0;}
    if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
    if (y < 0) {y = 0;}
    /*set the position of the lens:*/
    lens.style.left = x + "px";
    lens.style.top = y + "px";
    /*display what the lens "sees":*/
    result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}
</script>
</head>
<body onload="init();">
<script>
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  
//-->
</script>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<div id="main">
<br>
<h1><p style="text-align: center; color: midnightblue; font-style: italic; ">상세페이지</p></h1><br>
<div id="wrab">
	<div class="img-zoom-box">		 
		  <div id="myresult" class="img-zoom-result"></div>
		  		<c:choose>
					<c:when test="${vo.jnum=='100'}">				
						<c:set var="i"  value="ear"/>
					</c:when>
					<c:when test="${vo.jnum=='200'}">				
						<c:set var="i" value="neck"/>
					</c:when>
					<c:when test="${vo.jnum=='300'}">				
						<c:set var="i" value="watch"/>
					</c:when>
					<c:when test="${vo.jnum=='400'}">				
						<c:set var="i" value="brace"/>
					</c:when>
		   			</c:choose>
		   			<img id="myimage" src="${cp }/acc/${i }/${vo.goimg }" width="300" height="240">
	</div>

		<div id="detail">
			<form name="form"  method="get" style="text-align: center;" action="${cp }/demand/insert" onsubmit="return checkLogin()">
			 <h1>${name}</h1><br>
			<h2>가격 : ${vo.goprice } 원</h2><br>
			<h3>배송방법: 택배</h3><br>
			색상:
			<select name="color">
			<option value="${vo.gocolor }">${vo.gocolor }</option>	
			</select>
			<br>
			수량 : <input type=hidden name="sell_price" value="${vo.goprice }">
			<input type="text" name="amount" value="1" size="3" onchange="change();">
			<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
			금액 : <input type="text" name="sum" size="11" readonly>원<br>
			<br>
			<!-- 아래추가 -->
			<input type="hidden" name="goImg" value="${vo.goimg }">
			<input type="hidden" name="jNum" value="${vo.jnum}">
			<input type="hidden" name="goName" value="${name}">
			<input type="hidden" name="getCode" value="${vo.gocode}">
			<input type="button" value="장바구니" onclick="CartGo()">&nbsp;<input type="submit" value="구매하기" >
			</form>
		</div>
</div>
<script>
imageZoom("myimage", "myresult");
function CartGo() {
	var mid='${sessionScope.mid}';
	if(mid==''){
		alert('로그인을 먼저 해주세요!');
	}else{
		alert('장바구니 등록 완료!');
		location.href="${cp}/cart/add?goImg=${vo.goimg}&jNum=${vo.jnum}&getCode=${vo.gocode}&name=${name}";
	}
}
function checkLogin() {
	var mid='${sessionScope.mid}';
	if(mid==''){
		alert('로그인을 먼저 해주세요!');
		return false;
	}
	return true;
}
</script>
</div>
</body>
</html>
