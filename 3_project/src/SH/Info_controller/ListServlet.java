package SH.Info_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Info_Dao.InfoDao;
import SH.Info_Vo.Info_Vo;


@WebServlet("/info/list")
public class ListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		InfoDao dao=new InfoDao();
		ArrayList<Info_Vo> list=dao.list();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/SH.info/infolist.jsp").forward(req, resp);
	}
}
