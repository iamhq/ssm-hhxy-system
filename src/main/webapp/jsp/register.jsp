<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/register.css">
<title>注册</title>

</head>
<body>
	<div class="container">
		<div class="row text-center">
			<div class="page-header">
				<h2 class="text-center">
					<img src="${APP_PATH }/static/img/logo.PNG"/>怀化学院工资管理系统
				</h2>
			</div>
			<div id="out" class="col-md-10 col-sm-12 ">
				<form action="${APP_PATH }/register" role="form" name="r"  method="post" onsubmit="return check()">
					<div class="form-group top">
						<label for="inputEmail3" class="col-sm-2 control-label">账号</label>
						<div class="col-md-10 col-sm-10">
							<input name="teacherId" type="text" class="form-control" id="in_id"
								placeholder="请输入账号"> <span class="help-block"></span>
						</div>
					</div>
					<div class="form-group top">
						<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
						<div class="col-md-10 col-sm-10">
							<input name="teacherName" type="text" class="form-control" id="in_name"
								placeholder="请输入姓名"> <span class="help-block"></span>
						</div>
					</div>
					<div>&nbsp</div>
					<div class="form-group top">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-md-10 col-sm-10">
							<input name="teacherPassword" type="password" class="form-control" id="in_pass"
								placeholder="请输入密码" /> <span class="help-block"></span>
						</div>
					</div>
					<div class="">&nbsp</div>
					<div class="form-group top">
						<label for="name" class="col-sm-2 control-label">选择院系</label>
						<div class="col-md-10 col-sm-10">
							<select name="managerDepartmentId" class="form-control" id="select_depts">
								<option>计算机科学与技术学院</option>
								<option>2</option>
							</select>
						</div>
					</div>
					<div class="">&nbsp</div>
					<div class="form-group top">
						<label for="name" class="col-sm-2 control-label">输入邮箱</label>
						<div class="col-md-10 col-sm-10">
							<input name="teacherEmail" type="email" class="form-control" id="in_email"
								placeholder="请输入邮箱" />
							<span class="help-block"></span>
						</div>
					</div>
					<div>&nbsp</div>
					<input id="register" type="submit" class="btn btn-info" value="注册">
				</form>
				
			</div>
		</div>
	
	</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${APP_PATH }/static/js/jquery-1.11.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/static/js/r.js"></script>
</body>
</html>
