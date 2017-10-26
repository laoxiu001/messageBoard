<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@ taglib prefix="s" uri="/struts-tags"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>学生交流平台-首页</title>
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
<!-- ECharts统计图表JS插件引入 -->
<script src="<%=basePath%>/JS/echarts/echarts.common.min.js"></script>
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
<link rel="stylesheet" href="<%=basePath%>/CSS/admin/index.css">
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
			<a class="clra">首页概览 >></a>
		</div>
		<div class="row" style="margin-left: 220px; margin-top: 20px;">
			<!-- 已回复留言和未回复留言饼图-->
			<div id="reply" class="pull-left"
				style="width: 500px; height: 350px;"></div>
			<script type="text/javascript">
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('reply'));

				// 指定图表的配置项和数据
				var i=${sss.i};/* 已回复 */
				var j=${sss.j};/* 未回复 */

				var option1 = {
					title : {
						text : '未回复留言：' + j + '条',
						left : 'center',
						top : 20,
					},
					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b}: {c} ({d}%)"
					},
					legend : {
						orient : 'vertical',
						x : 'left',
						data : [ '已回复留言', '未回复留言' ]
					},
					series : [ {
						name : '是否回复',
						type : 'pie',
						radius : [ '50%', '70%' ],
						avoidLabelOverlap : false,
						label : {
							normal : {
								show : false,
								position : 'center'
							},
							emphasis : {
								show : true,
								textStyle : {
									fontSize : '30',
									fontWeight : 'bold'
								}
							}
						},
						labelLine : {
							normal : {
								show : false
							}
						},
						data : [ {
							value : i,
							name : '已回复留言'
						}, {
							value : j,
							name : '未回复留言'
						} ]
					} ]
				};
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option1);
			</script>

			<!-- 用户留言类型留言饼图-->
			<div id="type" class="pull-left" style="width: 500px; height: 350px;"></div>
			<script type="text/javascript">
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('type'));
				var consulting = ${sss.consulting};//咨询
				var suggest = ${sss.suggest};//建议
				var complaints = ${sss.complaints};//投诉
				// 指定图表的配置项和数据
				var option2 = {
					title : {
						text : '用户留言类型',
						left : 'center',
						top : 20
					},

					tooltip : {
						trigger : 'item',
						formatter : "{a} <br/>{b} : {c} ({d}%)"
					},

					visualMap : {
						show : false,
						min : 80,
						max : 600,
						inRange : {
							colorLightness : [ 0, 1 ]
						}
					},
					series : [ {
						name : '留言类型',
						type : 'pie',
						radius : '55%',
						center : [ '50%', '50%' ],
						data : [ {
							value : consulting,
							name : '咨询'
						}, {
							value : suggest,
							name : '建议'
						}, {
							value : complaints,
							name : '投诉'
						} ].sort(function(a, b) {
							return a.value - b.value;
						}),
						roseType : 'radius',
						label : {
							normal : {
								textStyle : {

								}
							}
						},
						labelLine : {
							normal : {
								lineStyle : {

								},
								smooth : 0.2,
								length : 10,
								length2 : 20
							}
						},
						itemStyle : {
							normal : {

							}
						},

						animationType : 'scale',
						animationEasing : 'elasticOut',
						animationDelay : function(idx) {
							return Math.random() * 200;
						}
					} ]
				};
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option2);
			</script>
		</div>

		<!--  用户公告-->
		<div class="announcement pull-left" style="margin-left:220px;">
			<div style="padding-left:30px;padding-top:5px;">
				<h3><img src="<%=basePath%>/img/admin/announcement.png">&nbsp&nbsp公告</h3>
			</div>
			<hr>
			<form>
					<table class="table table-hover">
						<tr onclick="window.document.location='#';">
							<td>重庆文理学院留言板V4.0上线啦</td>
							<td>2017-9-1</td>
						</tr>
						<tr onclick="window.document.location='#';">
							<td>重庆文理学院留言板V3.0上线啦</td>
							<td>2017-8-1</td>
						</tr>
						<tr onclick="window.document.location='#';">
							<td>重庆文理学院留言板V2.0上线啦</td>
							<td>2017-7-1</td>
						</tr>
						<tr onclick="window.document.location='#';">
							<td>重庆文理学院留言板V1.0上线啦</td>
							<td>2017-6-1</td>
						</tr>
					</table>
			</form>
		</div>
		
		<!--  帮助文档-->
		<div class="announcement pull-left"  style="margin-left:40px;">
			<div style="padding-left:30px;padding-top:5px;">
				<h3><img src="<%=basePath%>/img/admin/help.png">&nbsp&nbsp帮助</h3>
			</div>
			<hr>
			<form>
					<table class="table table-hover">
						<tr onclick="window.document.location='#';">
							<td>【引导】如何回复留言</td>
							<td>2017-10-1</td>
						</tr>
						<tr onclick="window.document.location='#';">
							<td>【事项】留言回复注意事项</td>
							<td>2017-9-1</td>
						</tr>
						<tr onclick="window.document.location='#';">
							<td>【反馈】遇到问题如何反馈</td>
							<td>2017-8-1</td>
						</tr>
						<tr onclick="window.document.location='#';">
							<td>【转交】用户留言转交问题</td>
							<td>2017-7-1</td>
						</tr>
					</table>
			</form>
		</div>
	</div>
</body>
</html>