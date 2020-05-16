<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统产品顾客管理页面</title>
    <meta name="description" content="汽配销售">
    <meta name="keywords" content="汽配销售">

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">

    <link rel="stylesheet" href="dist/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="dist/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="dist/plugins/morris/morris.css">
    <link rel="stylesheet" href="dist/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="dist/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="dist/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="dist/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="dist/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="dist/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="dist/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="dist/plugins/select2/select2.css">
    <link rel="stylesheet" href="dist/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="dist/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="dist/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="dist/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="dist/css/style.css">
    <link rel="stylesheet" href="dist/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="dist/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="dist/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="dist/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 内容区域 -->

    <div class="content-wrapper">

        <div class="tab-pane">
            <%--    客户信息展示    --%>
            <div id="showAllCustomer">
                <!-- 客户信息内容头部 -->
                <section class="content-header">
                    <h1>
                        客户信息展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                        <li><a href="#">客户信息展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 客户信息内容头部 /-->
                <!-- 客户信息正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">客户信息列表</h3>
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-success" title="新增" data-toggle="modal" data-target="#addCustomer"><i class="fa fa-file-o"></i> 新增</button>
                                            <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllCustomerByUserIds()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                            <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllCustomer()"><i class="fa fa-refresh"></i> 刷新</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="customerSearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" id="search" class="btn btn-default" onclick="customerSearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->

                                <!--数据列表-->
                                <table id="customer-list" class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="customer-selall" type="checkbox">
                                        </th>
                                        <th class="sorting_asc">#</th>
                                        <th class="sorting_desc">姓名</th>
                                        <th class="sorting_desc sorting_desc_disabled">性别</th>
                                        <th class="sorting_asc sorting_asc_disabled">手机</th>
                                        <th class="sorting">地址</th>
                                        <th class="sorting">发货物流</th>
                                        <th class="sorting">收货地址</th>
                                        <th class="sorting">备注</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                                <!--数据列表/-->
                            </div>
                            <!-- 数据表格 /-->

                        </div>
                        <!-- /.box-body -->

                        <!-- .box-footer-->
                        <div class="box-footer">
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    总共2 页，共14 条数据。 每页
                                    <select class="form-control">
                                        <option>5</option>
                                        <option>10</option>
                                        <option>20</option>
                                        <option>50</option>
                                    </select> 条
                                </div>
                            </div>

                            <div class="box-tools pull-right">
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">首页</a>
                                    </li>
                                    <li><a href="#">上一页</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">下一页</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">尾页</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.box-footer-->
                    </div>
                </section>
                <!-- 客户信息正文区域 /-->
            </div>

            <%--   客户信息新增    --%>
            <div id="addCustomer" class="modal" role="dialog">

                <!-- .box-body -->
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllCustomer()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">客户信息新增</h4>
                        </div>
                        <div class="modal-body">
                            <form id="addCustomerForm" class="form-horizontal">
                                <div class="box-body">

                                    <div class="col-sm-12 form-group"  style="text-align: center">
                                        <label id="addCustomerMsg"></label>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">用户名：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="username" placeholder="请输入用户名...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputCustomerName" class="col-sm-4 control-label">姓名：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputCustomerName" name="name" placeholder="请输入姓名...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputCustomerName" class="col-sm-4 control-label">性别：</label>

                                        <div class="col-sm-8">
                                            <div class="form-inline">
                                                <div class="radio"><label><input type="radio" name="gender" value="男" checked> 男</label></div>
                                                <div class="radio"><label><input type="radio" name="gender" value="女"> 女</label></div>
                                                <span class="help-block small msg-info">Help block with success</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputCustomerFactory" class="col-sm-4 control-label">手机号码：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputCustomerFactory" name="phone" placeholder="请输入手机号码...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputCustomerPlace" class="col-sm-4 control-label">邮箱：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputCustomerPlace" name="email" placeholder="请输入邮箱...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">地址：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="address" placeholder="请输入地址...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">收货地址：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="receiverAdd" placeholder="请输入收货地址...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">发货物流：</label>

                                        <div class="col-sm-8">
                                            <select class="form-control select2" id="addCustomerLogisticsSelect" name="logName" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputCustomerRemark" class="col-sm-4 control-label">密码：</label>

                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="inputCustomerRemark" name="password" placeholder="请输入密码...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">密码：</label>

                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" name="repassword" placeholder="请确认密码...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>
<%--激活状态--%>
                                    <div class="col-sm-6 form-group" hidden>
                                        <label class="col-sm-4 control-label">激活状态：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="activeStatus" value="1" placeholder="请输入激活状态...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>
<%--标识--%>
                                    <div class="col-sm-6 form-group" hidden>
                                        <label class="col-sm-4 control-label">用户标识：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="iden" value="0" placeholder="请输入用户标识...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">备注：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="remark" placeholder="请输入备注...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="button" class="btn btn-success col-sm-2" onclick="addCustomer()" value="提交" />
                                        <input type="reset"  style="margin-left: 10px;"  class="btn btn-warning col-sm-2" value="重置"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllCustomer()" value="关闭"/>
                        </div>
                    </div>
                </div>

            </div>

            <%--   客户信息修改    --%>
            <div id="changeCustomer" class="modal" role="dialog">
                <!-- 客户信息修改内容头部 -->
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllCustomer()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">客户信息修改</h4>
                        </div>
                        <div class="modal-body">
                            <form id="changeCustomerForm" class="form-horizontal">
                                <div class="box-body">
                                    <div id="content">

                                    </div>
                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="button" class="btn btn-success col-sm-2" onclick="changeCustomerSubmit()" value="提交"/>
                                        <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-2" value="重置"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllCustomer()" value="返回"/>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->
    <!-- /.col -->
    <jsp:include page="footer.jsp"></jsp:include>
</div>
<!-- 内容区域 /-->



<script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="dist/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="dist/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/plugins/raphael/raphael-min.js"></script>
<script src="dist/plugins/morris/morris.min.js"></script>
<script src="dist/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="dist/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="dist/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="dist/plugins/knob/jquery.knob.js"></script>
<script src="dist/plugins/daterangepicker/moment.min.js"></script>
<script src="dist/plugins/daterangepicker/daterangepicker.js"></script>
<script src="dist/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="dist/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="dist/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="dist/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="dist/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="dist/plugins/fastclick/fastclick.js"></script>
<script src="dist/plugins/iCheck/icheck.min.js"></script>
<script src="dist/plugins/adminLTE/js/app.min.js"></script>
<script src="dist/plugins/treeTable/jquery.treetable.js"></script>
<script src="dist/plugins/select2/select2.full.min.js"></script>
<script src="dist/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="dist/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="dist/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="dist/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="dist/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="dist/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="dist/plugins/ckeditor/ckeditor.js"></script>
<script src="dist/plugins/input-mask/jquery.inputmask.js"></script>
<script src="dist/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="dist/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="dist/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="dist/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="dist/plugins/chartjs/Chart.min.js"></script>
<script src="dist/plugins/flot/jquery.flot.min.js"></script>
<script src="dist/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="dist/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="dist/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="dist/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="dist/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="dist/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="dist/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/date.js"></script>
<script>
    $(function () {

        if(!$("showAllCustomer").attr("hidden")){
            findAllCustomer();
        }

        $.post("logistics/findAll",{},function (data) {
            var str1 = "";
            for(var i = 0; i < data.length; i++){
                str1+='<option>'+data[i].name+'</option>';
            }
            $("#addCustomerLogisticsSelect").html(str1);
        });

        selectAllOrNone("#customer-selall","#customer-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllCustomerByUserIds() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#customer-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var userIds = checkedArr.join(",");
            $.post("user/deleteByUserIds",{"userIds":userIds},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！")
                    });
                    findAllCustomer();
                }else{
                    $(function () {
                        alert("批量删除失败！")
                    });
                }
            });
        }
    }
    function findAllCustomer() {
        $.post("user/findAllCustomer",{},function (data) {
            if(null == data){
                $("#customer-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].userId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].name+'</td>\n' +
                    '                                        <td>'+data[i].gender+'</td>\n' +
                    '                                        <td>'+data[i].phone+'</td>\n' +
                    '                                        <td>'+data[i].address+'</td>\n' +
                    '                                        <td>'+data[i].logName+'</td>\n' +
                    '                                        <td>'+data[i].receiverAdd+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeCustomer" onclick="findCustomerByUserId(\''+data[i].userId+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteCustomerByUserId(\''+data[i].userId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#customer-list tbody").html(str);
        });
    }

    function customerSearch() {
        var search = $("#customerSearch").val();
        $.post("user/findCustomerByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#customer-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].userId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].name+'</td>\n' +
                    '                                        <td>'+data[i].gender+'</td>\n' +
                    '                                        <td>'+data[i].phone+'</td>\n' +
                    '                                        <td>'+data[i].address+'</td>\n' +
                    '                                        <td>'+data[i].logName+'</td>\n' +
                    '                                        <td>'+data[i].receiverAdd+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeCustomer" onclick="findCustomerByUserId(\''+data[i].userId+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteCustomerByUserId(\''+data[i].userId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#customer-list tbody").html(str);
        });
    }


    function findCustomerByUserId(userId) {
        $.post("user/findByUserId",{"userId":userId},function (data) {
            var str=
                '\n' +
                '                                <div class="col-sm-12 form-group"  style="text-align: center">\n' +
                '                                    <label id="changeCustomerMsg"></label>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerUserId" class="col-sm-4 control-label">客户id：</label>\n' +
                '                                    <input type="hidden" class="form-control" name="userId" value="'+data.userId+'" placeholder="请输入客户id...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="userId" value="'+data.userId+'" disabled placeholder="请输入客户id...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerName" class="col-sm-4 control-label">用户名：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="username" value="'+data.username+'" placeholder="请输入用户名...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerName" class="col-sm-4 control-label">手机号码：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="phone" value="'+data.phone+'" placeholder="请输入手机号码...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerFactory" class="col-sm-4 control-label">邮箱：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="email" value="'+data.email+'" placeholder="请输入邮箱...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">姓名：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="name" value="'+data.name+'" placeholder="请输入姓名...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">激活码：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" value="'+data.activeCode+'" disabled placeholder="请输入激活码...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">激活状态：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="activeStatus" value="'+data.activeStatus+'" placeholder="请输入激活状态...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">注册时间：</label>\n' +
                '                                        <input type="hidden" class="form-control" name="regTime" value="'+ data.regTime +'" placeholder="请输入注册时间...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" value="'+ changeTime(data.regTime) +'" disabled placeholder="请输入注册时间...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">头像：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="file" name="img" value="'+data.img+'" style="border: 0">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +

                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">姓别：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                       <div class="form-inline">\n';
                    if(data.gender === "男"){
                        str += '                                           <div class="radio"><label><input type="radio" name="gender" value="男" checked> 男</label></div>\n' +
                            '                                           <div class="radio"><label><input type="radio" name="gender" value="女"> 女</label></div>\n' ;
                    }else if(data.gender === "女"){
                        str +='                                           <div class="radio"><label><input type="radio" name="gender" value="男"> 男</label></div>\n' +
                        '                                           <div class="radio"><label><input type="radio" name="gender" value="女" checked> 女</label></div>\n';
                    }
                    str +=
                '                                       </div>\n' +
                '                                       <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">地址：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="address" value="'+data.address+'" placeholder="请输入地址...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">收货地址：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="receiverAdd" value="'+data.receiverAdd+'" placeholder="请输入收货地址...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerPlace" class="col-sm-4 control-label">发货物流：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                            <select class="form-control select2" id="changeCustomerSelect" name="logName" style="width: 100%;">\n' +
                '                                            </select>'+
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputCustomerRemark" class="col-sm-4 control-label">备注：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="remark" value="'+data.remark+'" placeholder="请输入备注...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' ;
            $.post("logistics/findAll",{},function (ldata) {
                var str2 = "";
                for(var j = 0; j < ldata.length; j++){
                    if(data.logName === ldata[j].name){
                        str2+='<option selected>'+ldata[j].name+'</option>';
                    }else{
                        str2+='<option>'+ldata[j].name+'</option>';
                    }
                }
                $("#changeCustomerSelect").html(str2);
            });
            $("#changeCustomerForm .box-body #content").html(str);
        });

    }
    function deleteCustomerByUserId(userId) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("user/deleteByUserId",{"userId":userId},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！");
                    });
                    findAllCustomer();
                }else{
                    $(function () {
                        alert("删除失败！");
                    });
                }
            });
        }
    }
    function addCustomer(){
        $.post("user/add",$("#addCustomerForm").serialize(),function (data) {
            if(data){
                $("#addCustomerMsg").html("添加成功！");
                $("#addCustomerMsg").css("color","green");
            }else{
                $("#addCustomerMsg").html("已存在！添加失败！");
                $("#addCustomerMsg").css("color","red");
            }
        });

    }
    function changeCustomerSubmit() {
        $.post("user/change",$("#changeCustomerForm").serialize(), function (data) {
            if(data){
                $("#changeCustomerMsg").html("修改成功！");
                $("#changeCustomerMsg").css("color","green");
            }else{
                $("#changeCustomerMsg").html("修改失败！");
                $("#changeCustomerMsg").css("color","red");
            }
        });
    }
</script>
</body>

</html>
<!---->