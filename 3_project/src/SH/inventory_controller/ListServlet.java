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
		String spageNum=req.getParameter("pageNum");
		int jnum=Integer.parseInt(req.getParameter("jnum"));
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int endRow=pageNum*6;
		int startRow=endRow-5;
		InventoryDao dao=new InventoryDao();
		ArrayList<InventoryVo> list=dao.list(startRow, endRow, jnum);	
		int pageCount=(int)Math.ceil(dao.getCount()/6.0);
		//시작페이지 번호
		int startPageNum=((pageNum-1)/10*10)+1;
		//끝페이지 번호
		int endPageNum=startPageNum+3;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("jnum", jnum);
		switch(jnum) {
		case(100) : req.getRequestDispatcher("/SH.inventory/earring.jsp").forward(req, resp); break;
		case(200) : req.getRequestDispatcher("/SH.inventory/neck.jsp").forward(req, resp); break;
		case(300) : req.getRequestDispatcher("/SH.inventory/watch.jsp").forward(req, resp); break;
		case(400) : req.getRequestDispatcher("/SH.inventory/brace.jsp").forward(req, resp);  break;
		}
	}
}
