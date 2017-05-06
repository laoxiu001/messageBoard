<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专业分数查看-结果</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet" href="CSS/main.css">
<!--图表JS插件-->
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
</head>
<body>
	<div class="top">
		<div class="pull-left">
			<a href="index.jsp"><img src="img/back.png" alt="点我返回"></a>
		</div>
		<div class="center-block" style="width: 200px;">
			<a>统计信息</a>
		</div>
	</div>
	<div class="text-center">
		<h3>XX专业报考及录取人数</h3>
	</div>
	<div id="chart" style="width: 100%; height: 400px;"></div>
	<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('chart'));
    option = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data:['报考人数','录取人数']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : <%=request.getAttribute("year")%>
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'报考人数',
                type:'bar',
                data:<%=request.getAttribute("plan")%>
            },
            {
                name:'录取人数',
                type:'bar',
                data:<%=request.getAttribute("plan")%>
            }
        ]
    };
    myChart.setOption(option);
</script>

<div class="table-striped table-hover table-responsive">
		<table class="table-striped table-hover">
		<tr>
			<td><strong>专业</strong></td>
			<td><strong>最低分</strong></td>
			<td><strong>最高分</strong></td>
			<td><strong>线差</strong></td>
			<td><strong>年份</strong></td>
			<td><strong>年份</strong></td>
			<td><strong>年份</strong></td>
			<td><strong>年份</strong></td>
			<td><strong>年份</strong></td>
			<td><strong>年份</strong></td>
		</tr>
		<tr>
			<td>汉语言文学（师范）</td>
			<td>537</td>
			<td>547</td>
			<td>1212</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
		</tr>
		<tr>
			<td>汉语言文学（现代文秘）</td>
			<td>534</td>
			<td>527</td>
			<td>1312</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
		</tr>
		<tr>
			<td>数学与应用数学（师范）</td>
			<td>537</td>
			<td>545</td>
			<td>1232</td>
			<td>2011</td>
			<td>2011</td>
			<td>2011</td>
			<td>2011</td>
			<td>2011</td>
			<td>2011</td>
		</tr>
		<tr>
			<td>经济统计学</td>
			<td>527</td>
			<td>537</td>
			<td>312</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
			<td>2014</td>
		</tr>
		<tr>
			<td>汉语言文学（师范）</td>
			<td>537</td>
			<td>547</td>
			<td>1212</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
			<td>2013</td>
		</tr>
		<tr>
			<td>财务管理</td>
			<td>533</td>
			<td>523</td>
			<td>122</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
		</tr>
		<tr>
			<td>制药工程</td>
			<td>543</td>
			<td>545</td>
			<td>1434</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
			<td>2016</td>
		</tr>
	</table>
</div>



	<div class="text-center">
		<h3>XX专业录取分数统计</h3>
	</div>
	<div id="chart2" style="width: 100%; height: 400px;"></div>
	<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('chart2'));
    option = {
    	    tooltip: {
    	        trigger: 'axis'
    	    },
    	    legend: {
    	        data:['平均分数','控制线','线差']
    	    },
    	    grid: {
    	        left: '3%',
    	        right: '4%',
    	        bottom: '3%',
    	        containLabel: true
    	    },
    	    toolbox: {
    	        feature: {
    	            saveAsImage: {}
    	        }
    	    },
    	    xAxis: {
    	        type: 'category',
    	        boundaryGap: false,
    	        data: ['2013','2014','2015','2016']
    	    },
    	    yAxis: {
    	        type: 'value'
    	    },
    	    series: [
    	        {
    	            name:'平均分数',
    	            type:'line',
    	            data:[520, 532, 501, 534]
    	        },
    	        {
    	            name:'控制线',
    	            type:'line',
    	            data:[520, 582, 591, 534]
    	        },
    	        {
    	            name:'线差',
    	            type:'line',
    	            data:[50, 57, 81, 70]
    	        }
    	    ]
    	};
    myChart.setOption(option);
</script>
	<a href="index.jsp">index</a>
</body>
</html>