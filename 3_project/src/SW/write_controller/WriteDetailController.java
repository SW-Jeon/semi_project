package SW.write_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.WriteDao;
import SW_vo.WriteVo;

@WebServlet("/SW_write/writedetail")
public class WriteDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int writenum=Integer.parseInt(req.getParameter("writenum"));
		WriteDao dao=WriteDao.getInstance();
		WriteVo vo=dao.detail(writenum);
		req.setAttribute("vo", vo);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_write/W_List.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}	
}