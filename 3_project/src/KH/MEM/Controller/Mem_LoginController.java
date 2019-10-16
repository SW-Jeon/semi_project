package KH.MEM.Controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KH.Mem_Dao.Mem_Dao;


@WebServlet("/login.do")
public class Mem_LoginController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("content", "/pro/home.jsp");
		req.setAttribute("right", "/pro/right.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		String mpwd=req.getParameter("mpwd");
		Mem_Dao dao = Mem_Dao.getMem_Dao();
		boolean result=dao.isMember(mid, mpwd);
		if(result) {
			HttpSession session=req.getSession();	//세션객체 얻어오기
			session.setAttribute("mid",mid);
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/pro/home.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
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

