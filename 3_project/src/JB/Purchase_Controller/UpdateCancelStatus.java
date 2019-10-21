package JB.Purchase_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JB.dao.PurchaseDao;

@WebServlet("/user/updateCancel")
public class UpdateCancelStatus extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		int purnum=Integer.parseInt(req.getParameter("purnum"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		int puramount=Integer.parseInt(req.getParameter("puramount"));
		String gocode=req.getParameter("gocode");
		PurchaseDao dao=PurchaseDao.getPurchasedao();
		dao.updateCancel(purnum, mid); //구매취소 수정함
		dao.backInven(gocode, puramount);//인벤토리 테이블에 수량복구함
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/my/allbuy").forward(req, resp);
	}
}








