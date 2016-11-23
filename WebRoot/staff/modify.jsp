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

<title>My JSP 'Register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" type="text/css"
	href="${basePath}semantic/dist/semantic.min.css">
<script src="${basePath}semantic/dist/assets/library/jquery.min.js"></script>
<script src="${basePath}semantic/dist/semantic.min.js"></script>

</head>

<body>
	<div style="width:90%;margin: 50 auto ">
		<form class="ui form" action="${basePath}user/modifysubmit.action" method="post">
			<h4 class="ui dividing header">个人信息</h4>

			<div class="two fields">
				<div class="field">
					<label>姓名</label>

					<div class="field">
						<input type="text" disabled="disabled"
							value="${user.name}">
					</div>
				</div>

				<div class="field">
					<label>员工编号</label>

					<div class="field">
						<input type="text"  disabled="disabled" value="${user.userno}">
						<input type="hidden" name="userno" value="${user.userno}">
						<input type="hidden" name="userid" value="${user.userid}">
					</div>

				</div>
			</div>
			<div class="two fields">

				<div class="field">
					<label>手机号码</label>

					<div class="field">
						<input type="text" name="phone" placeholder="手机号码"
							value="${user.phone}">
					</div>
				</div>
				<div class="field">
					<label>职位</label> <select class="ui dropdown" name="postid"
						value="${user.postid}">
						<option value="1">职位1</option>
						<option value="2">职位2</option>
					</select>
				</div>
				<div class="field"></div>
			</div>
			<h4 class="ui dividing header">账号信息</h4>

			<div class="two fields">
				<div class="required field">
					<label>用户名</label>

					<div class="ui icon input">
						<input type="text" placeholder="用户名" disabled="disabled"
							value="${user.username}"> <i
							class="user icon"></i>
					</div>
					<input type="hidden" name="username" value="${user.username}">
				</div>
				<div class="required field">
					<label>密码</label>

					<div class="ui icon input">
						<input type="password" name="password" value="${user.password}">
						<i class="lock icon"></i>
					</div>
				</div>
			</div>

			<div class="ui hidden divider"></div>


			<input class="ui submit button" type="submit" value="提交" />
		</form>
	</div>
	<script>
		$('.ui.dropdown').dropdown();
	</script>

</body>
</html>
