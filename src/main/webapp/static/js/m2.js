/**
 * 
 */
var APP_PATH;
var changeId;//进行操作的id
var pnn;//当前页号
var lastPage;//
var size;//当前页记录数
$(function() {
	APP_PATH = window.location.href;
	to_page(1);
	select_depts3();
});

function log(str){
	console.log(str);
}
// 跳到指定页
function to_page(pn) {
	$("tr").removeClass("success");
	$("#page_info_area").empty();
	$("#managers_table tbody").empty();
	$("#page_nav ul").empty();
	$.ajax({
		url : APP_PATH + "/managers",
		data : "pn=" + pn,
		type : "GET",
		success : function(result) {
			var pageInfo = result.extend.pageInfo;
			// 解析显示员工数据
			build_managers_table(pageInfo);
			$("tr").removeClass("success");
			// 解析分页信息
			build_managers_info(pageInfo);
			// 显示分页nav
			build_managers_nav(pageInfo);
			pnn = pn;
		}
	});
}
// 跳到最后一页
function to_lastPage() {
	$("tr").removeClass("success");
	$("#page_info_area").empty();
	$("#managers_table tbody").empty();
	$("#page_nav ul").empty();
	$.ajax({
		url : APP_PATH + "/managers",
		type : "GET",
		success : function(result) {
			var pages = result.extend.pageInfo.pages;
			to_page(pages);
			lastPage = pages;
		}
	});
	
	to_page(lastPage);
}
//跳到指定页
function to_page_update(pn) {
	$("#managers_table tbody").empty();
	$("tr").removeClass("success");
	$.ajax({
		url : APP_PATH + "/managers",
		data : "pn=" + pn,
		type : "GET",
		success : function(result) {
			var pageInfo = result.extend.pageInfo;
			// 解析显示员工数据
			build_managers_table(pageInfo);
			pnn = pn;
			$("#"+changeId).addClass("success");
		}
	});
}
// 解析显示员工数据
function build_managers_table(pageInfo) {
	var managers = pageInfo.list;
	size = pageInfo.size;
	$.each(managers, function(index, item) {
		var checkboxTd = $('<td class="col-md-1 col-xs-1 text-right"><input type="checkbox" class="checkbox_item"></td>')
		var managersIdTd = $("<td></td>").append(item.managerId);
		var managerNameTd = $("<td></td>").append(item.managerName);
		var departmentNameTd = $("<td></td>").append(
				item.department.departmentName);
		var editBtnTd = $("<td></td>").append(
				$("<button></button>").addClass("btn btn-primary btn-xs")
						.append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-pencil")).append(
								"修改"));
		var delBtnTd = $("<td></td>").append(
				$("<button></button>").addClass("btn btn-danger btn-xs")
						.append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-remove")).append(
								"删除").addClass("del"));
		$("<tr></tr>").append(checkboxTd).append(managersIdTd).append(managerNameTd).append(
				departmentNameTd).append(editBtnTd).append(delBtnTd).attr("id",item.managerId).appendTo(
				"#managers_table tbody");
		editBtnTd.click(function(e){
			changeId = $(this).parent().attr('id');
			log(changeId);
			$("#update-h3").empty().append("修改管理员 " + changeId);
			build_select("#select_depts2");
			$("#managerUpdateModal").modal({});
		});
	});
}
// 解析分页信息
function build_managers_info(pageInfo) {
	var pages = pageInfo.pages;
	var pageNum = pageInfo.pageNum;
	var total = pageInfo.total;
	lastPage = pages;
	$("#page_info_area").append(
			"第" + pageNum + "页，总" + pages + "页，总" + total + "记录");
}
// 显示分页nav
function build_managers_nav(pageInfo) {
	var ul = $("#page_nav ul")
	var navigatepageNums = pageInfo.navigatepageNums;
	var pages = pageInfo.pages;
	var pageNum = pageInfo.pageNum;
	var hasNextPage = pageInfo.hasNextPage;
	var hasPreviousPage = pageInfo.hasPreviousPage;

	// 构建Li
	var firstPageLi = $("<li></li>").append(
			$("<a></a>").append("首页"));
	var pagesLi = $("<li></li>").append(
			$("<a></a>").append("末页").attr("href", "#"));
	var prePageLi = $("<li></li>").append(
			$("<a></a>").append("&laquo;").attr("href", "#"));
	var nextPageLi = $("<li></li>").append(
			$("<a></a>").append("&raquo;").attr("href", "#"));

	// 显示分页nav
	ul.append(firstPageLi);
	ul.append(prePageLi);
	$.each(navigatepageNums, function(index, item) {
		var numPageLi = $("<li></li>").append(
				$("<a></a>").append(item).attr("href", "#"));
		ul.append(numPageLi);
		if (pageNum !== item) {
			// 绑定事件
			numPageLi.click(function() {
				to_page(item);
			});
		} else {
			numPageLi.addClass("active");
		}
	});
	ul.append(nextPageLi);
	ul.append(pagesLi);

	// Li绑定事件
	if (hasPreviousPage) {
		prePageLi.click(function() {
			to_page(pageNum - 1);
		});
	}
	if (hasNextPage) {
		nextPageLi.click(function() {
			to_page(pageNum + 1);
		});
	}
	if (pageNum !== 1) {
		firstPageLi.click(function() {
			to_page(1);
		});
	}
	if (pageNum !== pages) {
		pagesLi.click(function() {
			to_page(pages);
		});
	}
}
//获取部门列表
function build_select(str) {
	// 获得部门信息，显示
	$.ajax({
		url : APP_PATH + "/depts",
		type : "POST",
		success : function(result) {
			$(str).empty();
			$.each(result.extend.depts, function(index, item) {
				var opt = $("<option></option>").append(item.departmentName)
						.attr("value", item.departmentId);
				opt.appendTo(str);
			});
		}
	});
}
// 校验表单数据
function validate_add_form(str_name, str_pass) {
	var regName = /(^[\u4e00-\u9fa5_a-zA-Z0-9_]{2,10}$)/;
	var regWord = /^[a-zA-Z0-9]{4,20}$/;

	// 获得校验结果，显示提示信息
	var result1 = validate(str_name, regName, "2到10个中英文");
	var result2 = validate(str_pass, regWord, "密码至少4位，由英文和数字组成");

	// 返回校验结果
	if (result1 && result2) {
		return true;
	} else {
		return false;
	}

}
//返回表单数据校验结果
function validate(ele, reg, msg) {
	// 1,取得数据,清空
	var eleVal = $(ele).val();
	$(ele).parent().removeClass("has-error has-success");
	$(ele).next("span").text(" ");

	// 2,校验，显示，返回
	if (reg.test(eleVal)) {
		$(ele).parent().addClass("has-success");
		$(ele).next("span").text("OK");
		return true;
	} else {
		$(ele).parent().addClass("has-error");
		$(ele).next("span").text(msg);
		return false;
	}
}
//seacher获取部门列表
function select_depts3() {
	build_select("#select_depts3");
	setTimeout(function() {
		var opt = $("<option></option>").append("全部")
		.attr("value", "-1").attr("selected", "selected");
		opt.prependTo("#select_depts3");
	},500);
}



// 顶部增加按钮绑定点击事件,模态框显示
$("#manager_add_btn").click(function() {
	$("#managerAddModal").modal({});
	build_select("#select_depts");
});

//添加增加管理员按钮绑定事件
$("#add_btn").click(function() {
	// 1,校验表单数据
	if (!validate_add_form("#in_name", "#in_pass")) {
		return;
	}
	// 验证通过发送请求
	var username = $("#in_name").val();
	var password = $("#in_pass").val();
	var dept_id = $("#select_depts").val();
	$.ajax({
		url : APP_PATH + "/addManager",
		type : "POST",
		data : JSON.stringify({
			managerName : username,
			managerPassword : password,
			managerDepartmentId : dept_id
		}),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(result) {
			$("#managerAddModal").modal('hide');
			to_lastPage(); 
		}
	});
});

//修改按钮绑定事件
$("#update_btn").click(function() {
	// 1,校验表单数据
	if (!validate_add_form("#in_name2", "#in_pass2")) {
		return;
	}
	// 验证通过发送请求
	$("#update-hidden-in").attr("value",changeId);
	$.ajax({
		url: APP_PATH + "/updateManager/" + changeId,
		type: "PUT",
		data: $("#update-form").serialize() + "&_method=PUT",
		success : function(result) {
			$("#managerUpdateModal").modal('hide');
			to_page_update(pnn);
		}
	});
});

$(document).on("click", ".del", function() {
	changeId = $(this).parent().parent().attr('id');
	log(changeId);
	if (confirm("确认删除管理员： " + changeId)) {
		$.ajax({
			url: APP_PATH + "/delManagerById/" + changeId,
			type: "DELETE",
			success: function(result) {
				alert(result.msg);
				to_page(pnn);
			}
		});
	}
})

$("#checkbox_all").click(function() {
	var checked = $(this).prop("checked");
	$(".checkbox_item").prop("checked", checked);
})
$(document).on("click", ".checkbox_item", function() {
	var flag = $(".checkbox_item:checked").length == $(".checkbox_item").length;
	$("#checkbox_all").prop("checked", flag);
})

//批量删除
$("#manager_del_btn_all").click(function() {
	var ids="";
	$.each($(".checkbox_item:checked"), function() {
		var id = $(this).parents("tr").attr("id");
		ids += id + "-";
		
	});
	ids = ids.substring(0, ids.length-1);
	if (confirm("确认删除这： " + $(".checkbox_item:checked").length + "条记录？")) {
		$.ajax({
			url: APP_PATH + "/delManagerById/" + ids,
			type: "DELETE",
			success: function(result) {
				alert("删除成功");
				to_page(pnn);
			}
		});
	}
})


