<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/SH.info/infoupdate.jsp</title>
</head>
<body>
<form action="${cp }/info/update" method="post">
	<table>
		<tr>
			<th>글번호</th>
			<td><input type="text" name="infonum" value="${vo.infonum }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="infotitle" value="${vo.infotitle }" ></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="30" cols="100" name="infocontent"> ${vo.infocontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정" >
				<input type="reset" value="되돌리기" >
				<a href="${cp }/info/list">목록으로</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>