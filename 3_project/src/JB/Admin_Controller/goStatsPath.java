package JB.Admin_Controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JB.Purchase_vo.PurchaseVo;
import JB.dao.PurchaseAdDao;
import JB.dao.PurchaseDao;

@WebServlet("/admin/stats")
public class goStatsPath extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH)+1;
		int day=cal.get(Calendar.DAY_OF_MONTH);
		String comeDay=req.getParameter("cday");
		if(comeDay!=null) {
			day=Integer.parseInt(comeDay);
		}
		String extraMonth=req.getParameter("selectMonth");
		int selectMonth=month; //현재 달로 초기화
		if(extraMonth!=null) {
			selectMonth=Integer.parseInt(extraMonth);
		}
		
		PurchaseDao pdao=PurchaseDao.getPurchasedao();
		PurchaseAdDao adao=PurchaseAdDao.getInstance();
		ArrayList<PurchaseVo> list=pdao.ListMonth(selectMonth); //해당되는 월 결제정보들을 담아줌
		int dayAll=adao.sumPriceDay(day); //일자 전체 매출액
		int monthAll=adao.sumPriceMonth(selectMonth); //선택한 월에 대한 전체 매출액
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		req.setAttribute("dc", dc);
		req.setAttribute("list", list);
		req.setAttribute("year", year);
		req.setAttribute("month", month);
		req.setAttribute("day", day);
		req.setAttribute("dayAll", dayAll);
		req.setAttribute("monthAll", monthAll);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/myPage.jsp");
		req.setAttribute("myPageContent", "/junbin_admin/listStat.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}






