<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统进货库位管理页面</title>
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

        <%--    库位展示    --%>
        <div id="showAllLocation">
            <!-- 库位内容头部 -->
            <section class="content-header">
                <h1>
                    库位展示
                    <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 进货管理</a></li>
                    <li><a href="#">库位展示</a></li>
                    <li class="active">数据列表</li>
                </ol>
            </section>
            <!-- 库位内容头部 /-->
            <!-- 库位正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">库位列表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-success" title="新增" onclick="gotoAddLocation()"><i class="fa fa-file-o"></i> 新增</button>
                                        <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllLocationByNos()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                        <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllLocation()"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" id="locationSearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" id="search" class="btn btn-default" onclick="locationSearch()"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="location-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="location-selall" type="checkbox">
                                    </th>
                                    <th class="sorting_asc">#</th>
                                    <th class="sorting_desc">库位编号</th>
                                    <th class="sorting_asc sorting_asc_disabled">库位地址</th>
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
            <!-- 库位正文区域 /-->
        </div>

        <%--   库位新增    --%>
        <div id="addLocation" hidden="hidden">
            <!-- 库位新增内容头部 -->
            <section class="content-header">
                <h1>
                    库位新增
                    <small>提交表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 进货管理</a></li>
                    <li><a href="#">库位</a></li>
                    <li class="active">库位新增</li>
                </ol>
            </section>
            <!-- 库位内容头部 /-->
            <!-- 库位正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">库位新增</h3>
                    </div>
                    <!-- 数据表单 -->
                    <form id="addLocationForm" class="form-horizontal">
                        <div class="box-body">

                            <div class="col-sm-12 form-group"  style="text-align: center">
                                <label id="addLocationMsg"></label>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label for="inputLocationNo" class="col-sm-3 control-label">库位编号：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputLocationNo" name="no" placeholder="请输入库位编号...">
                                    <span class="help-block small msg-info">Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label for="inputLocationLoca" class="col-sm-3 control-label">库位位置：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputLocationLoca" name="loca" placeholder="请输入库位位置...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label for="inputLocationRemark" class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputLocationRemark" name="remark" placeholder="请输入备注...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="button" class="btn btn-success col-sm-2" onclick="addLocation()" value="提交" />
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" onclick="goBackLocation()" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                </div>
                <!-- /.box-body -->
            </section>
            <!-- 库位正文区域 /-->
        </div>

        <%--   库位修改    --%>
        <div id="changeLocation" hidden="hidden">
            <!-- 库位修改内容头部 -->
            <section class="content-header">
                <h1>
                    库位修改
                    <small>修改表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 进货管理</a></li>
                    <li><a href="#">库位</a></li>
                    <li class="active">库位修改</li>
                </ol>
            </section>
            <!-- 库位内容头部 /-->
            <!-- 库位正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">库位修改</h3>
                    </div>
                    <!-- 数据表单 -->
                    <form id="changeLocationForm" class="form-horizontal">
                        <div class="box-body">

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="button" class="btn btn-success col-sm-2" onclick="changeLocationSubmit()" value="提交"/>
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" onclick="goBackLocation()" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                </div>
                <!-- /.box-body -->
            </section>
            <!-- 库位正文区域 /-->
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

        if(!$("showAllLocation").attr("hidden")){
            findAllLocation();
        }
        selectAllOrNone("#location-selall","#location-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllLocationByNos() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#location-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var nos = checkedArr.join(",");
            $.post("location/deleteByNos",{"nos":nos},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！");
                    });
                    findAllLocation();
                }else{
                    $(function () {
                        alert("批量删除失败！");
                    });
                }
            });
        }
    }
    function findAllLocation() {
        $.post("location/findAll",{},function (data) {
            if(null == data){
                $("#location-list tbody").html("");
                return;
            }
            var str="";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].no+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].no+'</td>\n' +
                    '                                        <td>'+data[i].loca+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" onclick="findLocationByNo(\''+data[i].no+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteLocationByNo(\''+data[i].no+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#location-list tbody").html(str);
        });
    }

    function locationSearch() {
        var search = $("#locationSearch").val();
        $.post("location/findAllByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#location-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].no+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].no+'</td>\n' +
                    '                                        <td>'+data[i].loca+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" onclick="findLocationByNo(\''+data[i].no+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteLocationByNo(\''+data[i].no+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#location-list tbody").html(str);
        });

    }

    function findLocationByNo(no) {
        $("#showAllLocation").attr("hidden","hidden");
        $("#addLocation").attr("hidden","hidden");
        $("#changeLocation").removeAttr("hidden");
        $.post("location/findByNo?no="+no,{},function (data) {
            var str=
                '\n' +
                '                                <div class="col-sm-12 form-group"  style="text-align: center">\n' +
                '                                    <label id="changeLocationMsg"></label>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputLocationNo" class="col-sm-3 control-label">库位编号：</label>\n' +
                '                                    <input type="hidden" class="form-control" name="no" value="'+data.no+'" placeholder="请输入库位编号...">\n' +
                '\n' +
                '                                    <div class="col-sm-9">\n' +
                '                                        <input type="text" class="form-control" name="no" value="'+data.no+'" disabled placeholder="请输入库位名...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputLocationLoca" class="col-sm-3 control-label">库位位置：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-9">\n' +
                '                                        <input type="text" class="form-control" name="loca" value="'+data.loca+'" placeholder="请输入库位位置..">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputLocationRemark" class="col-sm-3 control-label">备注：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-9">\n' +
                '                                        <input type="text" class="form-control" name="remark" value="'+data.remark+'" placeholder="请输入备注...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' ;
            $("#changeLocationForm .box-body").html(str);
        });

    }
    function deleteLocationByNo(no) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("location/deleteByNo",{"no":no},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！")
                    });
                    findAllLocation();
                }else{
                    $(function () {
                        alert("删除失败！")
                    });
                }
            });
        }
    }
    function gotoAddLocation() {
        $("#showAllLocation").attr("hidden","hidden");
        $("#changeLocation").attr("hidden","hidden");
        $("#addLocation").removeAttr("hidden");
    }
    function addLocation(){
        $.post("location/add",$("#addLocationForm").serialize(),function (data) {
            if(data){
                $("#addLocationMsg").html("添加成功！");
                $("#addLocationMsg").css("color","green");
            }else{
                $("#addLocationMsg").html("已存在！添加失败！");
                $("#addLocationMsg").css("color","red");
            }
            gotoAddLocation();
        });
    }
    function changeLocationSubmit() {
        $.post("location/change",$("#changeLocationForm").serialize(), function (data) {
            if(data){
                $("#changeLocationMsg").html("修改成功！");
                $("#changeLocationMsg").css("color","green");
            }else{
                $("#changeLocationMsg").html("修改失败！");
                $("#changeLocationMsg").css("color","red");
            }
        });
    }
    function goBackLocation() {
        findAllLocation();
        $("#showAllLocation").removeAttr("hidden","hidden");
        $("#addLocation").attr("hidden","hidden");
        $("#changeLocation").attr("hidden","hidden");
    }
</script>
</body>

</html>
<!---->