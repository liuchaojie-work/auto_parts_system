<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>XX汽配销售系统销售管理页面</title>
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
            <%--    销售信息展示    --%>
            <div id="showAllSale">
                <!-- 销售信息内容头部 -->
                <section class="content-header">
                    <h1>
                        销售信息展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 销售管理</a></li>
                        <li><a href="#">销售信息展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 销售信息内容头部 /-->
                <!-- 销售信息正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">销售信息列表</h3>
                        </div>

                        <div class="box-body">
                            <!-- 数据表格 -->
                            <div class="table-box box-body" style="padding: 0px;">
                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-primary" title="开单" data-toggle="modal" data-target="#addCustomer"><i class="fa fa-file-o"></i> 开单</button>
                                        </div>
                                        <div id="customerInfo" class="form-group ">

                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <select class="form-control select2" id="paymentSelect" name="payWay" style="width: 100%;">
                                        </select>
                                    </div>
                                </div>
                                <!--工具栏/-->
                            </div>
                            <!-- 数据表格 /-->

                            <div class="table-box" id="addProductView" hidden>
                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-success" title="添加" data-toggle="modal" data-target="#addProduct"><i class="fa fa-file-o"></i> 添加产品</button>
                                            <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="removeAllProductByPurNos()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->
                                <form id="productSellForm">
                                <!--数据列表-->
                                    <table id="product-list" class="table table-bordered table-striped table-hover dataTable">
                                        <thead>
                                        <tr>
                                            <th class="" style="padding-right:0px;">
                                                <input id="product-selall" type="checkbox">
                                            </th>
                                            <th>#</th>
                                            <th>型号</th>
                                            <th>类别</th>
                                            <th>品牌</th>
                                            <th>库位</th>
                                            <th>单价</th>
                                            <th>数量</th>
                                            <th>单位</th>
                                            <th>总计</th>
                                            <th>备注</th>
                                            <th class="text-center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                    <button id="btn-input" type="button" class="btn btn-info" title="提交" >提交</button>
                                    <!--数据列表/-->
                                </form>
                            </div>
                        </div>
                        <!-- /.box-body -->

                        <!-- .box-footer-->
                        <%--<div class="box-footer">
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
                        </div>--%>
                        <!-- /.box-footer-->
                    </div>
                </section>
                <!-- 销售信息正文区域 /-->
            </div>
            <div id="addCustomer" class="modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">添加客户</h4>
                        </div>
                        <div class="modal-body">
                            <div class="input-group input-group-sm" style="width: 200px;">
                                <input type="text" id="customerSearch" name="table_search" class="form-control pull-right" placeholder="请输入查询信息...">

                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default" onclick="customerSearch()"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <table id="customer-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="customer-selall" type="checkbox">
                                    </th>
                                    <th>#</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>手机</th>
                                    <th>地址</th>
                                    <th>发货物流</th>
                                    <th>收货地址</th>
                                    <th>备注</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" value="关闭"/>
                        </div>
                    </div>
                </div>
            </div>
            <%--   添加商品   --%>
            <div id="addProduct" class="modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">添加产品</h4>
                        </div>
                        <div class="modal-body">
                            <div class="table-box box-body" style="padding: 0px;">
                                <div class="box-tools pull-left">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="productSearch" name="table_search" class="form-control pull-right" placeholder="请输入搜索信息">

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default" onclick="productSearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--数据列表-->
                            <table id="productSel-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="productSel-selall" type="checkbox">
                                    </th>
                                    <th class="sorting_asc">#</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品型号</th>
                                    <th class="sorting_desc sorting_desc_disabled">类别</th>
                                    <th class="sorting_desc sorting_desc_disabled">品牌</th>
                                    <th>进价</th>
                                    <th>数量</th>
                                    <th>售价</th>
                                    <th>库位</th>
                                    <th class="sorting">备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" value="关闭"/>
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

        if(!$("showAllSale").attr("hidden")){
        }

        $.post("logistics/findAll",{},function (data) {
            var str1 = "";
            for(var i = 0; i < data.length; i++){
                str1+='<option>'+data[i].name+'</option>';
            }
            $("#addSaleLogisticsSelect").html(str1);
        });

        $.post("payment/findAll",{}, function (data) {
            for(var i = 0; i < data.length; i++ ){
                $("#paymentSelect").append('<option>'+data[i].payWay+'</option>')
            }
        });
        selectAllOrNone("#sale-selall","#sale-list");
        selectAllOrNone("#product-selall","#product-list");


        $("#btn-input").onclick(function () {

        });
    });

    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
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
                    '                                            <input type="button" class="btn btn-info btn-xs" data-dismiss="modal" onclick="checkedCustomerByUserId(\''+data[i].userId+'\')" value="选中"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#customer-list tbody").html(str);
        });
    }

    function productSearch() {
        var search = $("#productSearch").val();
        $.post("purchase/findByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#productSel-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i][0]+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i][2]+'</td>\n' +
                    '                                        <td>'+data[i][3]+'</td>\n' +
                    '                                        <td>'+data[i][4]+'</td>\n' +
                    '                                        <td>'+data[i][5]+'</td>\n' +
                    '                                        <td>'+data[i][6]+'</td>\n' +
                    '                                        <td>'+data[i][7]+'</td>\n' +
                    '                                        <td>'+data[i][9]+'</td>\n' +
                    '                                        <td>'+data[i][10]+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-dismiss="modal"  onclick="checkedProductByPurNo(\''+data[i][0]+'\')" value="选中"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#productSel-list tbody").html(str);
        });

    }

    function checkedCustomerByUserId(userId) {
        $("#customerInfo").html("");
        $.post("user/findByUserId",{"userId":userId},function (data) {
            $("#customerInfo").append('<input type="text" name="name" value="'+ data.name + '">\n' +
                '                <input type="text" name="phone" value="'+ data.phone + '">\n' +
                '                <input type="text" name="receiverAdd" value="'+ data.receiverAdd + '">\n' +
                '                <input type="text" name="logName" value="'+ data.logName + '">\n' +
                '                <input type="hidden" name="userId" value="' + userId + '">');
        });
        $("#addProductView").removeAttr("hidden");
        /*$("#product-list tbody").html("");*/
    }

    function checkedProductByPurNo(purNo) {
        $("#product-list tbody").html("");
        $.post("purchase/findByPurNo",{"purNo":purNo}, function (productInfo) {
            if(null != productInfo && 0 != productInfo.toString().length){
                var productInfoStr = productInfo.toString();
                // var productInfoStr = JSON.stringify(productInfo);
                getCookie = $.post("saleProduct/readySale",{"productInfo":productInfoStr}, function (productMap) {
                    var prodMap = JSON.parse(decodeURIComponent(productMap));
                    // alert(prodMap);
                    var i = 0;
                    $.each(prodMap,function (key, value) {
                        var proEle = value.toString().split(",");
                        i += 1;
                        $("#product-list tbody").append('<tr>\n' +
                            '              <fieldset>'+
                            '                  <td >\n' +
                            '                  <input name="ids" type="checkbox" value=" '+ proEle[10] +'" />\n' +
                            '                  </td>\n' +
                            '                  <td>'+ i +'</td>\n' +
                            '                  <td><input type="hidden" name="typeno" value="'+ proEle[1] +'"> <input type="text" disabled style="width: 120px; border: none; background-color: transparent" value="'+ proEle[1] +'"></td>\n' +
                            '                  <td><input type="hidden" name="cname" value="'+ proEle[2] +'"> <input type="text" disabled style="width: 70px; border: none; background-color: transparent" value="'+ proEle[2] +'"></td>\n' +
                            '                  <td><input type="hidden" name="bname" value="'+ proEle[3] +'"> <input type="text" disabled style="width: 70px; border: none; background-color: transparent" value="'+ proEle[3] +'"></td>\n' +
                            '                  <td><input type="hidden" name="loca" value="'+ proEle[8] +'"> <input type="text" disabled style="width: 120px; border: none; background-color: transparent" value="'+ proEle[8] +'"></td>\n' +
                            '                  <td><input type="number" name="price" class="price" style="width: 70px; border: none; background-color: transparent" value="'+ proEle[6] +'"></td>\n' +
                            '                  <td><input type="number" name="count" class="count" style="width: 50px; border: none; background-color: transparent" value="1" ></td>\n' +
                            '                  <td><input type="hidden" name="unit"  value="'+ proEle[11] +'"> <input type="text" style="width: 30px; border: none; background-color: transparent" disabled value="'+ proEle[11] +'"></td>\n' +
                            '                  <td><input type="number" name="zongji" class="zongji" style="width: 100px; border: none; background-color: transparent">  </td>\n' +
                            '                  <td><input type="text" name="remark" style="width: 50px; border: none; background-color: transparent" value="'+ proEle[9] +'"> <input type="hidden" name="purNo" value="'+ proEle[10] +'"></td>\n' +
                            '                  <td class="text-center"><input type="button" class="btn btn-danger btn-xs" value="删除" onclick="removeByPurNo(\''+ proEle[10]+' \')"></td>\n' +
                            '               </fieldset>'+
                            '               </tr>'
                        );
                        /*var price = $(this).find(".price").val();
                        var count = $(this).find(".count").val();
                        $(this).find(".zongji").val(price*count);*/
                    })
                });
            }else{
                $("#product-list tbody").html("");
            }
        });

    }

    function removeByPurNo(purNo){
        $("#product-list tbody").html("");
        $.post("saleProduct/removeSaleByPurNo",{"purNo":purNo},function (productMap) {
            alert("删除成功！");
            var prodMap = JSON.parse(decodeURIComponent(productMap));
            var i = 0;
            $.each(prodMap,function (key, value) {
                var proEle = value.toString().split(",");
                i += 1;
                $("#product-list tbody").append('<tr>\n' +
                    '              <fieldset>'+
                    '                  <td >\n' +
                    '                  <input name="ids" type="checkbox" value=" '+ proEle[10] +'" />\n' +
                    '                  </td>\n' +
                    '                  <td>'+ i +'</td>\n' +
                    '                  <td><input type="hidden" name="typeno" value="'+ proEle[1] +'"> <input type="text" disabled style="width: 120px; border: none; background-color: transparent" value="'+ proEle[1] +'"></td>\n' +
                    '                  <td><input type="hidden" name="cname" value="'+ proEle[2] +'"> <input type="text" disabled style="width: 70px; border: none; background-color: transparent" value="'+ proEle[2] +'"></td>\n' +
                    '                  <td><input type="hidden" name="bname" value="'+ proEle[3] +'"> <input type="text" disabled style="width: 70px; border: none; background-color: transparent" value="'+ proEle[3] +'"></td>\n' +
                    '                  <td><input type="hidden" name="loca" value="'+ proEle[8] +'"> <input type="text" disabled style="width: 120px; border: none; background-color: transparent" value="'+ proEle[8] +'"></td>\n' +
                    '                  <td><input type="number" name="price" class="price" style="width: 70px; border: none; background-color: transparent" value="'+ proEle[6] +'"></td>\n' +
                    '                  <td><input type="number" name="count" class="count" style="width: 50px; border: none; background-color: transparent" value="1" ></td>\n' +
                    '                  <td><input type="hidden" name="unit"  value="'+ proEle[11] +'"> <input type="text" style="width: 30px; border: none; background-color: transparent" disabled value="'+ proEle[11] +'"></td>\n' +
                    '                  <td><input type="number" name="zongji" class="zongji" style="width: 100px; border: none; background-color: transparent">  </td>\n' +
                    '                  <td><input type="text" name="remark" style="width: 50px; border: none; background-color: transparent" value="'+ proEle[9] +'"> <input type="hidden" name="purNo" value="'+ proEle[10] +'"></td>\n' +
                    '                  <td class="text-center"><input type="button" class="btn btn-danger btn-xs" value="删除" onclick="removeByPurNo(\''+ proEle[10]+' \')"></td>\n' +
                    '               </fieldset>'+
                    '               </tr>'
                );
                /*var price = $(this).find(".price").val();
                var count = $(this).find(".count").val();
                $(this).find(".zongji").val(price*count);*/
            });
        });
    }
    
    function removeAllProductByPurNos() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#product-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var purNos = checkedArr.join(",");
            $("#product-list tbody").html("");
            $.post("saleProduct/removeSaleByPurNos",{"purNos":purNos},function (productMap) {
                alert("删除成功！");
                var prodMap = JSON.parse(decodeURIComponent(productMap));
                var i = 0;
                $.each(prodMap,function (key, value) {
                    var proEle = value.toString().split(",");
                    i += 1;
                    $("#product-list tbody").append('<tr>\n' +
                        '              <fieldset>'+
                        '                  <td >\n' +
                        '                  <input name="ids" type="checkbox" value=" '+ proEle[10] +'" />\n' +
                        '                  </td>\n' +
                        '                  <td>'+ i +'</td>\n' +
                        '                  <td><input type="hidden" name="typeno" value="'+ proEle[1] +'"> <input type="text" disabled style="width: 120px; border: none; background-color: transparent" value="'+ proEle[1] +'"></td>\n' +
                        '                  <td><input type="hidden" name="cname" value="'+ proEle[2] +'"> <input type="text" disabled style="width: 70px; border: none; background-color: transparent" value="'+ proEle[2] +'"></td>\n' +
                        '                  <td><input type="hidden" name="bname" value="'+ proEle[3] +'"> <input type="text" disabled style="width: 70px; border: none; background-color: transparent" value="'+ proEle[3] +'"></td>\n' +
                        '                  <td><input type="hidden" name="loca" value="'+ proEle[8] +'"> <input type="text" disabled style="width: 120px; border: none; background-color: transparent" value="'+ proEle[8] +'"></td>\n' +
                        '                  <td><input type="number" name="price" class="price" style="width: 70px; border: none; background-color: transparent" value="'+ proEle[6] +'"></td>\n' +
                        '                  <td><input type="number" name="count" class="count" style="width: 50px; border: none; background-color: transparent" value="1" ></td>\n' +
                        '                  <td><input type="hidden" name="unit"  value="'+ proEle[11] +'"> <input type="text" style="width: 30px; border: none; background-color: transparent" disabled value="'+ proEle[11] +'"></td>\n' +
                        '                  <td><input type="number" name="zongji" class="zongji" style="width: 100px; border: none; background-color: transparent">  </td>\n' +
                        '                  <td><input type="text" name="remark" style="width: 50px; border: none; background-color: transparent" value="'+ proEle[9] +'"> <input type="hidden" name="purNo" value="'+ proEle[10] +'"></td>\n' +
                        '                  <td class="text-center"><input type="button" class="btn btn-danger btn-xs" value="删除" onclick="removeByPurNo(\''+ proEle[10]+' \')"></td>\n' +
                        '               </fieldset>'+
                        '               </tr>'
                    );
                    /*var price = $(this).find(".price").val();
                    var count = $(this).find(".count").val();
                    $(this).find(".zongji").val(price*count);*/
                });
            });
        }
    }
    
</script>
</body>

</html>
<!---->