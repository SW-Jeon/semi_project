package SW.qna_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.QnAlistDao;

@WebServlet("/SW_pro/delete")
public class QnAdeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qanum=Integer.parseInt(req.getParameter("qanum"));
		req.setAttribute("qanum",qanum);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("content","/SW_pro/delete.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int qanum=Integer.parseInt(req.getParameter("qanum"));
		String qapwd=req.getParameter("qapwd");
		QnAlistDao dao=QnAlistDao.getInstance();
		int n=dao.delete(qanum, qapwd);	  //QnA리스트에서 내역삭제
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/SW_pro/QnAlist");
		}else {
			req.setAttribute("msg","fail");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("content","/SW_pro/resulte.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}
	}
}