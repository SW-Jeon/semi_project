package SH.Info_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Info_Dao.InfoDao;
import SH.Info_Vo.InfoVo;

@WebServlet("/info/insert")
public class InsertServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/SH.info/infoinsert.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String num=req.getParameter("num");
		String infotitle=req.getParameter("infotitle");
		String infocontent=req.getParameter("infocontent");
		String admin=null;
		int infonum=0;	
		if(num!=null && num.equals("")) {
			infonum=Integer.parseInt("num");
		}
		InfoDao dao=new InfoDao();
		InfoVo vo=new InfoVo(infonum,infotitle,infocontent,admin);
		int n=dao.insert(vo);
		if(n>0) {
			req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
		}
		req.getRequestDispatcher("/SH.info/inforesult.jsp").forward(req, resp);
	}
}
