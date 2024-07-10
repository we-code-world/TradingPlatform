<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-paginator.min.js"></script>

    <!-- Template Main Javascript File -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

    <script type="text/javascript">

        function viewPersonal(id){
            $.ajax({
                url:'${pageContext.request.contextPath}/Personal/show?userid=id',
                type:'GET',
                data:{id:id},
                dataType:'json',
                success:function(json){
                    if(json){
                        $('#myviewform').find("input[name='phone']").val(json.phone);
                        $('#myviewform').find("input[name='username']").val(json.username);
                        $('#myviewform').find("input[name='qq']").val(json.qq);
                        $('#myviewform').find("input[name='power']").val(json.power);
                        $('#myviewform').find("input[name='createAt']").val(json.createAt);
                        $('#viewModal').modal('toggle');
                    }
                },
                error:function(){
                    alert('请求超时或系统出错!');
                    $('#viewModal').modal('hide');
                }
            });
        }

        function sendContext(){
            var context= $("#mycontext").text();
            $.ajax({
                url:'${pageContext.request.contextPath}/user/insertSelective',
                type:'POST',
                data:{context:context},
                dataType:'json',
                success:function(json){
                    alert(json.msg);
                    location.reload();
                },
                error:function(){
                    alert('请求超时或系统出错!');
                }
            });

        }

        $(function(){
            var options={
                bootstrapMajorVersion:1,    //版本
                currentPage:1,    //当前页数
                numberOfPages:5,    //最多显示Page页
                totalPages:10,    //所有数据可以显示的页数
                onPageClicked:function(e,originalEvent,type,page){
                    console.log("e");
                    console.log(e);
                    console.log("originalEvent");
                    console.log(originalEvent);
                    console.log("type");
                    console.log(type);
                    console.log("page");
                    console.log(page);
                }
            }
            //$("#page").bootstrapPaginator(options);
        })
    </script>
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

<!--求购信息-->
<div id="user_content">
    <div class="share">
        <h1 style="text-align: center">我的求购</h1>
        <hr />
        <div class="share_content">
            <c:if test="${empty requestScope.get('Buys')}">
                <div class="no_share">
                    <span>没有任何内容，去逛逛其它的吧！</span>
                </div>
            </c:if>
            <c:if test="${!empty requestScope.get('Buys')}">
                <c:forEach var="Buy" items="${requestScope.get('Buys')}">
                    <div class="story">
                        <a href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Buy.getGoodsid()}&userid=${requestScope.get('user').getUserid()}" class="head_img">
                            <img src="">
                        </a>
                        <span class="name" style="margin-left:30px;color: red">${Buy.getGoodsname()}</span>
                        <span class="text" style="overflow: hidden; outline: none;">${Buy.getData()}</span>
                        <div class="box">
                            <div class="interact">
                                <span class="fa fa-edit fa-lg"><a href="${pageContext.request.contextPath}/Buy/show?userid=${requestScope.get('user').getUserid()}">编辑</a></span>
                                <span class="time">${Buy.showDate()}</span>
                                <span class="fa fa-trash fa-lg"><a href="${pageContext.request.contextPath}/Buy/delete/${items.goods.id}">下架</a></span>
                            </div><br>
                            <div class="like_detail">
                                <div class="like_content">
                                    <span>上架时间：${Buy.showDate()}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>

</div>




</body>
</html>