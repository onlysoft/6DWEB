<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String basePath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>6D用户授权管理</title>
</head>
<body style="text-align: center">
	<%
		Object uobj = request.getSession().getAttribute("name");
		String username = "";
		if (uobj == null) {
			Object userob = request.getAttribute("name");
			if (userob == null) {
				response.sendRedirect("${pageContext.request.contextPath }/index.jsp");
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
		<a href="<%=basePath%>/welcome.jsp" class="btn btn-success">主页</a>
	<a href="${pageContext.request.contextPath }/servlet/logout" class="btn btn-success">注销</a>
		</div>
	
	<hr />
	<p>
		<font color="red" style=""><b> ${error }</b></font>
	</p>
	<p class="help-block">6DWeb用户管理.</p>
	<table border="1" width="700px" class="table table-bordered">
		<tr>
			<td>用户名</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<c:forEach var="bean" items="${users }">
			<tr>
				<%-- 判断够不够10个，不够10个，直接显示，够10个显示前面10个加。。。 --%>
				<td>${fn:substring(bean.name, 0, 10)}${fn:length(bean.name)>10? '...': '' }</td>
				<td>${bean.isactive?'激活': '未激活' }</td>
				<td><a
					href="${pageContext.request.contextPath }/servlet/activeServlet?id=${bean.id }&status=${bean.isactive?'1':'0'}">${bean.isactive?'禁用账号': '现在激活' }</a>&nbsp&nbsp&nbsp
					<a
					href="${pageContext.request.contextPath }/servlet/passwordServlet?id=${bean.id }">密码重置</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>