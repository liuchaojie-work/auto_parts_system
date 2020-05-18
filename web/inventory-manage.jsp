<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统库存管理页面</title>
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
            <%--    库存展示    --%>
            <div id="showAllInventory">
                <!-- 库存内容头部 -->
                <section class="content-header">
                    <h1>
                        库存展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 库存管理</a></li>
                        <li><a href="#">库存展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 库存内容头部 /-->
                <!-- 库存正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">库存列表</h3>
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
<%--                                            <button type="button" class="btn btn-default btn-success" title="新增" data-toggle="modal" data-target="#addInventory"><i class="fa fa-file-o"></i> 新增</button>--%>
                                            <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllInventoryByProIds()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                            <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllInventory()"><i class="fa fa-refresh"></i> 刷新</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="inventorySearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" id="search" class="btn btn-default" onclick="inventorySearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->

                                <!--数据列表-->
                                <table id="inventory-list" class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="inventory-selall" type="checkbox">
                                        </th>
                                        <th class="sorting_asc">#</th>
                                        <th class="sorting_desc">型号</th>
                                        <th class="sorting_asc sorting_asc_disabled">类别</th>
                                        <th class="sorting_desc sorting_desc_disabled">品牌</th>
                                        <th>库存数量</th>
                                        <th>单位</th>
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
                                    总共 <span id="totalPage" style="color: red"></span> 页，共 <span id="totalCount" style="color: red"></span> 条数据。 每页
                                    <select class="form-control" id="pageSize">
                                        <option>5</option>
                                        <option>10</option>
                                        <option>20</option>
                                        <option>50</option>
                                    </select> 条
                                </div>
                            </div>

                            <div class="box-tools pull-right">
                                <ul class="pagination" id="pageNum">

                                </ul>
                            </div>
                        </div>
                        <!-- /.box-footer-->
                    </div>
                </section>
                <!-- 库存正文区域 /-->
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
<script>
    $(function () {

        if(!$("showAllInventory").attr("hidden")){
            findAllInventory();
        }
        $("#pageSize").bind('input propertychange', function () {
            findAllInventory();
        });
        selectAllOrNone("#inventory-selall","#inventory-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllInventoryByProIds() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#inventory-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var proIds = checkedArr.join(",");
            $.post("inventory/deleteByProIds",{"proIds":proIds},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！")
                    });
                    findAllInventory();
                }else{
                    $(function () {
                        alert("批量删除失败！")
                    });
                }
            });
        }
    }
    function findAllInventory() {
        /*$.post("inventory/findAll",{},function (data) {
            if(null == data){
                $("#inventory-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].proId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].typeno+'</td>\n' +
                    '                                        <td>'+data[i].cname+'</td>\n' +
                    '                                        <td>'+data[i].bname+'</td>\n' +
                    '                                        <td>'+data[i].count+'</td>\n' +
                    '                                        <td>'+data[i].unit+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteInventoryByProId(\''+data[i].proId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#inventory-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize);
    }
    function load(currentPage, pageSize, condition) {
        $.get("inventory/pageQuery",{"currentPage":currentPage, "pageSize":pageSize, "condition":condition}, function (pb) {
            $("#totalCount").html(pb.totalCount);
            $("#totalPage").html(pb.totalPage);
            var lis ="";
            var firstPage ='<li onclick="javascript:load('+ 1 +','+ pb.pageSize +','+ condition +')"><a href="javascript:void(0);" aria-label="Previous">首页</a></li>';
            var beforeNum = (pb.currentPage - 1) < 1 ? 1: (pb.currentPage - 1);
            var beforePage ='<li onclick="javascript:load('+ beforeNum +','+ pb.pageSize +','+ condition +')"><a href="javascript:void(0);">上一页</a></li>';
            lis+=firstPage;
            lis+=beforePage;

            var begin;
            var end;

            if(pb.totalPage < 5){
                begin = 1;
                end = pb.totalPage;
            }else{
                begin = pb.currentPage - 2;
                end = pb.currentPage + 2;
                if(begin < 1){
                    begin = 1;
                    end = begin + 4;
                }
                if(end > pb.totalPage){
                    end = pb.totalPage;
                    begin = pb.totalPage - 4;
                }
            }

            for(var i = begin; i <= end ;i++){
                if(pb.currentPage == i){
                    lis+='<li class="active" onclick="javascript:load('+ i +','+ pb.pageSize +','+ condition +')"><a href="javascript:void(0);">'+ i +'</a></li>';
                }else{
                    lis+='<li onclick="javascript:load('+ i +','+ pb.pageSize +','+ condition +')"><a href="javascript:void(0);">'+ i +'</a></li>';
                }
            }
            var nextNum = (pb.currentPage + 1) > pb.totalPage ? pb.totalPage: (pb.currentPage + 1);
            var nextPage='<li onclick="javascript:load('+ nextNum +','+ pb.pageSize +','+ condition +')"><a href="javascript:void(0);">下一页</a></li>';
            var lastPage='<li onclick="javascript:load('+ pb.totalPage +','+ pb.pageSize +','+ condition +')"><a href="javascript:void(0);" aria-label="Next">尾页</a></li>';
            lis+=nextPage;
            lis+=lastPage;
            $("#pageNum").html(lis);

            var info_list = "";
            for(var i = 0; i < pb.list.length; i++){
                var listElement = pb.list[i];
                var tr =
                    '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+listElement.proId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+listElement.typeno+'</td>\n' +
                    '                                        <td>'+listElement.cname+'</td>\n' +
                    '                                        <td>'+listElement.bname+'</td>\n' +
                    '                                        <td>'+listElement.count+'</td>\n' +
                    '                                        <td>'+listElement.unit+'</td>\n' +
                    '                                        <td>'+listElement.remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteInventoryByProId(\''+listElement.proId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                info_list+=tr;
            }
            $("#inventory-list tbody").html(info_list);
            window.scrollTo(0,0);
        });
    }
    function inventorySearch() {
        var search = $("#inventorySearch").val();
        /*$.post("inventory/findAllByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#inventory-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].proId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].typeno+'</td>\n' +
                    '                                        <td>'+data[i].cname+'</td>\n' +
                    '                                        <td>'+data[i].bname+'</td>\n' +
                    '                                        <td>'+data[i].count+'</td>\n' +
                    '                                        <td>'+data[i].unit+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteInventoryByProId(\''+data[i].proId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#inventory-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize,search);
    }
    function deleteInventoryByProId(proId) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("inventory/deleteByProId",{"proId":proId},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！");
                    });
                    findAllInventory();
                }else{
                    $(function () {
                        alert("删除失败！");
                    });
                }
            });
        }
    }
</script>
</body>

</html>
<!---->