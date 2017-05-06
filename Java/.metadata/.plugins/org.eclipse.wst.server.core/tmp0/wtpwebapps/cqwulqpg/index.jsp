<%@page import="message.domain.AdmissionInformation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="message.dao.impl.AdmissionInformationDaoImpl"%>
<%@page import="java.util.LinkedList"%>
<%@page import="message.dao.AdmissionInformationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专业分数查看-首页</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件(一般不用引入) -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet" href="CSS/main.css">
</head>
<body>
	<div class="top">
		<a>请输入您的高考信息</a>
	</div>

	<div id="info">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath }/ServletList" method="post">
				<fieldset class="form-group">
					<label>生源地：</label> <select class="form-control" name="location">
						<option value="">--请选择--</option>
						<option value="云南">云南</option>
						<option value="内蒙">内蒙</option>
						<option value="北京">北京</option>
						<option value="四川">四川</option>
						<option value="宁夏">宁夏</option>
						<option value="安徽">安徽</option>
						<option value="山东">山东</option>
						<option value="山西">山西</option>
						<option value="广东">广东</option>
						<option value="广西">广西</option>
						<option value="新疆">新疆</option>
						<option value="江苏">江苏</option>
						<option value="江西">江西</option>
						<option value="河北">河北</option>
						<option value="河南">河南</option>
						<option value="浙江">浙江</option>
						<option value="海南">海南</option>
						<option value="湖北">湖北</option>
						<option value="湖南">湖南</option>
						<option value="甘肃">甘肃</option>
						<option value="福建">福建</option>
						<option value="西藏">西藏</option>
						<option value="贵州">贵州</option>
						<option value="辽宁">辽宁</option>
						<option value="重庆">重庆</option>
						<option value="陕西">陕西</option>
						<option value="黑龙江">黑龙江</option>
					</select>
				</fieldset>

				<fieldset class="form-group">
					<label>文理科</label> <select class="form-control" name="type">
						<option value="文">文科</option>
						<option value="理">理科</option>
					</select>
				</fieldset>

				<fieldset class="form-group">
					<label>查询专业：</label> <select class="form-control" name="major">
						<option value="">--请选择--</option>
						<option value="会展经济与管理">会展经济与管理</option>
						<option value="体育教育(师范)">体育教育(师范)</option>
						<option value="信息与计算科学(金融软件)">信息与计算科学(金融软件)</option>
						<option value="信息工程">信息工程</option>
						<option value="制药工程">制药工程</option>
						<option value="动画">动画</option>
						<option value="化学工程与工艺">化学工程与工艺</option>
						<option value="化学(师范)">化学(师范)</option>
						<option value="园林">园林</option>
						<option value="园林(景观设计)">园林(景观设计)</option>
						<option value="学前教育(师范)">学前教育(师范)</option>
						<option value="学前教育(师范)对口本科">学前教育(师范)对口本科</option>
						<option value="小学教育(全科教师)">小学教育(全科教师)</option>
						<option value="少数民族本科预科">少数民族本科预科</option>
						<option value="工商管理">工商管理</option>
						<option value="工商管理(旅游管理)">工商管理(旅游管理)</option>
						<option value="工商管理(旅游管理) 对口本科">工商管理(旅游管理) 对口本科</option>
						<option value="工商管理(物流管理)">工商管理(物流管理)</option>
						<option value="工商管理(酒店管理)">工商管理(酒店管理)</option>
						<option value="工程管理">工程管理</option>
						<option value="工程管理(工程造价)">工程管理(工程造价)</option>
						<option value="广播电视编导">广播电视编导</option>
						<option value="广播电视编导(文化遗产传播)">广播电视编导(文化遗产传播)</option>
						<option value="应用心理学">应用心理学</option>
						<option value="思想政治教育(师范)">思想政治教育(师范)</option>
						<option value="数学与应用数学(师范)">数学与应用数学(师范)</option>
						<option value="数学与应用数学(金融数学">数学与应用数学(金融数学)</option>
						<option value="服装设计与工程">服装设计与工程</option>
						<option value="机械工程">机械工程</option>
						<option value="机械工程对口本科">机械工程对口本科</option>
						<option value="机械电子工程">机械电子工程</option>
						<option value="材料成型及控制工程">材料成型及控制工程</option>
						<option value="汉语言文学(师范)">汉语言文学(师范)</option>
						<option value="汉语言文学(现代文秘)">汉语言文学(现代文秘)</option>
						<option value="法学">法学</option>
						<option value="环境科学(环境治理工程)">环境科学(环境治理工程)</option>
						<option value="环境设计">环境设计</option>
						<option value="生物科学(师范)">生物科学(师范)</option>
						<option value="电子信息科学与技术">电子信息科学与技术</option>
						<option value="电子信息科学与技术(微电子制造工程)">电子信息科学与技术(微电子制造工程)</option>
						<option value="电子信息科学与技术对口本科">电子信息科学与技术对口本科</option>
						<option value="电气工程与自动化">电气工程与自动化</option>
						<option value="社会体育指导与管理(保健康复)">社会体育指导与管理(保健康复)</option>
						<option value="社会体育指导与管理">社会体育指导与管理</option>
						<option value="经济统计学">经济统计学</option>
						<option value="网络工程">网络工程</option>
						<option value="网络工程(物联网技术)">网络工程(物联网技术)</option>
						<option value="美术学">美术学</option>
						<option value="舞蹈学(师范)">舞蹈学(师范)</option>
						<option value="英语(商务英语)">英语(商务英语)</option>
						<option value="英语(师范)">英语(师范)</option>
						<option value="行政管理">行政管理</option>
						<option value="行政管理对口本科">行政管理对口本科</option>
						<option value="视觉传达设计">视觉传达设计</option>
						<option value="计算机科学与技术对口本科">计算机科学与技术对口本科</option>
						<option value="财务管理">财务管理</option>
						<option value="软件工程">软件工程</option>
						<option value="金属材料工程">金属材料工程</option>
						<option value="音乐学(师范)">音乐学(师范)</option>
						<option value="音乐学(师范)">音乐学(师范)</option>
						<option value="音乐学(音乐表演)">音乐学(音乐表演)</option>
						<option value="风景园林">风景园林</option>
						<option value="食品科学与工程">食品科学与工程</option>
						<option value="高分子材料与工程">高分子材料与工程</option>
					</select>
				</fieldset>

				<button type="submit" class="btn btn-success form-control">提交</button>
			</form>
		</div>
	</div>

	<a href="result.jsp">result</a>

	<div class="bottom" style="margin-top: 200px">
		<a>各省各批次录取最低分请查询招生信息网</a> <a href="http://zb.cqwu.net">http://zb.cqwu.net</a></br>
		<a>咨询电话：023-49891968 49891969</a>
	</div>
</body>
</html>