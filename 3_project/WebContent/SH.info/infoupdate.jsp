<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/SH.info/infoupdate.jsp</title>
<style type="text/css">
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<div id="main">
<h1>수정페이지</h1>
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
			<td colspan="2" style="text-align: right; ">
				<input type="submit" value="수정" class="button1" >
				<input type="reset" value="되돌리기" class="button1"  >
				<a href="${cp }/info/list" style="color: green;">목록으로</a>
				
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>