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

	<form class="ui form" action="${basePath}user/querypaging.action" method="post">
		<div class="three fields">
			<div class="field">
				<input type="text" name="userno" placeholder="员工号" value="${userno}">
			</div>
			<div class="field">
				<input type="text" name="name" placeholder="姓名" value="${name}">
			</div>
			<div class="field">
				<input class="ui submit button" type="submit" value="查询" />
			</div>
		</div>
	</form>
	<c:if test="${requestScope.users!=null}">

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
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<div class="ui borderless pagination menu">
					<a class="item" onclick="query(${pager.currentpage-1})"> <i
						class="left arrow icon"></i> 上一页 </a>

					<c:if test="${pager.totalpagesize<=7}">
						<c:forEach var="i" begin="1" end="${pager.totalpagesize}">
							<a class="item" onclick="query(${i})"><c:out value="${i}" />
							</a>
						</c:forEach>
					</c:if>


					<c:if test="${pager.totalpagesize>7}">

						<c:forEach var="i" begin="1" end="3">
							<a class="item" onclick="query(${i})"><c:out value="${i}" />
							</a>
						</c:forEach>

						<a class="item">...</a>
						<a class="item">${pager.currentpage}/${pager.totalpagesize}</a>
						<a class="item">...</a>


						<c:forEach var="i" begin="${ pager.totalpagesize-2}"
							end="${pager.totalpagesize}">
							<a class="item" onclick="query(${i})"><c:out value="${i}" />
							</a>
						</c:forEach>
					</c:if>

					<a class="item" onclick="query(${pager.currentpage+1})"> 下一页 <i
						class="icon right arrow"></i> </a>
				</div>
			</div>
		</div>
	</c:if>

	<script language="javascript" type="text/javascript">
		function query(currentpage) {
			window.location.href = "${basePath}user/querypaging.action?currentpage="
					+ currentpage;
		}
		function modify(userid) {
			window.location.href = "${basePath}user/modify.action?userid="
					+ userid;
		}
		function deleteuser(userid) {
			window.location.href = "${basePath}user/delete.action?userid="
					+ userid;
		}
	</script>
</body>
</html>
