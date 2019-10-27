<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id=main>
	<form action="${cp }/insert.do" method="post" onsubmit="return Idvalidate();" name="frm1">
		<h1 style="font-size: 4em;">[회 원 가 입]</h1>
	   <table  style="width:65%; height:30%;  border-style: groove; " >
		<tr>
	       		<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:45%; padding-top: 30px; ">아이디(5~8자 사이)</th> 
	       		<td><input type="text" name="mid" placeholder="아이디를 적어주세요." style="width: 50%; height: 35px; font-size: 1.2em; margin-top: 30px; " required autofocus></td>
	       	</tr>
	       	<tr >
	       	 	<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">이름</th>
	       	 	<td><input type="text" name="mname" style="width: 50%; height: 35px; font-size: 1.2em;" placeholder="이름 입력" required></td>
	       	</tr>
	       	<tr>
	       		<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">비밀번호</th>
	       		<td><input type="password" name="mpwd" style="width: 50%; height: 35px; font-size: 1.2em;" placeholder="비밀번호 입력" required></td>
	       	</tr>
	       	<tr>
	       		<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">이메일</th>
	       		<td><input type="text" name="memail" style="width: 50%; height: 35px; font-size: 1.2em;" placeholder="이메일 입력" required></td>
	       	</tr>
	      	<tr>
	       		<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">주소</th>
	       		<td><input type="text" name="maddr" style="width: 50%; height: 35px; font-size: 1.2em;" placeholder="주소 입력" required></td>
	       	</tr>
	      	<tr>
	       		<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%; ">전화번호</th>
	       		<td><input type="text" name="mphone" style="width: 50%; height: 35px; font-size: 1.2em;" placeholder="전화번호 입력" required>
	       		<p style="color: red">전화번호는 '-' 없이 적어주세요.</p></td>
	       	</tr>
	       	<tr></tr>
	       	 	 	
	      	<tr>
	       		<th style="font-size: 1.5em;  font-weight:bold; text-align:center; padding-left: 5px; width:10%;  ">성별</th>
	       		<td><input name="mgen" type="radio" checked value="남" style="width: 15%; height: 20px; font-size: 1.2em;">남
                <input id="female" name="mgen" type="radio" value="여" style="width: 15%; height: 20px; font-size: 1.2em;">여</td>
	       	</tr>
	     </table>
	      <input type="hidden" name="회원상태" value="${param.mDelup   }">
	     <input type="submit" value="가입"style="width: 100px; height: 50px; text-align:center; font-size: medium; background-color: black; color: white;  margin-top: 50px;">
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

		if(mpwd.value.length>12 || mpwd.value.length<4){
			alert("비밀번호 4~12자리 내로 입력하세요");
			return false; 
		}

		if(mpwd.value.length>12 || mpwd.value.length<5){
			alert("비밀번호 5~12자리 내로 입력하세요");
			return false; 
		}	

		return true;
	}

</script>

