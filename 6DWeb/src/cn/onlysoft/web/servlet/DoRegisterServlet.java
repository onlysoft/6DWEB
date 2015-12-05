package cn.onlysoft.web.servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.entity.User;
import cn.onlysoft.web.service.UserService;

public class DoRegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userName = req.getParameter("username");
		String password = req.getParameter("password");
		UserService userService=new UserService();
		User user=new User();
		user.setId(UUID.randomUUID().toString());
		user.setName(userName);
		user.setPassword(password);
		if("admin".equals(userName))
		{
			user.setIsactive(true);
		}
		boolean b = userService.register(user);
		if(b)
		{
			req.setAttribute("name", userName);
			getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
		}else {
			String error = userService.getError();
			req.setAttribute("error", error);
			req.setAttribute("name", userName);
			getServletContext().getRequestDispatcher("/register.jsp").forward(req, resp);
		}
	}

	private  String Md5(String plainText ) { 
		String result=null;
		try { 
		MessageDigest md = MessageDigest.getInstance("MD5"); 
		md.update(plainText.getBytes()); 
		byte b[] = md.digest(); 

		int i; 

		StringBuffer buf = new StringBuffer(""); 
		for (int offset = 0; offset < b.length; offset++) { 
		i = b[offset]; 
		if(i<0) i+= 256; 
		if(i<16) 
		buf.append("0"); 
		buf.append(Integer.toHexString(i)); 
		} 
		result = buf.toString();
		} catch (NoSuchAlgorithmException e) { 
		// TODO Auto-generated catch block 
		e.printStackTrace(); 
		} 
		return result;
		}
	}

