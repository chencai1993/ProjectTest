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
	href="${basePath}semantic/dist/semantic.min.css">
<script src="${basePath}semantic/dist/assets/library/jquery.min.js"></script>
<script src="${basePath}semantic/dist/semantic.min.js"></script>
</head>

<body>

	
		
	<div id="middle-content-table">
	
	    <c:if test="${requestScope.admins!=null}">
	    
		<table class="ui table">
			<thead>
				<tr>
					<th>账号名</th>
					<th>密码</th>
					<th>使用者</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.admins}" var="admin">
					<tr>
						<td>${admin.username}</td>
						<td>${admin.password}</td>
						<td>${admin.owner}</td>
						<td>
							
							<div class="ui button" onclick="deleteuser('${admin.adminid}')">
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
		</c:if>

	</div>

	<script language="javascript" type="text/javascript"> 
	function deleteuser(adminid)
	{
		window.location.href="${basePath}admin/delete.action?adminid="+adminid;
	}
	</script>
</body>
</html>
