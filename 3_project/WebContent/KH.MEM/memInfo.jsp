<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <style>
.title{ font-size: 1.2em;  font-weight:bold; text-align:center; margin-left: 100px; width:10%;  }
.con{ width: 10%; height: 40px; font-size: 1.2em; padding-left: 10px;}
</style>
 
 <span style="font-size:20px;font-weight: bold">${vo.mname}</span> 님의 기본정보 관리페이지 입니다.<br>
 <hr>
<h1 style="font-size: 2.5em;"> [ 기본 정보 ]</h1>
<form>
	<table  style="width:50%; height:10%;  border-style: groove;  margin-left: 25%;" >
	<tr>
		<th class="title">아이디</th>
		<td class="con" >${vo.mid}</td>
	</tr>
	<tr>
		<th class="title">비밀번호</th>
		<td class="con" >${vo.mpwd}</td>
	</tr>
	<tr>
		<th class="title">이름</th>
		<td class="con" >${vo.mname}</td>
	</tr>
	<tr>	
		<th class="title">이메일</th>
		<td class="con" >${vo.memail}</td>
	</tr>
	<tr>
		<th class="title">휴대폰번호</th>
		<td class="con" >${vo.mphone}</td>
	</tr>
	<tr>
		<th class="title">성별</th>
		<td class="con" > ${vo.mgen}</td>
	</tr>
	<tr>	
		<th class="title">주소</th>
		<td class="con" >${vo.maddr}</td>
	</tr>
	</table>
</form>
 <hr>
	<h1 style="font-size: 2.5em;">[ 회원 수정 ]</h1>
	<form action="${cp }/update.do" method="post">
	<table  style="width:50%; height:10%;  border-style: groove;  margin-left: 25%;" >
		<tr>
			<th class="title">아이디</th> 
			<td class="con" ><input type="text" name="mid"  value="${vo.mid }" readonly="readonly" ></td>
		</tr>
		<tr>
			<th class="title">패스워드</th>
			<td class="con" ><input type="password" name="mpwd" ></td>
		<tr>
			<th class="title">이메일</th>
			<td class="con" ><input type="text" name="memail" ></td>
		</tr>
		<tr>	
			<th class="title">주소</th>
			<td class="con" ><input type="text" name="maddr" ></td>
		</tr>
		<tr>	
			<th class="title">연락처</th>
			<td class="con" ><input type="text" name="mphone" ></td>
		</tr>
	</table>
	<input type="submit" value="회원수정" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;  margin-top: 30px;">
	<input type="reset" value="취소" style="width: 100px; height: 50px; font-size: medium; background-color: black; color: white;" onclick="history.go(-1);">
	</form>

 <hr>
	<h1 style="font-size: 2.5em;"> [ 회원 탈퇴 ]</h1>
	<form action="${cp }/deleteMem" method="post">
	 <table  style="width:50%; height:10%;  border-style: groove;  margin-left: 25%;" >
		<tr>
			<th class="title">아이디</th>
			<td class="con" ><input type="text" name="mid"></td>
		</tr>
		<tr>
			<th class="title">패스워드</th>
			<td class="con" ><input type="password" name="mpwd" ></td>
		</tr>
		</table>
		<input type="submit" value="회원탈퇴" style="width: 100px; height: 50px; text-align:center; font-size: medium; background-color: black; color: white;  margin-top: 30px; margin-bottom: 50px;">
	</form>


