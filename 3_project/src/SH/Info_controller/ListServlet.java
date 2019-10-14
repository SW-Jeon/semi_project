package SH.Info_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Info_Dao.InfoDao;
import SH.Info_Vo.InfoVo;

@WebServlet("/info/list")
public class ListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		InfoDao dao=new InfoDao();
		ArrayList<InfoVo> list=dao.list();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/SH.info/infolist.jsp").forward(req, resp);
	}
}