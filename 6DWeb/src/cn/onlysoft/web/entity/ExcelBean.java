package cn.onlysoft.web.entity;

import com.google.gson.Gson;

public class ExcelBean {
	private String id; 
	private String fileName;
	private String versionCode;
	private String descption;
	private String excelpath;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getVersionCode() {
		return versionCode;
	}
	public void setVersionCode(String versionCode) {
		this.versionCode = versionCode;
	}
	
	public String getDescption() {
		return descption;
	}
	public void setDescption(String descption) {
		this.descption = descption;
	}
	public String getExcelpath() {
		return excelpath;
	}
	public void setExcelpath(String excelpath) {
		this.excelpath = excelpath;
	}
	@Override
	public String toString() {
		Gson gson=new Gson();
		String json = gson.toJson(this);
//		StringBuilder sBuilder=new StringBuilder();
//		sBuilder.append("{");
//		sBuilder.append("fileName:");
//		sBuilder.append(this.fileName);
//		sBuilder.append(",");
//		sBuilder.append("versionCode:");
//		sBuilder.append(this.versionCode);
//		sBuilder.append(",");
//		sBuilder.append("descption:");
//		sBuilder.append(this.descption);
//		sBuilder.append(",");
//		sBuilder.append("excelpath:");
//		sBuilder.append(this.excelpath);
//		sBuilder.append("}");
		return json;
	}
	
	
}
