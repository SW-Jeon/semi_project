<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- QnAwrite.jsp -->
<div id="main">
	<h1 style="font-size: 4em;">상품후기</h1>
	<img src="${cp }/images/review.png"  style="width: 80%; height: 500px;">
	<hr>
	<form method="post" action="${cp }/SW_review/Rwrite" enctype="multipart/form-data">
				 <table  style="width:85%; height:45%;  border-style: groove; " >
			 <tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">글쓴이</th>
			 	<td><input type="text" name="mid" style="width: 90%; height: 50px; font-size: large;" placeholder="회원아이디를 적어주세요." required autofocus ></td>
			 </tr>
	     	 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
	     	 
			 <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; ">제목</th>
			 	<td><input type="text" name="astitle" style="width: 90%; height: 50px; font-size: large;"placeholder="제목(33자이내)" required ></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			 
			 <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; ">후기</th>
			 	<td><textarea rows="5" cols="60" name="ascontent" style="width: 90%; height: 150px; font-size: large;" placeholder="후기를 남겨주세요.(200자이내)" required></textarea></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			 
			  <tr>
				 <th style="font-size: 1.5em; font-weight:bold; text-align:center; padding-left: 5px; ">상품선택</th>
			 		<td>	
				   		 <select name="gocode" style="width: 15%; height: 50px; font-size: large; ">
							<option value="b1,가죽화이트팔찌"
							<c:if test="${gocode=='b1'}">selected</c:if>>가죽화이트팔찌</option>
							<option value="b2"
							<c:if test="${gocode=='b2'}">selected</c:if>>레드원석팔찌</option>
							<option value="b3"
							<c:if test="${gocode=='b3'}">selected</c:if>>니트레드블루팔찌</option>
							<option value="b4"
							<c:if test="${gocode=='b4'}">selected</c:if>>주황연두실버팔찌</option>
							<option value="b5"
							<c:if test="${gocode=='b5'}">selected</c:if>>실팔찌</option>
							<option value="b6"
							<c:if test="${gocode=='b6'}">selected</c:if>>심플실버팔찌</option>
							<option value="b7"
							<c:if test="${gocode=='b7'}">selected</c:if>>드롭팔찌</option>
							<option value="b8"
							<c:if test="${gocode=='b8'}">selected</c:if>>로골체인팔찌</option>
							<option value="b9"
							<c:if test="${gocode=='b9'}">selected</c:if>>다크실버체인팔찌</option>
							<option value="b10"
							<c:if test="${gocode=='b10'}">selected</c:if>>스마일실버팔찌</option>
							<option value="b11"
							<c:if test="${gocode=='b11'}">selected</c:if>>레더원석팔찌</option>
							<option value="b12"
							<c:if test="${gocode=='b12'}">selected</c:if>>블링팔찌</option>
							<option value="b13"
							<c:if test="${gocode=='b13'}">selected</c:if>>블루미니원석팔찌</option>
							<option value="b14"
							<c:if test="${gocode=='b14'}">selected</c:if>>터프팔찌</option>
							<option value="b15"
							<c:if test="${gocode=='b15'}">selected</c:if>>심플블랙가죽팔찌</option>
							<option value="b16"
							<c:if test="${gocode=='b16'}">selected</c:if>>패션팔찌</option>
							<option value="b17"
							<c:if test="${gocode=='b17'}">selected</c:if>>이쁜팔찌</option>
							<option value="b18"
							<c:if test="${gocode=='b18'}">selected</c:if>>리얼심플팔찌</option>
							<option value="b19"
							<c:if test="${gocode=='b19'}">selected</c:if>>커플실팔찌</option>
							<option value="b20"
							<c:if test="${gocode=='b20'}">selected</c:if>>블랙로골팔찌</option>
							
							<option value="e1"
							<c:if test="${gocode=='e1'}">selected</c:if>>실버링귀걸이</option>
							<option value="e2"
							<c:if test="${gocode=='e2'}">selected</c:if>>블랙드롭귀걸이</option>
							<option value="e3"
							<c:if test="${gocode=='e3'}">selected</c:if>>골드드롭귀걸이</option>
							<option value="e4"
							<c:if test="${gocode=='e4'}">selected</c:if>>에메랄드귀걸이</option>
							<option value="e5"
							<c:if test="${gocode=='e5'}">selected</c:if>>하트귀걸이</option>
							<option value="e6"
							<c:if test="${gocode=='e6'}">selected</c:if>>엘레강스귀걸이</option>
							<option value="e7"
							<c:if test="${gocode=='e7'}">selected</c:if>>로골하트귀걸이</option>
							<option value="e8"
							<c:if test="${gocode=='e8'}">selected</c:if>>블랙크리스탈귀걸이</option>
							<option value="e9"
							<c:if test="${gocode=='e9'}">selected</c:if>>심플롱귀걸이</option>
							<option value="e10"
							<c:if test="${gocode=='e10'}">selected</c:if>>실버원형귀걸이</option>
							<option value="e11"
							<c:if test="${gocode=='e11'}">selected</c:if>>스노우귀걸이</option>
							<option value="e12"
							<c:if test="${gocode=='e12'}">selected</c:if>>링귀걸이</option>
							<option value="e13"
							<c:if test="${gocode=='e13'}">selected</c:if>>고풍귀걸이</option>
							<option value="e14"
							<c:if test="${gocode=='e14'}">selected</c:if>>향수병귀걸이</option>
							<option value="e15"
							<c:if test="${gocode=='e15'}">selected</c:if>>시크체인귀걸이</option>
							<option value="e16"
							<c:if test="${gocode=='e16'}">selected</c:if>>시크하트귀걸이</option>
							<option value="e17"
							<c:if test="${gocode=='e17'}">selected</c:if>>시크더블귀걸이</option>
							<option value="e18"
							<c:if test="${gocode=='e18'}">selected</c:if>>시크열쇠귀걸이</option>
							<option value="e19"
							<c:if test="${gocode=='e19'}">selected</c:if>>러블리귀걸이</option>
							<option value="e20"
							<c:if test="${gocode=='e20'}">selected</c:if>>파이널귀걸이</option>
							
							<option value="n1"
							<c:if test="${gocode=='n1'}">selected</c:if>>레드십자가목걸이</option>
							<option value="n2"
							<c:if test="${gocode=='n2'}">selected</c:if>>심플드롭목걸이</option>
							<option value="n3"
							<c:if test="${gocode=='n3'}">selected</c:if>>레드원석목걸이</option>
							<option value="n4"
							<c:if test="${gocode=='n4'}">selected</c:if>>파스텔내추럴목걸이</option>
							<option value="n5"
							<c:if test="${gocode=='n5'}">selected</c:if>>로골목걸이</option>
							<option value="n6"
							<c:if test="${gocode=='n6'}">selected</c:if>>옥색목걸이</option>
							<option value="n7"
							<c:if test="${gocode=='n7'}">selected</c:if>>크리스탈스퀘어목걸이</option>
							<option value="n8"
							<c:if test="${gocode=='n8'}">selected</c:if>>심플스퀘어목걸이</option>
							<option value="n9"
							<c:if test="${gocode=='n9'}">selected</c:if>>넥라인목걸이</option>
							<option value="n10"
							<c:if test="${gocode=='n10'}">selected</c:if>>심플러블리목걸이</option>
							<option value="n11"
							<c:if test="${gocode=='n11'}">selected</c:if>>동전목걸이</option>
							<option value="n12"
							<c:if test="${gocode=='n12'}">selected</c:if>>바다목걸이</option>
							<option value="n13"
							<c:if test="${gocode=='n13'}">selected</c:if>>사파이어목걸이</option>
							<option value="n14"
							<c:if test="${gocode=='n14'}">selected</c:if>>마수리목걸이</option>
							<option value="n15"
							<c:if test="${gocode=='n15'}">selected</c:if>>변형십자가목걸이</option>
							<option value="n16"
							<c:if test="${gocode=='n16'}">selected</c:if>>USB목걸이</option>
							<option value="n17"
							<c:if test="${gocode=='n17'}">selected</c:if>>시크블랙목걸이</option>
							<option value="n18"
							<c:if test="${gocode=='n18'}">selected</c:if>>엘레강스목걸이</option>
							<option value="n19"
							<c:if test="${gocode=='n19'}">selected</c:if>>하트볼드체인목걸이</option>
							<option value="n20"
							<c:if test="${gocode=='n20'}">selected</c:if>>우드목걸이</option>
							
							<option value="w1"
							<c:if test="${gocode=='w1'}">selected</c:if>>실버스퀘어시계</option>
							<option value="w2"
							<c:if test="${gocode=='w2'}">selected</c:if>>실버그린시계</option>
							<option value="w3"
							<c:if test="${gocode=='w3'}">selected</c:if>>실버라운드시계</option>
							<option value="w4"
							<c:if test="${gocode=='w4'}">selected</c:if>>블랙라운드시계</option>
							<option value="w5"
							<c:if test="${gocode=='w5'}">selected</c:if>>골드라운드시계</option>
							<option value="w6"
							<c:if test="${gocode=='w6'}">selected</c:if>>dw_레드시계</option>
							<option value="w7"
							<c:if test="${gocode=='w7'}">selected</c:if>>dw_블랙시계</option>
							<option value="w8"
							<c:if test="${gocode=='w8'}">selected</c:if>>dw_화이트시계</option>
							<option value="w9"
							<c:if test="${gocode=='w9'}">selected</c:if>>dw_브라운시계</option>
							<option value="w10"
							<c:if test="${gocode=='w10'}">selected</c:if>>dw_블루시계</option>
							<option value="w11"
							<c:if test="${gocode=='w11'}">selected</c:if>>dw_골드블랙시계</option>
							<option value="w12"
							<c:if test="${gocode=='w12'}">selected</c:if>>실버스퀘어블루시계</option>
							<option value="w13"
							<c:if test="${gocode=='w13'}">selected</c:if>>골드스퀘어시계</option>
							<option value="w14"
							<c:if test="${gocode=='w14'}">selected</c:if>>브라운스퀘어시계</option>
							<option value="w15"
							<c:if test="${gocode=='w15'}">selected</c:if>>dw_실버정사각시계</option>
							<option value="w16"
							<c:if test="${gocode=='w16'}">selected</c:if>>dw_블루화이트시계</option>
							<option value="w17"
							<c:if test="${gocode=='w17'}">selected</c:if>>dw_블루그린시계</option>
							<option value="w18"
							<c:if test="${gocode=='w18'}">selected</c:if>>dw_레드블랙시계</option>
							<option value="w19"
							<c:if test="${gocode=='w19'}">selected</c:if>>dw_라이트브라운시계</option>
							<option value="w20"
							<c:if test="${gocode=='w20'}">selected</c:if>>딥브라운시계</option>
						</select>
				</td>
			 </tr>
	     	 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
			 
			 <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; ">구매상품 이미지</th>
			 	<td><input type="file" name="asimg1"  required></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		</table>
			<input type="hidden" name="purnum" value="${purnum }">
			<input type="submit" value="리뷰남기기" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;">
			<input type="reset" value="취소"  style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;">
	</form>
</div>