package SW.qna_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.QnAlistDao;
import SW_vo.QnAvo;

@WebServlet("/SW_pro/update")
public class QnAupdateController  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qanum=Integer.parseInt(req.getParameter("qanum"));
		QnAlistDao dao=QnAlistDao.getInstance();
		QnAvo vo=dao.getInfo(qanum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/SW_pro/Q_Update.jsp").forward(req, resp);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main","/SW_pro/Q_Update.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String qacontent=req.getParameter("qacontent");
		String qaname=req.getParameter("qaname");
		String qapwd=req.getParameter("qapwd");
		QnAvo vo=new QnAvo(0, qacontent, qaname, qapwd, null, 0, null);
		QnAlistDao dao=QnAlistDao.getInstance();
		int n=dao.update(vo);
		if(n>0){
			resp.sendRedirect(req.getContextPath()+"/SW_pro/QnAdetail");
		}else {
			req.setAttribute("msg", "fail");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/SW_pro/result.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}
	}
}
