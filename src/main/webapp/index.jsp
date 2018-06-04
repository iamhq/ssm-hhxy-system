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
	<script
		src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			to_page(1);
		});
		function to_page(pn){
			$("#page_info_area").empty();
			$("#managers_table tbody").empty();
			$("#page_nav ul").empty();
			
			$.ajax({
				url : "${APP_PATH}/managers",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//解析显示员工数据
					build_managers_table(result);
					//解析分页信息
					build_managers_info(result);
					//显示分页nav
					build_managers_nav(result);
				}

			});
		}

		function build_managers_table(result) {
			var managers = result.extend.pageInfo.list;
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
		
		function build_managers_info(result){
			var pageInfo = result.extend.pageInfo;
			var lastPage = pageInfo.lastPage;
			var pageNum = pageInfo.pageNum;
			var total = pageInfo.total;
			
			$("#page_info_area").append("第"+ pageNum +"页，总" + lastPage + "页，总" + total + "记录");
		}

		function build_managers_nav(result) {
			var ul = $("#page_nav ul")
			var pageInfo = result.extend.pageInfo;
			var navigatepageNums = pageInfo.navigatepageNums;
			var lastPage = pageInfo.lastPage;
			var pageNum = pageInfo.pageNum;
			var hasNextPage = pageInfo.hasNextPage;
			var hasPreviousPage = pageInfo.hasPreviousPage;
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
			

			ul.append(firstPageLi);
			ul.append(prePageLi);
            $.each(navigatepageNums, function(index, item){
            	var numPageLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            	ul.append(numPageLi);
            	if (pageNum !== item){
            		numPageLi.click(function(){
                		to_page(item);
                	});
            	}else{
            		numPageLi.addClass("active");
            	}
            	
			});
			ul.append(nextPageLi);
			ul.append(lastPageLi);
			
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
			
			if (pageNum !== lastPage){
				firstPageLi.click(function(){
					to_page(lastPage);
				});
			}
		}
	</script>
</body>

</html>