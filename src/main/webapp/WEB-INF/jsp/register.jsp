<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8"><!--	<meta http-equiv="x-ua-compatible" content="ie=edge">-->
    <title>ע��ҳ��</title>
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
                <label >�˺�</label>
                <input  type="text" name="Account" id="acc" placeholder="�˺�" onblur="checkAccount()">
                <span id="ac_info"></span>
            </div>
            <div class="form-input">
                <label >����</label>
                <input type="password" name="password" id="pw1" placeholder="����">
            </div>
            <div class="form-input">
                <label >ȷ������</label>
                <input type="password" name="password" id="pw2" placeholder="ȷ������" onblur="checkPassword()">
                <span id="pw_info"></span>
            </div>
            <div class="form-input">
                <label >�ֻ���</label>
                <input type="text" name="Telephone" id="tel" placeholder="�ֻ���">
            </div>
            <div class="form-input">
                <label >����</label>
                <input type="text" name="Email" id="em" placeholder="����">
            </div>
            <div class="form-input">
                <label >��ַ</label>
                <input type="text" name="Address" id="ad" placeholder="��ַ">
            </div>
            <div class="form-input pt-50">
                <p id="reg_btn" class="pt-30" style="text-align: center"><a class="btn btn-primary btn js-scroll px-4" href="#" role="button" style="font-size: 25px;text-decoration: none">ע��</a></p>
            </div>
            <!-- Forget Password -->
            <a href="${pageContext.request.contextPath}/Login/show" class="registration" style="text-align: center">�����˺�?���¼</a>
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
                    $("#ac_info").html("���˺��Ѿ���ע�ᣡ");
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
            $("#pw_info").html("������������벻һ�£�");
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
                        title : "ע��ɹ�!",
                        type : "success",
                        confirmButtonText : "ȷ��",
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
                        title : "ע��ʧ��!",
                        type : "error",
                        confirmButtonText : "ȷ��",
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