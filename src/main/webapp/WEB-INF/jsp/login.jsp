<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"><!--	<meta http-equiv="x-ua-compatible" content="ie=edge">-->
    <title>登录页面</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">


    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.jpg">

    <!-- CSS here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/toastr/toastr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/check_radio/build.css">

    <style>
        label{
            margin:10px;
        }
        .a-radio{
            display: none;
        }
        .b-radio{
            display: inline-block;
            border:1px solid #ccc;
            width:26px;
            height: 26px;
            border-radius:2px;
            vertical-align: middle;
            margin-right: 5px;
            position: relative;
        }
        .b-radio:before{
            content: '';
            font-size: 0;
            width: 20px;
            height: 20px;
            background: #dca73a;
            position: absolute;
            left:50%;
            top:50%;
            margin-left: -9px;
            margin-top: -9px;
            border-radius: 2px;
            display: none;
        }
        .a-radio:checked~.b-radio:before{
            display: block;
        }
    </style>
</head>

<body>
<main class="login-body" style="background: url(${pageContext.request.contextPath}/img/login_register.png) bottom center no-repeat #efeff4 ;background-size: 100% 100%;">

    <!--		login form-->
    <form name="form1" id="log" class="form-default" >
        <div class="login-form1">
            <!-- logo-login -->
            <div class="logo-login">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" alt="">
            </div>
            <h4>Login In Here</h4>
            <br/>

            <div class="form-input">
                <label >账号</label>
                <input  type="text" name="Account" id="acc" placeholder="账号"/>
            </div>
            <br/>

            <div class="form-input pb-15">
                <label>密码</label>
                <input type="password" name="password" id="pw" placeholder="密码"/>
            </div>

            <p>
                <label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" class="a-radio" name="person"  id="user"   value="users"checked="checked"/>
                    <span class="b-radio"></span>普通用户
                </label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label>
                    <input type="radio" name="person" id="administrator" class="a-radio" value="admin"/>
                    <span class="b-radio"></span>管理员
                </label>
            </p>
            <br/>
            <div class="form-input pt-0 pb-0">
                <p id="log_btn" class="pt-0" style="text-align: center"><a class="btn btn px-4"  style="width: 200px;font-size: 25px;text-decoration: none">登录</a></p>
            </div>

            <a href="${pageContext.request.contextPath}/Register/show" class="registration" style="text-align: center">没有账号？请注册</a>
        </div>
    </form>
    <!-- /end login form -->
</main>

<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script src="${pageContext.request.contextPath}/lib/toastr/toastr.min.js"></script>

<script type="text/javascript">

    toastr.options.positionClass = 'toast-center-center';
    $("#log_btn").click(function () {
        if(document.form1.person.item("users").checked){
            var url="${pageContext.request.contextPath}/Login/user";}
        else {
            var url="${pageContext.request.contextPath}/Login/admin";
        }
        $.post({
            url: url,
            data:{"Account":$("#acc").val(),"password":$("#pw").val()},
            success: function(data){
                var res=data.result;
                if(res==="ok"){
                    toastr.success('登录成功');
                    if(data.role==="user"){
                        window.location.href="${pageContext.request.contextPath}/Sell/index?userid="+data.userid;
                    }else {
                        window.location.href="${pageContext.request.contextPath}/Admin/index?id="+data.id;
                    }
                }else toastr.error("用户名或密码错误！");
            }
        });
    });


</script>


</body>
</html>
