/**
 * 
 */
var APP_PATH;
var changeId;// 当前进行操作的id
var name;//当前进行操作的用户名
var pnn;// 当前页号
var lastPage;//
var size;// 当前页记录数
$(function() {
	var split = window.location.href.split("/check");
	APP_PATH = split[0];
	to_page(1);
	select_depts3();
});

function log(str){
	console.log(str);
}
// 跳到指定页
function to_page(pn) {
	$("tr").removeClass("success");
	$.ajax({
		url : APP_PATH + "/teachers",
		data : "pn=" + pn,
		type : "GET",
		success : function(result) {
			log("to_page");
			var pageInfo = result.extend.pageInfo;
//			// 解析显示员工数据
			build_teachers_table(pageInfo);
//			// 解析分页信息
			build_teachers_info(pageInfo);
//			// 显示分页nav
			build_teachers_nav(pageInfo, 1);
			pnn = pn;
		}
	});
}
// 跳到最后一页
function to_lastPage() {
	$("tr").removeClass("success");
	$.ajax({
		url : APP_PATH + "/teachers",
		type : "GET",
		success : function(result) {
			var pages = result.extend.pageInfo.pages;
			to_page(pages);
		}
	});
	
	to_page(lastPage);
}
// 跳到指定页
function to_page_update(pn) {
	$("tr").removeClass("success");
	$.ajax({
		url : APP_PATH + "/teachers",
		data : "pn=" + pn,
		type : "GET",
		success : function(result) {
			var pageInfo = result.extend.pageInfo;
			// 解析显示员工数据
			build_teachers_table(pageInfo);
			pnn = pn;
			$("#"+changeId).addClass("success");
		}
	});
}
// 解析显示员工数据
function build_teachers_table(pageInfo) {
	$("#teachers_table tbody").empty();
	var teachers = pageInfo.list;
	size = pageInfo.size;
	$.each(teachers, function(index, item) {
		var checkboxTd = $('<td class="col-md-1 col-xs-1 text-right"><input type="checkbox" class="checkbox_item"></td>')
		var teachersIdTd = $("<td></td>").append(item.teacherId);
		var teacherNameTd = $("<td></td>").append(item.teacherName);
		var departmentNameTd = $("<td></td>").append(
				item.department.departmentName);
		var saralyTd = $("<td></td>").append(
				item.teacherSalary);
		var emailTd = $("<td></td>").append(
				item.teacherEmail);
		
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
		$("<tr></tr>").append(checkboxTd).append(teachersIdTd).append(teacherNameTd).append(
				departmentNameTd).append(emailTd).append(saralyTd).append(editBtnTd).append(delBtnTd).attr("id",item.teacherId).appendTo(
				"#teachers_table tbody");
		editBtnTd.click(function(e){
			changeId = item.teacherId
			name = item.teacherName;
			$("#update-hidden-in").attr("value",changeId);
		    
			$("#update-h3").empty().append("修改教师 " + changeId);
			build_select("#select_depts2");
			$("#teacherUpdateModal").modal({});
		});
	});
}
// 解析分页信息
function build_teachers_info(pageInfo) {
	$("#page_info_area").empty();
	var pages = pageInfo.pages;
	var pageNum = pageInfo.pageNum;
	var total = pageInfo.total;
	lastPage = pages;
	$("#page_info_area").append(
			"第" + pageNum + "页，总" + pages + "页，总" + total + "记录");
}
// 显示分页nav
function build_teachers_nav(pageInfo, i) {
	$("#page_nav ul").empty();
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
	if ( i == 1) {
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
}
// 获取部门列表
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

// 返回表单数据校验结果
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
// seacher获取部门列表
function select_depts3() {
	build_select("#search_d");
	log("dd");
	setTimeout(function() {
		var opt = $("<option></option>").append("全部")
		.attr("value", "-1").attr("selected", "selected");
		opt.prependTo("#search_d");
	},500);
}

$("#search").click(function(){
	$("tr").removeClass("success");
	var name = $("#search_n").val();
	var dept = $("#search_d").val();
	$.ajax({
		url : APP_PATH + "/searchM",
		type : "POST",
		data : JSON.stringify({
			teacherName : name,
			teacherDepartmentId : dept
		}),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(result) {
			$("#teacherAddModal").modal('hide');
			to_lastPage(); 
		}
	});
})


// 顶部增加按钮绑定点击事件,模态框显示
$("#teacher_add_btn").click(function() {
	$("#teacherAddModal").modal({});
	build_select("#select_depts_add");
});

// 添加增加管理员按钮绑定事件
$("#add_btn").click(function() {
	// 1,校验表单数据
	var regSalary = /^[0-9]{1,5}$/;
	var regName = /(^[\u4e00-\u9fa5_a-zA-Z0-9_]{2,10}$)/;
	var regPass = /^[a-zA-Z0-9]{4,20}$/;
	var regId = /(^[0-9_]{1,9}$)/;
	var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	
	var r1 = validate("#in_id_add", regId, "9位以内数字");
	var r2 = validate("#in_name_add", regName, "2到10个中英文");
	var r3 = validate("#in_pass_add", regPass, "密码至少4位，由英文和数字组成");
	var r4 = validate("#in_email_add", regEmail, "邮箱格式不正确");
	var r5 = validate("#in_salary_add", regSalary, "不超过5位的数字");
	
	if (!(r1&&r2&&r3&&r4&&r5)) {
		return;
	}
	// 验证通过发送请求
	var id = $("#in_id_add").val();
	var password = $("#in_pass_add").val();
	var username = $("#in_name_add").val();
	var salary = $("#in_salary_add").val();
	var dept_id = $("#select_depts_add").val();
	var email = $("#in_email_add").val();
	$.ajax({
		url : APP_PATH + "/addTeacher",
		type : "POST",
		data : JSON.stringify({
			teacherId : id,
			teacherName : username,
			teacherPassword : password,
			managerDepartmentId : dept_id,
			teacherSalary : salary,
			teacherEmail : email
		}),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(result) {
			$("#teacherAddModal").modal('hide');
			to_lastPage(); 
		}
	});
});

// 修改按钮绑定事件
$("#update_btn").click(function() {
	// 1,校验表单数据
	var regSalary = /^[0-9]{1,5}$/;
	if (!validate("#in_salary", regSalary, "不超过5位的数字")) {
		return;
	}
	// 验证通过发送请求
	$.ajax({
		url: APP_PATH + "/updateTeacher/" + changeId,
		type: "PUT",
		data: $("#update-form").serialize() + "&_method=PUT",
		success : function(result) {
			$("#teacherUpdateModal").modal('hide');
			to_page_update(pnn);
		}
	});
});

$(document).on("click", ".del", function() {
	changeId = $(this).parent().parent().attr('id');
	log(changeId);
	if (confirm("确认删除管理员： " + changeId)) {
		$.ajax({
			url: APP_PATH + "/delTeacherById/" + changeId,
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

// 批量删除
$("#teacher_del_btn_all").click(function() {
	var ids="";
	$.each($(".checkbox_item:checked"), function() {
		var id = $(this).parents("tr").attr("id");
		ids += id + "-";
		
	});
	ids = ids.substring(0, ids.length-1);
	if (confirm("确认删除这： " + $(".checkbox_item:checked").length + "条记录？")) {
		$.ajax({
			url: APP_PATH + "/delteacherById/" + ids,
			type: "DELETE",
			success: function(result) {
				alert("删除成功");
				to_page(pnn);
			}
		});
	}
})


