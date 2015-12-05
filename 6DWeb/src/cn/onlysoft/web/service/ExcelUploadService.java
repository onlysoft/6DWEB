package cn.onlysoft.web.service;


import java.util.List;

import cn.onlysoft.web.dao.UploadFileRecordDao;
import cn.onlysoft.web.entity.ExcelBean;

public class ExcelUploadService {
	UploadFileRecordDao dao=new UploadFileRecordDao();
	public boolean uploadExcel(ExcelBean bean){
		int num = dao.addFileRecord(bean);
		if(num>0)
		{
			return true;
		}
		return false;
	}
	public String getVersionCode(){
		String maxVersion=null;
		ExcelBean excelBean = dao.queryVersion();
		if(excelBean!=null)
		{
			maxVersion=excelBean.getVersionCode();
		}
		return maxVersion;
	}
	public List<ExcelBean> getAllExcel()
	{
		List<ExcelBean> excelBeans=null;
		excelBeans=dao.queryAll();
		return excelBeans;
	}
	public ExcelBean getLastestVersion()
	{
		ExcelBean bean=null;
		bean=dao.queryVersion();
		return bean;
	}
	
	public boolean deleteFile(String id)
	{
		boolean b=false;
		int num=dao.delete(id);
		if(num>0)
		{
			b=true;
		}
		return b;
	}
}
