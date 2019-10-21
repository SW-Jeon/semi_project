package JB.Purchase_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JB.dao.PurchaseDao;
@WebServlet("/user/updateOk")
public class UpdateOkStatus extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		int purnum=Integer.parseInt(req.getParameter("purnum"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		PurchaseDao dao=PurchaseDao.getPurchasedao();
		dao.updateOk(purnum, mid);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/my/allbuy").forward(req, resp);
	}
}









