<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	href="<%=basePath%>/css/login.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript">
	function uploadFile() {
		window.location.href="<%=basePath%>/uploadFile.jsp";
	}
</script>
<title>6DWeb上传文件列表</title>
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
	<p>
		<button name="userManager" id="userManager" onclick="uploadFile()">上传文件</button>
	</p>
	<hr />
	<p>
		<font color="red" style=""><b> ${error }</b></font>
	</p>
	<p class="help-block">6DWeb上传文件管理</p>
	<table border="1" width="700px" class="table table-bordered">
		<tr>
			<td>名称</td>
			<td>版本号</td>
			<td>描述</td>
			<td>路径</td>
			<td>操作</td>
		</tr>
		<c:forEach var="bean" items="${excelBeans }">
			<tr>
				<%-- 判断够不够10个，不够10个，直接显示，够10个显示前面10个加。。。 --%>
				<td>${fn:substring(bean.fileName, 0, 10)}${fn:length(bean.fileName)>10? '...': '' }</td>
				<td>${bean.versionCode }</td>
				<td>${bean.descption }</td>
				<td>${bean.excelpath }</td>
				<td><a
					href="${pageContext.request.contextPath }/servlet/deleteServlet?id=${bean.id }">删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>