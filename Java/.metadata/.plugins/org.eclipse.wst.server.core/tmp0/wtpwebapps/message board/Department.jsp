<%@page import="java.util.Map"%>
<%@page import="user.dao.ListDao"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>学生交流平台-部门留言板</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<link rel="stylesheet" href="<%=basePath%>/CSS/public.css">
<link rel="stylesheet"
	href="<%=basePath%>/assets/themes/default/sangarSlider.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="<%=basePath%>/assets/themes/default/default.css" type="text/css"
	media="all">
<script type="text/javascript" src="<%=basePath%>/JS/main.js"></script>
<script type="text/javascript" src="<%=basePath%>/JS/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/jquery.touchSwipe.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/imagesloaded.min.js"></script>
<!-- jQuery Sangar Slider -->
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarBaseClass.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarSetupLayout.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarSizeAndScale.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarShift.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarSetupBulletNav.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarSetupNavigation.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarSetupSwipeTouch.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarSetupTimer.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarBeforeAfter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarLock.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarResponsiveClass.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarResetSlider.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/JS/sangarSlider/sangarTextbox.js"></script>
<script type="text/javascript" src="<%=basePath%>/JS/sangarSlider.js"></script>
<script type='text/javascript'>
	jQuery(document)
			.ready(function($) {
				$('#sangar-example').sangarSlider({
					timer : true, // true or false to have the timer
					width : 1250, // slideshow width
					height : 400
				// slideshow height
				});
			})
</script>
</head>
<body>
	<div class="container-fluid">
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
					<a href="#"><img id="touch"
						src="<%=basePath%>/img/facebook.png" /></a> <a href="#"><img
						id="touch" src="<%=basePath%>/img/twitter.png" /></a> <a href="#"><img
						id="touch" src="<%=basePath%>/img/Google+.png" /></a> <a href="#"><img
						id="touch" src="<%=basePath%>/img/telegram.png" /></a>
				</div>
				<div id="top_right">
					<form class="search"
						action="<%=basePath%>/result/Search_result.jsp">
						<select id="choose" name="select">
							<option value="id">编号</option>
							<option value="title">标题</option>
						</select> <input name="input" id="s_input" type="text"
							placeholder="请输入搜索内容"> <input class="fr" type="submit"
							id="button" value="" />
					</form>
				</div>
			</div>
		</div>

		<div class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<!-- .navbar-toggle样式用于toggle收缩的内容，即nav-collapse collapse样式所在元素 -->
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="sr-only">Toggle Navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- 确保无论是宽屏还是窄屏，navbar-brand都显示 -->
				<a class="navbar-brand">学生交流平台</a>
			</div>
			<!-- 屏幕宽度小于768px时，div.navbar-responsive-collapse容器里的内容都会隐藏，显示icon-bar图标，当点击icon-bar图标时，再展开。屏幕大于768px时，默认显示。 -->
			<div class="collapse navbar-collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=basePath%>/index.jsp">首 页</a></li>
					<li><a href="<%=basePath%>/Principal.jsp?object=all">校长留言板</a></li>
					<li class="active"><a
						href="<%=basePath%>/Department.jsp?object=all">部门留言板</a></li>
					<li><a href="<%=basePath%>/College.jsp?object=all">学院留言板</a></li>
					<li><a href="<%=basePath%>/Message.jsp">发表留言</a></li>
				</ul>
			</div>
		</div>

		<div id="picture">
			<div class="htmleaf-container">
				<div class="htmleaf-content bgcolor-3">
					<div class='sangar-slideshow-container' id='sangar-example'>
						<div class='sangar-content-wrapper'>
							<div class='sangar-content'>
								<img src='<%=basePath%>/img/lb1.jpg' /> <a href='#'></a>
							</div>
							<div class='sangar-content'>
								<img src='<%=basePath%>/img/lb2.jpg' /> <a href='#'></a>
							</div>
							<div class='sangar-content'>
								<img src='<%=basePath%>/img/lb3.jpg' /> <a href='#'></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="message_Principal">
			<div class="container-fluid">
				<div class="raw">
					<div class="greycontent_visiable">
						<div class="fr" style="width: 100%">
							<div class="bluebar">
								<a><img src="img/department.png"> 部门留言板</a>
							</div>
						</div>
						<div class="message_bottom_left">
							<ul>
								<li class="clrli"><a class="clra"
									href="Department.jsp?object=行政部门">●行政部门●</a></li>
								<li class="clrli"><a class="clra"
									href="Department.jsp?object=后勤服务部门">●后勤服务部门●</a></li>
								<li class="clrli"><a class="clra"
									href="Department.jsp?object=食堂监管部门">●食堂监管部门●</a></li>
								<li class="clrli"><a class="clra"
									href="Department.jsp?object=校园安保部门">●校园安保部门●</a></li>
								<li class="clrli"><a class="clra"
									href="Department.jsp?object=财务部门">●财务部门●</a></li>
							</ul>
						</div>
						<div id="message_bottom_right">
							<form name="form" id="form"
								action="${pageContext.request.contextPath }/Details.jsp"
								method="post">
								<table width="100%">
									<tr class="single">
										<td width="80px">留言编号</td>
										<td>留言标题</td>
										<td width="100px">留言时间</td>
										<td width="150px">留言对象</td>
										<td width="70px">留言类型</td>
									</tr>
									<%
										ListDao ls = new ListDao();

										String object = new String(request.getParameter("object").getBytes("ISO-8859-1"), "UTF-8");//获得留言对象
										String sql = "";

										if (object.equals("")) {
											object = "all";
										}

										if (object.equals("all")) {
											sql = "Select * from t_message where m_object1 = '部门' order by m_time desc";
										} else {
											sql = "Select * from t_message where m_object2 = '" + object + "' order by m_time desc";
										}

										ls.getList(sql);
										ls.count(sql);

										int totalPage = ls.getTotalPage();//获取总页数
										String currentPage = request.getParameter("pageIndex"); //获得当前页数
										if (currentPage == null) {
											currentPage = "1";
										}
										int pageIndex = Integer.parseInt(currentPage);
										//防止页数异常  
										if (pageIndex < 1) {
											pageIndex = 1;
										} else if (pageIndex > totalPage) {
											pageIndex = totalPage;
										}

										Map map = null;
										for (int i = 14 * (pageIndex - 1); i < ((14 * pageIndex) < (ls.sum) ? (14 * pageIndex) : (ls.sum)); i++) {
											map = (Map) ls.list.get(i);
											if ((i % 2) == 0) {
									%>
									<tr class="double"
										onclick="window.document.location = 'Details.jsp?index=<%out.print(map.get("id"));%>'">
										<td>
											<%
												out.print(map.get("id"));
											%>
										</td>
										<td>
											<%
												out.print(map.get("title"));
											%>
										</td>
										<td>
											<%
												out.print(map.get("m_time"));
											%>
										</td>
										<%
											if (object.equals("all")) {
										%>
										<td>
											<%
												out.print("部门");
											%>
										</td>
										<%
											} else {
										%>
										<td>
											<%
												out.print(map.get("m_object2"));
											%>
										</td>
										<%
											}
										%>
										<td>
											<%
												out.print(map.get("type"));
											%>
										</td>
									</tr>
									<%
										} else {
									%>
									<tr class="single"
										onclick="window.document.location = 'Details.jsp?index=<%out.print(map.get("id"));%>'">
										<td>
											<%
												out.print(map.get("id"));
											%>
										</td>
										<td>
											<%
												out.print(map.get("title"));
											%>
										</td>
										<td>
											<%
												out.print(map.get("m_time"));
											%>
										</td>
										<%
											if (object.equals("all")) {
										%>
										<td>
											<%
												out.print("部门");
											%>
										</td>
										<%
											} else {
										%>
										<td>
											<%
												out.print(map.get("m_object2"));
											%>
										</td>
										<%
											}
										%>
										<td>
											<%
												out.print(map.get("type"));
											%>
										</td>
									</tr>
									<%
										}
										}
									%>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="cb"></div>

				<div style="margin-top: 20px;">
					<form
						action="Department.jsp?object=<%=object%>&pageIndex=<%=pageIndex%>">
						<table>
							<a class="button"
								href="Department.jsp?object=<%=object%>&pageIndex=1">首 页</a>
							<a class="button"
								href="Department.jsp?object=<%=object%>&pageIndex=<%=pageIndex - 1%>">上一页</a>
							<a class="button"
								href="Department.jsp?object=<%=object%>&pageIndex=<%=pageIndex + 1%>">下一页</a>
							<a class="button"
								href="Department.jsp?object=<%=object%>&pageIndex=<%=totalPage%>">末
								页</a>
							<a class="jump">第</a>
							<input class="jump" name="pageIndex" type="text"
								value="<%=pageIndex%>" style="width: 30px;">
							<input class="jump" name="object" type="text" value="<%=object%>"
								style="width: 30px; display: none;">
							<a class="jump">页</a>&nbsp;/&nbsp;
							<a class="jump">共</a>
							<input class="jump" name="totalPage" type="text"
								value="<%=totalPage%>" style="width: 30px;" disabled="disabled">
							<a class="jump">页</a>
							<input class="jump" name="" type="submit" value="跳转"
								style="width: 60px;">
						</table>
					</form>
				</div>
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