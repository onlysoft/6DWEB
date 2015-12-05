package cn.onlysoft.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.service.UserService;

public class ActiveServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String status=req.getParameter("status");
		UserService service=new UserService();
		boolean active=status.equals("1")?false:true;
		boolean b = service.activeUser(id,active);
		if(b)
		{
			resp.sendRedirect(req.getContextPath()+"/servlet/managerServlet");
		}else {
			req.setAttribute("error", "激活失败，请重试！");
			req.getRequestDispatcher("/userlist.jsp").forward(req, resp);
		}
	}
	
}
