<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- write.jsp -->
<script type="text/javascript">
	function changes1Step(gocode) {
		if(gocode="팔찌"){
			
		}
	}
</script>
<div id="main">
	<h1 style="font-size: 5em;">회원문의</h1>
	<hr>
	<form method="post" action="${cp }/SW_write/write">
		 <table  style="width:40%" >
			 <tr><th align="center"><h4 style="font-size: 1.5em;">글쓰기</h4></th></tr>
	     	 <tr height="3" bgcolor="#dddddd"><td colspan="2"></td></tr>
	 	 
			 <tr>
			 <th align="center">상품선택</th>
			 <td>	
			 	<select name="gocode" onchange="changes1Step(value)">
				 	<option value="팔찌">팔찌</option>
					<option value="귀걸이">귀걸이</option>
					<option value="목걸이">목걸이</option>
					<option value="시계">시계</option>
			 	</select>
	
			    <select name="gocode">
						<option value="팔찌"
						<c:if test="${gocode=='b1'}">selected</c:if>>가죽화이트팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b2'}">selected</c:if>>레드원석팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b3'}">selected</c:if>>니트레드블루팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b4'}">selected</c:if>>주황연두실버팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b5'}">selected</c:if>>실팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b6'}">selected</c:if>>심플실버팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b7'}">selected</c:if>>드롭팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b8'}">selected</c:if>>로골체인팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b9'}">selected</c:if>>다크실버체인팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b10'}">selected</c:if>>스마일실버팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b11'}">selected</c:if>>레더원석팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b12'}">selected</c:if>>블링팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b13'}">selected</c:if>>블루미니원석팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b14'}">selected</c:if>>터프팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b15'}">selected</c:if>>심플블랙가죽팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b16'}">selected</c:if>>패션팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b17'}">selected</c:if>>이쁜팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b18'}">selected</c:if>>리얼심플팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b19'}">selected</c:if>>커플실팔찌</option>
						<option value="팔찌"
						<c:if test="${gocode=='b20'}">selected</c:if>>블랙로골팔찌</option>
						
						<option value="귀걸이"
						<c:if test="${gocode=='e1'}">selected</c:if>>실버링귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e2'}">selected</c:if>>블랙드롭귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e3'}">selected</c:if>>골드드롭귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e4'}">selected</c:if>>에메랄드귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e5'}">selected</c:if>>하트귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e6'}">selected</c:if>>엘레강스귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e7'}">selected</c:if>>로골하트귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e8'}">selected</c:if>>블랙크리스탈귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e9'}">selected</c:if>>심플롱귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e10'}">selected</c:if>>실버원형귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e11'}">selected</c:if>>스노우귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e12'}">selected</c:if>>링귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e13'}">selected</c:if>>고풍귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e14'}">selected</c:if>>향수병귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e15'}">selected</c:if>>시크체인귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e16'}">selected</c:if>>시크하트귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e17'}">selected</c:if>>시크더블귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e18'}">selected</c:if>>시크열쇠귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e19'}">selected</c:if>>러블리귀걸이</option>
						<option value="귀걸이"
						<c:if test="${gocode=='e20'}">selected</c:if>>파이널귀걸이</option>
						
						<option value="목걸이"
						<c:if test="${gocode=='n1'}">selected</c:if>>레드십자가목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n2'}">selected</c:if>>심플드롭목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n3'}">selected</c:if>>레드원석목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n4'}">selected</c:if>>파스텔내추럴목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n5'}">selected</c:if>>로골목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n6'}">selected</c:if>>옥색목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n7'}">selected</c:if>>크리스탈스퀘어목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n8'}">selected</c:if>>심플스퀘어목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n9'}">selected</c:if>>넥라인목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n10'}">selected</c:if>>심플러블리목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n11'}">selected</c:if>>동전목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n12'}">selected</c:if>>바다목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n13'}">selected</c:if>>사파이어목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n14'}">selected</c:if>>마수리목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n15'}">selected</c:if>>변형십자가목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n16'}">selected</c:if>>USB목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n17'}">selected</c:if>>시크블랙목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n18'}">selected</c:if>>엘레강스목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n19'}">selected</c:if>>하트볼드체인목걸이</option>
						<option value="목걸이"
						<c:if test="${gocode=='n20'}">selected</c:if>>우드목걸이</option>
						
						<option value="시계"
						<c:if test="${gocode=='w1'}">selected</c:if>>실버스퀘어시계</option>
						<option value="시계"
						<c:if test="${gocode=='w2'}">selected</c:if>>실버그린시계</option>
						<option value="시계"
						<c:if test="${gocode=='w3'}">selected</c:if>>실버라운드시계</option>
						<option value="시계"
						<c:if test="${gocode=='w4'}">selected</c:if>>블랙라운드시계</option>
						<option value="시계"
						<c:if test="${gocode=='w5'}">selected</c:if>>골드라운드시계</option>
						<option value="시계"
						<c:if test="${gocode=='w6'}">selected</c:if>>dw_레드시계</option>
						<option value="시계"
						<c:if test="${gocode=='w7'}">selected</c:if>>dw_블랙시계</option>
						<option value="시계"
						<c:if test="${gocode=='w8'}">selected</c:if>>dw_화이트시계</option>
						<option value="시계"
						<c:if test="${gocode=='w9'}">selected</c:if>>dw_브라운시계</option>
						<option value="시계"
						<c:if test="${gocode=='w10'}">selected</c:if>>dw_블루시계</option>
						<option value="시계"
						<c:if test="${gocode=='w11'}">selected</c:if>>dw_골드블랙시계</option>
						<option value="시계"
						<c:if test="${gocode=='w12'}">selected</c:if>>실버스퀘어블루시계</option>
						<option value="시계"
						<c:if test="${gocode=='w13'}">selected</c:if>>골드스퀘어시계</option>
						<option value="시계"
						<c:if test="${gocode=='w14'}">selected</c:if>>브라운스퀘어시계</option>
						<option value="시계"
						<c:if test="${gocode=='w15'}">selected</c:if>>dw_실버정사각시계</option>
						<option value="시계"
						<c:if test="${gocode=='w16'}">selected</c:if>>dw_블루화이트시계</option>
						<option value="시계"
						<c:if test="${gocode=='w17'}">selected</c:if>>dw_블루그린시계</option>
						<option value="시계"
						<c:if test="${gocode=='w18'}">selected</c:if>>dw_레드블랙시계</option>
						<option value="시계"
						<c:if test="${gocode=='w19'}">selected</c:if>>dw_라이트브라운시계</option>
						<option value="시계"
						<c:if test="${gocode=='w20'}">selected</c:if>>딥브라운시계</option>
					</select>
				</td>
			 </tr>
	     	 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 
			 <tr>
			 <th align="center">글쓴이</th>
			 <td><input type="text" name="mid"placeholder="아이디를 적어주세요." required autofocus></td>
			 </tr>
	     	 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 
			 <tr>
			 <th align="center">제목</th>
			 <td><input type="text" name="title"  placeholder="제목을 적어주세요." required></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 
			 <tr>
			 <th align="center">내용</th>
			 <td><textarea rows="5" cols="60" name="writecontent" placeholder="내용을 적어주세요." required></textarea></td>
			 <td><input type="hidden" name="qanum" value="${param.gocode }"></td>
			 <td><input type="hidden" name="qanum" value="${param.mid }"></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			
			<tr>
			<td><input type="submit" value="글올리기" style="width: 100px; height: 40px; font-size: 1em; font-weight:bolder; color:#6E6E6E; background-color: #F2F2F2;" ></td>
			<td><input type="reset" value="취소" style="width: 100px; height: 40px; font-size: 1em; font-weight:bolder; color:#6E6E6E; background-color: #F2F2F2;" ></td>
			</tr>
		</table>
	</form>
</div>