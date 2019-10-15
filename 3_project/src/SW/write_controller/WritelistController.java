package SW.write_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SW_dao.WriteDao;
import SW_vo.WriteVo;

@WebServlet("/SW_write/Wlist")
public class WritelistController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum=req.getParameter("pageNum");	
		String field=req.getParameter("field");
		String keyword=req.getParameter("keyword");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		//글은 10개씩
		int endRow=pageNum*10;
		int startRow=endRow-9;
		WriteDao dao=WriteDao.getInstance();
		ArrayList<WriteVo> list=dao.Wlist(startRow, endRow, field, keyword);
		int pageCount=(int)Math.ceil(dao.getCount(field, keyword)/10.0);		//전체페이지
		int startPageNum=((pageNum-1)/10*10)+1;		//시작페이지
		
		int endPageNum=startPageNum+9;	//끝 페이지
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main", "/SW_write/Wlist.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}


