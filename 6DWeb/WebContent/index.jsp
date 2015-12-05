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

<%
	String basePath = request.getContextPath();
%>
<!-- Bootstrap core CSS -->
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=basePath%>/css/jumbotron-narrow.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container">
		<div class="header">
			<ul class="nav nav-pills pull-right">
				<li class="active"><a href="#">主页</a>
				</li>
				<li><a href="#">关于</a>
				</li>
				<li><a href="#">联系我们</a>
				</li>
			</ul>
			<h3 class="text-muted">6DWeb</h3>
		</div>

		<div class="jumbotron">
			<h1>Welcome to 6DWeb</h1>
			<p class="lead">做你想做的梦吧，去你想去的地方吧，成为你想成为的人吧，因为你只有一次生命，一个机会去做所有那些你想做的事！</p>
			<p>
				<a class="btn btn-lg btn-success" href="<%=basePath%>/login.jsp"
					role="button">现在 登陆</a>
			</p>
		</div>

		<div class="row marketing">
			<div class="col-lg-6">
				<h4>Tips</h4>
				<p>最好的朋友就是那种能和你促膝而坐，彼此不说只字片语，分别时却感到这是你有过的最好的一次交流！</p>

				<h4>Tips</h4>
				<p>告诉家人和朋友，你是多么的爱他们；做一切可以给你的生活带来欢笑与快乐的事情；每一天、每一小时、每一分钟都是那么特别；你无法知道这是否是你的最后一刻。</p>

				<h4>Tips</h4>
				<p>将所谓的“有那么一天”或“某一天”从你的字典中删掉；曾打算“在那么一天”要写的信，就在今天提笔吧！</p>
			</div>

			<div class="col-lg-6">
				<h4>Tips</h4>
				<p>无心快语可能引发争执，无情之词可能折损生命，适时温语可能消弭压力，而关爱之声可能治愈心灵。</p>

				<h4>Tips</h4>
				<p>生命中令人悲伤的一件事是你遇到了一个对你来说很重要的人，但却最终发现你们有缘无份，因此你不得不放手。</p>

				<h4>Tips</h4>
				<p>迷上某人只需一分钟，喜欢上某人需要一小时，爱上某人则要一天，然而，忘记某人却是一辈子的事情。</p>
			</div>
		</div>

		<div class="footer">
			<p>&copy; Company 2013</p>
		</div>

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
