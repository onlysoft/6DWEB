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

    <title>6DWeb后台管理系统</title>

    <!-- Bootstrap core CSS -->
    <%
	String basePath = request.getContextPath();
	%>
    <link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">

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
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">6DWeb</a>
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="<%=basePath%>/servlet/login">
            <div class="form-group">
              <input type="text" placeholder="Username" class="form-control" name="username" value="${name }"> 
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" name="password">
            </div>
            <button type="submit" class="btn btn-success">登陆</button>
            <a class="btn btn-success" role="button" href="<%=basePath%>/register.jsp">没有账号，现在注册</a>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </div>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Welcome to 6DWeb !</h1>
        <p>做你想做的梦吧，去你想去的地方吧，成为你想成为的人吧，因为你只有一次生命，一个机会去做所有那些你想做的事.JUST DO IT！</p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Tips</h2>
          <p>最好的朋友就是那种能和你促膝而坐，彼此不说只字片语，分别时却感到这是你有过的最好的一次交流！ </p>
        </div>
        <div class="col-md-4">
          <h2>Tips</h2>
          <p>告诉家人和朋友，你是多么的爱他们；做一切可以给你的生活带来欢笑与快乐的事情；每一天、每一小时、每一分钟都是那么特别；你无法知道这是否是你的最后一刻。  </p>
       </div>
        <div class="col-md-4">
          <h2>Tips</h2>
          <p>将所谓的“有那么一天”或“某一天”从你的字典中删掉；曾打算“在那么一天”要写的信，就在今天提笔吧！  </p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  </body>
</html>
