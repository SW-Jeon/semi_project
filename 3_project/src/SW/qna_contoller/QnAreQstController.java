package SW.qna_contoller;

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
public class QnAreQstController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_pro/QnAdetail.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String qarecontent=req.getParameter("qarecontent");
		String reqst=req.getParameter("reqst");
		HttpSession session=req.getSession(); 
		String id=(String)session.getAttribute("adminid");
		if(id.equals("admin")) {
			QnAvo vo=new QnAvo(0, null, null, null, qarecontent, 0, reqst);
			QnAlistDao dao=QnAlistDao.getInstance();
			int n=dao.reDab(vo);
			if(n>0){
				req.setAttribute("msg", "success");
			}else {
				req.setAttribute("msg", "fail");
			}
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/SW_pro/result.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}else {
			resp.sendRedirect(req.getContextPath()+"/SW_pro/QnAlist.jsp");
		}
	}
}
