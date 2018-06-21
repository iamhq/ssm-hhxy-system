$(function() {
	var split = window.location.href.split("/check");
	APP_PATH = split[0];
	// 获得部门信息，显示
	var id = $("#p_dept_id").text(); 
	$.ajax({
		url : APP_PATH + "/dept",
		data : "id=" + id,
		type : "GET",
		success : function(result) {
			$("#p_dept").empty();
			$("#p_dept").append(result.extend.dept.departmentName);		
		}
	});
});
