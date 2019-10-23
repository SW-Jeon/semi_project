package SH.inventory_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;


@WebServlet("/inventory/list")
public class ListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum=req.getParameter("pageNum");
		int jnum=Integer.parseInt(req.getParameter("jnum"));
		int level=Integer.parseInt(req.getParameter("level"));
		int pageNum=1;
		String keyword=null;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int endRow=pageNum*6;
		int startRow=endRow-5;
		InventoryDao dao=new InventoryDao();
		ArrayList<InventoryVo> list=dao.list(startRow, endRow, jnum,level);	
		int pageCount=(int)Math.ceil(dao.getCount(jnum, keyword, level)/6.0);
		//시작페이지 번호
		int startPageNum=((pageNum-1)/4*4)+1;
		//끝페이지 번호
		int endPageNum=startPageNum+3;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		System.out.println("pageNum:"+pageNum);
		System.out.println("pageCount:"+pageCount);
		System.out.println("startPageNum:"+startPageNum);
		System.out.println("endPageNum:"+endPageNum);
		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("jnum", jnum);
		req.setAttribute("level", level);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		switch(jnum) {
		case(100) : req.setAttribute("main", "/SH.inventory/earring.jsp"); break;
		case(200) : req.setAttribute("main","/SH.inventory/neck.jsp"); break;
		case(300) : req.setAttribute("main","/SH.inventory/watch.jsp"); break;
		case(400) : req.setAttribute("main","/SH.inventory/brace.jsp");  break;
		}
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}
