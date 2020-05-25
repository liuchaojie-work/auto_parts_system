<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>XX汽配销售系统产品管理页面</title>
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
            <%--    产品展示    --%>
            <div id="showAllProduct">
                <!-- 产品内容头部 -->
                <section class="content-header">
                    <h1>
                        产品展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                        <li><a href="#">产品展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 产品内容头部 /-->
                <!-- 产品正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">产品列表</h3>
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <c:choose>
                                                <c:when test="${1 eq user.iden or 999 eq user.iden}">
                                                    <button type="button" class="btn btn-default btn-success" title="新增" data-toggle="modal" data-target="#addProduct" ><i class="fa fa-file-o"></i> 新增</button>
                                                    <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllProductByProIds()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                                </c:when>
                                            </c:choose>
                                            <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllProduct()"><i class="fa fa-refresh"></i> 刷新</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="productSearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" id="search" class="btn btn-default" onclick="productSearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->

                                <!--数据列表-->
                                <table id="product-list" class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="product-selall" type="checkbox">
                                        </th>
                                        <th class="sorting_asc">#</th>
                                        <c:choose>
                                            <c:when test="${1 eq user.iden or 999 eq user.iden}">
                                                <th class="sorting_desc">产品id</th>
                                            </c:when>
                                        </c:choose>
                                        <th class="sorting_asc sorting_asc_disabled">产品型号</th>
                                        <th class="sorting_desc sorting_desc_disabled">产品类别</th>
                                        <th class="sorting_desc sorting_desc_disabled">产品品牌</th>
                                        <th class="sorting">产品图片地址</th>
                                        <th class="sorting">产品描述</th>
                                        <th class="sorting">备注</th>
                                        <c:choose>
                                            <c:when test="${1 eq user.iden or 999 eq user.iden}">
                                                <th class="text-center">操作</th>
                                            </c:when>
                                        </c:choose>
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
                <!-- 产品正文区域 /-->
            </div>

            <%--   产品新增    --%>
            <div id="addProduct" class="modal" role="dialog">
                <!-- 产品新增内容头部 -->
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllProduct()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">产品新增</h4>
                        </div>

                        <!-- 数据表单 -->
                        <div class="modal-body">
                            <form id="addProductForm" class="form-horizontal">
                                <div class="box-body">

                                    <div class="col-sm-12 form-group"  style="text-align: center">
                                        <label id="addProductMsg"></label>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputProductProId" class="col-sm-4 control-label">产品型号：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputProductProId" name="typeno" placeholder="请输入产品型号...">
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品类别：</label>

                                        <div class="col-sm-8">
                                            <select id="addProductCategorySelect" name="cname" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品品牌：</label>

                                        <div class="col-sm-8">
                                            <select id="addProductBrandSelect" name="bname" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品图片：</label>

                                        <div class="col-sm-8">
                                            <input type="file" class="form-control" name="img" placeholder="请选择图片" style="border: 0">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputProductDescr" class="col-sm-4 control-label">产品描述：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputProductDescr" name="descr" placeholder="请输入产品描述...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputProductRemark" class="col-sm-4 control-label">备注：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputProductRemark" name="remark" placeholder="请输入备注...">
                                            <span class="help-block small msg-info" >Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="button" class="btn btn-success col-sm-2" onclick="addProduct()" value="提交" />
                                        <input type="reset" style="margin-left: 10px" class="btn btn-warning col-sm-2" value="重置"/>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllProduct()" value="关闭"/>
                        </div>

                    </div>
                </div>
                <!-- 产品内容头部 /-->
            </div>

            <%--   产品修改    --%>
            <div id="changeProduct" class="modal " role="dialog">
                <!-- 产品修改内容头部 -->
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllProduct()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">产品修改</h4>
                        </div>

                        <!-- 数据表单 -->
                        <div class="modal-body">
                            <form id="changeProductForm" class="form-horizontal">
                                <div class="box-body">

                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllProduct()" value="关闭"/>
                        </div>

                    </div>
                </div>

                <!-- 产品修改内容 /-->
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

        if(!$("showAllProduct").attr("hidden")){
            findAllProduct();
        }

        $.post("category/findAll",{},function (categoryData) {
            var str1 = "";
            for(var i = 0; i < categoryData.length; i++){
                str1+='<option>'+categoryData[i].name+'</option>';
            }
            $("#addProductCategorySelect").html(str1);
        });

        $.post("brand/findAll",{},function (brandData) {
            var str2 = "";
            for(var j = 0; j < brandData.length; j++){
                str2+='<option>'+brandData[j].name+'</option>';
            }
            $("#addProductBrandSelect").html(str2);
        });

        $("#addProductCategorySelect").blur(function () {
            var cname = $("#addProductCategorySelect").val();
            $.post("categoryBrand/findByCname",{"cname":cname},function (data) {
                var str1 = "";
                for(var i = 0; i < data.length; i++){
                    str1+='<option>'+data[i].bname+'</option>';
                }
                $("#addProductBrandSelect").html(str1);
            });
        });

        // $("#addProductBrandSelect").blur(function () {
        //     var bname = $("#addProductBrandSelect").val();
        //     $.post("categoryBrand/findByBname",{"bname":bname},function (data) {
        //         var str1 = "";
        //         for(var i = 0; i < data.length; i++){
        //             str1+='<option>'+data[i].cname+'</option>';
        //         }
        //         $("#addProductCategorySelect").html(str1);
        //     });
        // });
        $("#pageSize").bind('input propertychange', function () {
            findAllProduct();
        });


        selectAllOrNone("#product-selall","#product-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllProductByProIds() {
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
            var proIds = checkedArr.join(",");
            $.post("product/deleteByProIds",{"proIds":proIds},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！")
                    });
                    findAllProduct();
                }else{
                    $(function () {
                        alert("批量删除失败！")
                    });
                }
            });
        }
    }
    function findAllProduct() {
        /*$.post("product/findAll",{},function (data) {
            if(null == data){
                $("#product-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i][0]+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i][0]+'</td>\n' +
                    '                                        <td>'+data[i][1]+'</td>\n' +
                    '                                        <td>'+data[i][2]+'</td>\n' +
                    '                                        <td>'+data[i][3]+'</td>\n' +
                    '                                        <td>'+data[i][4]+'</td>\n' +
                    '                                        <td>'+data[i][5]+'</td>\n' +
                    '                                        <td>'+data[i][6]+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeProduct" onclick="findProductByProId(\''+data[i][0]+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteProductByProId(\''+data[i][0]+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#product-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize);
    }
    function load(currentPage, pageSize, condition) {
        $.get("product/pageQuery",{"currentPage":currentPage, "pageSize":pageSize, "condition":condition}, function (pb) {
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
                    '                                        <td><input name="ids" type="checkbox" value="'+listElement[0]+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n'+
                    ' <c:choose><c:when test="${1 eq user.iden or 999 eq user.iden}">'+
                    '                                        <td>'+listElement[0]+'</td>\n' +
                    '</c:when></c:choose>'+
                    '                                        <td>'+listElement[1]+'</td>\n' +
                    '                                        <td>'+listElement[2]+'</td>\n' +
                    '                                        <td>'+listElement[3]+'</td>\n' +
                    '                                        <td>'+listElement[4]+'</td>\n' +
                    '                                        <td>'+listElement[5]+'</td>\n' +
                    '                                        <td>'+listElement[6]+'</td>\n' +
                    ' <c:choose><c:when test="${1 eq user.iden or 999 eq user.iden}">'+
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeProduct" onclick="findProductByProId(\''+listElement[0]+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteProductByProId(\''+listElement[0]+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '</c:when></c:choose>'+
                    '                                    </tr>';
                info_list+=tr;
            }
            $("#product-list tbody").html(info_list);
            window.scrollTo(0,0);
        });
    }
    function productSearch() {
        var search = $("#productSearch").val();
        /*$.post("product/findAllByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#product-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i][0]+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i][0]+'</td>\n' +
                    '                                        <td>'+data[i][1]+'</td>\n' +
                    '                                        <td>'+data[i][2]+'</td>\n' +
                    '                                        <td>'+data[i][3]+'</td>\n' +
                    '                                        <td>'+data[i][4]+'</td>\n' +
                    '                                        <td>'+data[i][5]+'</td>\n' +
                    '                                        <td>'+data[i][6]+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" onclick="findProductByProId(\''+data[i][0]+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteProductByProId(\''+data[i][0]+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#product-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize,search);
    }
    function findProductByProId(proId) {
        $.post("product/findByProId",{"proId":proId},function (data) {
            var str=
                '<div class="col-sm-12 form-group"  style="text-align: center">\n' +
                '                                            <label id="changeProductMsg"></label>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputProductProId" class="col-sm-4 control-label">产品id：</label>\n' +
                '\n' +
                '                                                <input type="hidden" class="form-control" id="inputProductProId" name="proId" value="'+ data[0] +'"  placeholder="请输入产品型号...">\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputProductProId" name="proId" disabled="disabled" value="'+ data[0] +'"  placeholder="请输入产品型号...">\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputProductProId" class="col-sm-4 control-label">产品型号：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputProductProId" name="typeno" value="'+ data[1] +'"  placeholder="请输入产品型号...">\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label class="col-sm-4 control-label">产品类别：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <select id="changeProductCategorySelect" name="cname" class="form-control select2" value="'+ data[2] +'"  style="width: 100%;" >\n' +
                '                                                </select>\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label class="col-sm-4 control-label">产品品牌：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <select id="changeProductBrandSelect" name="bname" class="form-control select2" value="'+ data[3] +'" style="width: 100%;" >\n' +
                '\n' +
                '                                                </select>\n' +
                '                                                <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label class="col-sm-4 control-label">产品图片：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="file" class="form-control" name="img" placeholder="请选择图片" value="'+ data[4] +'" style="border: 0">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputProductDescr" class="col-sm-4 control-label">产品描述：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputProductDescr" name="descr" value="'+ data[5] +'" placeholder="请输入产品描述...">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-6 form-group">\n' +
                '                                            <label for="inputProductRemark" class="col-sm-4 control-label">备注：</label>\n' +
                '\n' +
                '                                            <div class="col-sm-8">\n' +
                '                                                <input type="text" class="form-control" id="inputProductRemark" name="remark" value="'+ data[6] +'" placeholder="请输入备注...">\n' +
                '                                                <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '\n' +
                '                                        <div class="col-sm-offset-4 col-sm-8" >\n' +
                '                                            <input type="button" class="btn btn-success col-sm-2" onclick="changeProductSubmit()" value="提交" />\n' +
                '                                            <input type="reset" style="margin-left: 10px" class="btn btn-warning col-sm-2" value="重置"/>\n' +
                '                                        </div>';
            $("#changeProductForm .box-body").html(str);

            $.post("category/findAll",{},function (categoryData) {
                var str1 = "";
                for(var i = 0; i < categoryData.length; i++){
                    if($.trim(data[2]) === $.trim(categoryData[i].name)){
                        str1+='<option selected="selected">'+data[2]+'</option>';
                    }else{
                        str1+='<option>'+categoryData[i].name+'</option>';
                    }
                }
                $("#changeProductCategorySelect").html(str1);
            });

            $.post("brand/findAll",{},function (brandData) {
                var str2 = "";
                for(var j = 0; j < brandData.length; j++){
                    if($.trim(data[3]) === $.trim(brandData[j].name)){
                        str2+='<option selected="selected">'+data[3]+'</option>';
                    }else{
                        str2+='<option>'+brandData[j].name+'</option>';
                    }
                }
                $("#changeProductBrandSelect").html(str2);
            });

            $("#changeProductCategorySelect").blur(function () {
                var cname = $("#changeProductCategorySelect").val();
                $.post("categoryBrand/findByCname",{"cname":cname},function (data) {
                    var str1 = "";
                    for(var i = 0; i < data.length; i++){
                        str1+='<option>'+data[i].bname+'</option>';
                    }
                    $("#changeProductBrandSelect").html(str1);
                });
            });
        });

    }
    function deleteProductByProId(proId) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("product/deleteByProId",{"proId":proId},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！");
                    });
                    findAllProduct();
                }else{
                    $(function () {
                        alert("删除失败！");
                    });
                }
            });
        }
    }
    function addProduct(){
        $.post("product/add",$("#addProductForm").serialize(),function (data) {
            if(data){
                $("#addProductMsg").html("添加成功！");
                $("#addProductMsg").css("color","green");
            }else{
                $("#addProductMsg").html("已存在！添加失败！");
                $("#addProductMsg").css("color","red");
            }
        });

    }
    function changeProductSubmit() {
        $.post("product/change",$("#changeProductForm").serialize(), function (data) {
            if(data){
                $("#changeProductMsg").html("修改成功！");
                $("#changeProductMsg").css("color","green");
            }else{
                $("#changeProductMsg").html("修改失败！");
                $("#changeProductMsg").css("color","red");
            }
        });
    }
</script>
</body>

</html>
<!---->