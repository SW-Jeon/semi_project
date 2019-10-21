<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- QnAwrite.jsp -->
<div id="main">
	<h1 style="font-size: 4em;">고객만족센터</h1>
	<h2 >Q&A</h2>
	<hr>
	<form method="post" action="${cp }/SW_pro/QnAwrite">
		 <table  style="width:85%; height:30%;  border-style: groove; " >
			 <tr>
				 <th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">글쓴이</th>
				 <td><input type="text" name="qaname" style="width: 90%; height: 50px; font-size: 1.5em;" placeholder="이름을 적어주세요." required autofocus></td>
			 </tr>
			 
			 <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">내용</th>
			 	<td><textarea rows="5" cols="60" name="qacontent" style="width: 90%; height: 200px; font-size: 1.5em;" placeholder="내용을 적어주세요." required></textarea></td>
			 </tr>
			 
			 <tr>
			 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">비밀번호</th>
				<td><input type="password" name="qapwd" style="width: 90%; height: 50px; font-size: 1.5em;" placeholder="비밀번호를 입력해주세요." required></td>
			 </tr>
		</table>
			<input type="submit" value="글올리기" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;" >
			<input type="reset" value="취소" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 50px;"  onclick="history.go(-1);">
	</form>
</div>