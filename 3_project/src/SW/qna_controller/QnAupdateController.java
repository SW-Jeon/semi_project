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
		String mid=req.getParameter("mid");
		String title=req.getParameter("title");
	}
}
