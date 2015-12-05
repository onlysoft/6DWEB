package cn.onlysoft.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.entity.ExcelBean;
import cn.onlysoft.web.service.ExcelUploadService;
import cn.onlysoft.web.utils.WebUtils;

public class UploadServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExcelBean bean = WebUtils.doUpload(req, ExcelBean.class);
		ExcelUploadService service=new ExcelUploadService();
		boolean b = service.uploadExcel(bean);
		if(b)
		{
			resp.sendRedirect(req.getContextPath()+"/servlet/ListServlet");
		}else {
			System.out.println("upload error");
		}
	}
	
}
