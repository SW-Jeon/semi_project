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

@WebServlet("/SW_write/writeupdate")
public class WriteUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int writenum=Integer.parseInt(req.getParameter("writenum"));
		WriteDao dao=WriteDao.getInstance();
		WriteVo vo=dao.getInfo(writenum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/SW_write/W_Update.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String mid=req.getParameter("mid");
		String title=req.getParameter("title");
		String writecontent=req.getParameter("writecontent");
		String rewrite=req.getParameter("rewrite");
		String rewst=req.getParameter("rewst");
		
		HttpSession session=req.getSession(); 
		String gocode=(String)session.getAttribute("gocode");
		
		WriteVo vo=new WriteVo(0, mid, gocode, title, writecontent, rewrite, rewst);
		WriteDao dao=WriteDao.getInstance();
		int n=dao.update(vo);
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