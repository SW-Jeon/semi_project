package SH.inventory_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/go/serch")
public class GoSerchListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int level=Integer.parseInt(req.getParameter("level"));
		req.setAttribute("level", level);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/SH.inventory/serch.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}
