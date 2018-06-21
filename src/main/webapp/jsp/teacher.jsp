<%@page
	import="org.omg.PortableInterceptor.USER_EXCEPTION,cn.hqisgood.bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>教师-首页</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">


<script>
	
</script>
</head>
<body>

	<div class="modal fade" id="edit_model" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog row" role="document">
			<div class="modal-content ">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title">修改密码</h3>
				</div>
				<div>&nbsp</div>

				<div class="form-group top">
					<label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
					<div class="col-md-10 col-sm-10">
						<input type="password" class="form-control" id="in_pass"
							placeholder="请输入密码" /> <span class="help-block"></span>
					</div>
				</div>
				<div>&nbsp</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="add_btn">修改</button>
				</div>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="row text-center">
			<div class="page-header">
				<h3 class="text-center">
					<img src="${APP_PATH }/static/img/logo.PNG " />教师
				</h3>
			</div>
			<div class="col-md-12 col-sm-12 text-right">
				<%
					Teacher username = (Teacher) session.getAttribute("USER");
				%>
				<h5>
					在线用户：<%=username.getTeacherName()%>&nbsp <a
						href="${APP_PATH }/toLogin"><button
							class="btn btn-info btn-sm" id="exit">退出登录</button></a>
				</h5>
			</div>
			<div class="jumbotron">
				<h1><%=username.getTeacherName()%></h1>
				<p>
					邮箱：<%=username.getTeacherEmail()%></p>
				<p>
					部门ID：<span id="p_dept_id"><%=username.getManagerDepartmentId()%></span>
				</p>
				<p>
					部门：<span id="p_dept"></span>
				</p>
				<p>
					薪水：<%=username.getTeacherSalary()%></p>

			</div>
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${APP_PATH }/static/js/jquery-1.11.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script
		src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/static/js/teacher.js"></script>
</body>
</html>