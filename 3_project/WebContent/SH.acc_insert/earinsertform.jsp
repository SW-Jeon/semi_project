<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /SH.acc_insert/earInsertform.jspv-->
<div id="main">
	<h1 style="font-size: 4em; text-align:center; ">상품등록페이지</h1>
	<form action="${cp }/SH.acc_insert/earinsertOk.jsp" enctype="multipart/form-data" method="post">
		<table  style="width:85%; height:45%;  border-style: groove;  margin-left: 100px;" >
		 <tr>
			<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">코드번호</th>
			 <td><input type="text" name="gocode" style="width: 90%; height: 50px; font-size: large;" placeholder="귀걸이e" required autofocus ></td>
		 </tr>
		  <tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">제품이름</th>
			 	<td><input type="text" name="goname" style="width: 90%; height: 50px; font-size: large;" placeholder="제품이름" required></td>
		  </tr>
		  <tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">가격</th>
			 	<td><input type="text" name="goprice" style="width: 90%; height: 50px; font-size: large;" placeholder="숫자만 입력하세요" required ></td>
		  </tr>
		  <tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">색상</th>
			 	<td><input type="text" name="gocolor" style="width: 90%; height: 50px; font-size: large;" placeholder="영어로 입력하세요" required ></td>
		   </tr>
		   <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; ">이미지</th>
			 	<td><input type="file" name="file1"  required></td>
		   </tr>
		   <tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">재고수량</th>
			 	<td><input type="text" name="pamount" style="width: 90%; height: 50px; font-size: large;" placeholder="재고수량" required ></td>
		    </tr>
			 <tr>
				<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width: 20%; ">품목번호</th>
			 	<td><input type="text" name="jnum" style="width: 90%; height: 50px; font-size: large;" placeholder="귀걸이100" required ></td>
			 </tr>
		</table>
		<input type="submit" value="상품등록" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px; margin-left: 40%;">
		<input type="reset" value="취소" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;" onclick="history.go(-1);">
	</form>
</div>