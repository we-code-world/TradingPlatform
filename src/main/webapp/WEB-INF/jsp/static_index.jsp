<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>南理工闲鱼</title>
    <meta name="referrer" content="never">
    <meta http-equiv="X-UA-Compatible" content="edge" />
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



    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/css/style-red.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet">
</head>

<body id="page-top">

<!--/ 导航 /-->
<nav class="navbar navbar-b navbar-expand-md fixed-top navbar-trans" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll" href="#page-top">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" style="width:50px">
            南理工闲鱼
        </a>

        <div class="navbar-collapse justify-content-end collapse" id="navbarDefault" style="">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll active" href="${pageContext.request.contextPath}/" style="font-size: 20px">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/login/show" style="font-size: 20px">发布求购</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/login/show" style="font-size: 20px">发布二手</a>
                </li>

                <li class="button-header margin-left " ><a href="${pageContext.request.contextPath}/register/show" class="btn">注册</a></li>
                &nbsp;&nbsp;
                <li class="button-header"><a href="${pageContext.request.contextPath}/login/show" class="btn">登录</a></li>
            </ul>
        </div>
    </div>
</nav>


<!--/ 字幕 /-->
<div id="home" class="intro route bg-image" style="background-image: url(${pageContext.request.contextPath}/img/intro-bg.jpg)">
    <div class="overlay-itro"></div>
    <div class="intro-content display-table">
        <div class="table-cell">
            <div class="container">
                <p class="display-6 color-d">我们是</p>
                <h1 class="intro-title mb-4">南&nbsp&nbsp理&nbsp&nbsp工&nbsp&nbsp闲&nbsp&nbsp鱼</h1>
                <p class="intro-subtitle"><span class="text-slider-items">极致体验,闲置交换,废物利用,方便你我,极速发货</span><strong class="text-slider">闲置交换</strong><span class="typed-cursor" style="animation-iteration-count: infinite;">|</span></p>
                <p class="pt-3"><a class="btn btn-primary btn js-scroll px-4" href="#iwant" role="button" style="font-size: 25px">开始你的购物之旅吧</a></p>
            </div>
        </div>
    </div>
</div>


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
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-ico">
                        <span class="ico-circle"><i class="ion-monitor"></i></span>
                    </div>
                    <div class="service-content">
                        <h2 class="s-title">有钱</h2>
                        <p class="s-description text-center" href="${pageContext.request.contextPath}/Login/show">
                            想要有钱	想要有钱想要有钱想 要有钱想要有钱想要有钱想要有钱想 想要有钱想要有钱想要有钱
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-ico">
                        <span class="ico-circle"><i class="ion-code-working"></i></span>
                    </div>
                    <div class="service-content">
                        <h2 class="s-title">有钱</h2>
                        <p class="s-description text-center" href="${pageContext.request.contextPath}/Login/show">
                            想要有钱	想要有钱想要有钱想 要有钱想要有钱想要有钱想要有钱想 想要有钱想要有钱想要有钱
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-ico">
                        <span class="ico-circle"><i class="ion-camera"></i></span>
                    </div>
                    <div class="service-content">
                        <h2 class="s-title">有钱</h2>
                        <p class="s-description text-center" href="${pageContext.request.contextPath}/Login/show">
                            想要有钱	想要有钱想要有钱想 要有钱想要有钱想要有钱想要有钱想 想要有钱想要有钱想要有钱
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-ico">
                        <span class="ico-circle"><i class="ion-android-phone-portrait"></i></span>
                    </div>
                    <div class="service-content">
                        <h2 class="s-title">有钱</h2>
                        <p class="s-description text-center" href="${pageContext.request.contextPath}/login/show">
                            想要有钱	想要有钱想要有钱想 要有钱想要有钱想要有钱想要有钱想 想要有钱想要有钱想要有钱
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-ico">
                        <span class="ico-circle"><i class="ion-paintbrush"></i></span>
                    </div>
                    <div class="service-content">
                        <h2 class="s-title">有钱</h2>
                        <p class="s-description text-center" href="${pageContext.request.contextPath}/login/show">
                            想要有钱	想要有钱想要有钱想 要有钱想要有钱想要有钱想要有钱想 想要有钱想要有钱想要有钱
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-ico">
                        <span class="ico-circle"><i class="ion-stats-bars"></i></span>
                    </div>
                    <div class="service-content">
                        <h2 class="s-title">有钱</h2>
                        <p class="s-description text-center" href="${pageContext.request.contextPath}/login/show">
                            想要有钱	想要有钱想要有钱想 要有钱想要有钱想要有钱想要有钱想 想要有钱想要有钱想要有钱
                        </p>
                    </div>
                </div>
            </div>
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
                    <!-- Product Single1 -->
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                            </div>
                            <button class="main-btn quick-view" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-eye"></i> 商品详情</button>
                            <img src="${pageContext.request.contextPath}/img/product06.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">￥32.50</h3>

                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/login/show">商品名称</a></h2>
                            <div class="product-btns">
                                <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart" href="${pageContext.request.contextPath}/login/show"></i> 加入购物车</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="primary-btn add-to-cart"><i class="fa fa-commenting-o" href="${pageContext.request.contextPath}/login/show"></i> 联系卖家</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Product Single1 -->

                    <!-- Product Single2 -->
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                            </div>
                            <button class="main-btn quick-view" href="${pageContext.request.contextPath}/Login/show"><i class="fa fa-eye"></i> 商品详情</button>
                            <img src="${pageContext.request.contextPath}/img/product05.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">￥32.50  </h3>

                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/login/show">商品名称</a></h2>
                            <div class="product-btns">
                                <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart" href="${pageContext.request.contextPath}/login/show"></i> 加入购物车</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="primary-btn add-to-cart"><i class="fa fa-commenting-o" href="${pageContext.request.contextPath}/login/show"></i> 联系卖家</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Product Single2 -->

                    <!-- Product Single3 -->
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                            </div>
                            <button class="main-btn quick-view" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-eye"></i> 商品详情</button>
                            <img src="${pageContext.request.contextPath}/img/product04.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">￥32.50</h3>

                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/login/show">商品名称</a></h2>
                            <div class="product-btns">
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-shopping-cart"></i> 加入购物车</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-commenting-o"></i> 联系卖家</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Product Single3 -->

                    <!-- Product Single4 -->
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                            </div>
                            <button class="main-btn quick-view" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-eye"></i> 商品详情</button>
                            <img src="${pageContext.request.contextPath}/img/product03.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">￥32.50  </h3>

                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/login/show">商品名称</a></h2>
                            <div class="product-btns">
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-shopping-cart"></i> 加入购物车</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-commenting-o"></i> 联系卖家</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Product Single4 -->

                    <!-- Product Single5 -->
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                            </div>
                            <button class="main-btn quick-view" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-eye"></i> 商品详情</button>
                            <img src="${pageContext.request.contextPath}/img/product03.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">￥32.50  </h3>

                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/login/show">商品名称</a></h2>
                            <div class="product-btns">
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-shopping-cart"></i> 加入购物车</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-commenting-o"></i> 联系卖家</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Product Single5 -->

                    <!-- Product Single6 -->
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                            </div>
                            <button class="main-btn quick-view" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-eye"></i> 商品详情</button>
                            <img src="${pageContext.request.contextPath}/img/product06.jpg" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">￥32.50</h3>

                            <h2 class="product-name"><a href="${pageContext.request.contextPath}/login/show">商品名称</a></h2>
                            <div class="product-btns">
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-shopping-cart"></i> 加入购物车</button>
                                &nbsp;&nbsp;&nbsp;
                                <button class="primary-btn add-to-cart" href="${pageContext.request.contextPath}/login/show"><i class="fa fa-commenting-o"></i> 联系卖家</button>
                            </div>
                        </div>
                    </div>
                    <!-- /Product Single6 -->
                </div>
            </div>
            <!-- /Product Slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>


<!--专利-->
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

<!--回弹小窗-->
<a href="#" class="back-to-top" style="display: none;"><i class="fa fa-chevron-up"></i></a>


<!-- JavaScript Libraries -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
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



</body>
</html>

