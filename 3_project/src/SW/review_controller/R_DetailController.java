package SW.review_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.AsWriteDao;
import SW_vo.AsWriteVo;

@WebServlet("/SW_review/Rdetail")
public class R_DetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int asnum=Integer.parseInt(req.getParameter("asnum"));
		AsWriteDao dao=AsWriteDao.getInstance();
		AsWriteVo vo=dao.detail(asnum);
		dao.addHit(asnum); 	//업데이트 하면서 조회수 +1씩 증가
		req.setAttribute("vo", vo);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_review/R_Detail.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}	
}