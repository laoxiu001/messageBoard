<%@page import="java.util.Map"%>
<%@page import="user.dao.ListDao"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学生交流平台-回复留言</title>
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
<!-- 阿里云iconfont字体JS引入 -->
<script src="<%=basePath%>/JS/iconfont/iconfont.js"></script>
<!--弹窗组件layer.JS引入 -->
<script src="<%=basePath%>/JS/windows/layer.js"></script>
<style type="text/css">
.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
}
</style>
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
					<li class="clrli"><a href="<%= basePath%>/logout.jsp"><img
							src="<%=basePath%>/img/admin/logout.png">注销退出</a></li>
					<li class="clrli"><a href=""><img
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
							<li class="clrli"><a href=""><img
									alt="<%=basePath%>/admin/inf.jsp"
									src="<%=basePath%>/img/admin/inf.png"> 个人资料</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div id="location">
			<a class="clra">回复留言 >> 未回复留言</a>
		</div>
		<div class="row">
			<div id="right" class="span10">
				<form>
					<table style="width: 90%; margin: 0px auto;"
						class="table table-striped table-hover table-bordered">
						<tr class="success">
							<td>编号</td>
							<td>标题</td>
							<td>留言日期</td>
							<td>留言类型</td>
							<td>点击率</td>
							<td style="width: 100px;">操作</td>
						</tr>
						<tr>
							<td>15654</td>
							<td>快速创建您的个性化机器人只需四步</td>
							<td>2017-07-09</td>
							<td>建议</td>
							<td>85</td>
							<td><a title="回复留言"><svg class="icon" aria-hidden="true">
									<use xlink:href="#icon-huifu"></use> </svg></a> <a id="button_delete"
								title="删除留言"><svg class="icon" aria-hidden="true"> <use
										xlink:href="#icon-icon209"></use> </svg> </a><a id="button_forward"
								title="转交留言"><svg class="icon" aria-hidden="true"> <use
										xlink:href="#icon-shenpizhuanjiao"></use> </svg></td>
							</a>
						</tr>
						<tr>
							<td>15654</td>
							<td>快速创建您的个性化机器人只需四步</td>
							<td>2017-07-09</td>
							<td>建议</td>
							<td>85</td>
							<td><a title="回复留言"><svg class="icon" aria-hidden="true">
									<use xlink:href="#icon-huifu"></use> </svg></a> <a id="button_delete"
								title="删除留言"><svg class="icon" aria-hidden="true"> <use
										xlink:href="#icon-icon209"></use> </svg> </a><a id="button_forward"
								title="转交留言"><svg class="icon" aria-hidden="true"> <use
										xlink:href="#icon-shenpizhuanjiao"></use> </svg></td>
							</a>
						</tr>
						<tr>
							<td>15654</td>
							<td>快速创建您的个性化机器人只需四步</td>
							<td>2017-07-09</td>
							<td>建议</td>
							<td>85</td>
							<td><a title="回复留言"><svg class="icon" aria-hidden="true">
									<use xlink:href="#icon-huifu"></use> </svg></a> <a id="button_delete"
								title="删除留言"><svg class="icon" aria-hidden="true"> <use
										xlink:href="#icon-icon209"></use> </svg> </a><a id="button_forward"
								title="转交留言"><svg class="icon" aria-hidden="true"> <use
										xlink:href="#icon-shenpizhuanjiao"></use> </svg></td>
							</a>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	/* 弹窗组件JS */
	<script>
		$('#button_delete').on('click', function() {
			layer.confirm('您确定要删除这条留言吗？', {
				btn : [ '确定', '取消' ]
			//按钮
			});
		});
	</script>
</body>
</html>