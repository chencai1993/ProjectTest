<%@ page language="java" import="java.util.*,cn.table.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'QueryStaff.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="semantic/dist/semantic.min.css">
<script src="semantic/dist/assets/library/jquery.min.js"></script>
<script src="semantic/dist/semantic.min.js"></script>
</head>

<body>

	<form class="ui form" action="user/querystaff.action" method="post">
		<div class="three fields">
			<div class="field">
				<input type="text" name="userno" placeholder="员工号">
			</div>
			<div class="field">
				<input type="text" name="name" placeholder="姓名">
			</div>
			<div class="field">
				<input class="ui submit button" type="submit" value="查询" />
			</div>
		</div>
	</form>
	<div id="middle-content-table">
		<table class="ui table">
			<thead>
				<tr>
					<th>员工编号</th>
					<th>姓名</th>
					<th>账号名</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.users}" var="user">
					<tr>
						<td>${user.userno}</td>
						<td>${user.name}</td>
						<td>${user.username}</td>
						<td>${user.phone}</td>
						<td>
							<div class="ui button" onclick="modify('${user.userid}')">
								<i class="edit icon"></i> 修改
							</div>

							<div class="ui button" onclick="deleteuser('${user.userid}')">
								<i class="remove icon"></i> 删除
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui borderless pagination menu">
			<a class="item"> <i class="left arrow icon"></i> 上一页 </a> <a
				class="item">1</a> <a class="item">2</a> <a class="item">3</a> <a
				class="item">4</a> <a class="item">5</a> <a class="item">6</a> <a
				class="item"> 下一页 <i class="icon right arrow"></i> </a>
		</div>
	</div>

	<script language="javascript" type="text/javascript"> 
	function modify(userid)
	{
		window.location.href="user/modify.action?userid="+userid;
	}
	function deleteuser(userid)
	{
		window.location.href="user/delete.action?userid="+userid;
	}
	</script>
</body>
</html>
