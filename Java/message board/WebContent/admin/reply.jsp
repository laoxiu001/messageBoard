<%@page import="admin.struts.LoginAction"%>
<%@page import="java.util.Map"%>
<%@page import="user.dao.ListDao"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
					<li class="clrli"><a href="logout"><img
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
							<li class="clrli"><a href="<%=basePath%>/admin/index"><img
									alt="" src="<%=basePath%>/img/admin/index.png"> 首页概览</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/reply_s"><img
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
			<a class="clra">回复留言 >> 未回复留言</a> <a>${ts_1} ${ts_2} </a>
		</div>
		<div class="row">
			<div id="right" class="span10">
				<form name="form" action="reply_s" method="post">
					<table style="width: 90%; margin: 0px auto;"
						class="table table-striped table-hover table-bordered">
						<tr class="success">
							<td>留言编号</td>
							<td>标题</td>
							<td>留言日期</td>
							<td>留言类型</td>
							<td>点击率</td>
							<td style="width: 100px;">操作</td>
						</tr>
						<s:iterator var="li" value="list" status="number">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="title" /></td>
								<td><s:property value="m_time" /></td>
								<td><s:property value="type" /></td>
								<td><s:property value="click" /></td>
								<td><a style="cursor: pointer"
									href="<%= basePath%>/admin/reply_inf?id=<s:property value="id"/>"
									title="回复留言"><svg class="icon" aria-hidden="true"> <use
											xlink:href="#icon-huifu"></use> </svg></a> <a style="cursor: pointer"
									onclick="forward('<s:property value="m_time"/><s:property value="m_object2"/>;"
									title="转交留言"> <svg class="icon" aria-hidden="true"> <use
											xlink:href="#icon-shenpizhuanjiao"></use> </svg>
								</a> <a style="cursor: pointer"
									onclick="del('<s:property value="id"/>');" title="删除留言"><svg
											class="icon" aria-hidden="true"> <use
											xlink:href="#icon-icon209"></use> </svg> </a></td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="6" style="margin: auto; text-align: center;"><input
								type="submit" value="首页" name="shouPage" class="btn btn-primary" />
								<input type="submit" value="上一页" name="previousPage"
								class="btn btn-primary" /> <input type="text" value="${sss.p}"
								name="page" style="width: 20px; text-align: center;" /> <input
								type="submit" value="下一页" name="theNextPage"
								class="btn btn-primary" /> <input type="submit" value="末页"
								name="moPage" class="btn btn-primary" /></td>
						</tr>
					</table>

				</form>

			</div>
		</div>
	</div>
	<script>
 	/* 转交留言JS */
 		function forward(m_object2) {
		}
 	/* 删除留言JS */
 		function del(id) {
			layer.confirm('确定删除这条记录吗？', {icon: 8, title:'警告'}, function(){
				  //do something
				  location.href = "<%=basePath%>/admin/reply_d?id=" + id;  
				});
		}
	</script>
	<%
		String msg = (String) session.getAttribute("msg");
		if (msg != null && !msg.equals("")) {
			//用户进行了数据的操作，反馈成功或者失败结果
	%>
	<script type="text/javascript">
		layer.msg('<%=msg%>');
	</script>
	<%
		}
		//登录信息展示一次之后及时清除msg的session值
		session.removeAttribute("msg");
	%>
</body>
</html>