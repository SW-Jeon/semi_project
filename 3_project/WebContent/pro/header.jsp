<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<div id="header">
	<div id="logo">
		<a href="${cp }/pro/home"><img src="../images/HS.png" style="height: 200px; width: 200px;"></a>
	</div>
	<div id="gnb">
		<ul>
			<li><button type="button" class="navyBtn" onClick="window.open('https://www.ilogen.com/web/personal/tkSearch')">배송조회</button></li>
			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/SW_pro/QnAlist'">고객만족센터</button></li>
			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/pro/join'">회원가입</button></li>
		</ul>
	</div>
	<div id="ser">
                   <form method="post" action="${cp }/SW_pro/list">
                             <input type="text" name="keyword" value="${keyword }" style="width: 200px; height: 50px;" placeholder="원하시는 상품을 검색해주세요" required autofocus>
                             <input type="submit" value="검색" style="width: 100px; height: 50px;"   >
                   </form>
          </div>
         <br><br><br> <hr>
	<div id="banner">
		<ul>
			<li><button type="button" class="Btn" onClick="location.href='${cp }'">귀걸이</button></li>
			<li><button type="button" class="Btn" onClick="location.href='${cp }'">목걸이</button></li>
			<li><button type="button" class="Btn" onClick="location.href='${cp }'">팔찌</button></li>
			<li><button type="button" class="Btn" onClick="location.href='${cp }'">시계</button></li>
		</ul>
	</div>
</div>