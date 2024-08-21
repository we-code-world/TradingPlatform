<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>�û���Ϣ���</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- ��ҳ -->
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

    <!-- ʵ����߶��� -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/lib/matrix/matrix.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap3.3.7.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <!-- ȫѡ base.js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/base.js"></script>
    <link href="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/lib/sweetalert/sweetalert.min.js"></script>

    <script type="text/javascript">

        /* �޸� */
        function doEdit(id){
            $.ajax({
                url:'${pageContext.request.contextPath}/Admin/getUSER',
                data:{"id":id},
                success:function(json) {
                    if (json.result.toString() === "ok") {
                        $('#myeditform').find("input[name='userId']").val(json.user.userid);
                        $('#myeditform').find("input[name='account']").val(json.user.account);
                        $('#myeditform').find("input[name='mobile']").val(json.user.telephone);
                        $('#myeditform').find("input[name='withdrawals']").val(json.user.email);
                        $('#myeditform').find("input[name='address']").val(json.user.address);
                        $('#myeditform').find("input[name='QQ']").val(json.user.qq);
                        $('#editModal').modal('toggle');
                        $('#pass').val(id);
                        $('#refuse').val(id);
                    }
                },
                error:function(){
                    alert('����ʱ��ϵͳ����!');
                    $('#editModal').modal('hide');
                },
            });
        }

        /* ͨ�� */
        function doSavePass(){
            $.ajax({
                url:'${pageContext.request.contextPath}/Admin/updateUSERpass',
                data:{"id":$('#pass').val()},
                success:function(json){
                    if(json.result==="ok"){
                        swal({
                            title : "ͨ�������ɹ�",
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
                    else{
                        swal({
                            title : "ͨ������ʧ��",
                            type : "error",
                            confirmButtonText : "ȷ��",
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
                        title : "����ʱ��ϵͳ����!",
                        type : "error",
                        confirmButtonText : "ȷ��",
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

        /* ��ͨ�� */
        function doSaveRefuse(){
            $.ajax({
                url:'${pageContext.request.contextPath}/Admin/updateUSERRefuse',
                data:{"id":$('#refuse').val()},
                success:function(json){
                    if(json.result==="ok"){
                        swal({
                            title : "�ܾ������ɹ�",
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
                    else{
                        swal({
                            title : "�ܾ�����ʧ��",
                            type : "error",
                            confirmButtonText : "ȷ��",
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
                        title : "����ʱ��ϵͳ����!",
                        type : "error",
                        confirmButtonText : "ȷ��",
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

        //����ֵ ��̬ѡ��
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
                       onclick="return confirm('ȷ���˳���');"><i class="icon-key"></i>�˳�</a>
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
                    <p style="font-size:30px;text-align:center;color: black">�ص���ҳ</p>
                </a>
            </div>
        </div>

    </div>
    <ul>
        <li class="submenu"><a href="#"><i class="icon icon-group"></i>
            <span>�û���Ϣ���</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pageuserinfo?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">�û���Ϣ�б�</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-signal"></i>
            <span>�����</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagewtb?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">����Ϣ�б�</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-th"></i>
            <span>�������</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagewts?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">������Ϣ�б�</a></li>
            </ul>
        </li>
        <li class="submenu"><a href="#"><i class="icon icon-inbox"></i>
            <span>�������</span> </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Admin/pagedeal?id=${requestScope.get('admin').getUserid()}&&pageNum=1&&pageSize=10">������Ϣ�б�</a></li>
            </ul>
        </li>
    </ul>
</div>


<!--��Ҫ����-->
<div id="content" style="margin-right: 100px; margin-top: 40px;">

    <!-- Page table -->
    <div class="container" style="width: 900px;">
        <!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

        <div class="col-lg-12">
            <h2 class="page-header"
                style="margin-top: 10px; text-align: center; font-family: '΢���ź�', Verdana, sans-serif, '����', serif;">
                �û���Ϣ���</h2>
        </div>

        <!--������-->
        <form class="form-horizontal" id="myserchform" name="myform"
              action="${pageContext.request.contextPath}/Admin/search?id=${requestScope.get('admin').getUserid()}" method="post" style="height: 150px">
            <div class="form-group">
                <div class="col-sm-5" style="text-align: center;">
                    <input type="number" placeholder="�����û�id" name="userId" value="" class="form-control"/>
                </div>
                <div class="col-sm-5" style="text-align: left;">
                    <select name="state" data-style="btn-info" class="form-control" id="myselected">
                        <option value="" >��ѡ�����״̬</option>
                        <option value="0">�д����</option>
                        <option value="1">��˳ɹ�</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <button class="btn btn-success btn-default" type="submit">����</button>
                    <!-- <button class="btn btn-danger btn-sm" type="button" id="deletePurseButton">ɾ��</button>  -->
                </div>
            </div>
        </form>

        <!--�����ʾ-->
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>�û�ID</th>
                <th>״̬</th>
                <th>����</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${requestScope.get('users').list}">
                <tr>
                    <td>${user.getUserid()}</td>

                    <td>
                        <c:if test="${user.getAdminSign()==0}"><span class="btn-primary  btn-warning">�д����</span></c:if>
                        <c:if test="${user.getAdminSign()==1}"><span class="btn-primary btn-danger">���δͨ��</span> </c:if>
                        <c:if test="${user.getAdminSign()==2}"><span class="btn-primary  btn-success">�����ͨ��</span></c:if>
                    </td>
                    <td>

                        <c:if test="${user.getAdminSign()!=0}"><button type="button" class="btn btn-success" >�������</button></c:if>

                        <c:if test="${user.getAdminSign()==0}"><button type="button" class="btn btn-info" onclick="doEdit(${user.getUserid()})">�������</button></c:if>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!--��ҳ��-->
        <div style="text-align: right">
            <div class="pagination">
                <ul>
                    <c:if test="${requestScope.get('users').pageNum != 1 }">
                        <li><a>��1ҳ</a></li>
                    </c:if>
                    <c:if test="${requestScope.get('users').isFirstPage = false }">
                        <li><a href="${pageContext.request.contextPath}/Admin/pageuserinfo?id=${requestScope.get('admin').getUserid()}&&pageNum=${requestScope.get('users').pageNum-1 }&&pageSize=10">��һҳ</a>
                        </li>
                    </c:if>
                    <li>��${requestScope.get('users').pageNum}ҳ</li>
                    <c:if test="${requestScope.get('users').isLastPage = false}">
                        <li><a href="${pageContext.request.contextPath}/Admin/pageuserinfo?id=${requestScope.get('admin').getUserid()}&&pageNum=${requestScope.get('users').pageNum+1 }&&pageSize=10">��һҳ</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--�޸�  ģ̬��Modal�� -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">�����Ϣ</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="myeditform" name="myform">
                    <input type="hidden" id="id" name="id" value="" />
                    <div class="form-group">
                        <label class="col-sm-4 control-label">�û�ID:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="userId" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">�ǳ�:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="account" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">�ֻ�:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="mobile" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">����:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="withdrawals" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">��ַ:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="address" style="margin-top: 8px;" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">QQ:</label>
                        <div class="col-sm-8">
                            <input type="text" readonly class="form-control" name="QQ" style="margin-top: 8px;" />
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer" >
                <div style="text-align:center">
                    <div class="col-sm-2"></div>
                    <button id="pass" type="button" class="btn btn-success col-sm-4" onclick="doSavePass()">ͨ��</button>
                    <button id="refuse" type="button" class="btn btn-danger col-sm-4" onclick="doSaveRefuse()">�ܾ�</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

</body>
</html>
