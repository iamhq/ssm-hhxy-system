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
<title>院系管理员</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"	rel="stylesheet">
</head>
<body>

<!-- 增加管理员的Modal -->
<div class="modal fade" id="teacherAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog row" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" >添加教师</h3>
      </div>
      <div>&nbsp</div>
      <div class="modal-body">
     	 <form role="form">
     	 <div class="form-group top">
			<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
			<div class="col-md-10 col-sm-10">
				<input type="text" class="form-control" id="in_name" placeholder="请输入教师姓名">
				<span class="help-block"></span>
			</div>
		 </div>
		<div>&nbsp</div>
		<div class="form-group top">
			<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
				<div class="col-md-10 col-sm-10">
					<input type="password" class="form-control" id="in_pass" placeholder="请输入密码"/>
					<span class="help-block"></span>
				</div>
		</div>
		<div class="">&nbsp</div>
		<div class="form-group top">
			<label for="name" class="col-sm-2 control-label">选择院系</label> 
			<div class="col-md-10 col-sm-10">
				<select class="form-control" id="select_depts">
					<option>计算机科学与技术学院</option>
					<option>2</option>
				</select>
			</div>
		</div>
		<div>&nbsp</div>
		</form>
	 </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="add_btn">添加</button>
      </div>
    </div>
  </div>
</div>

<!-- 修改管理员的Modal -->
<div class="modal fade" id="teacherUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog row" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="update-h3">修改教师</h3>
      </div>
      <div>&nbsp</div>
      <div class="modal-body" >
     	 <form role="form" id="update-form"">
     	 <div class="form-group top">
			<label for="inputEmail3" class="col-sm-2 control-label">修改用户名</label>
			<div class="col-md-10 col-sm-10">
				<input name="teacherName"  type="text" class="form-control" id="in_name2" placeholder="请输入要修改的管理员姓名">
				<span class="help-block"></span>
			</div>
		 </div>
		<div>&nbsp</div>
		<input id="update-hidden-in" name="teacherId" type="hidden">
		<div class="form-group top">
			<label for="inputPassword3" class="col-sm-2 control-label">修改密码</label>
				<div class="col-md-10 col-sm-10">
					<input name="teacherPassword" type="password" class="form-control" id="in_pass2" placeholder="请输入新密码"/>
					<span class="help-block"></span>
				</div>
		</div>
		<div class="">&nbsp</div>
		<div class="form-group top">
			<label for="name" class="col-sm-2 control-label">重新选择院系</label> 
			<div class="col-md-10 col-sm-10">
				<select name="teacherDepartmentId" class="form-control" id="select_depts2">
					<option>计算机科学与技术学院</option>
					<option>2</option>
				</select>
			</div>
		</div>
		<div>&nbsp</div>
		</form>
	 </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="update_btn">修改</button>
      </div>
    </div>
  </div>
</div>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2 class="text-center">
					<img src="${APP_PATH }/static/img/logo.PNG " />院系管理员
				</h2>
			</div>
			<h4>操作教师</h4>
			<div class="panel panel-default">
			</div>
			<div class="col-md-12 col-xs-12">
				<table class="table table-hover " id="teachers_table">
					<thead>
						<tr class="info " >
							<td class="col-md-1 col-xs-1 text-right">
								<input type="checkbox" id="checkbox_all">
							</td>
							<td>教师ID</td>
							<td>教师用户名</td>
							<td>所在部门</td>
							<td>邮箱</td>
							<td>工资</td>
							<td>编辑</td>
							<td>删除</td>
						</tr>
					</thead>
					<tbody></tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
				</table>
				<p id="page_info_area"></p>
			</div>
			<nav aria-label="Page navigation" id="page_nav" class="text-center">
				<ul class="pagination">
				</ul>
			</nav>

		</div>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${APP_PATH }/static/js/jquery-1.11.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/static/js/m3.js"></script>
</body>

</html>