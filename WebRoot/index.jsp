<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="${basePath}semantic/dist/semantic.min.css">
<script src="${basePath}semantic/dist/assets/library/jquery.min.js"></script>
<script src="${basePath}semantic/dist/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="${basePath}basic.css">
</head>

<body>
	<div id="main">
		<div id="top">
			<div id="top-left">
				<div id="titlename">员工考勤管理系统</div>
			</div>
			<div id="top-right">
				<table>
					<tr>
						<td><img src="New_Master_1_files/u99_normal.png"></img> <span>用户单位：XX</span>
						</td>
						<td><img src="New_Master_1_files/u252_normal.png"></img> <span
							id="datetime"></span>
						</td>
					</tr>
					<tr>
						<td><img src="New_Master_1_files/u94_normal.png"></img> <span
							style="vertical-align:40%;color:#fff">操作员：谢彤</span>
						</td>
						<td><img src="New_Master_1_files/u91_normal.png"></img> <span>退出</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="middle">
			<div id="menu-breadcrumb">
				<div class="ui breadcrumb">
					<a class="section">主页</a> <i class="right chevron icon divider"></i>
					<a class="section">注册</a> <i class="right chevron icon divider"></i>
					<div class="active section">个人信息</div>
				</div>
			</div>
			<div id="middle-menu">
				<div id="menu" class="ui styled accordion">
					<div class="active content">
						<div class="accordion">
							<div class="active title">
								<i class="dropdown icon"></i> 系统用户管理
							</div>
							<div class="active content">
								<div class="accordion">
									<div class="content">
										<a href="${basePath}admin/register.jsp" target="content">管理员添加</a>
									</div>
									<div class="content">
										<a href="${basePath}admin/query.action" target="content">管理员查询</a>
									</div>
									
								</div>
							</div>
							<div class="active title">
								<i class="dropdown icon"></i>部门职位管理
							</div>
							<div class="active content">
								<div class="accordion">
									<div class="content">
										<a href="立案管理_iframe.html" target="content">部门添加</a>
									</div>
									<div class="content">
										<a href="案件办理_iframe.html" target="content">部门查询</a>
									</div>
									<div class="content">
										<a href="#">职位添加</a>
									</div>
									<div class="content">
										<a href="综合查询_iframe.html" target="content">职位查询</a>
									</div>

								</div>
							</div>
							<div class="active title">
								<i class="dropdown icon"></i> 员工管理
							</div>
							<div class="active content">
								<div class="accordion">
									<div class="content">
										<a href="${basePath}staff/register.jsp" target="content">员工添加</a>
									</div>
									<div class="content">
										<a href="${basePath}user/query.action" target="content">员工查询</a>
									</div>
								</div>
							</div>
							<div class="active title">
								<i class="dropdown icon"></i>考勤管理
							</div>
							<div class="active content">
								<div class="accordion">
									<div class="content">
										<a href="#">考勤计划管理</a>
									</div>
									<div class="content">
										<a href="#">考勤记录查询</a>
									</div>

								</div>
							</div>
							<div class="active title">
								<i class="dropdown icon"></i> 请假管理
							</div>
							<div class="active content">
								<div class="accordion">
									<div class="content">
										<a href="#">请假申请</a>
									</div>
									<div class="content">
										<a href="#">请假记录查询</a>
									</div>

								</div>
							</div>

							<div class="active title">
								<i class="dropdown icon"></i> 公休假管理
							</div>
							<div class="active content">
								<div class="accordion">
									<div class="content">
										<a href="#">个人公休假查询</a>
									</div>
									<div class="content">
										<a href="#">公休假设置</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="middle-content">
				<iframe name="content" scrolling="no"
					style="width: 100%;height: 1000px;border:0" src="${basePath}staff/register.jsp">

				</iframe>
			</div>
		</div>

		<div id="bottom"></div>
	</div>

	<script>
		function showLeftTime() {
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var day = now.getDate();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var seconds = now.getSeconds();
			$('#datetime').text(
					"" + year + "年" + month + "月" + day + "日 " + hours + ":"
							+ minutes + ":" + seconds + "");
			var timeID = setTimeout(showLeftTime, 1000);
		}

		$(document).ready(function() {
			$('.ui.accordion').accordion();
			showLeftTime();
		});
	</script>

</body>
</html>
