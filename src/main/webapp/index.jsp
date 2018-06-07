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
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- Bootstrap -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"	rel="stylesheet">
</head>
<body>

<!-- 增加员工的Modal -->
<div class="modal fade" id="managerAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog row" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
      </div>
      <div>&nbsp</div>
      
      
      <div class="modal-body">
     	 <form role="form">
     	 <div class="form-group top">
			<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
			<div class="col-md-10 col-sm-10">
				<input type="email" class="form-control" id="in_name" placeholder="请输入管理员姓名">
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
				<select class="form-control" id="select_dept">
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


	<div class="container">

		<div class="row ">
			<div class="page-header">
				<h2 class="text-center">
					<img src="${APP_PATH }/static/img/logo.PNG " />管理员列表
				</h2>
			</div>
			<div class="panel panel-default">
				<div class="panel-body text-right">
					<button class="btn btn-primary text-center" id="manager_add_btn">
						<span class="glyphicon glyphicon-plus" aria-hidden="true" >新增</span>
					</button>
				</div>
			</div>
			
			<div class="col-md-12 col-xs-12">
				<table class="table table-hover" id="managers_table">
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
							<td >
								<p id="page_info_area"></p>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tfoot>
				</table>

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
	<script type="text/javascript">
		$(function() {
			to_page(1);
		});
		
		//跳到指定页
		function to_page(pn){
			$("#page_info_area").empty();
			$("#managers_table tbody").empty();
			$("#page_nav ul").empty();
			
			$.ajax({
				url : "${APP_PATH}/managers",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					var pageInfo = result.extend.pageInfo;
					//解析显示员工数据
					build_managers_table(pageInfo);
					//解析分页信息
					build_managers_info(pageInfo);
					//显示分页nav
					build_managers_nav(pageInfo);
				}
			});
		}
		//跳到最后一页
		function to_lastPage(){
			$.ajax({
				url : "${APP_PATH}/managers",
				type : "GET",
				success : function(result) {
					var pn = result.extend.pageInfo.pages;
					var total = result.extend.pageInfo.total;
					to_page(pn);
				}
			});
		}

		//解析显示员工数据
		function build_managers_table(pageInfo) {
			var managers = pageInfo.list;
			$.each(managers, function(index, item) {
				var managersIdTd = $("<td></td>").append(item.managerId);
				var managerNameTd = $("<td></td>").append(item.managerName);
				var departmentNameTd = $("<td></td>").append(
						item.department.departmentName);
				var editBtn = $("<td></td>")
									.append($("<button></button>").addClass("btn btn-primary btn-xs")
						      		.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
						     		.append("编辑"));
				var delBtn = $("<td></td>")
									.append($("<button></button>").addClass("btn btn-danger btn-xs")
									.append($("<span></span>").addClass("glyphicon glyphicon-remove"))
									.append("删除"));
				$("<tr></tr>").append(managersIdTd).append(managerNameTd)
						.append(departmentNameTd).append(editBtn)
						.append(delBtn).appendTo("#managers_table tbody");
			});
		}
		
		//解析分页信息
		function build_managers_info(pageInfo){
			var pages = pageInfo.pages;
			var pageNum = pageInfo.pageNum;
			var total = pageInfo.total;
			$("#page_info_area").append("第"+ pageNum +"页，总" + pages + "页，总" + total + "记录");
		}

		//显示分页nav
		function build_managers_nav(pageInfo) {
			var ul = $("#page_nav ul")
			var navigatepageNums = pageInfo.navigatepageNums;
			var pages = pageInfo.pages;
			var pageNum = pageInfo.pageNum;
			var hasNextPage = pageInfo.hasNextPage;
			var hasPreviousPage = pageInfo.hasPreviousPage;
			
			//构建Li
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var pagesLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
			
			//显示分页nav
			ul.append(firstPageLi);
			ul.append(prePageLi);
            $.each(navigatepageNums, function(index, item){
            	var numPageLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            	ul.append(numPageLi);
            	if (pageNum !== item){
            		//绑定事件
            		numPageLi.click(function(){
                		to_page(item);
                	});
            	}else{
            		numPageLi.addClass("active");
            	}
			});
			ul.append(nextPageLi);
			ul.append(pagesLi);
			
			//Li绑定事件
			if (hasPreviousPage) {
				prePageLi.click(function(){
					to_page(pageNum - 1);
				});
			}
			if (hasNextPage) {
				nextPageLi.click(function(){
					to_page(pageNum + 1);
				});
			}
			if (pageNum !== 1){
				firstPageLi.click(function(){
					to_page(1);
				});
			}
			if (pageNum !== pages){
				pagesLi.click(function(){
					to_page(pages);
				});
			}
		}
		
		//增加按钮点击事件,模态框显示
		$("#manager_add_btn").click(function(){
			$("#managerAddModal").modal({
			});
			build_modal_select();
		});
		
		function build_modal_select(){
			//获得部门信息，显示
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "POST",
				success : function(result) {
					var select = $("#select_dept");
					select.empty();
					$.each(result.extend.depts, function(index, item){
						var opt = $("<option></option>").append(item.departmentName).attr("value", item.departmentId);
						opt.appendTo(select);
					});
				}
			});
			
		}
		
		$("#add_btn").click(function(){
			//1,校验表单数据
			if (!validate_add_form()){
				return;
			};
			
			//验证通过发送请求
			var username = $("#in_name").val();
			var password = $("#in_pass").val();
			var dept_id = $("#select_dept").val();
			$.ajax({
				url: "${APP_PATH}/addManager",
				type : "POST",
				data:  JSON.stringify({
					managerName : username,
					managerPassword : password,
					managerDepartmentId : dept_id
				}),
				contentType: "application/json; charset=utf-8",  
		        dataType: "json", 
				success : function(result) {
					build_add_table(result);
				}
			});
		});
		
		//添加管理员成功后,隐藏模态框，到最后一页
		function build_add_table(result) {
			$("#managerAddModal").modal('hide');
			var pn = to_lastPage();
		}
		
		//校验表单数据
		function validate_add_form(){
			var regName = /(^[\u4e00-\u9fa5_a-zA-Z0-9_]{2,10}$)/;
			var regWord = /^[a-zA-Z0-9]{4,20}$/;
			
			//获得校验结果，显示提示信息
			var result1 = validate("#in_name", regName, "2到10个中英文");
			var result2 = validate("#in_pass", regWord, "密码至少4位，由英文和数字组成");
			
			//返回校验结果
			if (result1 && result2) {
				return true;
			}else{
				return false;
			}
			
		}
		
		function validate(ele, reg, msg){
			//1,取得数据,清空
			var eleVal = $(ele).val();
			$(ele).parent().removeClass("has-error has-success");
			$(ele).next("span").text(" ");
			
			//2,校验，显示，返回
			if (reg.test(eleVal)) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text("OK");
				return true;
			}else{
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
				return false;
			}
		}
		</script>
</body>

</html>