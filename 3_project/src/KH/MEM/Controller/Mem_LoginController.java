package KH.MEM.Controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KH.Mem_Dao.Mem_Dao;
import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;


@WebServlet("/login.do")
public class Mem_LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		String islogin=req.getParameter("islogin"); //결제완료후 get방식으로 islogin 파라미터 넘겨줌
		InventoryDao idao=new InventoryDao();
		InventoryVo vo=new InventoryVo();
		ArrayList<InventoryVo> list=idao.mainList(vo);
		if(islogin!=null) {
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/pro/home.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.setAttribute("list", list);
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}else {
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("content", "/pro/home.jsp");
		req.setAttribute("right", "/pro/right.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String mpwd=req.getParameter("mpwd");
		Mem_Dao dao = Mem_Dao.getMem_Dao();
		boolean result=dao.isMember(mid, mpwd);
		InventoryDao idao=new InventoryDao();
		InventoryVo vo=new InventoryVo();
		ArrayList<InventoryVo> list=idao.mainList(vo);
		if(result) {
			HttpSession session=req.getSession();	//세션객체 얻어오기
			session.setAttribute("mid",mid);
			session.setAttribute("ismain", "ok"); //홈컨트롤러로 이동할시 세션에 ismain 값을 지정
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/pro/home.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.setAttribute("list", list);
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}else {
			req.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않아요.");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("content", "/KH.MEM/result.jsp");
			req.setAttribute("right", "/pro/right.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
		}	
	}
}

