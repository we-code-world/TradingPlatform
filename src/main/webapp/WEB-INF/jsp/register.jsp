<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8"><!--	<meta http-equiv="x-ua-compatible" content="ie=edge">-->
    <title>注册页面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">


    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.jpg">

    <!-- CSS here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/toastr/toastr.min.css">
    <link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>

</head>
<body>

<!-- Register -->

<%--<main class="login-body" data-vide-bg="${pageContext.request.contextPath}/img/login_register.png">--%>
<main class="login-body" style="background: url(${pageContext.request.contextPath}/img/login_register.png) bottom center no-repeat #efeff4 ;background-size: 100% 100%;">


    <!-- Login Admin -->
    <form class="form-default"  method="POST">

        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login" style="">
                <a href="register.jsp"><img src="${pageContext.request.contextPath}/img/favicon.jpg" alt=""></a>
            </div>
            <h2>Registration Here</h2>

            <div class="form-input">
                <label >账号</label>
                <input  type="text" name="Account" id="acc" placeholder="账号" onblur="checkAccount()">
                <span id="ac_info"></span>
            </div>
            <div class="form-input">
                <label >密码</label>
                <input type="password" name="password" id="pw1" placeholder="密码">
            </div>
            <div class="form-input">
                <label >确认密码</label>
                <input type="password" name="password" id="pw2" placeholder="确认密码" onblur="checkPassword()">
                <span id="pw_info"></span>
            </div>
            <div class="form-input">
                <label >手机号</label>
                <input type="text" name="Telephone" id="tel" placeholder="手机号">
            </div>
            <div class="form-input">
                <label >邮箱</label>
                <input type="text" name="Email" id="em" placeholder="邮箱">
            </div>
            <div class="form-input">
                <label >地址</label>
                <input type="text" name="Address" id="ad" placeholder="地址">
            </div>
            <div class="form-input pt-50">
                <p id="reg_btn" class="pt-30" style="text-align: center"><a class="btn btn-primary btn js-scroll px-4" href="#" role="button" style="font-size: 25px;text-decoration: none">注册</a></p>
            </div>
            <!-- Forget Password -->
            <a href="${pageContext.request.contextPath}/Login/show" class="registration" style="text-align: center">已有账号?请登录</a>
        </div>
    </form>
    <!-- /end login form -->
</main>


<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>


<script src="${pageContext.request.contextPath}/lib/jquery/jquery.vide.js"></script>


<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script src="${pageContext.request.contextPath}/lib/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
<script>
    function checkAccount(){
        $.post({
            url: "${pageContext.request.contextPath}/Register/user/check/account",
            data:{"Account":$("#acc").val()},
            success: function(data){
                var res=data.result;
                if(res.toString()==="ok"){
                    $("#ac_info").css("color","green");
                    $("#ac_info").html("");
                }else {
                    $("#ac_info").css("color","red");
                    $("#ac_info").html("该账号已经被注册！");
                }
            }
        })
    }
    function checkPassword(){
        var pw1=$("#pw1").val();
        var pw2=$("#pw2").val();
        if(pw1==pw2){
            $("#pw_info").css("color","green");
            $("#pw_info").html("");
            $("#pw_info").val("ok");
        }else {
            $("#pw_info").css("color","red");
            $("#pw_info").html("两次输入的密码不一致！");
            $("#pw_info").val("error");
        }
    }
    toastr.options.positionClass = 'toast-center-center';

    $("#reg_btn").click(function sub(){
        $.post({
            url: "${pageContext.request.contextPath}/Register/user/submit",
            data:{"pw_info":$("#pw_info").val(),"Account":$("#acc").val(),"password":$("#pw1").val(),"Email":$("#em").val(),"Telephone":$("#tel").val(),"Address":$("#ad").val()},
            success: function(data){
                var res=data.result;
                if(res.toString()==="ok"){
                    swal({
                        title : "注册成功!",
                        type : "success",
                        confirmButtonText : "确定",
                        closeOnConfirm : true,
                        timer:1000
                    },function(isConfirm){
                        if (isConfirm) {
                            location.reload();
                            window.location.href="${pageContext.request.contextPath}/Login/show";
                        }
                    });
                }else {
                    swal({
                        title : "注册失败!",
                        type : "error",
                        confirmButtonText : "确定",
                        closeOnConfirm : true,
                        timer:1000
                    },function(isConfirm){
                        if (isConfirm) {
                            location.reload();
                        }
                    });}
            }
        })
    });
</script>
</body>
</html>