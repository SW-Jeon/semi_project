package SW.write_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SW_dao.WriteDao;
import SW_vo.WriteVo;

@WebServlet("/SW_write/Wrewst")
public class WriteRewstController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid=req.getParameter("mid");
		WriteDao dao=WriteDao.getInstance();
		WriteVo vo=dao.getInfo(mid);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/SW_write/W_Detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String rewrite=req.getParameter("rewrite");
		String rewst=req.getParameter("rewst");
		WriteDao dao=WriteDao.getInstance();
		dao.getInfo(mid);
		WriteVo vo=new WriteVo(0, mid, null, null, rewrite, rewst);
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
	}
}