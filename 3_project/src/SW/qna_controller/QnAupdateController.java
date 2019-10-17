package SW.qna_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.QnAlistDao;
import SW_vo.QnAvo;

@WebServlet("/SW_pro/Qupdate")
public class QnAupdateController  extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qanum=Integer.parseInt(req.getParameter("qanum"));
		QnAlistDao dao=QnAlistDao.getInstance();
		QnAvo vo=dao.getInfo(qanum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/SW_pro/Q_Update.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String qacontent=req.getParameter("qacontent");
		String qaname=req.getParameter("qaname");
		String qapwd=req.getParameter("qapwd");
		String qarecontent =req.getParameter("qarecontent");
		int qahit =Integer.parseInt(req.getParameter("qahit"));
		String reqst =req.getParameter("reqst");
		QnAvo vo=new QnAvo(0, qacontent, qaname, qapwd, qarecontent, qahit, reqst);
		QnAlistDao dao=QnAlistDao.getInstance();
		int n=dao.update(vo);
		if(n>0){
			req.setAttribute("msg", "success");
		}else {
			req.setAttribute("msg", "fail");
		}
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main","/SW_pro/result.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}
