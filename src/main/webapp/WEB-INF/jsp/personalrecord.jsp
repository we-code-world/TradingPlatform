<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-3.3.7.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/toastr/toastr.min.css">
    <!-- Google font -->
    <link href="${pageContext.request.contextPath}/lib/font/style2fonts.css" rel="stylesheet">

    <!-- 图片上传插件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/fileinput/fileinput.min.css">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/css/style-red.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhomeo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usero.css" />

</head>
<body>
<!--头部导航-->
<nav class="navbar navbar-b navbar-expand-md  navbar-trans" style="background-color: #955e46" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll" href="#page-top">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" style="width:50px">
            南理工闲鱼
        </a>
        <div class="navbar-collapse justify-content-end collapse" id="navbarDefault" style="">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/index?userid=${requestScope.get('user').getUserid()}" style="font-size: 20px">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Buy/show?userid=${requestScope.get('user').getUserid()}" style="font-size: 20px">发布求购</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/show?userid=${requestScope.get('user').getUserid()}" style="font-size: 20px">发布商品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Personal/index?userid=${requestScope.get('user').getUserid()}" style="font-size: 20px">个人主页</a>
                </li>


                <!--				<div id="header">-->
                <!--					<div class="container">-->
                <div class="" style="">
                    <ul class="header-btns">


                        <!-- Cart -->
                        <c var="user_cart" value="${requestScope.get('user_cart')}">
                            <li class="header-cart">
                                <a href="${pageContext.request.contextPath}/Cart/show?userid=${requestScope.get('user').getUserid()}">
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


<!--个人中心边栏-->
<div id="user_nav">
    <div class="home_nav">
        <ul>
            <a href="${pageContext.request.contextPath}/Personal/index?userid=${requestScope.get('user').getUserid()}">
                <li class="notice">
                    <div></div>
                    <span>个人主页</span>
                    <strong></strong>
                </li>
            </a>
            <a href="${pageContext.request.contextPath}/Personal/record?userid=${requestScope.get('user').getUserid()}">
                <li class="notice">
                    <div></div>
                    <span>交易记录</span>
                    <strong></strong>
                </li>
            </a>
            <a href="${pageContext.request.contextPath}/Personal/Buy/show?userid=${requestScope.get('user').getUserid()}">
                <li class="store">
                    <div></div>
                    <span>我的求购</span>
                    <strong></strong>
                </li>
            </a>
            <a href="${pageContext.request.contextPath}/Personal/Sell/show?userid=${requestScope.get('user').getUserid()}">
                <li class="second">
                    <div></div>
                    <span>我的商品</span>
                    <strong></strong>
                </li>
            </a>
            <a href="${pageContext.request.contextPath}/Personal/show?userid=${requestScope.get('user').getUserid()}">
                <li class="set">
                    <div></div>
                    <span>修改信息</span>
                    <strong></strong>
                </li>
            </a>
        </ul>
    </div>
</div>

<!--交易记录-->
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <!--

        描述：右侧内容区域
    -->
        <div id="user_content">

            <div class="share">

                <!--

                描述：订单展示
            -->
                <h1 style="text-align: center">交易记录</h1>
                <hr />
                <div class="share_content">
                    <c:if test="${empty requestScope.get('Buys') and empty requestScope.get('Sells')}">
                        <div class="no_share">
                            <span>没有任何内容，去逛逛其它的吧！</span>
                        </div>
                    </c:if>
                    <c:if test="${!empty requestScope.get('Buys') or !empty requestScope.get('Sells')}">
                        <div class="story">

                            <div class="container">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist" style="width: 46%">
                                    <!-- <li class="nav-item"><a class="nav-link active"
                                        data-toggle="tab" href="#home">全部订单</a></li> -->
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab"
                                                            href="#orders_my" >我求购的</a></li>
                                    <li class="nav-item" ><a class="nav-link" data-toggle="tab"
                                                             href="#orders_other" >我寄卖的</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content" style="width: 46%">
                                    <!-- 我买的 -->
                                    <div id="orders_my" class="container tab-pane active"
                                         style="width: 100%">
                                        <br>
                                        <form class="form-horizontal" role="form">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                    </tr>
                                                    <tr>
                                                        <th >订单编号</th>
                                                        <th>名称</th>
                                                        <th>价格</th>
                                                        <th>备注</th>
                                                        <th>当前状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="B" items="${requestScope.get('Buys')}">
                                                        <tr>
                                                         <td>${B.getGoodsid()}</td>
                                                         <td>${B.getGoodsname()}</td>
                                                         <td>${B.getPrice()}</td>
                                                         <td>${B.getData()}</td>
                                                            <td>
                                                                <c:if test="${B.getOrderstate()==1}"><input type="button" value="已付款" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==2}"><input type="button" value="待卖家确认" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==3}"><input type="button" value="卖家已同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==4}"><input type="button" value="卖家未同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==5}"><input type="button" value="待管理员确认" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==6}"><input type="button" value="管理员已同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==7}"><input type="button" value="管理员未同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${B.getOrderstate()==8}"><input type="button" value="交易完成" class="btn btn-info"/></c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </form>
                                    </div>


                                    <!-- 我卖的 -->
                                    <div id="orders_other" class="container tab-pane"
                                         style="width: 100%">
                                        <br>
                                        <form class="form-horizontal" role="form">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                    </tr>
                                                    <tr>
                                                        <th >订单编号</th>
                                                        <th>名称</th>
                                                        <th>价格</th>
                                                        <th>备注</th>
                                                        <th>当前状态</th>
                                                        <th>操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="S" items="${requestScope.get('Sells')}">
                                                        <tr>
                                                            <td>${S.getGoodsid()}</td>
                                                            <td>${S.getGoodsname()}</td>
                                                            <td>${S.getPrice()}</td>
                                                            <td>${S.getData()}</td>
                                                            <td>
                                                                <c:if test="${S.getOrderstate()==1}"><input type="button" value="买家已付款" class="btn btn-info"/></c:if>
                                                                <c:if test="${S.getOrderstate()==2}"><input type="button" value="待确认" class="btn btn-info"/>
                                                                    <p>
                                                                        <span onclick="doPass()">同意</span>
                                                                        <span onclick="doRefuse()">拒绝</span>
                                                                    </p>
                                                                </c:if>
                                                                <c:if test="${S.getOrderstate()==3}"><input type="button" value="已同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${S.getOrderstate()==4}"><input type="button" value="未同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${S.getOrderstate()==5}"><input type="button" value="待管理员确认" class="btn btn-info"/></c:if>
                                                                <c:if test="${S.getOrderstate()==6}"><input type="button" value="管理员已同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${S.getOrderstate()==7}"><input type="button" value="管理员未同意" class="btn btn-info"/></c:if>
                                                                <c:if test="${S.getOrderstate()==8}"><input type="button" value="交易完成" class="btn btn-info"/></c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/fileinput/fileinput.min.js"></script>

<!-- Template Main Javascript File -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/lib/toastr/toastr.min.js"></script>
<script>
    function doPass(id) {
        $.ajax({
            url:'${pageContext.request.contextPath}/Personal/Dealpass',
            data:{"id":id},
            success:function(json) {
                if(json.result=== "ok") {
                    toastr.success("操作成功");
                    location.reload();
                }else {
                    toastr.error("操作失败！")
                    location.reload();
                }
            },
            error:function(){
                toastr.error('请求超时或系统出错!');
            },
        });
    }
    function doRefuse(id) {
        $.ajax({
            url:'${pageContext.request.contextPath}/Personal/Dealrefuse',
            data:{"id":id},
            success:function(json) {
                if(json.result=== "ok") {
                    toastr.success("操作成功");
                    location.reload();
                }else {
                    toastr.error("操作失败！")
                    location.reload();
                }
            },
            error:function(){
                toastr.error('请求超时或系统出错!');
            },
        });
    }
</script>

</body>
</html>