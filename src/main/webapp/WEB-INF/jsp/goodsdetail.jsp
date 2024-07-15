<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>南理工闲鱼</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/toastr/toastr.min.css">
    <!-- Google font -->
    <link href="${pageContext.request.contextPath}/lib/fonts/style2fonts.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/css/style-red.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>

    <style>
        p{
            color: black
        }

        img.double-border {
            border: 5px solid #ddd;
            padding: 5px; /*Inner border size*/
            background: #fff; /*Inner border color*/
        }
        #user_content .share .share_content .yes_share .message{
            color: black;
            width: 400px;
            word-wrap: break-word
        }
        /* 鼠标移动到选项上修改背景颜色 */
        #user_list li{
            list-style: none;
        }
        #user_list li a:hover {
            background-color: #555;
            color: white;
        }
        #user_list li a {
            display: block;
            color: #000;
            padding: 8px 0px;
            text-decoration: none;
            text-align: center;
        }
        .outer-container {
            overflow: hidden;
        }

        .inner-container {
            left: 0;
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .inner-container::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>
<body>


<!--头部导航-->
<nav class="navbar navbar-b navbar-expand-md  navbar-trans" style="background-color: #955e46" id="mainNav">
    <div class="container" >
        <a class="navbar-brand js-scroll" href="#page-top">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" style="width:50px">
            南理工闲鱼
        </a>
        <div class="navbar-collapse justify-content-end collapse" id="navbarDefault" style="">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/index/?userid=${requestScope.get('userid')}" style="font-size: 20px">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Buy/show?userid=${requestScope.get('userid')}" style="font-size: 20px">发布求购</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/show?userid=${requestScope.get('userid')}" style="font-size: 20px">发布二手</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Personal/index?userid=${requestScope.get('userid')}" style="font-size: 20px">个人主页</a>
                </li>




                <!--				<div id="header">-->
                <!--					<div class="container">-->
                <div class="" style=""  id="cart">
                    <ul class="header-btns">


                        <!-- Cart -->
                        <c var="user_cart" value="${requestScope.get('user_cart')}">
                            <li class="header-cart">
                                <a href="${pageContext.request.contextPath}/Cart/show?userid=${requestScope.get('userid')}">
                                    <div class="header-btns-icon">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="qty" id="number">${user_cart.getGoodsnum()}</span>
                                    </div>
                                    <strong style="color: red">购物车:</strong>
                                    <br>
                                    <span style="color: red" id="sum">￥${user_cart.getPricesum()}</span>
                                </a>
                            </li>
                            <!-- /Cart -->
                        </c>

                    </ul>
                    <!--				</div>-->
                    <!--					</div>-->
                </div>
            </ul>
        </div>
    </div>
</nav>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
<script>
    function change(gid,uid){
        $.ajax({
            url: "${pageContext.request.contextPath}/Cart/add",
            cache: false,
            type:'GET',
            data:{"goodsid":gid,"userid":uid},
            dataType:"json",
            success: function(data){
                swal({
                    title : "加入成功",
                    type : "success",
                    confirmButtonText : "确定",
                    closeOnConfirm : true,
                    timer:1000
                },function(isConfirm){
                    if (isConfirm) {
                        location.reload();
                    }
                });
                var res=data.user_cart;
                $("#number").html(res.goodsnum);
                $("#sum").html(res.pricesum);
            }
        })
    }
</script>

<!--商品详情-->
    <div class="container" style="margin-top: 50px" >
        <div class="row">
            <div class="col-xs-6 col-md-6">
                <a href="#" class="thumbnail ">
                    <img class="double-border" src="${pageContext.request.contextPath}${requestScope.get('goods').getPictureurl()}"  width="560px" height="560px"  alt="${requestScope.goods.getGoodsname()}" />
                </a>
            </div>
            <div class="col-xs-6 col-md-6" >
                <div class="panel panel-default" style="height: 560px ">
                    <div class="panel-body"  >
                        <h3>产品名称:${requestScope.get('goods').getGoodsname()}</h3>
                        <div style="margin-left: 10px; margin-top:50px;">

                            <p style="background:url(${pageContext.request.contextPath}/img/bgprice.png);color: #999;font-size: 24px;text-align: left;background-color: #e9e9e9;">市场价格:&nbsp;&nbsp;&nbsp;<span class="text-danger" style="font-size: 45px;color: #FF0036;font-weight: bolder;">${requestScope.get('goods').getPrice()}</span><span class="glyphicon glyphicon-yen"></span></p>

                            <p style="font-weight:900">详细介绍:</p>
                            <p style="height: 18px;line-height: 18px;color: #666;font-weight: 700">${requestScope.get('goods').getData()}</p>
                            <br>
                            <br>
                            <br>
                            <button class="btn btn-warning" onclick="change(${requestScope.get('goods').getGoodsid()},${requestScope.get('userid')})">加入购物车&nbsp;&nbsp;&nbsp;<span class="fa fa-shopping-cart"></span></button>&nbsp;&nbsp;&nbsp;
                            <button  style="margin-left: 50px" class="btn btn-danger"><a onclick="chatseller(${requestScope.get('goods').getSellerid()},${requestScope.get('userid')})">联系卖家&nbsp;&nbsp;</a><span class="fa fa-comment"></span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!--尾部-->
<section class="paralax-mf footer-paralax bg-image sect-mt4 route" style="background-image: url(${pageContext.request.contextPath}/img/intro-bg.jpg)">
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="copyright-box">
                        <p class="copyright">&copy; Copyright <strong>南理工闲鱼</strong>. All Rights Reserved</p>
                        <div class="credits">
                            Designed by <strong>闲鱼工作组</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</section>

<!--back to top-->
<a href="#" class="back-to-top" style="display: none;"><i class="fa fa-chevron-up"></i></a>

<!--聊天窗口-->
<a  onclick="chatAll(${requestScope.get('userid')})" class="chatbutton talk-to-someone" style="display: block;"><i  class="fa fa-comment"></i></a>

<!--聊天  模态框（Modal） -->
<div class="modal fade" id="chatModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 600px">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel" style="margin-left: 210px;">交流页面</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div id="user_area" style="height: 400px;width: 500px">

                    <!--					左侧用户-->
                    <div style="overflow-y:auto;overflow-x: hidden;position:absolute; top:0; left:0; width:20%; height:100%; background-color:white;">
                        <div class="list-group" id="user_list">
                        </div>
                    </div>
                    <!--					右侧聊天-->
                    <div class="outer-container" style="overflow-y:auto;position:absolute; top:0px; right:0; width:80%; height:100%; background-color:antiquewhite;">
                        <div id="user_content" class="inner-container"
                             style="overflow-y:auto;position:absolute; top:0; right:0; width:90%; height:100%; background-color:antiquewhite;padding-left: 30px;padding-top:20px;padding-bottom:40px;">
                            <div class="share">
                                <!--交流-->
                                <div class="share_content">
                                    <div class="yes_share" id="user_text">
                                        <%--                                            <p style="text-align:left;font-size:30px;color:rgb(150,145,155);">Sell.getAccount()</p>--%>
                                        <%--                                            <p style="text-align:left;color:#4fbef6;">${msg.showDate()}</p>--%>
                                        <%--                                            <div class="message">${msg.getContent()}</div>--%>
                                        <%--                                            <hr>--%>
                                        <%--                                            <!--卖家说-->--%>
                                        <%--                                            <p style="text-align:right;font-size:30px;color:rgb(150,145,155);">wangdi123</p>--%>
                                        <%--                                            <p style="text-align:right;color:#4fbef6;">2020-10-0410:20:05</p>--%>
                                        <%--                                            <div class="message"></div>--%>
                                        <%--                                            <hr>--%>
                                    </div>
                                </div>
                                <!--发布-->
                                <div class="publish" style="background:antiquewhite" id="text_area">
                                    <%--                                    <div class="form-group"><textarea class="form-control" id="Textarea" rows="3"></textarea></div>--%>
                                    <%--                                    <button type="submit" class="btn btn-primary pull-right" id="sendmsg">发送</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <!-- /.modal-content -->
        </div>
    </div>
</div>
<script>
    function chatseller(sid, uid) {
        chatAll(uid);
        chatid(sid, uid)
    }

    function chatid(sid, uid) {
        selectu(sid, uid);
        $.ajax({
            url: '${pageContext.request.contextPath}/Message/chat',
            type: 'POST',
            data: {"id": sid, "userid": uid},
            success: function (data) {
                console.log(data);
                var html="";
                for (var i=0;i<data.users.length;i++) {
                    html+="<li><a onclick='chatid("+data.users[i].userid+","+uid+")' class=\"list-group-item list-group-item-success\">"+data.users[i].account+"</a></li>"
                }
                console.log(html);
                $("#user_list").html(html);
                var text="";
                for (var msgi = 0; msgi < data.messages.length; msgi++) {
                    var lor="";
                    if (data.messages[msgi].senderid===data.mine.userid)lor="right";
                    else lor="left";
                    var msgdate=dateFtt("yyyy-MM-dd hh:mm:ss",new Date(data.messages[msgi].date));
                    // text+="<p style=\"text-align:"+lor+";font-size:30px;color:rgb(150,145,155);\">"+data.messages[msgi].senderid+"</p>";
                    text+="<p style=\"text-align:"+lor+";color:#4fbef6;\">"+msgdate+"</p>";
                    text+="<div class=\"message\" style=\"text-align:"+lor+";\">"+data.messages[msgi].content+"</div>";
                    text+="<hr>";
                }
                for (var addi=0;addi<3-data.messages.length;addi++){
                    // text+="<p style=\"text-align:left;font-size:30px;color:rgb(150,145,155);\"></p>";
                    text+="<p style=\"text-align:left;color:#4fbef6;\"><br></p>";
                    text+="<div class=\"message\"><br></div>";
                    text+="<hr>";
                }
                console.log(text);
                $("#user_text").html(text);
            }
        })
    }

    function chatAll(uid) {
        $.ajax({
            url: '${pageContext.request.contextPath}/Message/all',
            type: 'POST',
            data: {"userid": uid},
            success: function (data) {
                console.log(data);
                var html="";
                $("#user_list").html(html);
                for (var i=0;i<data.users.length;i++) {
                    html+="<li><a onclick='chatid("+data.users[i].userid+","+uid+")' class=\"list-group-item list-group-item-success\">"+data.users[i].account+"</a></li>"
                }
                console.log(html);
                $("#user_list").html(html);
                $('#chatModal').modal('toggle');
            }
        })
    }

    function sendContext(sid,uid) {
        $.ajax({
            url:'${pageContext.request.contextPath}/Message/send',
            type:'POST',
            data:{"id": sid, "userid": uid,"text":$("#Textarea").val()},
            success:function (data) {
                if (data.result==="ok"){
                    chatseller(sid,uid);
                }else toastr.error("消息发送失败！")
            },
            error:function () {
                toastr.error("系统或服务器发生错误，请稍后重试！")
            }
        })
    }
    function selectu(sid, uid) {
        show="";
        show+="<div class=\"form-group\"><textarea class=\"form-control\" id=\"Textarea\" rows=\"3\"></textarea></div>";
        show+="<button type=\"submit\" class=\"btn btn-primary pull-right\" id=\"sendmsg\" onclick='sendContext("+sid+","+uid+")'>发送</button>";
        console.log(show)
        $("#text_area").html(show);
    }

</script>

<!-- JavaScript Libraries -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/counterup/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/counterup/jquery.counterup.js"></script>
<script src="${pageContext.request.contextPath}/lib/lightbox/js/lightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/typed/typed.min.js"></script>

<!-- Template Main Javascript File -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script>
    /**************************************时间格式化处理************************************/
    function dateFtt(fmt,date)
    { //author: meizz
        var o = {
            "M+" : date.getMonth()+1,                 //月份
            "d+" : date.getDate(),                    //日
            "h+" : date.getHours(),                   //小时
            "m+" : date.getMinutes(),                 //分
            "s+" : date.getSeconds(),                 //秒
            "q+" : Math.floor((date.getMonth()+3)/3), //季度
            "S"  : date.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }
</script>

</body>
</html>