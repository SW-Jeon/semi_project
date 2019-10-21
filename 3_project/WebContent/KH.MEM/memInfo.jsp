<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 

 <span style="font-size:20px;font-weight: bold">${vo.mname}</span> 님의 기본정보 관리페이지 입니다.<br>
 <hr>

<h1>기본 정보</h1>
	아이디: ${vo.mid}<br>
	비밀번호: ${vo.mpwd}<br>
	이름: ${vo.mname}<br>
	이메일: ${vo.memail}<br>
	휴대폰번호: ${vo.mphone}<br>
	성별: ${vo.mgen}<br>
	주소: ${vo.maddr}<br>

 <hr>
	<h1>회원 수정</h1>
	<form action="${cp }/update.do" method="post">
	 <table  style="width:20%" >
	<tr>
		<th>아이디</th> 
		<td><input type="text" name="mid"  value="${vo.mid }" readonly="readonly"></td>
		<tr height="1" bgcolor="#dddddd"><td colspan="2"></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="password" name="mpwd" ></td>
		<tr height="1" bgcolor="#dddddd"><td colspan="2"></td>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="memail" ></td>
		<tr height="1" bgcolor="#dddddd"><td colspan="2"></td>
	</tr>
	<tr>	
		<th>주소</th>
		<td><input type="text" name="maddr" ></td>
		<tr height="1" bgcolor="#dddddd"><td colspan="2"></td>
	</tr>
	<tr>	
		<th>연락처</th>
		<td><input type="text" name="mphone" ></td>
		<tr height="1" bgcolor="#dddddd"><td colspan="2"></td>
	</tr>
	<tr>
		<td><input type="submit" value="회원수정">
		<input type="reset" value="취소"></td>
	</tr>	
	</table>
	</form>

 <hr>
	<h1>회원 탈퇴</h1>
	<form action="${cp }/deleteMem" method="post">
	아이디: <input type="text" name="mid"><br>
	패스워드: <input type="password" name="mpwd"><br>
	<input type="submit" value="회원탈퇴"><br>
	</form>


