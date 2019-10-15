package JB.Demand_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import JB.Demand_vo.DemandVo;
import JB.dao.DemandDao;

@WebServlet("/demand/insert")
public class JB_InsertServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(); 
		String mid=(String)session.getAttribute("mid");
		if(mid==null) { //session에 id가 없다면(비로그인 상태이면) main으로 이동함
			resp.sendRedirect(req.getContextPath() + "/pro/home");
		}
		String goCode=req.getParameter("getCode"); //상품코드 받음
		String goName=req.getParameter("goName"); //상품명 받음
		String goImg=req.getParameter("goImg"); //물품 이미지명 받음
		int jNum=Integer.parseInt(req.getParameter("jNum")); //물품코드명 받음
		int orderAmount=Integer.parseInt(req.getParameter("orderAmount")); //수량 받음
		int goPrice=Integer.parseInt(req.getParameter("goPrice")); //1개 가격 받음
		int orderPrice=goPrice * orderAmount; //총주문가격 계산
		
		DemandDao dao=DemandDao.getDemandDao();
		DemandVo vo=new DemandVo(0, mid, goCode, orderAmount, orderPrice);
		//아래 추가작업
		//기훈이가 작업한 memvo에서 getInfo를 requestScope에 담아야함..
		//기훈이 dao도 반영해야함..
		//ex) MemDao dao=MemDao.getMemDao();
		//MemVo mvo=dao.getInfo(mid); --> mid 에 해당하는 회원의 정보를 담은 vo 필요
		//req.setAttribute("mvo",mvo);
		
		
		
		int n=dao.insert(vo); //DB에 추가
		if(n>0) {
			//req.setAttribute("mvo",mvo);
			req.setAttribute("vo", vo);
			req.setAttribute("goName", goName);
			req.setAttribute("goImg", goImg);
			req.setAttribute("jNum", jNum);
			req.setAttribute("goPrice", goPrice);
			req.getRequestDispatcher("/junbin/demand.jsp").forward(req, resp);
		}else {
			//물품리스트 페이지로 돌아가기
			req.setAttribute("jNum", jNum);
			req.getRequestDispatcher("/junbin/backpage.jsp").forward(req, resp);
		}
	}
}




