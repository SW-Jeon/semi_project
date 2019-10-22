<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="main">
	<h1 style="font-size: 4em;">회원문의</h1>
	<h3 >회원문의 수정하기</h3>
	<hr>
	<form method="post" action="${cp }/SW_pro/update">
		 <table  style="width:85%; height:30%;  border-style: groove; " >
			 <tr>
				 <th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">제목</th>
				 <td><input type="text" name="title" style="width: 90%; height: 50px; font-size: 1.5em;" placeholder="제목을 적어주세요." required autofocus></td>
			 </tr> 
			 <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">내용</th>
			 	<td><textarea rows="5" cols="60" name="writecontent" style="width: 90%; height: 200px; font-size: 1.5em;" placeholder="내용을 적어주세요." required></textarea></td>
			 </tr>
		</table>
			<input type="submit" value="수정하기" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;" >
			<input type="reset" value="취소" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;"  onclick="history.go(-1);"  >
	</form>
</div>