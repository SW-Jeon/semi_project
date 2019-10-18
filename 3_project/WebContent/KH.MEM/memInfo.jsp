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
	<form action="updateMem.jsp" method="post">
	아이디: <input type="text" name="mid"><br>
	패스워드: <input type="password" name="mpwd"><br>
	이메일: <input type="text" name="memail"><br>
	<input type="submit" value="회원수정"><br>
	</form>

 <hr>
	<h1>회원 탈퇴</h1>
	<form action="deleteMem.jsp" method="post">
	아이디: <input type="text" name="mid"><br>
	패스워드: <input type="password" name="mpwd"><br>
	<input type="submit" value="회원탈퇴"><br>
	</form>


