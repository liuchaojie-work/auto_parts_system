<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>XX汽配销售系统产品品牌和类别关联页面</title>
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
            <%--  品牌类别关联    --%>
            <div id="showAllCategoryBrand" >
                <!-- 品牌和类别关联内容头部 -->
                <section class="content-header">
                    <h1>
                        品牌和类别关联展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 品牌和类别关联管理</a></li>
                        <li><a href="#">品牌和类别关联展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 品牌和类别关联内容头部 /-->
                <!-- 品牌和类别关联正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">品牌和类别关联列表</h3>
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-success" title="新建" data-toggle="modal" data-target="#addCategoryBrand"><i class="fa fa-file-o"></i> 新增</button>
                                            <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllCategoryBrandByCbIds()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                            <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllCategoryBrand()"><i class="fa fa-refresh"></i> 刷新</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="categoryBrandSearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default" onclick="categoryBrandSearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->

                                <!--数据列表-->
                                <table id="categoryBrand-list" class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="categoryBrand-selall" type="checkbox">
                                        </th>
                                        <th>#</th>
                                        <th>关联id</th>
                                        <th>产品类别名</th>
                                        <th>产品品牌名</th>
                                        <th>备注</th>
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
                <!-- 品牌和类别关联正文区域 /-->
            </div>

            <%--   品牌类别关联新增    --%>
            <div id="addCategoryBrand"  class="modal" role="dialog" >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllCategoryBrand()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">品牌类别关联新增</h4>
                        </div>
                        <div class="modal-body">
                            <form id="addCategoryBrandForm" class="form-horizontal">
                                <div class="box-body">
                                    <div class="col-sm-12 form-group"  style="text-align: center">
                                        <label id="addCategoryBrandMsg"></label>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-3 control-label">产品类别名：</label>

                                        <div class="col-sm-9">
                                            <select id="addCategorySelect" name="cname" class="form-control select2" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-3 control-label">产品品牌名：</label>

                                        <div class="col-sm-9">
                                            <select id="addBrandSelect" name="bname" class="form-control select2" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-3 control-label">备注：</label>

                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="remark" placeholder="请输入备注...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="button" class="btn btn-success col-sm-2" onclick="addCategoryBrand()" value="提交"/>
                                        <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning" value="重置"/>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllCategoryBrand()" value="返回"/>
                        </div>
                    </div>
                </div>
            </div>

            <%--   品牌类别关联修改    --%>
            <div id="changeCategoryBrand" class="modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllCategoryBrand()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">品牌类别关联修改</h4>
                        </div>
                        <div class="modal-body">
                            <form id="changeCategoryBrandForm" class="form-horizontal">
                                <div class="box-body">

                                    <div class="col-sm-12 form-group"  style="text-align: center">
                                        <label id="changeCategoryBrandMsg"></label>
                                    </div>

                                    <div id="changeCbId" class="col-sm-6 form-group">

                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-3 control-label">产品类别名：</label>

                                        <div class="col-sm-9">
                                            <select class="form-control select2" id="changeCategorySelect" name="cname" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-3 control-label">产品品牌名：</label>

                                        <div class="col-sm-9">
                                            <select class="form-control select2" id="changeBrandSelect" name="bname" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-3 control-label">备注：</label>

                                        <div id="changeRemark" class="col-sm-9">
                                            <input type="text" class="form-control" name="remark" placeholder="请输入备注...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="submit" class="btn btn-success col-sm-2" onclick="changeCategoryBrandSubmit()" value="保存"/>
                                        <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-2" value="重置"/>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllCategoryBrand()" value="返回"/>
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
<script>
    $(function () {

        if(!$("showAllCategoryBrand").attr("hidden")){
            findAllCategoryBrand();
        }
        $.post("category/findAll",{},function (categoryData) {
            var str1 = "";
            for(var i = 0; i < categoryData.length; i++){
                str1+='<option>'+categoryData[i].name+'</option>';
            }
            $("#addCategorySelect").html(str1);
        });

        $.post("brand/findAll",{},function (brandData) {
            var str2 = "";
            for(var j = 0; j < brandData.length; j++){
                str2+='<option>'+brandData[j].name+'</option>';
            }
            $("#addBrandSelect").html(str2);
        });
        selectAllOrNone("#categoryBrand-selall","#categoryBrand-list");

        $("#pageSize").bind('input propertychange', function () {
            findAllCategoryBrand();
        });
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllCategoryBrandByCbIds() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#categoryBrand-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var cbIds = checkedArr.join(",");
            $.post("categoryBrand/deleteByCbIds",{"cbIds":cbIds},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！")
                    });
                    findAllCategoryBrand();
                }else{
                    $(function () {
                        alert("批量删除失败！")
                    });
                }
            });
        }
    }
    function findAllCategoryBrand() {
        /*$.post("categoryBrand/findAll",{},function (data) {
            if(null == data){
                $("#categoryBrand-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].cbId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].cbId+'</td>\n' +
                    '                                        <td>'+data[i].cname+'</td>\n' +
                    '                                        <td>'+data[i].bname+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeCategoryBrand"  onclick="findCategoryBrandByCbId(\''+data[i].cbId+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteCategoryBrandByCbId(\''+data[i].cbId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#categoryBrand-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize);
    }
    function load(currentPage, pageSize, condition) {
        $.get("categoryBrand/pageQuery",{"currentPage":currentPage, "pageSize":pageSize, "condition":condition}, function (pb) {
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
                    '                                        <td><input name="ids" type="checkbox" value="'+listElement.cbId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+listElement.cbId+'</td>\n' +
                    '                                        <td>'+listElement.cname+'</td>\n' +
                    '                                        <td>'+listElement.bname+'</td>\n' +
                    '                                        <td>'+listElement.remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeCategoryBrand"  onclick="findCategoryBrandByCbId(\''+listElement.cbId+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteCategoryBrandByCbId(\''+listElement.cbId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                info_list+=tr;
            }
            $("#categoryBrand-list tbody").html(info_list);
            window.scrollTo(0,0);
        });
    }
    function findCategoryBrandByCbId(cbId) {
        $.post("categoryBrand/findByCbId?cbId="+cbId,{},function (data) {
            var str0 = '<label class="col-sm-3 control-label">关联id：</label>\n' +
                '                                <input type="hidden" class="form-control" name="cbId" value="'+ data.cbId +'" placeholder="请输入备注...">\n' +
                '\n' +
                '                                <div class="col-sm-9">\n' +
                '                                    <input type="text" class="form-control" name="cbId" value="'+ data.cbId +'" disabled="disabled" placeholder="请输入备注...">\n' +
                '                                    <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                </div>';
            $("#changeCategoryBrandForm .box-body #changeCbId").html(str0);
            $.post("category/findAll",{},function (categoryData) {
                var str1 = "";
                // alert(data.cname);
                for(var i = 0; i < categoryData.length; i++){
                    if($.trim(categoryData[i].name) === $.trim(data.cname)){
                        str1+='<option selected="selected">'+data.cname+'</option>';
                    }else{
                        str1+='<option>'+categoryData[i].name+'</option>';
                    }
                }
                $("#changeCategorySelect").html(str1);
            });
            $.post("brand/findAll",{},function (brandData) {
                var str2 = "";
                for(var j = 0; j < brandData.length; j++){
                    if($.trim(brandData[j].name) === $.trim(data.bname)){
                        str2+='<option selected="selected">'+data.bname+'</option>';
                    }else{
                        str2+='<option>'+brandData[j].name+'</option>';
                    }
                }
                $("#changeBrandSelect").html(str2);
            });

            var str4='<input type="text" class="form-control" name="remark" value="'+ data.remark +'" placeholder="请输入备注...">'
            $("#changeRemark").html(str4);
        });

    }
    function deleteCategoryBrandByCbId(cbId) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("categoryBrand/deleteByCbId",{"cbId":cbId},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！")
                    });
                    findAllCategoryBrand();
                }else{
                    $(function () {
                        alert("删除失败！")
                    });
                }
            });
        }
    }
    function addCategoryBrand(){
        $.post("categoryBrand/add",$("#addCategoryBrandForm").serialize(),function (data) {
            if(data){
                $("#addCategoryBrandMsg").html("添加成功！");
                $("#addCategoryBrandMsg").css("color","green");
            }else{
                $("#addCategoryBrandMsg").html("已存在！添加失败！");
                $("#addCategoryBrandMsg").css("color","red");
            }
        });
    }
    function changeCategoryBrandSubmit() {
        $.post("categoryBrand/change",$("#changeCategoryBrandForm").serialize(), function (data) {
            if(data){
                $("#changeCategoryBrandMsg").html("修改成功！");
                $("#changeCategoryBrandMsg").css("color","green");
            }else{
                $("#changeCategoryBrandMsg").html("修改失败！");
                $("#changeCategoryBrandMsg").css("color","red");
            }
        });
    }
    function categoryBrandSearch() {
        var search = $("#categoryBrandSearch").val();
        /*$.post("categoryBrand/findByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#categoryBrand-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].cbId+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].cbId+'</td>\n' +
                    '                                        <td>'+data[i].cname+'</td>\n' +
                    '                                        <td>'+data[i].bname+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" onclick="findCategoryBrandByCbId(\''+data[i].cbId+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteCategoryBrandByCbId(\''+data[i].cbId+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#categoryBrand-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize,search);
    }

</script>
</body>

</html>
<!---->