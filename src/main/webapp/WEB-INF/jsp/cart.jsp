<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <title>��������</title>
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
<!--ͷ������-->
<nav class="navbar navbar-b navbar-expand-md  navbar-trans" style="background-color: #955e46" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll" href="#page-top">
            <img src="${pageContext.request.contextPath}/img/favicon.jpg" style="width:50px">
            ��������
        </a>
        <div class="navbar-collapse justify-content-end collapse" id="navbarDefault">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/index?userid=${requestScope.get('userid')}" style="font-size: 20px">��ҳ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Buy/show?userid=${requestScope.get('userid')}" style="font-size: 20px">������</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Sell/show?userid=${requestScope.get('userid')}" style="font-size: 20px">������Ʒ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll" href="${pageContext.request.contextPath}/Personal/index?userid=${requestScope.get('userid')}" style="font-size: 20px">������ҳ</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!--�ҵĹ��ﳵ-->
<div class="container" style="background-color: white;margin-top: 50px">
    <div class="row" style="margin-left: 40px">
        <h3>�ҵĹ��ﳵ<small>��ܰ��ʾ����Ʒ�Ƿ���ɹ����������µ�Ϊ׼Ŷ���뾡�����</small></h3>
    </div>
    <div class="row" style="margin-top: 40px;">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>���</th>
                    <th>��Ʒ����</th>
                    <th>�۸�</th>
                    <th>����</th>
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
                                <button type="button" class="btn btn-danger" onclick="delone(${goods.getGoodsid()})">ɾ��</button>
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

            <button id="removeAllProduct" onclick="delall()" class="btn btn-danger" style="margin-left: 770px">��չ��ﳵ</button>
            &nbsp;&nbsp;
            <button onclick="checkout()" class="btn  btn-success" >����</button>

            <br><br>
            <div style="margin-bottom: 20px;margin-left: 900px">
            ��Ʒ����ܼƣ�<span id="total" class="text-danger" ><b>��${requestScope.get('user_cart').getPricesum()}&nbsp</b></span>
        </div>
    </div>
</div>
</div>

<!--β��-->
<section class="paralax-mf footer-paralax bg-image sect-mt4 route" style="background-image: url(${pageContext.request.contextPath}/img/intro-bg.jpg)">
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="copyright-box">
                        <p class="copyright">&copy; Copyright <strong>��������</strong>. All Rights Reserved</p>
                        <div class="credits">
                            Designed by <strong>���㹤����</strong>
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
                        title : "ɾ���ɹ�",
                        type : "success",
                        confirmButtonText : "ȷ��",
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
                        title : "��ճɹ�",
                        type : "success",
                        confirmButtonText : "ȷ��",
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
                        title:"�Ƿ����",
                        text:"",
                        type:"warning",
                        showCancelButton:true,//�Ƿ���ʾȡ����ť
                        cancelButtonText:'ȡ ��',//��ť����
                        cancelButtonColor:'#b9b9b9',

                        showConfirmButton:true,
                        confirmButtonText:'ȷ ��',
                        confirmButtonColor:"#dd6b55",

                        closeOnConfirm:false,//���������һ������
                        closeOnCancel:true
                    },function(isConfirm){
                        $.ajax({
                            url:'${pageContext.request.contextPath}/Cart/pay/all',
                            type:'POST',
                            data:{"cartid":${requestScope.get('user_cart').getCartid()}},
                            success:function (data) {
                                toastr.success("֧����ɣ�");
                                location.reload();
                            },
                            error:function () {
                                toastr.error("����ʱ��ϵͳ����!");
                                location.reload();
                            }
                        })
                    })

                }else {
                    swal({
                        title:"���㣬�Ƿ��ֵ",
                        text:"",
                        type:"warning",
                        showCancelButton:true,//�Ƿ���ʾȡ����ť
                        cancelButtonText:'ȡ ��',//��ť����
                        cancelButtonColor:'#b9b9b9',

                        showConfirmButton:true,
                        confirmButtonText:'ȷ ��',
                        confirmButtonColor:"#dd6b55",

                        closeOnConfirm:false,//���������һ������
                        closeOnCancel:true
                    },function(isConfirm) {//��ȷ��ť���еĲ�����
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
