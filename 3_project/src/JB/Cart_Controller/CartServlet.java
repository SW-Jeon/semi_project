package JB.Cart_Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;


@WebServlet("/cart/add")
public class CartServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String changeImg="";
		int jNum=Integer.parseInt(req.getParameter("jNum"));
		String goImg=req.getParameter("goImg");
		String goCode=req.getParameter("getCode"); //물건코드(e1,e2..)
		String name=req.getParameter("name"); //물건이름(ex.실버링귀걸이)
		switch(jNum) {
			case(100): changeImg=req.getContextPath()+"/acc/ear/"+goImg; break;
			case(200): changeImg=req.getContextPath()+"/acc/neck/"+goImg; break;
			case(300): changeImg=req.getContextPath()+"/acc/brace/"+goImg; break;
			case(400): changeImg=req.getContextPath()+"/acc/watch/"+goImg; break;
		}
		//Cookie cook1=new Cookie(goCode, ""); //코드쿠키에 넣어줌
		//cook1.setPath("/");
		//cook1.setMaxAge(0); //1시간유지
		String reName=goCode+"."+goImg;
		Cookie cook2=new Cookie(goCode, changeImg); //이미지경로 쿠키 넣어줌
		cook2.setPath("/");
		cook2.setMaxAge(60*10); //1시간유지
		//resp.addCookie(cook1);
		resp.addCookie(cook2);
		//System.out.println(goCode+"."+goImg);
		InventoryDao dao=new InventoryDao();
		InventoryVo vo=dao.detail(goCode);
		Cookie[] cookies=req.getCookies();
		req.setAttribute("name", name); //물건한글이름
		req.setAttribute("vo", vo);
		req.setAttribute("cookies", cookies);
		req.getRequestDispatcher("/junbin/cartResult.jsp").forward(req, resp);
	}
}












