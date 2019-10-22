<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id=main>
	<form action="${cp }/insert.do" method="post" onsubmit="return Idvalidate();" name="frm1">
	     <table style="width:800; border-left: 1px;" >
	       	<tr  height="50">
	       		<td align="center" ><b>[회원가입]</b></td>
	       	</tr>
	       	<tr  height="30">
	       		<th> 아이디(5~8자 사이) <input type="text" name="mid" placeholder="아이디 입력"></th>
	       		<th><input type="button" value="체크"></th>
	       	</tr>
	       	<tr  height="30">
	       	 	<th>이름 <input type="text" name="mname" placeholder="이름 입력" required></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> 비밀번호<input type="password" name="mpwd" placeholder="비밀번호 입력" required></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> 이메일<input type="text" name="memail" placeholder="이메일 입력" required></th>
	       	</tr>
	      	<tr  height="30">
	       		<th> 주소<input type="text" name="maddr" placeholder="주소 입력" required></th>
	       	</tr>
	      	<tr  height="30">
	       		<th> 전화번호<input type="text" name="mphone" placeholder="전화번호 입력" required></th>
	       	</tr> 	 	
	      	<tr  height="30">
	       		<th><label><input name="mgen" type="radio" checked value="남">남</label>
                <input id="female" name="mgen" type="radio" value="여"><label for="female">여</label></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> <input type="hidden" name="회원상태" value="${param.mDelup   }"></th>
	       	</tr>
	       	<tr  height="30">
	       		<th> <input type="submit" value="가입" ></th>
	       	</tr>
	     </table>
	</form>      
</div>
<script type="text/javascript">
	function Idvalidate(){
		var mid=document.frm1.mid;
		if(mid.value.length>8 || mid.value.length<5){
			alert("아이디는 5~8자 사이로 입력하세요");
			return false; //submit작업 취소
		}
		for(var i=0;i<mid.value.length;i++){
			var ch=mid.value.charAt(i);
			if(!(ch>='a' && ch<='z')){
				alert("아이디는 영문소문자로만 입력해 주세요.");
				return false;//메소드 끝내기
			}
		}
		var mpwd=document.frm1.mpwd;
		if(mpwd.value.length>12 || mpwd.value.length<5){
			alert("비밀번호 5~12자리 내로 입력하세요");
			return false; 
		}	
		return true;
	}
</script>