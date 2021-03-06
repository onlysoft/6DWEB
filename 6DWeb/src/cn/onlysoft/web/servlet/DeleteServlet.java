package cn.onlysoft.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.service.ExcelUploadService;

public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		ExcelUploadService service=new ExcelUploadService();
		boolean b = service.deleteFile(id);
		if(b)
		{
			req.setAttribute("error", "文件删除成功");
			req.getRequestDispatcher("/servlet/ListServlet").forward(req, resp);
		}else {
			req.setAttribute("error", "文件删除失败");
			req.getRequestDispatcher("/servlet/ListServlet").forward(req, resp);
		}
	}
	
}
