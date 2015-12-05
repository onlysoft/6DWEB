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
<title>6Dweb注册页</title>
<script type="text/javascript">
	function verify() {
		var password = document.getElementById("password").value;
		var repete_password = document.getElementById("repete_password").value;
		if (password != repete_password) {
			alert("两次输入密码不相同，请检查后重新输入");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<div class="wrapper">
		<form action="<%=basePath%>/servlet/doRegister" method="post"
			onsubmit="return verify()">
			<div class="loginBox">
				<div class="loginBoxCenter">
					<p>
						<label for="username">用户名：</label>
					</p>
					<p>
						<input type="text" id="email" name="username" class="loginInput"
							autofocus="autofocus" required="required" autocomplete="on"
							placeholder="请输入用户名" value="${name}" />
					</p>
					<p>
						<label for="password">密码：</label>
					</p>
					<p>
						<input type="password" id="password" name="password"
							class="loginInput" required="required" placeholder="请输入密码"
							value="" />
					</p>
					<p>
						<label for="password">再次输入密码：</label>
					</p>
					<p>
						<input type="password" id="repete_password" name="repete_password"
							class="loginInput" required="required" placeholder="请再次输入密码"
							value="" />
					</p>
					<p>
						<font color="red" style=""><b> ${error }</b></font>
					</p>
				</div>
				<div class="loginBoxButtons">
					<button class="loginBtn">注册</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>