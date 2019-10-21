package KH.MEM.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import KH.MEM_Vo.Mem_Vo;
import KH.Mem_Dao.Mem_Dao;

@WebServlet("/go/info")
public class Mem_GoSearch extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		Mem_Dao dao=Mem_Dao.getMem_Dao();
		Mem_Vo vo=dao.select(mid);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/myPage.jsp");
		req.setAttribute("myPageContent", "/KH.MEM/memInfo.jsp");
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}







