<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%
	String basePath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/login.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript">
	function getUpdate() {
		window.location.href="<%=basePath%>/servlet/updateServlet";
	}
	function fileManager() {
		window.location.href="<%=basePath%>/servlet/ListServlet";
	}
	function userManager() {
		window.location.href="<%=basePath%>/servlet/managerServlet";
	}
</script>
<title>6DWeb功能页</title>
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
	<a href="<%=basePath%>/servlet/logout" class="btn btn-success">注销</a>
	<hr />
	<p>
		<button name="userManager" id="userManager" onclick="userManager()" class="btn btn-primary btn-lg btn-block">用户授权管理</button>
		<button name="getUpdate" id="getUpdate" onclick="getUpdate()" class="btn btn-success btn-lg btn-block">获取最新</button>
		<button name="uploadFile" id="uploadFile" onclick="fileManager()" class="btn btn-info btn-lg btn-block">文件管理</button>
	</p>
</body>
</html>