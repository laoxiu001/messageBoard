<%@page import="admin.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	href="<%=basePath%>/CSS/bootstrap/bootstrap.min.css">
<!-- jquery -->
<script src="<%=basePath%>/CSS/bootstrap/jquery.min.js"></script>
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="<%=basePath%>/CSS/bootstrap/bootstrap-theme.min.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=basePath%>/CSS/bootstrap/bootstrap.min.js"></script>
<!--弹窗组件layer.JS引入 -->
<script src="<%=basePath%>/JS/windows/layer.js"></script>
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
				<form name="form" action="login" method="post">
					<table>
						<div id="input">
							<input type="text" name="user" style="width: 100%; height: 100%;"
								placeholder="请输入用户名">
						</div>
						<div id="input">
							<input type="password" name="password"
								style="width: 100%; height: 100%;" placeholder="请输入密码">
						</div>
						<div id="input">
							<input id="submit" class="submit" value="登陆" type="submit">
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
	<%
		String login = (String) session.getAttribute("login");
		if (login != null && !login.equals("")) {
			//用户未登录
	%>
	<script type="text/javascript">
		layer.msg('<%=login%>
		');
	</script>
	<%
		}
		//登录信息展示一次之后及时清除msg的session值
		session.removeAttribute("login");
	%>
</body>
</html>