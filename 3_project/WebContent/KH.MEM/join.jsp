<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function Idvalidate(){
		var mid=document.getElementById("mid").value;
			if(mid.length>8 || mid.length<5){
				alert("아이디는 5~8자 사이로 입력하세요");
				return false; //submit작업 취소
			}
	}		
	
</script>
</head>

<body>
<div id=main>
	<form action="${cp }/insert.do" method="post" >
	     <table style="width:800; border-left: 1px;" >
	       	<tr  height="50">
	       		<td align="center" ><b>[회원가입]</b></td>
	       	</tr>
	       	<tr  height="30">
	       		<th> 아이디(5~8자 사이) <input type="text" id="mid" placeholder="아이디 입력" required autofocus></th>
	       		<th><input type="button" value="자릿수확인" onclick="Idvalidate()"></th>
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
	       		<th><label><input name="mgen" type="radio" checked value="male">남</label>
                <input id="female" name="mgen" type="radio" value="female"><label for="female">여</label></th>
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
  </body>