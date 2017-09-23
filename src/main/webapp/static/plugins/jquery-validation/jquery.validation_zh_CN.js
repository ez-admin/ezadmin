$.validator.setDefaults({
    highlight: function (element) {
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function (element) {
        element.closest('.form-group').removeClass('has-error').addClass('has-success');
    },
    errorElement: "span",
    errorPlacement: function (error, element) {
        if (element.is(":radio") || element.is(":checkbox")) {
            error.appendTo(element.parent().parent().parent());
        } else {
            error.appendTo(element.parent());
        }
    },
    errorClass: "help-block m-b-none",
    validClass: "help-block m-b-none"

});
var icon="<i class='fa fa-times-circle'></i>";
$.extend( $.validator.messages, {
	required: icon+"必填字段",
	remote: icon+"请修正此字段",
	email: icon+"请输入有效的电子邮件",
	url: icon+"请输入有效的网址",
	date: icon+"请输入有效的日期",
	dateISO: icon+"请输入有效的日期 (YYYY-MM-DD)",
	number: icon+"请输入有效的数字",
	digits: icon+"只能输入数字",
	creditcard: icon+"请输入有效的信用卡号码",
	equalTo: icon+"你的输入不相同",
	extension: icon+"请输入有效的后缀",
	maxlength: $.validator.format( icon+"最多可以输入 {0} 个字符" ),
	minlength: $.validator.format( icon+"最少要输入 {0} 个字符" ),
	rangelength: $.validator.format(icon+"请输入长度在 {0} 到 {1} 之间的字符串" ),
	range: $.validator.format( icon+"请输入范围在 {0} 到 {1} 之间的数值" ),
	max: $.validator.format(icon+"请输入不大于 {0} 的数值" ),
	min: $.validator.format( icon+"请输入不小于 {0} 的数值" )
} );