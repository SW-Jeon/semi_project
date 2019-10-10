package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/pro/home")
public class Homecontroller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String top=(String)req.getAttribute("top");
		String content=(String)req.getAttribute("content");
		String right=(String)req.getAttribute("right");
		String main=(String)req.getAttribute("main");
		String bottom=(String)req.getAttribute("bottom");
		if(top==null) {
			top="/pro/header.jsp";
		}
		if(content==null) {
			content="/pro/home.jsp";
		}
		if(main==null) {
			main="/pro/home.jsp";
		}
		if(right==null) {
			right="/pro/right.jsp";
		}
		if(bottom==null) {
			bottom="/pro/footer.jsp";
		}
		req.setAttribute("top", top);
		req.setAttribute("content", content);
		req.setAttribute("right", right);
		req.setAttribute("main", main);
		req.setAttribute("bottom", bottom);
		getServletContext().setAttribute("cp", req.getContextPath());
		req.getRequestDispatcher("/pro/index.jsp").forward(req, resp);
	}
}
