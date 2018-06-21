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
<title>登录-欢迎来到怀化学院工资管理系统</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">

		<div class="row ">
			<div class="page-header">
				<h2 class="text-center">
					<img src="${APP_PATH }/static/img/logo.PNG"/>怀化学院工资管理系统
				</h2>

				<p class="text-center">
					如未注册请点击 <a class="btn btn-primary btn-sm" href="${APP_PATH }/toRegister" role="button">注册</a>
				</p>
			</div>

			<form action="${APP_PATH }/check" , method="post">
				<div class="col-md-6 col-md-offset-3 col-xs-8 col-xs-offset-2">
					<h2 class="form-signin-heading ">登录</h2>
					<br />
					<div >
						<ul class="nav  nav-tabs">
						<li id="1" class="li active" role="presentation">
							<a>super管理员登录</a>
						</li>
						<li id="2"  class="li" role="presentation">
							<a>院系管理员登录</a>
						</li>
						<li id="3"  class="li" role="presentation">
							<a>教师登录</a>
						</li>
						<input id="hidden_li_in" name="u" type="hidden" value="1">
					</ul>
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon" id="sizing-addon2">&nbsp;@&nbsp&nbsp;</span>
						<input name="userId" type="text" class="form-control" placeholder="请输入账号"
							aria-describedby="sizing-addon2">
					</div>
					<br />
					<div class="input-group">
						<span class="input-group-addon" id="sizing-addon2">密码</span> 
						<input name="password" type="password" class="form-control" placeholder="请输入密码" aria-describedby="sizing-addon2">
					</div>
					<br /> 
					<label class="checkbox text-right">
						<button class="btn btn-large btn-default m" type="submit ">
							<span class="glyphicon glyphicon glyphicon-share-alt" aria-hidden="true"></span>登录
						</button>
						&nbsp;&nbsp;
					</label>
				</div>
			</form>
		</div>
		<div class="text-center">
		<font color="red" >
			<span >${msg}</span>
		</font>
		</div>

	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${APP_PATH }/static/js/jquery-1.11.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script
		src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/static/js/login.js"></script>

</body>

</html>