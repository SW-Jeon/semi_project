package SW_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.QnAlistDao;

@WebServlet("/SW_pro/Delete")
public class DeleteControllor extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qaNum=Integer.parseInt(req.getParameter("qaNum"));
		req.setAttribute("qaNum", qaNum);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_pro/delete.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int qaNum=Integer.parseInt(req.getParameter("qaNum"));
		String qaPwd=req.getParameter("qaPwd");
		
		QnAlistDao dao=QnAlistDao.getInstance();
		int n=dao.delete(qaNum, qaPwd);
		if(n>0) {
			req.setAttribute("msg","success");
		}else {
			req.setAttribute("msg","fail");
		}
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("content","/SW_pro/result.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}

