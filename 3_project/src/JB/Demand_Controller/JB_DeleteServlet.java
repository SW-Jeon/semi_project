package JB.Demand_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JB.dao.DemandDao;
@WebServlet("/demand/delete")
public class JB_DeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int ordernum=Integer.parseInt(req.getParameter("ordernum")); //주문번호 받음
		String jNum=req.getParameter("jNum"); //물품코드 받음
		DemandDao dao=DemandDao.getDemandDao();
		int n=dao.delete(ordernum); //주문 테이블에서 내역 삭제함
		if(n>0) {
			req.setAttribute("jNum", jNum);
			req.getRequestDispatcher("/junbin/backpage.jsp").forward(req, resp);
		}else {
			req.setAttribute("code", "fail");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("content", "/junbin/buyresult.jsp");
			req.setAttribute("right", "/pro/right.jsp");
			req.setAttribute("main", "/pro/home.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
		}
	}
}



