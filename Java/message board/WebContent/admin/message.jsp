<%@page import="user.dao.ListDao"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>学生交流平台-留言查看</title>
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
					<li class="clrli"><a href="<%=basePath%>/admin/inf.jsp"><img
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
						<a>编号：${sss.session} </a>
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
			<a class="clra">回复留言 >> 未回复留言</a>
		</div>
		<div class="row">
			<div id="right" class="span10">
				<form action="modify" method="post" class="form-group">
					<table style="width: 1100px; margin: 0px auto;"
						class="table table-striped table-hover table-bordered">
						<s:iterator var="li" value="list" status="number">
							<tr>
								<td style="width: 90px">留言编号：</td>
								<td><a name="id" class="clra"><s:property value="id" /></a></td>
							</tr>
							<tr>
								<td>留言标题：</td>
								<td><a class="clra"> <s:property value="title" />
								</a></td>
							</tr>
							<tr>
								<td>留言内容：</td>
								<td><a class="clra"> <s:property value="m_content" />
								</a></td>
							</tr>
							<tr>
								<td>留言时间：</td>
								<td><a class="clra"> <s:property value="m_time" />
								</a></td>
							</tr>
							<tr>
								<td>用户：</td>
								<td><a class="clra"> <s:property value="user" />
								</a></td>
							</tr>
							<tr>
								<td>学号：</td>
								<td><a class="clra"> <s:property value="number" />
								</a></td>
							</tr>
							<tr>
								<td>点击率：</td>
								<td><a class="clra"> <s:property value="click" />
								</a></td>
							</tr>
							<tr>
								<td>留言类型：</td>
								<td><a class="clra"> <s:property value="type" />
								</a></td>
							</tr>
							<tr>
								<td>受理单位：</td>
								<td><input name="reply" class="form-control" id=""
									value="<s:property value="reply" />"></td>
							</tr>
							<tr>
								<td>回复内容：</td>
								<td><a class="clra"> <textarea class="form-control"
											name="r_content" style="height: 150px;"><s:property
												value="r_content" /></textarea>
								</a></td>
							</tr>
							<tr>
								<td>留言对象：</td>
								<td><select name="m_object" id="" class="form-control"
									style="width: 160px;">
										<option value="false,false"><s:property
												value="m_object2" /></option>
										<option value="false,false">-------校 长-------</option>
										<option value="校长,分管校长">分管校长</option>
										<option value="校长,学院校长">学院校长</option>
										<option value="校长,分管书记">分管书记</option>
										<option value="校长,书记">书记</option>
										<option value="false,false">-------部 门-------</option>
										<option value="部门,行政部门">行政部门</option>
										<option value="部门,后勤服务部门">后勤服务部门</option>
										<option value="部门,食堂监管部门">食堂监管部门</option>
										<option value="部门,校园安保部门">校园安保部门</option>
										<option value="部门,财务部门">财务部门</option>
										<option value="false,false">-------学 院-------</option>
										<option value="学院,数学与财经学院">数学与财经学院</option>
										<option value="学院,机电学院">机电学院</option>
										<option value="学院,文传学院">文传学院</option>
										<option value="学院,网络工程学院">网络工程学院</option>
										<option value="学院,外国语学院">外国语学院</option>
										<option value="学院,体育学院">体育学院</option>
								</select></td>
								<!-- 隐藏表单域存储用户id -->
							<td><input name="id" hidden="hidden" value="<s:property value="id" />"></td>
							</tr>
						</s:iterator>
						<tr>
							<td></td>
							<td>
								<button class="btn-success btn-lg"
									style="margin-left: 500px; width: 100px;" type="submit">提交</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script>
	/* 回复留言JS */
 		function reply(m_content) {
	layer.prompt(
			{
			  formType: 2,
			  value: '',
			  title: '回复留言',
			  area: ['500px', '200px'] //自定义文本域宽高
			}, function(value, index, elem){
			  alert(value); //得到value
			  layer.close(index);
			});
		}
 	/* 转交留言JS */
 		function forward(m_object2) {
		}
 	/* 删除留言JS */
 		function del(id) {
			layer.confirm('确定删除这条记录吗？', {icon: 8, title:'警告'}, function(){
				  //do something
				  location.href = "<%=basePath%>/delete.jsp?id=" + id;  
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