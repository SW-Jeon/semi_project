<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
		<h1>회원문의</h1>
		<h3>글보기</h3>
	<hr>
	<table style="display: inline-block; ">
			<tr>
				<td width="150">번호  |</td><td width="600" >${vo.writenum }</td>
			</tr>
			<tr>
				<td width="150">글내용  |</td><td width="600">${vo.title}</td>
			</tr>
			<tr>
				<td width="150">글내용  |</td><td width="600">${vo.writecontent}</td>
			</tr>
			<tr>
				<td width="150">글쓴이  |</td><td width="600">${vo.mid}</td>
			</tr>	
			<tr>
				<td width="150">답변  |</td><td width="600">${vo.rewrite}</td>
			</tr>	
			<tr>
				<td width="150">답변확인상태  |</td><td width="600">${vo.rewst}</td>
			</tr>
			<tr>
				<td width="30"><a href="${cp }/SW_write/update?writenum=${vo.writenum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">수정하기</a></td>
				<td width="30"><a href="${cp }/SW_write/delete?writenum=${vo.writenum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">삭제하기</a></td>
			</tr>
	</table>
	<br><hr>
 <c:if test="${sessionScope.mid=='admin'}">		
	<form method="post"  action="${cp }/SW_write/Wrewst">
		<table style="display: inline-block;">
			<tr>
				<td width="30">운영자 답변</td><td width="500"><textarea rows="5" cols="60" name="rewrite"></textarea></td>
			</tr>
			<tr>
			<td width="30">답변상태</td>
			<td width="500"><input name="rewst" type="radio" checked value="대기중" required><label for="대기중">대기중</label>
              <input name="rewst" type="radio" value="답변완료"><label for="답변완료">답변완료</label></td>
              <td><input type="hidden" name="writenum" value="${param.writenum }"></td>
			</tr>
			<tr>
				<td width="30"><input type="submit"  value="답변확인" style="margin-left: 300px; margin-top: 50px;"></td>
			</tr>
		</table>
	</form>
</c:if>		
</div>
