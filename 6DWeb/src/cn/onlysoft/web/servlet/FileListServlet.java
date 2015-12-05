package cn.onlysoft.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.onlysoft.web.entity.ExcelBean;
import cn.onlysoft.web.service.ExcelUploadService;

public class FileListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ExcelUploadService service=new ExcelUploadService();
		List<ExcelBean> allExcel = service.getAllExcel();
		req.setAttribute("excelBeans", allExcel);
		req.getRequestDispatcher("/fileList.jsp").forward(req, resp);
	}
	
}
