package SH.Info_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Info_Dao.InfoDao;
import SH.Info_Vo.Info_Vo;


@WebServlet("/info/detail")
public class DetailServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int infonum=Integer.parseInt(req.getParameter("infonum"));
		InfoDao dao=new InfoDao();
		Info_Vo vo=dao.detail(infonum);
		req.setAttribute("vo",vo);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SH.info/infodetail.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);	
	}
}
