package cn.onlysoft.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.entity.ExcelBean;
import cn.onlysoft.web.service.ExcelUploadService;

public class GetUpdateServlet extends HttpServlet {
	ExcelUploadService service=new ExcelUploadService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExcelBean bean = service.getLastestVersion();
		bean.setExcelpath(req.getContextPath()+bean.getExcelpath());
		resp.getWriter().write(bean.toString());
	}
	
}
