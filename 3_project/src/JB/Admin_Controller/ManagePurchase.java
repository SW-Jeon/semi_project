package JB.Admin_Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JB.Purchase_vo.PurchaseVo;
import JB.dao.PurchaseAdDao;
import JB.dao.PurchaseDao;

@WebServlet("/admin/purchase")
public class ManagePurchase extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		String field=req.getParameter("field");
		String keyword=req.getParameter("keyword");
		System.out.println(field);
		System.out.println(keyword);
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum*10)-9;
		int endRow=pageNum*10;
		PurchaseDao pdao=PurchaseDao.getPurchasedao();
		PurchaseAdDao dao=PurchaseAdDao.getInstance();
		ArrayList<PurchaseVo> list=dao.searchList(startRow, endRow, field, keyword);
		int pageCount=(int)Math.ceil(pdao.getCount(field,keyword)/10.0);
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
		req.setAttribute("field", field);
		req.setAttribute("keyword", keyword);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/myPage.jsp");
		req.setAttribute("myPageContent", "/junbin_admin/listBuyAll.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}








