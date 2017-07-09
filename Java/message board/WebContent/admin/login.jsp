<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>学生交流平台-管理员登录</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Jquery -->
<script
	src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=basePath%>/CSS/main.css">
<link rel="stylesheet" href="<%=basePath%>/CSS/admin/login.css">
<link rel="stylesheet" href="<%=basePath%>/CSS/public.css">
</head>
<body>
	<div id="top" class="row">
		<div id="top_left" class="fl col-xs-6">
			<a href="#"><img src="<%=basePath%>/img/logo1.png" alt="Logo"></a>
		</div>
		<div id="top_right" class="fr col-xs-6">
			<div class="school">
				<ul>
					<li class="clrli"><a class="clra" href="#">学校概况</a></li>
					<li class="clrli"><a class="clra" href="#">创新创业</a></li>
					<li class="clrli"><a class="clra" href="#">教学科研</a></li>
					<li class="clrli"><a class="clra" href="#">校园文化</a></li>
					<li class="clrli"><a class="clra" href="#">信息公开</a></li>
					<li class="clrli"><a class="clra" href="#">招生信息</a></li>
					<li class="clrli"><a class="clra" href="#">就业信息</a></li>
				</ul>
				<a href="#"><img id="touch" src="<%=basePath%>/img/facebook.png" /></a>
				<a href="#"><img id="touch" src="<%=basePath%>/img/twitter.png" /></a>
				<a href="#"><img id="touch" src="<%=basePath%>/img/Google+.png" /></a>
				<a href="#"><img id="touch" src="<%=basePath%>/img/telegram.png" /></a>
			</div>
		</div>
	</div>

	<div id="content">
		<div id="login">
			<div id="login_title">
				<a>登陆管理后台</a>
			</div>

			<div id="login_form">
				<form name="form"
					action="${pageContext.request.contextPath }/LoginServlet"
					method="post">
					<table>
						<div id="input">
							<input type="text" name="user" style="width: 100%; height: 100%;"
								placeholder="请输入用户名">
						</div>
						<div id="input">
							<input type="text" name="password"
								style="width: 100%; height: 100%;" placeholder="请输入密码">
						</div>
						<div id="input">
							<input id="submit" class="submit" value="登陆" type="submit"
								name="password">
						</div>
					</table>
				</form>
			</div>
		</div>
	</div>

	<div id="bottom">
		<div id="bottom_text">
			<a> 版权所有 2011 重庆文理学院 地址: 重庆市永川区红河大道319号 邮编: 402160</br>
				校友会电话：023-49891798 校办电话：023-49891910
			</a> <a href="#" class="admin">管理登录</a>
		</div>
	</div>
</body>
</html>