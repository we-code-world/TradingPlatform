<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="GBK"%>
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
            <c:if test="${empty requestScope.get('buy_list')}">
                <div style="text-align: center;width: 100%;">
                    <br>
                    还没有人发布该类求购哦！请耐心等待哟~
                    <br>
                </div>
            </c:if>
            <c:forEach var="Buy" items="${requestScope.get('buy_list')}">
                <div class="col-md-4" data-toggle="tooltip"title="和求购者聊天">
                    <div class="service-box">
                        <div class="service-ico">
                            <span class="ico-circle"><i class=<%=cls[i % 6]%>></i></span>
                        </div>
                        <div class="service-content">
                            <h2 class="s-title">${Buy.getGoodsname()}</h2>
                            <p class="s-description text-center">
                                    ${Buy.getData()}
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
                    <c:if test="${empty requestScope.get('goods_list')}">
                        <div style="text-align: center;">
                            <br>
                            还没有人发布该类商品哦！请耐心等待上架~
                            <br>
                        </div>
                    </c:if>
                    <c:forEach var="Sell" items="${requestScope.get('goods_list')}">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span>New</span>
                                </div>
                                <a href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Sell.getGoodsid()}&userid=${requestScope.get('userid')}"><button class="main-btn quick-view"><i class="fa fa-eye"></i> 商品详情</button></a>
                                <img src="${pageContext.request.contextPath}${Sell.getPictureurl()}" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">￥${Sell.getPrice()}</h3>

                                <h2 class="product-name"><a href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Sell.getGoodsid()}&userid=${requestScope.get('userid')}">${Sell.getGoodsname()}</a></h2>
                                <div class="product-btns">
                                    <button class="primary-btn add-to-cart" onclick="change(${Sell.getGoodsid()},${requestScope.get('userid')})"><i class="fa fa-shopping-cart"></i> 加入购物车</button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button class="primary-btn add-to-cart" onclick="chatid(${Sell.getSellerid()},${requestScope.get('userid')})"><i class="fa fa-commenting-o"></i> 联系卖家</button>
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
