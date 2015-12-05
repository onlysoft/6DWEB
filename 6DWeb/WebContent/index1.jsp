<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%
	String basePath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/login.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.min.css" />
<title>6D后台管理系统</title>
</head>
<body>
	<div class="wrapper">
		<%
			Object uObject = session.getAttribute("name");
			if (uObject != null) {
				String username = uObject.toString();
				if (username != null) {
					response.sendRedirect(basePath + "/welcome.jsp");
				}
			}
		%>
		<form action="<%=basePath%>/servlet/login" method="post">
			<div class="loginBox">
				<div class="loginBoxCenter">
					<p>
						<label for="username">用户名：</label>
					</p>
					<p>
						<input type="text" id="email" name="username" class="loginInput"
							autofocus="autofocus" required="required" autocomplete="on"
							placeholder="请输入用户名" value="${name }" />
					</p>
					<p>
						<label for="password">密码：</label><a class="forgetLink" href="#">忘记密码?</a>
					</p>
					<p>
						<input type="password" id="password" name="password"
							class="loginInput" required="required" placeholder="请输入密码"
							value="" />
					</p>

					<p>
						<label for="password"><a class="forgetLink"
							href="<%=basePath%>/register.jsp">没有账号，现在注册</a></label>
					</p>
					<p>
						<font color="red" style=""><b> ${error }</b></font>
					</p>
				</div>
				<div class="loginBoxButtons">
					<input id="remember" type="checkbox" name="remember" /> <label
						for="remember">记住登录状态</label>
					<button class="loginBtn">登录</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>