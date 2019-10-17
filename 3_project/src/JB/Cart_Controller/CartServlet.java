package JB.Cart_Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JB.Cart_Vo.CartVo;
import JB.dao.CartDao;
import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;


@WebServlet("/cart/add")
public class CartServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid"); //로그인 아이디 얻어옴(세션스코프)
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
		CartDao dao=CartDao.getInstance();
		CartVo vo=new CartVo(0, name, changeImg, mid);
		dao.insert(vo); //장바구니 DB에 값 넣기
		resp.sendRedirect(req.getContextPath()+"/junbin/successCartResult.jsp");
	}
}












