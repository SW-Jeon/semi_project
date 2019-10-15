<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/SH.info/infodetail.jsp</title>
</head>
<body>

	<table>
		<tr>
			<th>글번호</th>
			<td><input type="text" name="infotitle" value="${vo.infonum }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="infotitle" value="${vo.infotitle }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="30" cols="100" readonly="readonly"> ${vo.infocontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="${cp }/info/delete?infonum=${vo.infonum}">삭제</a>	
				<a href="${cp }/info/update?infonum=${vo.infonum}">수정</a>
				<a href="${cp }/info/list">목록으로</a>
			</td>
		</tr>
	</table>
	

</body>
</html>