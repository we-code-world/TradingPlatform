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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css" />

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


<!--个人信息修改-->
<div id="user_content" >
		<form action="${pageContext.request.contextPath}/Personal/update" method="post" commandName="user" role="form">
			<h1 style="margin-left: 300px">修改个人信息</h1><hr />
				<input class="in_info" type="hidden" name="Userid" value="${requestScope.get('user').getUserid()}"/>
			<div class="changeinfo" style="margin-left: 150px">

				<span>账号：</span>
				<input class="in_info" type="text" name="Account" placeholder="请输入账号" value="${requestScope.get('user').getAccount()}"/>
			</div><hr />
			<div class="changeinfo" style="margin-left: 150px">
				<span>密码：</span>
				<input class="in_info" type="text" name="password" value="${requestScope.get('user').getPassword()}"/>
			</div><hr />
			<div class="changeinfo" style="margin-left: 150px">
				<span>手机号码：</span>
				<input class="in_info" type="text" name="Telephone" value="${requestScope.get('user').getTelephone()}"/>
			</div><hr />
			<div class="changeinfo" style="margin-left: 150px">
				<span>邮箱：</span>
				<input class="in_info" type="text" name="Email" value="${requestScope.get('user').getEmail()}"/>
			</div><hr />
			<div class="changeinfo" style="margin-left: 150px">
				<span>地址：</span>
				<input class="in_info" type="text" name="address" placeholder="请输入你的详细宿舍地址" value="${requestScope.get('user').getAddress()}"/>
			</div><hr />
			<div class="changeinfo" style="margin-left: 150px">
				<span>QQ：</span>
				<input class="in_info" type="text" name="qq" placeholder="请输入QQ" value="${requestScope.get('user').getQQ()}"/>
			</div>
			<input type="submit" class="setting-save" value="保存修改信息" style="margin: 100px 5000px 0px 300px;font-size: 20px;width: 200px"/>
		</form>
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

</body>
</html>