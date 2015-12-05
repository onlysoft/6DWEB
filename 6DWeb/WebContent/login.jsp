<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

<title>登陆6DWeb后台</title>

<%
	String basePath = request.getContextPath();
%>
<!-- Bootstrap core CSS -->
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<%
			Object uObject = session.getAttribute("name");
			if (uObject != null) {
				String username = uObject.toString();
				if (username != null) {
					response.sendRedirect(basePath + "/welcome.jsp");
				}
			}
		%>
	<div class="container">
	
		<form class="form-signin" action="<%=basePath%>/servlet/login" method="post">
			<h2 class="form-signin-heading">6DWeb登陆</h2>
			<p>
						<font color="red" style=""><b> ${error }</b></font>
			</p>
			<input type="text" class="form-control" placeholder="Username"
				required autofocus name="username" value="${name }"> <input type="password"
				class="form-control" placeholder="Password" name="password" required> 
			<p>
			<label
				class="checkbox"> <input type="checkbox" value="remember-me" name="remember">
				Remember me
			</label>
			<a type="button" class="btn btn-info" href="<%=basePath%>/register.jsp">没有账号，现在注册</a>
			</p>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
		</form>

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>