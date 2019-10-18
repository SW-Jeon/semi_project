package JB.AllBuy_Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JB.Purchase_vo.PurchaseVo;
import JB.dao.PurchaseDao;
@WebServlet("/my/allbuy")
public class listAllbuyServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum*10)-9;
		int endRow=pageNum*10;
		PurchaseDao dao=PurchaseDao.getPurchasedao();
		ArrayList<PurchaseVo> list=dao.buyList(startRow, endRow, mid);
		//전체페이지 갯수 구하기
		int pageCount=(int)Math.ceil(dao.getCount(mid)/10.0);
		//시작페이지 번호
		int startPageNum=((pageNum-1)/10*10)+1;
		//끝 페이지 번호
		int endPageNum=startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
		}
		System.out.println(endRow);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/myPage.jsp");
		req.setAttribute("myPageContent", "/junbin/listUserBuy.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);	
	}
}








