<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>南理工闲鱼</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-3.3.7.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/toastr/toastr.min.css">
    <link href="${pageContext.request.contextPath}/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">

    <!-- Google font -->
    <link href="${pageContext.request.contextPath}/lib/font/style2fonts.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/css/style-red.css" rel="stylesheet">
    <style>
        ul{
            text-decoration: none
        }
        #navbarDefault li{
            margin-left: 50px
        }
    </style>

</head>
<body id="cart">
<!--头部导航-->
<nav class="navbar navbar-b navbar-expand-md  navbar-trans" style="background-color: #955e46" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll" href="#page-top">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" style="width:50px">
            南理工闲鱼
        </a>
        <div class="navbar-collapse justify-content-end collapse" id="navbarDefault">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/index?userid=${requestScope.get('userid')}" style="font-size: 20px">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Buy/show?userid=${requestScope.get('userid')}" style="font-size: 20px">发布求购</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/show?userid=${requestScope.get('userid')}" style="font-size: 20px">发布商品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Personal/index?userid=${requestScope.get('userid')}" style="font-size: 20px">个人主页</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!--我的购物车-->
<div class="container" style="background-color: white;margin-top: 50px">
    <div class="row" style="margin-left: 40px">
        <h3>我的购物车<small>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</small></h3>
    </div>
    <div class="row" style="margin-top: 40px;">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>序号</th>
                    <th>商品名称</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
                <% int i=0;%>
                    <c:forEach var="goods" items="${requestScope.get('goods_list')}">
                        <% i=i+1; %>
                        <c:if test="${goods!=null}">
                        <tr id="good${goods.getGoodsid()}">
                            <th><%=i%></th>
                            <th>${goods.getGoodsname()}</th>
                            <th>${goods.getPrice()}</th>
                            <th>
                                <button type="button" class="btn btn-danger" onclick="delone(${goods.getGoodsid()})">删除</button>
                            </th>
                        </tr>
                        </c:if>
                    </c:forEach>
            </table>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="pull-right" style="margin-right: 40px;">

            <button id="removeAllProduct" onclick="delall()" class="btn btn-danger" style="margin-left: 770px">清空购物车</button>
            &nbsp;&nbsp;
            <button onclick="checkout()" class="btn  btn-success" >结账</button>

            <br><br>
            <div style="margin-bottom: 20px;margin-left: 900px">
            商品金额总计：<span id="total" class="text-danger" ><b>￥${requestScope.get('user_cart').getPricesum()}&nbsp</b></span>
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






<!-- JavaScript Libraries -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.js"></script>
<!--<script src="lib/bootstrap/js/bootstrap3.3.7.js"></script>-->
<script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/counterup/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/counterup/jquery.counterup.js"></script>
<script src="${pageContext.request.contextPath}/lib/toastr/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/typed/typed.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>

<script>
    function delone(gid) {
        $.ajax({
            url:'${pageContext.request.contextPath}/Cart/delete/one',
            type:'POST',
            data:{"id":${requestScope.get('userid')},"gid":gid},
            success:function (data) {
                if(data.result==="ok"){
                    swal({
                        title : "删除成功",
                        type : "success",
                        confirmButtonText : "确定",
                        closeOnConfirm : true,
                        timer:1000
                    },function(isConfirm){
                        if (isConfirm) {
                            location.reload();
                        }
                    });
                }
            }
        })
    }
    function delall() {
        $.ajax({
            url:'${pageContext.request.contextPath}/Cart/delete/all',
            type:'POST',
            data:{"id":${requestScope.get('userid')}},
            success:function (data) {
                if(data.result==="ok"){
                    swal({
                        title : "清空成功",
                        type : "success",
                        confirmButtonText : "确定",
                        closeOnConfirm : true,
                        timer:1000
                    },function(isConfirm){
                        if (isConfirm) {
                            location.reload();
                        }
                    });
                }
            }
        })
    }


    function checkout() {
        $.ajax({
            url:'${pageContext.request.contextPath}/Pay/checkout',
            type:'POST',
            data:{"uid":${requestScope.get('userid')},"sum":${requestScope.get("user_cart").getPricesum()}},
            success:function (data) {
                if(data.result==="ok"){
                    swal({
                        title:"是否结账",
                        text:"",
                        type:"warning",
                        showCancelButton:true,//是否显示取消按钮
                        cancelButtonText:'取 消',//按钮内容
                        cancelButtonColor:'#b9b9b9',

                        showConfirmButton:true,
                        confirmButtonText:'确 认',
                        confirmButtonColor:"#dd6b55",

                        closeOnConfirm:false,//点击返回上一步操作
                        closeOnCancel:true
                    },function(isConfirm){
                        $.ajax({
                            url:'${pageContext.request.contextPath}/Cart/pay/all',
                            type:'POST',
                            data:{"cartid":${requestScope.get('user_cart').getCartid()}},
                            success:function (data) {
                                toastr.success("支付完成！");
                                location.reload();
                            },
                            error:function () {
                                toastr.error("请求超时或系统出错!");
                                location.reload();
                            }
                        })
                    })

                }else {
                    swal({
                        title:"余额不足，是否充值",
                        text:"",
                        type:"warning",
                        showCancelButton:true,//是否显示取消按钮
                        cancelButtonText:'取 消',//按钮内容
                        cancelButtonColor:'#b9b9b9',

                        showConfirmButton:true,
                        confirmButtonText:'确 认',
                        confirmButtonColor:"#dd6b55",

                        closeOnConfirm:false,//点击返回上一步操作
                        closeOnCancel:true
                    },function(isConfirm) {//正确按钮进行的操作点
                        if(isConfirm===true){
                            addcharge();
                        }
                    })
                }
            }
        })
    }
    function addcharge() {
        $.ajax({
            url:'${pageContext.request.contextPath}/Pay/recharge',
            type:'POST',
            data:{"userid":${requestScope.get('userid')}},
            success:function (data) {
                $.ajax({
                    url:'${pageContext.request.contextPath}/Pay/page_pay',
                    type:'POST',
                    data:{"WIDout_trade_no":data.WIDout_trade_no,"WIDsubject":data.WIDsubject,"WIDtotal_amount":${requestScope.get('user_cart').getPricesum()},"WIDbody":data.WIDbody},
                    success:function (data) {
                        $("#cart").html(data);
                    }
                })
            }
        })
    }
</script>


</body>
</html>
