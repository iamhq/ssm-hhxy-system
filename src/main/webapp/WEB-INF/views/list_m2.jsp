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
					<thead>
						<tr class="info">
							<td>管理员ID</td>
							<td>管理员用户名</td>
							<td>所在部门</td>
							<td>编辑</td>
							<td>删除</td>
						</tr>
					</thead>
					<tbody>
						
					</tbody>


					<tfoot>
						<tr>
							<td>
								<p>第${pageInfo.pageNum}页，总${pageInfo.pages }页，总${pageInfo.total }记录</p>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tfoot>
				</table>

			</div>

		</div>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${APP_PATH }/static/js/jquery-1.11.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script
		src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "${APP_PATH}/managers",
				data : "pn=1",
				type : "GET",
				success : function(result) {
					//解析员工数据
					build_managers_table(result);
					//解析分页信息
				}

			});
		});

		function build_managers_table(result) {
			var managers = result.extend.pageInfo.list;
			$.each(managers, function(index, item)){
				var managersIdTd = $("<td></td>").append(item. managersId);
				var managerNameTd = $("<td></td>").append(item. managerName);
				var managersIdTd = $("<td></td>").append(item. department.departmentName);
				$("<tr></tr>").append();
			}
		}

		function build_managers_nav() {

		}
	</script>
</body>

</html>