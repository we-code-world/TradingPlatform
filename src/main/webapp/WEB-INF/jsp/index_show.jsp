<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="GBK"%>
<!--������-->
<section id="iwant" class="services-mf route">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="title-box text-center">
                    <h3 class="title-a">
                        ������
                    </h3>
                    <p class="subtitle-a">
                        ��ȫУ֮��������������
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
                    ��û���˷���������Ŷ�������ĵȴ�Ӵ~
                    <br>
                </div>
            </c:if>
            <c:forEach var="Buy" items="${requestScope.get('buy_list')}">
                <div class="col-md-4" data-toggle="tooltip"title="����������">
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
<!-- ��ӭ����  -->
<div class="section" id="goods">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">��ӭ����</h2>
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
                            ��û���˷���������ƷŶ�������ĵȴ��ϼ�~
                            <br>
                        </div>
                    </c:if>
                    <c:forEach var="Sell" items="${requestScope.get('goods_list')}">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span>New</span>
                                </div>
                                <a href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Sell.getGoodsid()}&userid=${requestScope.get('userid')}"><button class="main-btn quick-view"><i class="fa fa-eye"></i> ��Ʒ����</button></a>
                                <img src="${pageContext.request.contextPath}${Sell.getPictureurl()}" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">��${Sell.getPrice()}</h3>

                                <h2 class="product-name"><a href="${pageContext.request.contextPath}/Sell/goodsdetail?id=${Sell.getGoodsid()}&userid=${requestScope.get('userid')}">${Sell.getGoodsname()}</a></h2>
                                <div class="product-btns">
                                    <button class="primary-btn add-to-cart" onclick="change(${Sell.getGoodsid()},${requestScope.get('userid')})"><i class="fa fa-shopping-cart"></i> ���빺�ﳵ</button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button class="primary-btn add-to-cart" onclick="chatid(${Sell.getSellerid()},${requestScope.get('userid')})"><i class="fa fa-commenting-o"></i> ��ϵ����</button>
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
