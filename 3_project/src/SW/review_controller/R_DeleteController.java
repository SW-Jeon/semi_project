package SW.review_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.AsWriteDao;

@WebServlet("/SW_review/Rdelete")
public class R_DeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int asnum=Integer.parseInt(req.getParameter("asnum"));
		AsWriteDao dao=AsWriteDao.getInstance();
		int n=dao.delete(asnum);
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
