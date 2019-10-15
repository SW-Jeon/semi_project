package SH.inventory_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;

@WebServlet("/inventory/detail")
public class DetailServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String gocode=req.getParameter("gocode");
		String name=req.getParameter("index");
		InventoryDao dao=new InventoryDao();
		InventoryVo vo=dao.detail(gocode);
		req.setAttribute("vo", vo);
		req.setAttribute("name", name);
		req.getRequestDispatcher("/SH.inventory/detail.jsp").forward(req, resp);
		
	}
}
