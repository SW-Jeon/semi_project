package SW.qna_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.QnAlistDao;
import SW_vo.QnAvo;

@WebServlet("/SW_pro/QnAwrite")
public class QnAwriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_pro/QnAwrite.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String qacontent=req.getParameter("qacontent");
		String qaname=req.getParameter("qaname");
		String qapwd=req.getParameter("qapwd");
		int qahit=Integer.parseInt(req.getParameter("qahit"));
		String reqst="대기중";
		QnAvo vo=new QnAvo(0, qacontent, qaname, qapwd, null, qahit, reqst);
		QnAlistDao dao=QnAlistDao.getInstance();
		int n=dao.insert(vo);
		if(n>0){
			resp.sendRedirect(req.getContextPath()+"/SW_pro/QnAlist");
		}else {
			req.setAttribute("msg", "fail");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/SW_pro/result.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}	
	}
}


