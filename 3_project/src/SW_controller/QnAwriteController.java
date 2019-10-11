package SW_controller;

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
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qaContent=req.getParameter("qaContent");
		String qaName=req.getParameter("qaName");
		String qaPwd=req.getParameter("qaPwd");
		QnAvo vo=new QnAvo(0, qaContent, qaName, qaPwd, null, 0, null);
		QnAlistDao dao=QnAlistDao.getInstance();
		int n=dao.insert(vo);
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


