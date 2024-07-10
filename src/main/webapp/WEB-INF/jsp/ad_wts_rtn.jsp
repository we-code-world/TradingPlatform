<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Page table -->
<div class="container" style="width: 900px;">
    <!-- &lt;!&ndash; Marketing Icons Section &ndash;&gt;-->

    <div class="col-lg-12">
        <h2 class="page-header"
            style="margin-top: 10px; text-align: center; font-family: '微软雅黑', Verdana, sans-serif, '宋体', serif;">
            求卖审核</h2>
    </div>

    <!--搜索栏-->
    <form class="form-horizontal" id="myserchform" name="myform"
          action="${pageContext.request.contextPath}/Admin/search?id=${requestScope.get('admin').getUserid()}" method="post" style="height: 150px">
        <div class="form-group">
            <div class="col-sm-5" style="text-align: center;">
                <input type="number" placeholder="请输用户id" name="userId" class="form-control"/>
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
            <th>用户ID</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="wts" items="${requestScope.get('wtss')}" >
            <tr>
                <td>${wts.getUserid()}</td>

                <td>
                    <c:if test="${wts.getAdministrator_agree()==0}"><span class="btn-primary btn-warning">尚待审核</span> </c:if>
                    <c:if test="${wts.getAdministrator_agree()==1}"><span class="btn-primary btn-danger">审核未通过</span> </c:if>
                    <c:if test="${wts.getAdministrator_agree()==2}"><span class="btn-primary  btn-success">审核已通过</span></c:if>
                </td>
                <td>

                    <c:if test="${wts.getAdministrator_agree()!=0}"><p type="button" class="btn btn-success" >无需审核</p></c:if>
                    <c:if test="${wts.getAdministrator_agree()==0}"><p type="button" class="btn btn-info" onclick="doEdit(${wts.getSellid()})">立即审核</p></c:if>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!--分页条-->
    <div style="text-align: right">
        <div class="pagination">
            <ul>
                <li><a>第1页</a></li>

                <li><a
                        href="${pageContext.request.contextPath}/Admin/purseList?pageNum=${purseGrid.current+1 }">下一页</a>
                </li>
            </ul>
        </div>
    </div>
</div>
