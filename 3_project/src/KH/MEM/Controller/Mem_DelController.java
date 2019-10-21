package KH.MEM.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KH.MEM_Vo.Mem_Vo;
import KH.Mem_Dao.Mem_Dao;

@WebServlet("/deleteMem")
public class Mem_DelController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid = req.getParameter("mid");
		Mem_Dao dao = Mem_Dao.getMem_Dao();
		Mem_Vo vo = dao.select(mid);
		req.setAttribute("Mem_Vo", vo);
		req.getRequestDispatcher("/KH.MEM/memInfo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid = req.getParameter("mid");
		String mpwd = req.getParameter("mpwd");

		Mem_Vo vo = new Mem_Vo(mid, null, mpwd, null, null, null, null, 0);
		Mem_Dao dao = Mem_Dao.getMem_Dao();
		int n = dao.updateDel(mid);
		if (n > 0) {
			req.setAttribute("code", "success");
		} else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/KH.MEM/result.jsp").forward(req, resp);
	}
}
