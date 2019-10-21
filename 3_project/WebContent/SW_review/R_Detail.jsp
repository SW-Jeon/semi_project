<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="main">
		<h1 style="font-size: 5em;">상품후기</h1>
		<img src="${cp }/images/review.png" >
	<hr>
	<table style="display: inline-block; ">
			<tr>
				<td width="150">번호  |</td><td width="600" >${vo.asnum }</td>
			</tr>
			<tr>
				<td width="150">글내용  |</td><td width="600">${vo.astitle}</td>
			</tr>
			<tr>
				<td width="150">글내용  |</td><td width="600">${vo.ascontent}</td>
			</tr>
			<tr>
				<td width="150">글쓴이  |</td><td width="600">${vo.mid}</td>
			</tr>
					<tr>
				<td width="150">조회수  |</td><td width="600">${vo.ashit}</td>
			</tr>

			<tr>
				<td width="30"><a href="${cp }/SW_review/Rupdate?asnum=${vo.asnum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">수정하기</a></td>
				<td width="30"><a href="${cp }/SW_review/Rdelete?asnum=${vo.asnum }" style="text-align: center; text-decoration: none; display: inline-block; font-size: 1.5em;">삭제하기</a></td>
			</tr>
	</table>
	<br><hr>
		
</div>


