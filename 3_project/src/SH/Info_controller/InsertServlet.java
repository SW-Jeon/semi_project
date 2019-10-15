package SH.Info_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import SH.Info_Dao.InfoDao;
import SH.Info_Vo.Info_Vo;


@WebServlet("/info/insert")
public class InsertServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/SH.info/infoinsert.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String snum=req.getParameter("num");
		String infotitle=req.getParameter("infotitle");
		String infocontent=req.getParameter("infocontent");
		int infonum=0;
		Info_Vo vo=new Info_Vo(infonum,infotitle,infocontent,null);
		InfoDao dao=new InfoDao();
<<<<<<< HEAD
=======
		Info_Vo vo=new Info_Vo(infonum,infotitle,infocontent,admin);
>>>>>>> refs/remotes/origin/master
		int n=dao.insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/info/list");
		}else {
			req.setAttribute("code", "fail");
			req.getRequestDispatcher("/SH.info/inforesult.jsp").forward(req, resp);
		}
	}
}
