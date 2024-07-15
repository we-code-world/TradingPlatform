<%@ page language="java" pageEncoding="GBK" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="referrer" content="never">
    <title>南理工闲鱼</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%--    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-3.3.7.css" rel="stylesheet">--%>

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/toastr/toastr.min.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chathome.css" />--%>
    <!-- Google font -->
    <link href="${pageContext.request.contextPath}/lib/fonts/style2fonts.css" rel="stylesheet">


    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/css/style-red.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sidecategory.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>

    <style>
        .search-box {
            position: absolute;
            left: 50%;
            transform: translate(-50%, -50%);
            /*background: #2f3640;*/
            height: 50px;
            border-radius: 40px;
            padding: 10px;
            margin-top: 50px;
            padding: 0;
            background: #e84118;
        }

        .search-box:hover > .search-txt {
            width: 240px;
            padding: 0 6px;
        }

        .search-box:hover > .search-btn {
            background: white;
        }

        .search-btn {
            color: #e84118;
            float: right;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: #f4aa2a;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .search-txt {
            border: none;
            background: none;
            outline: none;
            float: left;
            padding: 0;
            color: white;
            font-size: 16px;
            transition: 0.4s;
            line-height: 50px;
            width: 0px;
        }

        #user_content .share .share_content .yes_share .message{
            color: black;
            width: 400px;
            word-wrap: break-word
        }
        /* 鼠标移动到选项上修改背景颜色 */
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

<body id="page-top">

<!--/ 导航 /-->
<nav class="navbar navbar-b navbar-expand-md  navbar-trans fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll" href="#page-top">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" style="width:50px;">
            南理工闲鱼
        </a>

        <div class="navbar-collapse justify-content-end collapse " id="navbarDefault" style="">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll"
                       href="${pageContext.request.contextPath}/Sell/index?userid=${requestScope.get('userid')}"
                       style="font-size: 20px">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll"
                       href="${pageContext.request.contextPath}/Buy/show?userid=${requestScope.get('userid')}"
                       style="font-size: 20px">发布求购</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll"
                       href="${pageContext.request.contextPath}/Sell/show?userid=${requestScope.get('userid')}"
                       style="font-size: 20px">发布二手</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll"
                       href="${pageContext.request.contextPath}/Personal/index?userid=${requestScope.get('userid')}"
                       style="font-size: 20px">个人主页</a>
                </li>

                <div class="cart" style="" id="cart" data-toggle="tooltip"title="点击查看购物车详情" data-placement="bottom">
                    <ul class="header-btns">
                        <!-- Cart -->
                        <c var="user_cart" value="${requestScope.get('user_cart')}">
                            <li class="header-cart">
                                <a href="${pageContext.request.contextPath}/Cart/show?userid=${requestScope.get('userid')}">
                                    <div class="header-btns-icon">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span class="qty" id="number">${user_cart.getGoodsNum()}</span>
                                    </div>
                                    <strong style="color: red">购物车:</strong>
                                    <br>
                                    <span style="color: red" id="sum">￥${user_cart.getPriceSum()}</span>
                                </a>
                            </li>
                            <!-- /Cart -->
                        </c>
                    </ul>
                </div>
                <li class="nav-item">
                    <a class="nav-link " href="${pageContext.request.contextPath}/static_index.jsp"
                       style="padding-left: 13px;font-size:15px">退出登录</a>
                </li>
                <li style="">
                    <span>${requestScope.get('username')}<br>欢迎你！</span>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
<script>
    function change(gid, uid) {
        $.ajax({
            url: "${pageContext.request.contextPath}/Cart/add",
            cache: false,
            type: 'GET',
            data: {"goodsid": gid, "userid": uid},
            dataType: "json",
            success: function (data) {
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
                var res = data.user_cart;
                $("#number").html(res.goodsnum);
                $("#sum").html("￥" + res.pricesum);
            }
        })
    }
</script>

<%--悬浮分类--%>
<div class="side-category" style="display: block;">
    <div class="side-category-tit">
        <a onclick="serchByclass(0)">全品分类</a>
    </div>
    <div class="side-category-bd">
        <div class="f-item">
            <div class="f-box">
                <a class="f-tit" onclick="serchByclass(1)">闲置数码</a>
            </div>
        </div>
        <div class="f-item">
            <div class="f-box">
                <a class="f-tit" onclick="serchByclass(2)">校园代步</a>
            </div>
        </div>
        <div class="f-item">
            <div class="f-box">
                <a class="f-tit" onclick="serchByclass(4)">图书教材</a>
            </div>
        </div>
        <div class="f-item">
            <div class="f-box">
                <a class="f-tit" onclick="serchByclass(5)">美妆衣物</a>
            </div>
        </div>
        <div class="f-item">
            <div class="f-box">
                <a class="f-tit" onclick="serchByclass(6)">运动棋牌</a>
            </div>
        </div>
        <div class="f-item">
            <div class="f-box">
                <a class="f-tit" onclick="serchByclass(7)">票券小物</a>
            </div>
        </div>
    </div>
    <div class="side-category-ft" data-action="category-toggle">
        <span class="label tohide">收起导航</span>
        <span class="label toshow">展开导航</span>
    </div>
</div>

<!--/ 字幕 /-->
<div id="home" class="intro route bg-image"
     style="background-image: url(${pageContext.request.contextPath}/img/intro-bg.jpg)">
    <div class="overlay-itro"></div>
    <div class="intro-content display-table">
        <div class="table-cell">
            <div class="container">
                <p class="display-6 color-d">我们是</p>
                <h1 class="intro-title mb-4">南&nbsp&nbsp理&nbsp&nbsp工&nbsp&nbsp闲&nbsp&nbsp鱼</h1>
                <p class="intro-subtitle"><span class="text-slider-items">极致体验,闲置交换,废物利用,方便你我,极速发货</span><strong
                        class="text-slider">闲置交换</strong><span class="typed-cursor"
                                                               style="animation-iteration-count: infinite;">|</span></p>
                <p class="pt-3"><a class="btn btn-primary btn js-scroll px-4" href="#goods" role="button"
                                   style="font-size: 25px">开始你的购物之旅吧</a></p>
                <div class="search-box ">
                    <input class="search-txt" type="text" id="search_box"  placeholder="Type to search">
                    <a class="search-btn" href="#goods" onclick="serchBydes()" style="transition:10s ease-in-out">
                        <i class="fa fa-search" ></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

</div>

<div id="bas">
<!--火速求购-->
    <section id="iwant" class="services-mf route">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="title-box text-center">
                        <h3 class="title-a">
                            火速求购
                        </h3>
                        <p class="subtitle-a">
                            集全校之力，解决你的需求。
                        </p>
                        <div class="line-mf"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <% String cls[] = {"ion-monitor", "ion-code-working", "ion-camera", "ion-android-phone-portrait", "ion-paintbrush", "ion-stats-bars"};
                    int i = 0;
                %>
                <c:forEach var="Buy" items="${requestScope.get('buy_list')}">
                    <div class="col-md-4" data-toggle="tooltip"title="和求购者聊天" onclick="chatseller(${Buy.getOwnerId()},${requestScope.get('userid')})">
                        <div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class=<%=cls[i % 6]%>></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">${Buy.getName()}</h2>
                                <p class="s-description text-center">
                                        ${Buy.getDescribe()}
                                </p>
                            </div>
                        </div>
                    </div>
                    <% i = i + 1;%>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- 欢迎购买  -->
    <div class="section" id="goods">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h2 class="title">欢迎购买</h2>
                    </div>
                </div>
                <!-- section title -->


                <!-- Product Slick -->
                <div class="col-md-12 col-sm-6 col-xs-6">
                    <div class="row">
                        <!-- Product Singles -->
                        <c:forEach var="Sell" items="${requestScope.get('goods_list')}">
                            <div class="product product-single">
                                <div class="product-thumb">
                                    <div class="product-label">
                                        <span>New</span>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Sell.getId()}&userid=${requestScope.get('userid')}">
                                        <button class="main-btn quick-view"><i class="fa fa-eye"></i> 商品详情</button>
                                    </a>
                                    <img src="${pageContext.request.contextPath}${Sell.getPictureUrl()}" alt="">
                                </div>
                                <div class="product-body">
                                    <h3 class="product-price">￥${Sell.getPrice()}</h3>

                                    <h2 class="product-name"><a
                                            href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Sell.getId()}&userid=${requestScope.get('userid')}">${Sell.getName()}</a>
                                    </h2>
                                    <div class="product-btns">
                                        <button class="primary-btn add-to-cart"
                                                onclick="change(${Sell.getId()},${requestScope.get('userid')})"><i
                                                class="fa fa-shopping-cart"></i> 加入购物车
                                        </button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button class="primary-btn add-to-cart" onclick="chatseller(${Sell.getOwnerId()},${requestScope.get('userid')})">
                                            <i class="fa fa-commenting-o"></i> 联系卖家
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- /Product Singles -->
                    </div>
                </div>
                <!-- /Product Slick -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
</div>

<!--尾部-->
<section class="paralax-mf footer-paralax bg-image sect-mt4 route"
         style="background-image: url(${pageContext.request.contextPath}/img/intro-bg.jpg)">
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

<!--回弹小窗-->
<a href="#" class="back-to-top" style="display: none;" data-toggle="tooltip"title="回到顶部" data-placement="left"><i class="fa fa-chevron-up"></i></a>

<!--聊天窗口-->
<a onclick="chatAll(${requestScope.get('userid')})" class="chatbutton talk-to-someone" style="display: block;" data-toggle="tooltip"title="打开聊天页面" data-placement="left"><i
        class="fa fa-comment" ></i></a>


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
                    <div class="outer-container" id="chat_div" style="position:absolute; top:0px; right:0; width:80%; height:100%; background-color:antiquewhite;">
                        <div id="user_content" class="inner-container"
                             style="scrollbar-arrow-color:yellow;scrollbar-base-color:lightsalmon;position:absolute; top:0; right:0; width:90%; height:100%; background-color:antiquewhite;padding-left: 30px;padding-top:20px;padding-bottom:40px;">
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
                                <div class="publish" style="background:antiquewhite" id="text_area" data-toggle="tooltip"title="输入你想说的话">
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

<script src="${pageContext.request.contextPath}/lib/toastr/toastr.min.js"></script>
<%--suppress JSJQueryEfficiency --%>
<script>
    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });

    function chatseller(sid, uid) {
        chatAll(uid);
        chatid(sid, uid);
    }

    function chatid(sid, uid) {
        selectu(sid, uid);
        $.ajax({
            url: '${pageContext.request.contextPath}/Message/chat',
            type: 'POST',
            data: {"id": sid, "userid": uid},
            success: function (data) {
                var html="";
                for (var i=0;i<data.users.length;i++) {
                    html+="<li><a id='user"+i+"' onclick='chatid("+data.users[i].userid+","+uid+")' class=\"list-group-item list-group-item-success\" data-toggle=\"tooltip\"title=\"点击这里与他开始聊天吧\">"+data.users[i].account+"</a></li>"
                }
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
                $("#user_text").html(text);
                $("#user0").attr("style","background-color: #555;color: white;");
                $("#user_content").scrollTop($("#user_content")[0].scrollHeight);
            }
        });
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
                var sign=0;
                for (var i=0;i<data.users.length;i++) {
                    html+="<li><a id='user"+i+"' onclick='chatid("+data.users[i].userid+","+uid+")' class=\"list-group-item list-group-item-success\" data-toggle=\"tooltip\"title=\"点击这里与他开始聊天吧\">"+data.users[i].account+"</a></li>"
                }
                $("#user_list").html(html);
                $('#chatModal').modal('toggle');
            }
        })
    }
    function selectu(sid, uid) {
        show="";
        show+="<div class=\"form-group\"><textarea class=\"form-control\" id=\"Textarea\" rows=\"3\"></textarea></div>";
        show+="<button type=\"submit\" class=\"btn btn-primary pull-right\" id=\"sendmsg\" onclick='sendContext("+sid+","+uid+")'>发送</button>";
        $("#text_area").html(show);
    }

    function sendContext(sid,uid) {
        $.ajax({
            url:'${pageContext.request.contextPath}/Message/send',
            type:'POST',
            data:{"id": sid, "userid": uid,"text":$("#Textarea").val()},
            success:function (data) {
                if (data.result==="ok"){
                    chatid(sid,uid);
                }else toastr.error("消息发送失败！")
            },
            error:function () {
                toastr.error("系统或服务器发生错误，请稍后重试！")
            }
        })
    }
    function serchBydes() {
        $.ajax({
            url:'${pageContext.request.contextPath}/Sell/serch',
            type:'POST',
            data:{"descript":$("#search_box").val(),"userid":${requestScope.get('userid')}},
            success:function (data) {
                $("#bas").html(data);
            }
        })
    }
    function serchByclass(cid) {
        if (cid===0){
            location.reload();
        }else {
            $.ajax({
                url:'${pageContext.request.contextPath}/Sell/classes',
                type:'POST',
                data:{"catelogId":cid,"userid":${requestScope.get('userid')}},
                success:function (data) {
                    $("#goods").html(data);
                }
            })
        }
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
<script src="${pageContext.request.contextPath}/js/global.js"></script>

<script>
    +function () {
        var bigH = $('.side-category').height();
        $(window).on('scroll resize load', function () {
            var sTop = $(this).scrollTop(),
                valve = $('#home').offset().top + $('#home').height(),
                wH = $(this).height();
            if (sTop > valve) {
                $('.side-category').show();
            } else {
                $('.side-category').hide();
            }
        })
    }();
    zAction.add({
        'category-toggle': function () {
            if ($(this).hasClass('on')) {
                $(this).removeClass('on').prev().slideDown(200);
            } else {
                $(this).addClass('on').prev().slideUp(200);
            }
        },

    });
</script>
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


