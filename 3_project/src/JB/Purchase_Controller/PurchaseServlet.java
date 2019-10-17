package JB.Purchase_Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/purchase/insert")
public class PurchaseServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String ordernum=req.getParameter("ordernum");
		String msg=req.getParameter("msg"); //배송메시지
		String buyway=req.getParameter("buyway"); // 결제방식(카드,무통장입금)
		String hal=req.getParameter("hal"); //카드 할부 정보
		String bank=req.getParameter("bank"); //무통장입금 은행정보
		String cardname=req.getParameter("cardname"); //선택한 카드이름
		String orderprice=req.getParameter("orderprice"); //천단위 안붙은 결제가격
		String goName=req.getParameter("goName");//물품명 이름
		if(hal!=null && cardname!=null) {
			req.setAttribute("hal", hal);
			req.setAttribute("cardname", cardname);
		}
		req.setAttribute("bank", bank);
		String name=req.getParameter("name");//악세사리 종류(이미지 나타내기 위한 파일폴더명)
		String goImg=req.getParameter("goImg");//이미지명 받음
		String orderamount=req.getParameter("orderamount");//주문수량 받음
		String allamount=req.getParameter("allamount"); //천단위 콤마붙은 가격 문자열값 받음
		//아래 추가작업
		//기훈이가 작업한 memvo에서 getInfo를 requestScope에 담아야함..
		//기훈이 dao도 반영해야함..
		//ex) MemDao dao=MemDao.getMemDao();
		//MemVo mvo=dao.getInfo(mid); --> mid 에 해당하는 회원의 정보를 담은 vo 필요
		//req.setAttribute("mvo",mvo);
		req.setAttribute("ordernum", ordernum); //주문번호 보냄
		req.setAttribute("msg", msg);
		req.setAttribute("buyway", buyway);
		req.setAttribute("name", name);
		req.setAttribute("goImg", goImg);
		req.setAttribute("orderamount", orderamount);
		req.setAttribute("orderprice", orderprice);
		req.setAttribute("allamount", allamount);
		req.setAttribute("goName", goName);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.setAttribute("main", "/junbin/purchase.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
}
