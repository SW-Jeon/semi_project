<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="main">
<c:choose>
	<c:when test="${code=='success'}">
		<h1>결제가 진행중입니다 ^__^</h1>
		<div id="d1" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d2" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d3" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d4" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d5" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d6" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d7" style="width:35px;height:35px;display: inline-block;"></div>
		<div id="d8" style="width:35px;height:35px;display: inline-block;"></div>
		<script type="text/javascript">
			var cols=["orange","green","hotpink","black","orange","green","hotpink","black"];
			var index=0;
			var tid;
			tid=setInterval(ChangeColor,1000);
			function ChangeColor() {
				clearColor();
				var box0=document.getElementById("d1");
				var box1=document.getElementById("d2");
				var box2=document.getElementById("d3");
				var box3=document.getElementById("d4");
				var box4=document.getElementById("d5");
				var box5=document.getElementById("d6");
				var box6=document.getElementById("d7");
				var box7=document.getElementById("d8");
				if(index==0){
					box0.style.backgroundColor=cols[index++];
				}else if(index==1){
					box1.style.backgroundColor=cols[index++];
				}else if(index==2){
					box2.style.backgroundColor=cols[index++];
				}else if(index==3){
					box3.style.backgroundColor=cols[index++];
				}else if(index==4){
					box4.style.backgroundColor=cols[index++];
				}else if(index==5){
					box5.style.backgroundColor=cols[index++];
				}else if(index==6){
					box6.style.backgroundColor=cols[index++];
				}else if(index==7){
					box7.style.backgroundColor=cols[index++];
					index=0;
				}
			}
			function clearColor() {
				var box0=document.getElementById("d1");
				var box1=document.getElementById("d2");
				var box2=document.getElementById("d3");
				var box3=document.getElementById("d4");
				var box4=document.getElementById("d5");
				var box5=document.getElementById("d6");
				var box6=document.getElementById("d7");
				var box7=document.getElementById("d8");
				box0.style.backgroundColor="white";
				box1.style.backgroundColor="white";
				box2.style.backgroundColor="white";
				box3.style.backgroundColor="white";
				box4.style.backgroundColor="white";
				box5.style.backgroundColor="white";
				box6.style.backgroundColor="white";
				box7.style.backgroundColor="white";
			}
		</script>
	</c:when>
	<c:otherwise>
		<h1>결제가 실패했습니다..</h1>
		<a href="${pageContext.request.contextPath }/pro/home">홈으로 돌아가기</a>
	</c:otherwise>
</c:choose>
<h1>결제가 진행중입니다 ^__^</h1>
		<div id="d1" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d2" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d3" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d4" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d5" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d6" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d7" style="width:45px;height:35px;display: inline-block;"></div>
		<div id="d8" style="width:45px;height:35px;display: inline-block;"></div>
		<script type="text/javascript">
			var cols=["orange","green","hotpink","black","orange","green","hotpink","black"];
			var index=0;
			var tid;
			tid=setInterval(ChangeColor,100);
			function ChangeColor() {
				clearColor();
				var box0=document.getElementById("d1");
				var box1=document.getElementById("d2");
				var box2=document.getElementById("d3");
				var box3=document.getElementById("d4");
				var box4=document.getElementById("d5");
				var box5=document.getElementById("d6");
				var box6=document.getElementById("d7");
				var box7=document.getElementById("d8");
				if(index==0){
					box0.style.backgroundColor=cols[index++];
				}else if(index==1){
					box1.style.backgroundColor=cols[index++];
				}else if(index==2){
					box2.style.backgroundColor=cols[index++];
				}else if(index==3){
					box3.style.backgroundColor=cols[index++];
				}else if(index==4){
					box4.style.backgroundColor=cols[index++];
				}else if(index==5){
					box5.style.backgroundColor=cols[index++];
				}else if(index==6){
					box6.style.backgroundColor=cols[index++];
				}else if(index==7){
					box7.style.backgroundColor=cols[index++];
					index=0;
				}
				
			}
			function clearColor() {
				var box0=document.getElementById("d1");
				var box1=document.getElementById("d2");
				var box2=document.getElementById("d3");
				var box3=document.getElementById("d4");
				var box4=document.getElementById("d5");
				var box5=document.getElementById("d6");
				var box6=document.getElementById("d7");
				var box7=document.getElementById("d8");
				box0.style.backgroundColor="white";
				box1.style.backgroundColor="white";
				box2.style.backgroundColor="white";
				box3.style.backgroundColor="white";
				box4.style.backgroundColor="white";
				box5.style.backgroundColor="white";
				box6.style.backgroundColor="white";
				box7.style.backgroundColor="white";
			}
			setTimeout(function(){//3초 지났다가 한번만 실행되는 함수
				location.href="${pageContext.request.contextPath}/junbin/successBuy.jsp";
			},3000);
		</script>
</div>
