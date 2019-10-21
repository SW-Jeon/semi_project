package SW.review_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import JB.Purchase_vo.PurchaseVo;
import JB.dao.PurchaseDao;
import SH.Inventory_Dao.InventoryDao;
import SH.Inventory_Vo.InventoryVo;
import SW_dao.AsWriteDao;
import SW_vo.AsWriteVo;

@WebServlet("/SW_review/Rwrite")
public class R_WriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int purnum=Integer.parseInt(req.getParameter("purnum"));
		req.setAttribute("purnum", purnum);
		req.setAttribute("top", "/pro/header.jsp");
		req.setAttribute("main",	"/SW_review/R_Write.jsp");
		req.setAttribute("bottom", "/pro/footer.jsp");
		req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String path=getServletContext().getRealPath("/SW_review/upload");	//업로드할 디렉토리
		MultipartRequest mr=new MultipartRequest(  //인코딩 처리 객체
				req, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy()
		);
		String asimg=mr.getOriginalFileName("asimg1");
		System.out.println(asimg);
		String astitle=mr.getParameter("astitle");
		String ascontent=mr.getParameter("ascontent");
		String mid=mr.getParameter("mid");
		String gocode=mr.getParameter("gocode");
		
		int purnum=Integer.parseInt(mr.getParameter("purnum"));
		System.out.println(purnum);
		//참조키값들 조회
		InventoryDao dao1=new InventoryDao();
		InventoryVo ivo=dao1.getInfo(gocode);
		PurchaseDao dao2=PurchaseDao.getPurchasedao();
		PurchaseVo pvo=dao2.getInfo(purnum);
		
		System.out.println(gocode );
		//전송된 파일정보 DB에 저장하기
		AsWriteDao dao=AsWriteDao.getInstance();
		AsWriteVo vo=new AsWriteVo(0, asimg, astitle, ascontent, mid, gocode, purnum, 0);
		int n=dao.insert(vo);
		if(n>0){
			resp.sendRedirect(req.getContextPath()+"/SW_review/Rlist");
		}else {
			req.setAttribute("msg", "fail");
			req.setAttribute("top", "/pro/header.jsp");
			req.setAttribute("main","/SW_pro/result.jsp");
			req.setAttribute("bottom", "/pro/footer.jsp");
			req.getRequestDispatcher("/pro/product.jsp").forward(req, resp);
		}
		req.setAttribute("ivo", ivo);
		req.setAttribute("pvo", pvo);
	}
}
