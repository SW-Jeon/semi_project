<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- QnAwrite.jsp -->
<div id="main">
	<div class="f">
	<h1 style="font-size: 5em;">Q&A</h1>
	<hr>
	<form method="post" action="${cp }/SW_review/Rwrite">
		 <table  style="width:40%" >
			 <tr><th align="center"><h4 style="font-size: 1.5em;">글쓰기</h4></th></tr>
	     	 <tr height="3" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 <tr><th align="center">글쓴이</th><td><input type="text" name="qaname" placeholder="이름을 적어주세요." required autofocus></td></tr>
	     	 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 <tr><th align="center">내용</th><td><textarea rows="5" cols="60" name="qacontent" placeholder="내용을 적어주세요." required></textarea></td></tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			 <tr><th align="center">비밀번호</th><td><input type="password" name="qapwd" placeholder="비밀번호를 입력해주세요." required></td></tr>
			 <tr height="1" bgcolor="#dddddd"><td colspan="2"></td></tr>
			<tr><td><input type="submit" value="글올리기" style="width: 100px; height: 40px; font-size: 1em; font-weight:bolder; color:#6E6E6E; background-color: #F2F2F2;" ></td>
			<td><input type="reset" value="취소" style="width: 100px; height: 40px; font-size: 1em; font-weight:bolder; color:#6E6E6E; background-color: #F2F2F2;" ></td></tr>
		</table>
	</form>
	</div>
</div>