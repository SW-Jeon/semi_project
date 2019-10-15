package SW.write_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.WriteDao;

@WebServlet("/SW_write/delete")
public class WriteDeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int writenum=Integer.parseInt(req.getParameter("writenum"));
		String mid=req.getParameter("mId");
		WriteDao dao=WriteDao.getInstance();
		int n=dao.delete(writenum, mid);

		if(n>0) {
			resp.sendRedirect(req.getContextPath() +"/SW_write/Wlist");
		}else {
			req.setAttribute("msg","fail");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("content","/SW_pro/result.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}
	}
}