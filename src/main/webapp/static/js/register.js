var APP_PATH="";
$(function() {
	var str = window.location.href;
	APP_PATH = str.split("/toRegister")[0];
	build_select("#select_depts");
});

//获得部门，显示
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
}//校验信息，注册
//校验表单数据
function validate_form() {
	var regName = /(^[\u4e00-\u9fa5_a-zA-Z0-9_]{2,10}$)/;
	var regWord = /^[a-zA-Z0-9]{4,20}$/;
	var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/

	// 获得校验结果，显示提示信息
	var result1 = validate("#in_name", regName, "2到10个中英文");
	var result2 = validate("#in_pass", regWord, "密码至少4位，由英文和数字组成");
	var result3 = validate("#in_emil", regEmail, "邮箱格式不正确");
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

//function register(){
//	//var flag = validate_form();
//	//console.log(flag);
//	alert("aaa");
//	return false;
//}