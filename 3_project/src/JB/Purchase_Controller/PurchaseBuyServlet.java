package JB.Purchase_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JB.Purchase_vo.PurchaseVo;
import JB.dao.PurchaseDao;
import SH.Inventory_Dao.InventoryDao;

@WebServlet("/purchase/buy")
public class PurchaseBuyServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid"); //세션에 저장된 유저아이디
		int ordernum=Integer.parseInt(req.getParameter("ordernum"));
		int pursumprice=Integer.parseInt(req.getParameter("pursumprice"));
		int puramount=Integer.parseInt(req.getParameter("puramount"));
		String puraddr=req.getParameter("puraddr");
		String purway=req.getParameter("purway");
		String goCode=req.getParameter("goCode"); //물품코드 받음
		String purstatus="결제완료";
		PurchaseVo vo=new PurchaseVo(0, ordernum, mid, pursumprice, purway, null, puramount, purstatus, puraddr);
		PurchaseDao dao=PurchaseDao.getPurchasedao();
		InventoryDao idao=new InventoryDao();
		int n=dao.insert(vo);
		int n1=idao.update(puramount, goCode);
		if(n>0 && n1>0) {
			req.setAttribute("code", "success");
		}else {
			req.setAttribute("code", "fail");
		}
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/watingBuy.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}

