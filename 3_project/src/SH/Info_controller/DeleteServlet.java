package SH.Info_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Info_Dao.InfoDao;

@WebServlet("/info/delete")
public class DeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int infonum=Integer.parseInt(req.getParameter("infonum"));
		InfoDao dao=new InfoDao();
		int n=dao.delete(infonum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/info/list");
		}else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/SH.info/inforesult.jsp").forward(req, resp);
		}
		
	}
}
