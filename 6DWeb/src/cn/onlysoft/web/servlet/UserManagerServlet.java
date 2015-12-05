package cn.onlysoft.web.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.entity.User;
import cn.onlysoft.web.service.UserService;

public class UserManagerServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService service=new UserService();
		List<User> users = service.getAllUser();
		Iterator<User> iterator = users.iterator();
		while(iterator.hasNext())
		{
			User user=iterator.next();
			if(user.getName().equals("admin"))
			{
				iterator.remove();
				break;
			}
		}
		req.setAttribute("users", users);
		req.getRequestDispatcher("/userlist.jsp").forward(req, resp);
	}
	
}
