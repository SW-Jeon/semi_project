package SW.qna_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.QnAlistDao;
import SW_vo.QnAvo;

@WebServlet("/SW_pro/QnAdetail")
public  class QnAdetailController extends HttpServlet {
			@Override
			protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				req.setCharacterEncoding("utf-8");
				int qanum=Integer.parseInt(req.getParameter("qanum"));
				QnAlistDao dao=QnAlistDao.getInstance();
				dao.addHit(qanum); 	//업데이트 하면서 조회수 +1씩 증가
				QnAvo vo=dao.detail(qanum);
				req.setAttribute("vo", vo);
				req.setAttribute("top", "/pro/header.jsp");
				req.setAttribute("main",	"/SW_pro/QnAdetail.jsp");
				req.setAttribute("bottom", "/pro/footer.jsp");
				req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
			}	
}