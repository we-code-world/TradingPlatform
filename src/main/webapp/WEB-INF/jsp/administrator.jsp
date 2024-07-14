<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>管理员首页</title>
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-3.3.7o.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/matrix/matrix-media.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/matrix/matrix-style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome3.css"/>

    <!-- 实现左边动画 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/lib/matrix/matrix.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap3.3.7.js"></script>
</head>
<body>

<!--top-Header-menu-->
<div id="user-nav" class="navbar-inverse" style="">
    <ul class="nav" style="height:35px;margin-top: -5px">
        <li class="dropdown" id="profile-messages"><a title="" href="#"
                                                      data-toggle="dropdown" data-target="#profile-messages"
                                                      class="dropdown-toggle"> <i class="icon icon-user"></i>
            <span class="text" style="color: white">${requestScope.get('admin').getAccount()}</span><b class="caret"></b> </a>
            <ul class="dropdown-menu">
                <li>
                    <a href="${pageContext.request.contextPath}/Login/show"
                       onclick="return confirm('确认退出吗？');"><i class="icon-key"></i>退出</a>
                </li>
            </ul>
        </li>
    </ul>
</div>

<!--sidebar-menu-->
<div id="sidebar" style="margin-top: 30px">
    <div id="headers">
        <div style="float:left;height:50px;background-color:#323232;margin-top: 230px">
            <div style="float:left;background-color:rgb(39,169,227);height:50px;width:220px;">
                <a href="${pageContext.request.contextPath}/Admin/index?id=${requestScope.get('admin').getId()}">
                    <p style="font-size:30px;text-align:center;color: black">回到首页</p>
                </a>
            </div>
        </div>

    </div>
    <ul>
        <li class="submenu"><a href="#"><i class="icon icon-group"></i>
            <span>用户信息审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pageuserinfo?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10">用户信息列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-signal"></i>
            <span>求购审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagewtb?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10">求购信息列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-th"></i>
            <span>求卖审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagewts?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10">求卖信息列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-inbox"></i>
            <span>交易审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagedeal?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10">交易信息列表</a></li>
            </ul>
        </li>
    </ul>
</div>

<!--main-container-part-->
<div id="content" style="margin-right: 100px;margin-top: 40px;">

    <!-- 主要内容 -->
    <div class="container-fluid">
        <div class="quick-actions_homepage">
            <ul class="quick-actions">
                <li class="bg_lb"><a
                        href="${pageContext.request.contextPath}/Admin/pageuserinfo?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10"> <i
                        class="icon-group"></i>用户信息审核
                </a></li>
                <li class="bg_lg span3"><a
                        href="${pageContext.request.contextPath}/Admin/pagewtb?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10"> <i
                        class="icon-signal"></i>求购审核
                </a></li>
                <li class="bg_lo"><a
                        href="${pageContext.request.contextPath}/Admin/pagewts?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10"> <i
                        class="icon-th"></i>求卖审核
                </a></li>
                <li class="bg_ly"><a href="${pageContext.request.contextPath}/Admin/pagedeal?id=${requestScope.get('admin').getId()}&&pageNum=1&&pageSize=10">
                    <i class="icon-inbox"></i>交易审核
                </a></li>
            </ul>
        </div>
    </div>
</div>


</body>
</html>
