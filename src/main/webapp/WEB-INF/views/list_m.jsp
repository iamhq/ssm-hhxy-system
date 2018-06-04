<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员</title>
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<div class="container">

		<div class="row ">
			<div class="page-header">
				<h2 class="text-center">
					<img src="${APP_PATH }/static/img/logo.PNG " />管理员列表
				</h2>
			</div>
			<div class="col-md-12 col-xs-12">
				<table class="table table-hover">
					<tr class="info">
						<td>管理员ID</td>
						<td>管理员用户名</td>
						<td>所在部门</td>
						<td>编辑</td>
						<td>删除</td>
					</tr>
					<c:forEach items="${ pageInfo.list}" var="m">

						<tr>
							<td>${m.managerId}</td>
							<td>${m.managerName}</td>
							<td>${m.department.departmentName}</td>
							<td>
								<button class="btn btn-primary btn-xs">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
								</button>
							</td>
							<td>
								<button class="btn btn-danger btn-xs">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>编辑
								</button>
							</td>
						</tr>
					</c:forEach>

					<tr>
						<td>
							<p>第${pageInfo.pageNum}页，总${pageInfo.pages }页，总${pageInfo.total }记录</p>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						
					</tr>
				</table>
				<div class="row">
					<nav aria-label="Page navigation" class="text-center">
					<ul class="pagination">

						<li><a href="${APP_PATH }/managers?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a
								href="${APP_PATH }/managers?pn=${pageInfo.pageNum - 1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>


						<c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
							<c:if test="${page_num == pageInfo.pageNum}">
								<li class="active"><a href="#">${page_num}</a></li>
							</c:if>
							<c:if test="${page_num != pageInfo.pageNum}">
								<li><a href="${APP_PATH }/managers?pn=${page_num}">${page_num}</a></li>
							</c:if>

						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a
								href="${APP_PATH }/managers?pn=${pageInfo.pageNum + 1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>

						<li><a href="${APP_PATH }/managers?pn=${pageInfo.pages}">末页</a></li>
					</ul>
					</nav>
				</div>

			</div>
		</div>

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<script src="${APP_PATH }/static/js/jquery-1.11.3.min.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<script
			src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>

</html>