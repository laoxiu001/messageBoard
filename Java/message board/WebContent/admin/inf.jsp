<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生交流平台-个人资料</title>
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

<link rel="stylesheet" href="<%=basePath%>/CSS/public.css">
<link rel="stylesheet" href="<%=basePath%>/CSS/admin/manage.css">
</head>
<body>
	<div id="top" class="container-fluid">
		<div class="row">
			<img class="span2" id="top_left" id="top_left" alt="重庆文理学院"
				src="<%=basePath%>/img/admin/logo2.png"> <span><img
				class="span2" id="top_right" alt="用户头像"
				src="<%=basePath%>/img/admin/avatar.png">
				<ul id="flow">
					<li class="clrli"><a href="logout"><img
							src="<%=basePath%>/img/admin/logout.png">注销退出</a></li>
					<li class="clrli"><a href="<%=basePath%>/admin/inf"><img
							src="<%=basePath%>/img/admin/inf.png">个人资料</a></li>
				</ul> </span> <a class="span4" id="top_user">欢迎回家，用户${sss.session}  </a>

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
						<a>编号：${sss.session}</a>
					</div>

					<div id="nav">
						<ul>
							<li class="clrli"><a href="<%=basePath%>/admin/index"><img
									alt="" src="<%=basePath%>/img/admin/index.png"> 首页概览</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/reply_s"><img
									alt="" src="<%=basePath%>/img/admin/reply.png"> 回复留言</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/change_1"><img
									alt="" src="<%=basePath%>/img/admin/change.png"> 修改密码</a></li>
							<li class="clrli"><a href="<%=basePath%>/admin/inf"><img
									alt="<%=basePath%>/admin/inf.jsp"
									src="<%=basePath%>/img/admin/inf.png"> 个人资料</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="location">
			<a class="clra">个人资料 >> </a>
		</div>
		<div class="row">
			<div id="right" class="span10"
				style="width: 900px; height: 400px; margin-left: 400px;">
				<div style="width: 600px;" class="center-block">
					<form action="inf_u" class="form-horizontal" role="form" method="post">
						<table>
						<s:iterator var="li" value="list" status="number">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">用户编号</label>
								<div class="col-sm-10">
									<input name="id" value="<s:property value="id"/>" class="form-control" id=""
										style="width: 300px;" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input name="user" value="<s:property value="user"/>" class="form-control" id=""
										style="width: 300px;">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">所属单位</label>
								<div class="col-sm-10">
									<select name="department" class="form-control" style="width: 300px;">
									    <option value="<s:property value="department"/>"><s:property value="department"/>(当前学院)</option>
										<option value="体育学院">体育学院</option>
										<option value="外国语学院">外国语学院</option>
										<option value="数学与财经学院">数学与财经学院</option>
										<option value="文传学院">文传学院</option>
										<option value="经济管理学院">经济管理学院</option>
										<option value="网络工程学院">网络工程学院</option>
										<option value="机电学院">机电学院</option>
										<option value="后勤服务部门">后勤服务部门</option>
										<option value="校园安保部门">校园安保部门</option>
										<option value="行政部门">行政部门</option>
										<option value="财务部门">财务部门</option>
										<option value="食堂监管部门">食堂监管部门</option>
										<option value="分管校长">分管校长</option>
										<option value="分管书记">分管书记</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">联系方式</label>
								<div class="col-sm-10">
									<input name = "tel" value="<s:property value="tel"/>" class="form-control" id=""
										style="width: 300px;">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">邮箱账号</label>
								<div class="col-sm-10">
									<input name="email" value="<s:property value="email"/>" class="form-control"
										id="" style="width: 300px;">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default" onclick="del()">修改</button>
								</div>
								<a>${sss.tishi}</a>
							</div>
						</table>
						</s:iterator>
					</form>
<%-- 					<script type="text/javascript">
					function del() { layer.confirm('确定修改个人信息？', {icon: 8,title:'警告'}, function(){ 
						//do something 
						location.href = "<%=basePath%>/admin/inf" });}
					</script> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>