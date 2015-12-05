<%@page import="cn.onlysoft.web.service.ExcelUploadService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%
	String basePath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.min.css" />
<title>6dWeb上传文件</title>
<%
	ExcelUploadService service = new ExcelUploadService();
	String version = service.getVersionCode();
	if (version == null) {
		version = "1";
	} else {
		version = (Integer.valueOf(version) + 1) + "";
	}
%>
<SCRIPT LANGUAGE="JavaScript">
	function check() {
		var type = uploadform.excelpath.value.match(/^(.*)(\.)(.{1,8})$/)[3];
		type = type.toUpperCase();
		if (type == "XLS" || type == "XLSX") {
			return true;
		}

		else {
			alert("上传类型有误");
			return false;
		}
	}
</script>
</head>
<body style="text-align: center">
	<%
		Object uobj = request.getSession().getAttribute("name");
		String username = "";
		if (uobj == null) {
			Object userob = request.getAttribute("name");
			if (userob == null) {
				response.sendRedirect(basePath + "/index.jsp");
			} else {
				username = userob.toString();
			}

		} else {
			username = uobj.toString();
		}
	%>
	<h1>
		welcome
		<%=username%></h1>
	<div>
		<a href="<%=basePath%>/welcome.jsp" class="btn btn-success">主页</a> <a
			href="${pageContext.request.contextPath }/servlet/logout"
			class="btn btn-success">注销</a>
	</div>
	<hr />
	<form name="uploadform" method="post"
		action="${pageContext.request.contextPath}/servlet/uploadServlet"
		enctype="multipart/form-data" onsubmit="return(check())"
		class="form-horizontal" role="form">
		<p class="help-block">6DWeb文件上传管理.</p>
		<table border="1" width="500px" class="table table-bordered">
			<tr>
				<td>版本号</td>
				<td><input type="text" name="versionCode" value=<%=version%>
					readonly /></td>
			</tr>
			<tr>
				<td>上传文件</td>
				<td><input type="file" name="excelpath" id="exampleInputFile" /></td>
			</tr>

			<tr>
				<td>更新描述</td>
				<td><input type="text" name="descption" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="上传" /></td>
			</tr>
		</table>
	</form>
</body>
</html>