package KH.MEM.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KH.MEM_Vo.Mem_Vo;
import KH.Mem_Dao.Mem_Dao;

@WebServlet("/insert.do")
public class Mem_InsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("content", "/pro/home.jsp");
		req.setAttribute("right", "/pro/right.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid = req.getParameter("mid");
		String mname = req.getParameter("mname");
		String mpwd = req.getParameter("mpwd");
		String memail = req.getParameter("memail");
		String maddr = req.getParameter("maddr");
		String mphone = req.getParameter("mphone");
		String mgen = req.getParameter("mgen");
		Mem_Vo vo=new Mem_Vo(mid, mname, mpwd, memail, maddr, mphone, mgen, 0);
		Mem_Dao dao = Mem_Dao.getMem_Dao();		//싱글톤 객체 적용
		int n = dao.insert(vo);
		if (n > 0) {
			req.setAttribute("code", "success");
		} else {
			req.setAttribute("code", "fail");
		}
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main","/KH.MEM/result.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}
