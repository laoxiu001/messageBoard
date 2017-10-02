<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>学生交流平台-修改密码</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

<link rel="stylesheet" href="<%=basePath%>/CSS/public.css">
<link rel="stylesheet" href="<%=basePath%>/CSS/admin/manage.css">
</head>
<body style="background-color: #eaecec;">
	<div id="top" class="container-fluid">
		<div class="row">
			<img class="span2" id="top_left" id="top_left" alt="重庆文理学院"
				src="<%=basePath%>/img/admin/logo2.png"> <span><img
				class="span2" id="top_right" alt="用户头像"
				src="<%=basePath%>/img/admin/avatar.png">
				<ul id="flow">
					<li class="clrli"><a href="logout"><img
							src="<%=basePath%>/img/admin/logout.png">注销退出</a></li>
					<li class="clrli"><a href="<%=basePath%>/admin/inf.jsp"><img
							src="<%=basePath%>/img/admin/inf.png">个人资料</a></li>
				</ul> </span> <a class="span4" id="top_user">欢迎回家，用户12138 </a>

		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div id="left" class="span2">
				<div id="left_visiable">
					<div id="left_visiable_avatar">
						<img alt="用户头像" src="<%=basePath%>/img/admin/avatar_white.png">
					</div>

					<div id="left_visiable_userid">
						<a>编号：1056314532</a>
					</div>

					<div id="nav">
						<ul>
							<li class="clrli"><a href="<%=basePath%>/admin/index.jsp"><img
									alt="" src="<%=basePath%>/img/admin/index.png"> 首页概览</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/reply.jsp"><img
									alt="" src="<%=basePath%>/img/admin/reply.png"> 回复留言</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/change.jsp"><img
									alt="" src="<%=basePath%>/img/admin/change.png"> 修改密码</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/inf.jsp"><img
									alt="<%=basePath%>/admin/inf.jsp"
									src="<%=basePath%>/img/admin/inf.png"> 个人资料</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div id="location">
			<a class="clra">修改密码 >> </a>
		</div>
		<div class="row">
			<div id="right" class="span10"
				style="width: 900px; height: 300px; margin-left: 400px;">
				<div style="width: 600px;" class="center-block">
					<form class="form-horizontal" role="form">
						<table>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">当前密码</label>
								<div class="col-sm-10">
									<input class="form-control" id="" placeholder="请输入您的当前密码"
										style="width: 250px;">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">新密码</label>
								<div class="col-sm-10">
									<input class="form-control" id="" placeholder="请输入您要修改的新密码"
										style="width: 250px;">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">确认新密码</label>
								<div class="col-sm-10">
									<input class="form-control" id="" placeholder="请再次输入您设置的新密码"
										style="width: 250px;">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">确认修改</button>
								</div>
							</div>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>