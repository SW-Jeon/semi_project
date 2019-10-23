package SH.inventory_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Inventory_Dao.InventoryDao;
@WebServlet("/delete/go")
public class DeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String gocode=req.getParameter("gocode");
		InventoryDao dao=new InventoryDao();
		int n=dao.delete(gocode);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/pro/home");
		}
	}
}
