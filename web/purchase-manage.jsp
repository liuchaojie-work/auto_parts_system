<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统进货关联页面</title>
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
            <%--  进货    --%>
            <div id="showAllPurchase" >
                <!-- 进货内容头部 -->
                <section class="content-header">
                    <h1>
                        进货展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 进货管理</a></li>
                        <li><a href="#">进货展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 进货内容头部 /-->
                <!-- 进货正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">进货列表</h3>
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-success" title="新建" data-toggle="modal" data-target="#addPurchase"><i class="fa fa-file-o"></i> 新增</button>
                                            <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllPurchaseByPurNos()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                            <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllPurchase()"><i class="fa fa-refresh"></i> 刷新</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="purchaseSearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default" onclick="purchaseSearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->

                                <!--数据列表-->
                                <table id="purchase-list" class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="purchase-selall" type="checkbox">
                                        </th>
                                        <th>#</th>
                                        <th>入库编号</th>
<%--                                        <th>产品id</th>--%>
                                        <th>产品型号</th>
                                        <th>产品类别</th>
                                        <th>产品品牌</th>
                                        <th>产品进价</th>
                                        <th>产品数量</th>
                                        <th>产品售价</th>
                                        <th>入库时间</th>
                                        <th>库位</th>
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
                <!-- 进货正文区域 /-->
            </div>

            <%--   进货新增    --%>
            <div id="addPurchase"  class="modal" role="dialog" >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllPurchase()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">进货新增</h4>
                        </div>
                        <div class="modal-body">
                            <form id="addPurchaseForm" class="form-horizontal">
                                <div class="box-body">
                                    <div class="col-sm-12 form-group"  style="text-align: center">
                                        <label id="addPurchaseMsg"></label>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品型号：</label>

                                        <div class="col-sm-8">
                                            <select id="addTypenoSelect" name="typeno" class="form-control select2" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品类别名：</label>

                                        <div class="col-sm-8">
                                            <select id="addCategorySelect" name="cname" class="form-control select2" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品品牌名：</label>

                                        <div class="col-sm-8">
                                            <select id="addBrandSelect" name="bname" class="form-control select2" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品进价：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="purchasePrice" placeholder="请输入进价...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品数量：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="count" placeholder="请输入数量..">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品售价：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="sellPrice" placeholder="请输入售价...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">库位：</label>

                                        <div class="col-sm-8">
                                            <select id="addLocationSelect" name="loca" class="form-control select2" style="width: 100%;">

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">备注：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="remark" placeholder="请输入备注...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="submit" class="btn btn-success col-sm-2" onclick="addPurchase()" value="提交"/>
                                        <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning" value="重置"/>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllPurchase()" value="返回"/>
                        </div>
                    </div>
                </div>
            </div>

            <%--   进货修改    --%>
            <div id="changePurchase" class="modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllPurchase()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">进货修改</h4>
                        </div>
                        <div class="modal-body">
                            <form id="changePurchaseForm" class="form-horizontal">
                                <div class="box-body">

                                </div>

                            </form>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllPurchase()" value="返回"/>
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

        if(!$("showAllPurchase").attr("hidden")){
            findAllPurchase();
        }

        $.post("product/findAll",{}, function (data) {
            var str1 = "";
            for(var i = 0; i < data.length; i++){
                str1+='<option>'+data[i][1]+'</option>';
            }
            $("#addTypenoSelect").html(str1);
        });

        $.post("location/findAll",{}, function (data) {
            for(var i = 0; i < data.length; i++){
                $("#addLocationSelect").append('<option>'+data[i].loca+'</option>');
            }

        });

        $("#addTypenoSelect").blur(function () {
            var typeno = $("#addTypenoSelect").val();
            $.post("product/findByTypeno", {"typeno":typeno}, function (typenoData) {
                $("#addCategorySelect").html("");
                $("#addBrandSelect").html("");
                for(var i = 0; i < typenoData.length; i++){
                    $.post("categoryBrand/findByCbId",{"cbId":typenoData[i].cbId}, function (data) {
                        $("#addCategorySelect").append('<option>'+data.cname+'</option>');
                        $("#addBrandSelect").append('<option>'+data.bname+'</option>');
                    });
                }
            });
        });


        $("#addCategorySelect").blur(function () {
            var typeno = $("#addTypenoSelect").val();
            var cname = $("#addCategorySelect").val();
            $.post("product/findByTypenoAndCname", {"typeno":typeno,"cname":cname}, function (data) {
                $("#addBrandSelect").html("");
                for(var i = 0; i < data.length; i++){
                    $("#addBrandSelect").append('<option>'+data[i][1]+'</option>');
                }
            });
        });

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
        selectAllOrNone("#purchase-selall","#purchase-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllPurchaseByPurNos() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#purchase-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var purNos = checkedArr.join(",");
            $.post("purchase/deleteByPurNos",{"purNos":purNos},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！")
                    });
                    findAllPurchase();
                }else{
                    $(function () {
                        alert("批量删除失败！")
                    });
                }
            });
        }
    }
    function findAllPurchase() {
        $.post("purchase/findAll",{},function (data) {
            if(null == data){
                $("#purchase-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i][0]+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i][0]+'</td>\n' +
                    // '                                        <td>'+data[i][1]+'</td>\n' +
                    '                                        <td>'+data[i][2]+'</td>\n' +
                    '                                        <td>'+data[i][3]+'</td>\n' +
                    '                                        <td>'+data[i][4]+'</td>\n' +
                    '                                        <td>'+data[i][5]+'</td>\n' +
                    '                                        <td>'+data[i][6]+'</td>\n' +
                    '                                        <td>'+data[i][7]+'</td>\n' +
                    '                                        <td>'+changeTime(data[i][8])+'</td>\n' +
                    '                                        <td>'+data[i][9]+'</td>\n' +
                    '                                        <td>'+data[i][10]+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changePurchase"  onclick="findPurchaseByPurNo(\''+data[i][0]+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deletePurchaseByPurNo(\''+data[i][0]+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#purchase-list tbody").html(str);
        });
    }

    function findPurchaseByPurNo(purNo) {
        $.post("purchase/findByPurNo",{"purNo":purNo},function (data) {
            var str=
                '<div class="col-sm-12 form-group"  style="text-align: center">\n' +
                '                                            <label id="changePurchaseMsg"></label>\n' +
                '                                        </div>\n' +
                '                                                <input type="hidden" class="form-control" id="inputPurchasePurNo" name="purNo" value="'+ purNo +'">\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputPurchaseTypeno" class="col-sm-4 control-label">产品型号：</label>\n' +
                '\n' +
                '                                                <input type="hidden" class="form-control" id="inputPurchaseTypeno" name="typeno" value="'+ data[1] +'"  placeholder="请输入产品型号...">\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputPurchaseTypeno" name="typeno" disabled="disabled" value="'+ data[1] +'"  placeholder="请输入产品型号...">\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label class="col-sm-4 control-label">产品类别：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <select id="changeCategorySelect" name="cname" class="form-control select2" value="'+ data[2] +'"  style="width: 100%;" >\n' +
                '                                                </select>\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label class="col-sm-4 control-label">产品品牌：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <select id="changeBrandSelect" name="bname" class="form-control select2" value="'+ data[3] +'" style="width: 100%;" >\n' +
                '\n' +
                '                                                </select>\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label class="col-sm-4 control-label">进价：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputPurchasePrice" name="purchasePrice" value="'+ data[4] +'" placeholder="请输入产品进价...">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputPurchaseCount" class="col-sm-4 control-label">数量：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputPurchaseCount" name="count" value="'+ data[5] +'" placeholder="请输入数量...">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputSellPrice" class="col-sm-4 control-label">售价：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputSellPrice" name="sellPrice" value="'+ data[6] +'" placeholder="请输入售价...">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputPurchaseTime" class="col-sm-4 control-label">入库时间：</label>\n' +
                '                                        <input type="hidden" class="form-control" value="'+ data[7] +'" placeholder="请输入入库时间...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" value="'+ changeTime(data[7]) +'" disabled placeholder="请输入入库时间...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputPurchaseLoca" class="col-sm-4 control-label">库位：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <select id="changeLocationSelect" name="loca" class="form-control select2" value="'+ data[8] +'" style="width: 100%;" >\n' +
                '                                                </select>\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputPurchaseRemark" class="col-sm-4 control-label">备注：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputPurchaseRemark" name="remark" value="'+ data[9] +'" placeholder="请输入备注...">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-offset-4 col-sm-8" >\n' +
                '                                            <input type="button" class="btn btn-success col-sm-2" onclick="changePurchaseSubmit()" value="提交" />\n' +
                '                                            <input type="reset" style="margin-left: 10px" class="btn btn-warning col-sm-2" value="重置"/>\n' +
                '                                        </div>';
            $("#changePurchaseForm .box-body").html(str);

            var typeno = $("#inputPurchaseTypeno").val();
            $.post("product/findByTypeno", {"typeno":typeno}, function (typenoData) {
                $("#changeCategorySelect").html("");
                $("#changeBrandSelect").html("");
                for(var i = 0; i < typenoData.length; i++){
                    $.post("categoryBrand/findByCbId",{"cbId":typenoData[i].cbId}, function (cbData) {
                        if(cbData.cname == data[2]){
                            $("#changeCategorySelect").append('<option selected>'+cbData.cname+'</option>');
                        }else{
                            $("#changeCategorySelect").append('<option>'+cbData.cname+'</option>');
                        }
                        if(cbData.bname == data[3]){
                            $("#changeBrandSelect").append('<option selected>'+cbData.bname+'</option>');
                        }else{
                            $("#changeBrandSelect").append('<option>'+cbData.bname+'</option>');
                        }
                    });
                }
            });
            var cname = $("#changeCategorySelect").val();
            $.post("product/findByTypenoAndCname", {"typeno":typeno,"cname":cname}, function (bData) {
                $("#changeBrandSelect").html("");
                for(var i = 0; i < bData.length; i++){
                    if(data[3] == bData[i][1]){
                        $("#changeBrandSelect").append('<option selected>'+bData[i][1]+'</option>');
                    }else{
                        $("#changeBrandSelect").append('<option>'+bData[i][1]+'</option>');
                    }
                }
            });

            $.post("location/findAll", {}, function (locationData) {
                $("#changeLocationSelect").html("");
                for(var i = 0; i < locationData.length; i++){
                    if(data[8] == locationData[i].loca){
                        $("#changeLocationSelect").append('<option selected>'+data[8]+'</option>');
                    }else{
                        $("#changeLocationSelect").append('<option>'+locationData[i].loca+'</option>');
                    }
                }
            })

        });

    }
    function deletePurchaseByPurNo(purNo) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("purchase/deleteByPurNo",{"purNo":purNo},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！")
                    });
                    findAllPurchase();
                }else{
                    $(function () {
                        alert("删除失败！")
                    });
                }
            });
        }
    }

    function addPurchase(){
        $.post("purchase/add",$("#addPurchaseForm").serialize(),function (data) {
            if(data){
                $("#addPurchaseMsg").html("添加成功！");
                $("#addPurchaseMsg").css("color","green");
            }else{
                $("#addPurchaseMsg").html("已存在！添加失败！");
                $("#addPurchaseMsg").css("color","red");
            }
        });
    }


    function changePurchaseSubmit() {
        $.post("purchase/change",$("#changePurchaseForm").serialize(), function (data) {
            if(data){
                $("#changePurchaseMsg").html("修改成功！");
                $("#changePurchaseMsg").css("color","green");
            }else{
                $("#changePurchaseMsg").html("修改失败！");
                $("#changePurchaseMsg").css("color","red");
            }
        });
    }

    function purchaseSearch() {
        var search = $("#purchaseSearch").val();
        $.post("purchase/findByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#purchase-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i][0]+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i][0]+'</td>\n' +
                    // '                                        <td>'+data[i][1]+'</td>\n' +
                    '                                        <td>'+data[i][2]+'</td>\n' +
                    '                                        <td>'+data[i][3]+'</td>\n' +
                    '                                        <td>'+data[i][4]+'</td>\n' +
                    '                                        <td>'+data[i][5]+'</td>\n' +
                    '                                        <td>'+data[i][6]+'</td>\n' +
                    '                                        <td>'+data[i][7]+'</td>\n' +
                    '                                        <td>'+changeTime(data[i][8])+'</td>\n' +
                    '                                        <td>'+data[i][9]+'</td>\n' +
                    '                                        <td>'+data[i][10]+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changePurchase"  onclick="findPurchaseByPurNo(\''+data[i][0]+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deletePurchaseByPurNo(\''+data[i][0]+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#purchase-list tbody").html(str);
        });
    }

</script>
</body>

</html>
<!---->