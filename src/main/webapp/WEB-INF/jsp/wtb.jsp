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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css" />
	<link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>

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

<!--中部-->
<div id="cover" style="min-height: 639px;">
	<div id="user_area">
		<!-- 发布物品  -->
		<div id="user_content" style="height:800px">
			<div class="basic container">
				<form action="${pageContext.request.contextPath}/Buy/submit?userid=${requestScope.get('user').getUserid()}" method="post" role="form" enctype="multipart/form-data">
					<h1 style="margin-left: 200px; color:rgb(149,94,70)">发布求购</h1><hr />
					<div class="changeinfo">
						<span>物品名：</span>
						<input class="in_info" type="text" name="name" placeholder="请输入物品名" id="Goodsname"/>

					</div>
					<div class="changeinfo">
						<span>收购价格：</span>
						<input class="in_info" type="text" name="price" placeholder="请输入出售价格" id="Price"/>

					</div>
					<div class="changeinfo">
						<span>联系方式：</span>
						<input class="in_info" type="text" name="realPrice" placeholder="请输入联系方式" id="Telephone" value="${requestScope.get('user').getTelephone()}"/>

					</div>
					<div class="changeinfo">
						<span>物品类别：</span>
						<select class="in_info" name="catelogId" id="catelogId">
							<option value="1">闲置数码</option>
							<option value="2">校园代步</option>
							<option value="3">电器日用</option>
							<option value="4">图书教材</option>
							<option value="5">美妆衣物</option>
							<option value="6">运动棋牌</option>
							<option value="7">票券小物</option>
						</select>
					</div>
					<div class="changeinfo" id="dir">
						<span>商品描述：</span>
						<div class="sha">
							<div class="publ">
								<div class="pub_con">
									<div class="text_pu">
										<textarea name="describle" class="emoji-wysiwyg-editor" id="Data"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="changeinfo" style="margin-top: 200px;">
						<p onclick="sub(${requestScope.get('user').getUserid()})" class="btn btn-primary col-sm-offset-3 " style="margin-left:250px;background-color: blue;">发布求购</p>
					</div>
				</form>
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
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>
<script>
	toastr.options.positionClass = 'toast-center-center';

	function sub(id){
		$.post({
			url: "${pageContext.request.contextPath}/Buy/submit",
			data:{"Seekname":$("#Goodsname").val(),"Wprice":$("#Price").val(),"Telephone":$("#Telephone").val(),"Userid":id,"catelogId":$("#catelogId").val(),"Wtbdata":$("#Data").val()},
			success: function(data){
				var res=data.result;
				if(res.toString()==="ok"){
					swal({
						title : "发布成功",
						type : "success",
						confirmButtonText : "确定",
						closeOnConfirm : true,
						timer:1000
					},function(isConfirm){
						if (isConfirm) {
							location.reload();
						}
					});
				}else {
					swal({
						title : "发布失败",
						type : "error",
						confirmButtonText : "确定",
						closeOnConfirm : true,
						timer:1000
					},function(isConfirm){
						if (isConfirm) {
							location.reload();
						}
					});
				}
			},
			error: function(data){
				swal({
					title : "当前无法上传,可能是输入内容为空或格式不正确",
					type : "error",
					confirmButtonText : "确定",
					closeOnConfirm : true,
					timer:1000
				},function(isConfirm){
					if (isConfirm) {
						location.reload();
					}
				});
			}
		})
	}
</script>

</body>
</html>