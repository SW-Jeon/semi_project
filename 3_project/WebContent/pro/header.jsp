<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header.jsp -->
<div id="header">
	<div id="logo">
		<a href="${cp }/pro/home"><img src="../images/HS.png" style="height: 200px; width: 200px;"></a>
	</div>
	<div id="gnb">
		<ul>
			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/go/serch'">상품검색</button></li>
			<li><button type="button" class="navyBtn" onClick="window.open('https://www.ilogen.com/web/personal/tkSearch')">배송조회</button></li>
			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/SW_pro/QnAlist'">고객만족센터</button></li>
			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/info/list'">공지사항</button></li>
			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/SW_review/Rlist'">구매후기</button></li>
   		<c:choose>
   	 		<c:when test="${empty sessionScope.mid }"> <%--로그인 안한 경우 --%>
   	 			<li><button type="button" class="navyBtn" onClick="location.href='${cp }/pro/join'">회원가입</button></li>
			</c:when>
    		<c:otherwise>      <%--로그인 한 경우 --%>		
				<li><button type="button" class="navyBtn" onClick="location.href='${cp }/SW_write/Wlist'">회원문의</button></li>
				<li><button type="button" class="navyBtn" onClick="location.href='${cp } '">로그아웃</button></li>
            </c:otherwise>
       	</c:choose>
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
			<li><button type="button" class="Btn" onClick="location.href='${cp }/inventory/list?jnum=100&level=0'">귀걸이</button></li>
			<li><button type="button" class="Btn" onClick="location.href='${cp }/inventory/list?jnum=200&level=0'">목걸이</button></li>
			<li><button type="button" class="Btn" onClick="location.href='${cp }/inventory/list?jnum=400&level=0'">팔찌</button></li>
			<li><button type="button" class="Btn" onClick="location.href='${cp }/inventory/list?jnum=300&level=0'">시계</button></li>
		</ul>
	</div>
  <hr>
</div>