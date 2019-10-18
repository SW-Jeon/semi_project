package SW_controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;


@WebServlet("/pro/home")
public class Homecontroller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		String ismain=(String)session.getAttribute("ismain");
		InventoryDao dao=new InventoryDao();
		InventoryVo vo=new InventoryVo();
		ArrayList<InventoryVo> list=dao.mainList(vo);
		String top=(String)req.getAttribute("top");
		String content=(String)req.getAttribute("content");
		String right=(String)req.getAttribute("right");
		String main=(String)req.getAttribute("main");
		String bottom=(String)req.getAttribute("bottom");
		if(top==null) {
			top="/pro/header.jsp";
		}
		if(content==null) {
			content="/pro/home.jsp";
		}
		if(main==null) {
			main="/pro/banner.jsp";
		}
		if(right==null) {
			right="/pro/right.jsp";
		}
		if(bottom==null) {
			bottom="/pro/footer.jsp";
		}

		getServletContext().setAttribute("cp", req.getContextPath()); //application 스코프에 절대경로 넣어줌
		if(ismain==null) { //비로그인 상태일시, 실행되는 구문
			req.setAttribute("top", top);
			req.setAttribute("content", content);
			req.setAttribute("right", right);
			req.setAttribute("bottom", bottom);
			req.setAttribute("list", list);	
			req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
		}else { //로그인 시, 실행되는 구문
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/pro/home.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.setAttribute("list", list);
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}
	}
}