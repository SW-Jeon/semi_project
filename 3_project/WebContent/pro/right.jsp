<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id=right>
	<div id=right_down1>
		<br>
		<form method="post" action="${cp }/login.do">
			아이디 <input type="text" name="mid" value="${param.mid }" placeholder="Your ID" required autofocus><br> 
			<br>
			비밀번호 <input type="password" name="mpwd"  value="${param.mpwd }" placeholder="Password" required><br> 
			<br>
			<div style="color:red; font-size:12px">${requestScope.errMsg }</div>
		<div class="checkbox">
          <label>
            <input type="checkbox" value="remember"> 기억하기
          </label>
          </div>
          	<br>
			<input type="submit" value="로그인" style="width: 70px; height: 30px;">
		</form>
			<br>
		<span class="txt_find">
           <a href="/member/find/loginId" class="link_find">아이디</a>
            / 
           <a href="/member/find/password" class="link_find">비밀번호 찾기</a>
         </span>
	</div>
	<div id=right_down2>
		<img src="https://colinbendell.cloudinary.com/image/upload/c_crop,f_auto,g_auto,h_350,w_400/v1512090971/Wizard-Clap-by-Markus-Magnusson.gif">
	</div>
	<div id=right_down3>
		<img src="https://colinbendell.cloudinary.com/image/upload/c_crop,f_auto,g_auto,h_350,w_400/v1512090971/Wizard-Clap-by-Markus-Magnusson.gif">
	</div>
</div>
