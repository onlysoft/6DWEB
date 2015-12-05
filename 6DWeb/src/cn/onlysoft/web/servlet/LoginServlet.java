package cn.onlysoft.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.entity.User;
import cn.onlysoft.web.service.UserService;
import cn.onlysoft.web.utils.Md5Utils;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		String remeber=req.getParameter("remember");
		if("on".equals(remeber))
		{
			
		}
		if(password==null)
		{
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
			return;
		}
		password=Md5Utils.encrypt(password);
		UserService service=new UserService();
		User user = service.login(userName, password);
		if(user!=null)
		{
			if(user.isIsactive())
			{
				req.getSession().setAttribute("name", userName);
				req.setAttribute("name", userName);
				getServletContext().getRequestDispatcher("/welcome.jsp").forward(req, resp);
			}
			else
			{
				 req.setAttribute("error", "请联系管理员激活帐号!");
				 req.setAttribute("name", userName);
				 getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
			}
		}else {
			 	req.setAttribute("error", "用户名或密码错误");
			 	req.setAttribute("name", userName);
				getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);

		}
	}

}
