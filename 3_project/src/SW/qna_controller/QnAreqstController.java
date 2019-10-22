package SW.qna_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SW_dao.QnAlistDao;
import SW_vo.QnAvo;

@WebServlet("/SW_pro/QnAreqst")
public class QnAreqstController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qanum=Integer.parseInt(req.getParameter("qanum"));
		QnAlistDao dao=QnAlistDao.getInstance();
		QnAvo vo=dao.getInfo(qanum);
		req.setAttribute("vo", vo);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_pro/QnAdetail.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int qanum=Integer.parseInt(req.getParameter("qanum"));
		String qarecontent=req.getParameter("qarecontent");
		String reqst =req.getParameter("reqst");

		QnAlistDao dao=QnAlistDao.getInstance();
		QnAvo vo=new QnAvo(qanum, null, null, null, qarecontent, 0, reqst);
		int n=dao.reDab(vo);
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
