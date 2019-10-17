<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- QnAwrite.jsp -->
<div id="main">
	<h1 style="font-size: 5em;">상품후기</h1>
	<hr>
	<form method="post" action="${cp }/SW_review/Rwrite" enctype="multipart/form-data">
		 <table  style="width:40%" >
		 
			 <tr>
			 	<th align="center">글쓴이</th>
			 	<td><input type="text" name="mid" placeholder="회원아이디를 적어주세요." required autofocus></td>
			 </tr>
	     	 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
	     	 
			 <tr>
			 	<th align="center">제목</th>
			 	<td><input type="text" name="astitle" placeholder="제목(33자이내)" required></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 
			 <tr>
			 	<th align="center">후기</th>
			 	<td><textarea rows="5" cols="60" name="ascontent" placeholder="후기를 남겨주세요.(200자이내)" required></textarea></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 
			 <tr>
			 	<th align="center">구매상품 이미지첨부</th>
			 	<td><input type="file" name="asimg1" required></td>
			 </tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			
			 <tr>
			 	<td><input type="submit" value="리뷰남기기" style="width: 100px; height: 40px; font-size: 1em; font-weight:bolder; color:#6E6E6E; background-color: #F2F2F2;" ></td>
				<td><input type="reset" value="취소" style="width: 100px; height: 40px; font-size: 1em; font-weight:bolder; color:#6E6E6E; background-color: #F2F2F2;" ></td>
			 </tr>
		</table>
	</form>
</div>