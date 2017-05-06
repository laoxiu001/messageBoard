/* 发表留言页面start */
function anonymous() {
    document.getElementById("user").value = "保密";
    document.getElementById("number").value = "保密";
}
function unanonymous() {
    document.getElementById("user").value = "";
    document.getElementById("number").value = "";
}

var code;
function createCode() {
    code = "";
    var codeLength = 4; //验证码的长度
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
    for (var i = 0; i < codeLength; i++) {
        var charNum = Math.floor(Math.random() * 52);
        code += codeChars[charNum];
    }
    if (checkCode) {
        checkCode.className = "code";
        checkCode.innerHTML = code;
    }
}

function publish() {
    var user = document.getElementById('user').value;
    var number = document.getElementById('number').value;
    var title = document.getElementById('title').value;
    var type = document.getElementById('type').value;
    var m_object = document.getElementById('m_object').value;
    var m_content = document.getElementById('m_content').value;
    var inputCode = document.getElementById("inputCode").value;
    var result = true;
    if (confirm("确定发表吗？")) {
        if (user.length <= 0) {
            result = false;
            alert("用户名不能为空！");
        } else if (user.length > 5) {
            result = false;
            alert("用户名不能超过5字符！");
        } else if (number.length <= 0) {
            result = false;
            alert("学号不能为空！");
        } else if (number.length > 20) {
            result = false;
            alert("学号不能超过20字符！");
        } else if (title.length <= 0) {
            result = false;
            alert("标题不能为空！");
        } else if (title.length > 10) {
            result = false;
            alert("标题不能超过10字符！");
        } else if (type.length <= 0) {
            result = false;
            alert("留言类型不能为空！");
        } else if (type == '点我选择') {
            result = false;
            alert("请选择留言类型！");
        } else if (m_object.length <= 0) {
            result = false;
            alert("留言对象不能为空！");
        } else if (m_object == 'false,false') {
            result = false;
            alert("请选择正确的留言对象！");
        } else if (m_content.length <= 0) {
            result = false;
            alert("留言内容不能为空！");
        } else if (m_content.length > 400) {
            result = false;
            alert("留言内容不能超过400字符！");
        } else if (inputCode.length <= 0) {
            result = false;
            alert("请输入验证码！");
            createCode();
        } else if (inputCode.toUpperCase() != code.toUpperCase()) {
            result = false;
            alert("验证码输入有误！");
            createCode();
        }
        return result;
    }
    return false;
}
/* 发表留言页面end */

/* 发表成功页面start */
function Copy(obj)
{
	/*点击编号自动复制功能*/
    obj.select();
    js=obj.createTextRange();
    js.execCommand("Copy");
    alert("复制成功!");
}
/* 发表失败页面end */