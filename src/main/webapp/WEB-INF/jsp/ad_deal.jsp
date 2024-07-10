<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>交易审核</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- 分页 -->
    <link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="icon">
    <link href="${pageContext.request.contextPath}/img/favicon.jpg" rel="apple-touch-icon">

    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-3.3.7o.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/matrix/matrix-media.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/matrix/matrix-style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome3.css"/>

    <!-- 实现左边动画 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/lib/matrix/matrix.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap3.3.7.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <!-- 全选 base.js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/base.js"></script>
    <link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>


    <script type="text/javascript">

        /* 修改 */
        function doEdit(id){
            $.ajax({
                url:'${pageContext.request.contextPath}/Admin/getDEAL',
                data:{"id":id},
                success:function(json) {
                    if (json.result.toString() === "ok") {
                        $('#myeditform').find("input[name='dealId']").val(json.deal.transactionid);
                        $('#myeditform').find("input[name='buyuserId']").val(json.deal.buyerid);
                        $('#myeditform').find("input[name='selluserId']").val(json.deal.sellerid);
                        $('#myeditform').find("input[name='goodsid']").val(json.deal.goodsid);
                        $('#myeditform').find("input[name='price']").val(json.deal.price);
                        $('#myeditform').find("input[name='pic']").attr("src",json.deal.pictureurl);
                        $('#editModal').modal('toggle');
                        $('#pass').val(id);
                        $('#refuse').val(id);
                    }
                },
                error:function(){
                    alert('请求超时或系统出错!');
                    $('#editModal').modal('hide');
                },
            });
        }

        /* 通过 */
        function doSavePass(){
            $.ajax({
                url:'${pageContext.request.contextPath}/Admin/updateDEALpass',
                data:{"id":$('#pass').val()},
                success:function(json){
                    if(json.result==="ok"){
                        swal({
                            title : "通过操作成功",
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
                    else{
                        swal({
                            title : "通过操作失败",
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
                    $('#editModal').modal('toggle');
                },
                error:function(){
                    swal({
                        title : "请求超时或系统出错!",
                        type : "error",
                        confirmButtonText : "确定",
                        closeOnConfirm : true,
                        timer:1000
                    },function(isConfirm){
                        if (isConfirm) {
                            location.reload();
                        }
                    });
                    $('#editModal').modal('toggle');
                }
            });
        }

        /* 不通过 */
        function doSaveRefuse(){
            $.ajax({
                url:'${pageContext.request.contextPath}/Admin/updateDEALRefuse',
                data:{"id":$('#refuse').val()},
                success:function(json){
                    if(json.result==="ok"){
                        swal({
                            title : "拒绝操作成功",
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
                    else{
                        swal({
                            title : "拒绝操作失败",
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
                    $('#editModal').modal('toggle');
                },
                error:function(){
                    swal({
                        title : "请求超时或系统出错!",
                        type : "error",
                        confirmButtonText : "确定",
                        closeOnConfirm : true,
                        timer:1000
                    },function(isConfirm){
                        if (isConfirm) {
                            location.reload();
                        }
                    });
                    $('#editModal').modal('toggle');
                }
            });
        }

        //根据值 动态选中
        $("#myselected option[value='${searchpurse.state}']").attr("selected","selected");
    </script>
    <style>
        .modal-header {
            text-align: center;
        }

        table td {
            text-align: center;
            border: 0px;
        }
    </style>
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
                <a href="${pageContext.request.contextPath}/Admin/index?id=${requestScope.get('admin').getUserid()}">
                    <p style="font-size:30px;text-align:center;color: black">回到首页</p>
                </a>
            </div>
        </div>

    </div>
    <ul>
        <li class="submenu"><a href="#"><i class="icon icon-group"></i>
            <span>用户信息审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pageuserinfo?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">用户信息列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-signal"></i>
            <span>求购审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagewtb?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">求购信息列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-th"></i>
            <span>求卖审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagewts?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">求卖信息列表</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-inbox"></i>
            <span>交易审核</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagedeal?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">交易信息列表</a></li>
            </ul>
        </li>
    </ul>
</div>


<!--主要内容-->
<div id="content" style="margin-right: 100px; margin-top: 40px;">

    <!-- Page table -->
    <div class="container" style="width: 900px;">
        <!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

        <div class="col-lg-12">
            <h2 class="page-header"
                style="margin-top: 10px; text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
                交易审核</h2>
        </div>

        <!--搜索栏-->
        <form class="form-horizontal" id="myserchform" name="myform"
              action="${pageContext.request.contextPath}/Admin/search?id=${requestScope.get('admin').getUserid()}" method="post" style="height: 150px">
            <div class="form-group">
                <div class="col-sm-5" style="text-align: center;">
                    <input type="number" placeholder="请输交易id" name="dealId" value="${searchpurse.userId}" class="form-control"/>
                </div>
                <div class="col-sm-5" style="text-align: left;">
                    <select name="state" data-style="btn-info" class="form-control" id="myselected">
                        <option value="" >请选择审核状态</option>
                        <option value="0">尚待审核</option>
                        <option value="1">审核成功</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <button class="btn btn-success btn-default" type="submit">查找</button>
                    <!-- <button class="btn btn-danger btn-sm" type="button" id="deletePurseButton">删除</button>  -->
                </div>
            </div>
        </form>

        <!--表格显示-->
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>交易ID</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="deal" items="${requestScope.get('deals').list}">
                <tr>
                    <td>${deal.getTransactionid()}</td>

                    <td>
                        <c:if test="${deal.getAdministrator_agree()==0}"><span class="btn-primary btn-warning">尚待审核</span> </c:if>
                        <c:if test="${deal.getAdministrator_agree()==1}"><span class="btn-primary btn-danger">审核未通过</span> </c:if>
                        <c:if test="${deal.getAdministrator_agree()==2}"><span class="btn-primary  btn-success">审核已通过</span></c:if>
                    </td>
                    <td>


                        <c:if test="${deal.getAdministrator_agree()!=0}"><button type="button" class="btn btn-success" >无需审核</button></c:if>

                        <c:if test="${deal.getAdministrator_agree()==0}"><button type="button" class="btn btn-info" onclick="doEdit(${deal.getTransactionid()})">立即审核</button></c:if>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!--分页条-->
        <div style="text-align: right">
            <div class="pagination">
                <ul>
                    <c:if test="${requestScope.get('deals').pageNum != 1 }">
                        <li><a>第1页</a></li>
                    </c:if>
                    <c:if test="${requestScope.get('deals').isFirstPage = false }">
                        <li><a href="${pageContext.request.contextPath}/Admin/pagedeal?id=${requestScope.get('admin').getUserid()}&&pageNum=${requestScope.get('deals').pageNum-1 }&&pageSize=10">上一页</a>
                        </li>
                    </c:if>
                    <li>第${requestScope.get('deals').pageNum}页</li>
                    <c:if test="${requestScope.get('deals').isLastPage = false}">
                        <li><a href="${pageContext.request.contextPath}/Admin/pagedeal?id=${requestScope.get('admin').getUserid()}&&pageNum=${requestScope.get('deals').pageNum+1 }&&pageSize=10">下一页</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--修改  模态框（Modal） -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">审核信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="myeditform" name="myform">
                    <input type="hidden" id="id" name="id" value="" />
                    <div class="form-group">
                        <label class="col-sm-4 control-label">交易ID:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="dealId" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">买方用户ID:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="buyuserId" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">卖方用户ID:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="selluserId" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">商品ID:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="goodsid" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">商品价格:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="price" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">商品图片:</label>
                        <div class="col-sm-8">
                            <img  name="pic" style="margin-top: 8px; width: 200px;height: 200px" />
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer" >
                <div style="text-align:center">
                    <div class="col-sm-2"></div>
                    <button id="pass" type="button" class="btn btn-success col-sm-4" onclick="doSavePass()">通过</button>
                    <button id="refuse" type="button" class="btn btn-danger col-sm-4" onclick="doSaveRefuse()">拒绝</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

</body>
</html>
