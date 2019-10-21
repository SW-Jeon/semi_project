package JB.Admin_Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KH.MEM_Vo.Mem_Vo;
import KH.Mem_Dao.Mem_Dao;

@WebServlet("/admin/member")
public class goManegeMember extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum*10)-9;
		int endRow=pageNum*10;
		Mem_Dao dao=Mem_Dao.getMem_Dao();
		ArrayList<Mem_Vo> list=dao.listAll(startRow, endRow);
		int pageCount=(int)Math.ceil(dao.getCount()/10.0);
		//시작페이지 번호
		int startPageNum=((pageNum-1)/5*5)+1;
		//끝 페이지 번호
		int endPageNum=startPageNum+4;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/myPage.jsp");
		req.setAttribute("myPageContent", "/junbin_admin/listMember.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}








