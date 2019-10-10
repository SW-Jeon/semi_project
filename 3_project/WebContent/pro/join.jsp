<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id=main>
	<form action="join.jsp"  onsubmit="return valiDate();" name="frm1" >
	     <table width="800" border="1px" >
	       	<tr  height="50">
	       		<td align="center" ><b>[회원가입]</b></td>
	       	</tr>
	       	<tr  height="30">
	       		<th> 아이디(5~8자 사이) <input type="text" name="id" placeholder="아이디 입력" required autofocus></th>
	       	</tr>
	       	<tr  height="30">
	       	 	<th>이름 <input type="text" name="name" placeholder="이름 입력" required></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> 비밀번호<input type="password" name="pwd" placeholder="비밀번호 입력" required></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> 이메일<input type="text" name="email" placeholder="이메일 입력" required></th>
	       	</tr>
	      	<tr  height="30">
	       		<th> 주소<input type="text" name="addr" placeholder="주소 입력" required></th>
	       	</tr>
	      	<tr  height="30">
	       		<th> 전화번호<input type="text" name="phone" placeholder="전화번호 입력" required></th>
	       	</tr> 	 	
	      	<tr  height="30">
	       		<th><label><input name="sex" type="radio" checked value="male">남</label>
                <input id="female" name="sex" type="radio" value="female"><label for="female">여</label></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> <input type="hidden" name="회원상태" value="${param.mDelup   }"></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> <input type="submit"  value="가입" ></th>
	       	</tr>
	     </table>
	</form>      
</div>