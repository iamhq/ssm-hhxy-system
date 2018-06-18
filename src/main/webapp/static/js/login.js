function log(str) {
	console.log(str);
}

//选择身份
$(".li").click(function(){
	$("#hidden_li_in").attr("value", $(this).attr("id"));
	$(this).parent().find("li").removeClass("active");
	$(this).addClass("active");
})

