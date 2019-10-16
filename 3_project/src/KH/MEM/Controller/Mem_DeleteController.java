package KH.MEM.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import KH.Mem_Dao.Mem_Dao;

@WebServlet("/delete")
public class Mem_DeleteController extends HttpServlet {
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		String mid = req.getParameter("mid");
		Mem_Dao dao = Mem_Dao.getMem_Dao();
		int n = dao.delete(mid);
		if (n > 0) {
			resp.sendRedirect(req.getContextPath() + "/list");
		} else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("result.jsp").forward(req, resp);
		}

	}

}
