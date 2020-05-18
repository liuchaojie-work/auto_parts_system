<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统产品部分顾客价格表页面</title>
    <meta name="description" content="汽配销售">
    <meta name="keywords" content="汽配销售">

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,clientPrice-scalable=no" name="viewport">
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
            <%--    客户产品价格展示    --%>
            <div id="showAllClientPrice">
                <!-- 客户产品价格内容头部 -->
                <section class="content-header">
                    <h1>
                        客户产品价格展示
                        <small>数据列表</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                        <li><a href="#">客户产品价格展示</a></li>
                        <li class="active">数据列表</li>
                    </ol>
                </section>
                <!-- 客户产品价格内容头部 /-->
                <!-- 客户产品价格正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">客户产品价格列表</h3>
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--工具栏-->
                                <div class="pull-left">
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-success" title="新增" data-toggle="modal" data-target="#addClientPrice"><i class="fa fa-file-o"></i> 新增</button>
                                            <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteAllClientPriceByCpNos()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                            <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllClientPrice()"><i class="fa fa-refresh"></i> 刷新</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-tools pull-right">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" id="clientPriceSearch" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" id="search" class="btn btn-default" onclick="clientPriceSearch()"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--工具栏/-->

                                <!--数据列表-->
                                <table id="clientPrice-list" class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right:0px;">
                                            <input id="clientPrice-selall" type="checkbox">
                                        </th>
                                        <th class="sorting_asc">#</th>
                                        <th class="sorting_desc">用户名</th>
                                        <th class="sorting_desc sorting_desc_disabled">姓名</th>
                                        <th class="sorting_asc sorting_asc_disabled">手机</th>
                                        <th class="sorting">型号</th>
                                        <th class="sorting">类别</th>
                                        <th class="sorting">品牌</th>
                                        <th>售价</th>
                                        <th>添加时间</th>
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
                <!-- 客户产品价格正文区域 /-->
            </div>

            <%--   客户产品价格新增    --%>
            <div id="addClientPrice" class="modal" role="dialog">

                <!-- .box-body -->
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllClientPrice()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">客户产品价格新增</h4>
                        </div>
                        <div class="modal-body">
                            <form id="addClientPriceForm" class="form-horizontal">
                                <div class="box-body">

                                    <div class="col-sm-12 form-group"  style="text-align: center">
                                        <label id="addClientPriceMsg"></label>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">用户名：</label>

                                        <div class="col-sm-8">
                                            <select id="addUsernameSelect" name="username" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="addNameSelect" class="col-sm-4 control-label">姓名：</label>

                                        <div class="col-sm-8">
                                            <select id="addNameSelect" name="name" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="addPhoneSelect" class="col-sm-4 control-label">手机：</label>

                                        <div class="col-sm-8">
                                            <select id="addPhoneSelect" name="phone" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品型号：</label>

                                        <div class="col-sm-8">
                                            <select id="addTypenoSelect" name="typeno" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品类别：</label>

                                        <div class="col-sm-8">
                                            <select id="addCategorySelect" name="cname" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label class="col-sm-4 control-label">产品品牌：</label>

                                        <div class="col-sm-8">
                                            <select id="addBrandSelect" name="bname" class="form-control select2" style="width: 100%;" >

                                            </select>
                                            <span class="help-block small msg-info">Help block with success</span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 form-group">
                                        <label for="inputClientPricePrice" class="col-sm-4 control-label">售价：</label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="inputClientPricePrice" name="price" placeholder="请输入售价...">
                                            <span class="help-block small msg-info">Help block with success</span>
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
                                        <input type="button" class="btn btn-success col-sm-2" onclick="addClientPrice()" value="提交" />
                                        <input type="reset"  style="margin-left: 10px;"  class="btn btn-warning col-sm-2" value="重置"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllClientPrice()" value="关闭"/>
                        </div>
                    </div>
                </div>

            </div>

            <%--   客户产品价格修改    --%>
            <div id="changeClientPrice" class="modal" role="dialog">
                <!-- 客户产品价格修改内容头部 -->
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="findAllClientPrice()">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">客户产品价格修改</h4>
                        </div>
                        <div class="modal-body">
                            <form id="changeClientPriceForm" class="form-horizontal">
                                <div class="box-body">
                                    <div id="content">

                                    </div>
                                    <div class="col-sm-offset-4 col-sm-8" >
                                        <input type="button" class="btn btn-success col-sm-2" onclick="changeClientPriceSubmit()" value="提交"/>
                                        <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-2" value="重置"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-danger" data-dismiss="modal" onclick="findAllClientPrice()" value="返回"/>
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

        if(!$("showAllClientPrice").attr("hidden")){
            findAllClientPrice();
        }

        $.post("user/findAllCustomer", {}, function (userData) {
           for(var i = 0; i < userData.length; i++){
               $("#addUsernameSelect").append('<option>'+userData[i].username+'</option>');
               $("#addNameSelect").append('<option>'+userData[i].name+'</option>');
               $("#addPhoneSelect").append('<option>'+userData[i].phone+'</option>');
           }
        });

        $("#addUsernameSelect").blur(function () {
            var username = $("#addUsernameSelect").val();
            $.post("user/findByUsername",{"account":username},function (userData) {
                $("#addNameSelect").html("");
                $("#addPhoneSelect").html("");
                $("#addNameSelect").append('<option>'+userData.name+'</option>');
                $("#addPhoneSelect").append('<option>'+userData.phone+'</option>');
            })
        });

        $.post("product/findAll",{}, function (data) {
            var str1 = "";
            for(var i = 0; i < data.length; i++){
                str1+='<option>'+data[i][1]+'</option>';
            }
            $("#addTypenoSelect").html(str1);
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

        $("#pageSize").bind('input propertychange', function () {
            findAllClientPrice();
        });

        selectAllOrNone("#clientPrice-selall","#clientPrice-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    function deleteAllClientPriceByCpNos() {
        var result = confirm("确定删除所选吗？");
        if(result){
            var checks = $("#clientPrice-list tbody tr td input[type='checkbox']:checked");
            if(0 == checks.length){
                alert("未选种任何一条!");
                return false;
            }
            var checkedArr = new Array();
            checks.each(function () {
                checkedArr.push($(this).val());
            });
            var cpNos = checkedArr.join(",");
            $.post("clientPrice/deleteByCpNos",{"cpNos":cpNos},function (data) {
                if(data){
                    $(function (){
                        alert("批量删除成功！")
                    });
                    findAllClientPrice();
                }else{
                    $(function () {
                        alert("批量删除失败！")
                    });
                }
            });
        }
    }
    function findAllClientPrice() {
        /*$.post("clientPrice/findAll",{},function (data) {
            if(null == data){
                $("#clientPrice-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].cpNo+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].username+'</td>\n' +
                    '                                        <td>'+data[i].name+'</td>\n' +
                    '                                        <td>'+data[i].phone+'</td>\n' +
                    '                                        <td>'+data[i].typeno+'</td>\n' +
                    '                                        <td>'+data[i].cname+'</td>\n' +
                    '                                        <td>'+data[i].bname+'</td>\n' +
                    '                                        <td>'+data[i].price+'</td>\n' +
                    '                                        <td>'+data[i].time+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeClientPrice" onclick="findClientPriceByCpNo(\''+data[i].cpNo+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteClientPriceByCpNo(\''+data[i].cpNo+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#clientPrice-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize);
    }
    function load(currentPage, pageSize, condition) {
        $.get("clientPrice/pageQuery",{"currentPage":currentPage, "pageSize":pageSize, "condition":condition}, function (pb) {
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
                    '                                        <td><input name="ids" type="checkbox" value="'+listElement.cpNo+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+listElement.username+'</td>\n' +
                    '                                        <td>'+listElement.name+'</td>\n' +
                    '                                        <td>'+listElement.phone+'</td>\n' +
                    '                                        <td>'+listElement.typeno+'</td>\n' +
                    '                                        <td>'+listElement.cname+'</td>\n' +
                    '                                        <td>'+listElement.bname+'</td>\n' +
                    '                                        <td>'+listElement.price+'</td>\n' +
                    '                                        <td>'+listElement.time+'</td>\n' +
                    '                                        <td>'+listElement.remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeClientPrice" onclick="findClientPriceByCpNo(\''+listElement.cpNo+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteClientPriceByCpNo(\''+listElement.cpNo+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                info_list+=tr;
            }
            $("#clientPrice-list tbody").html(info_list);
            window.scrollTo(0,0);
        });
    }
    function clientPriceSearch() {
        var search = $("#clientPriceSearch").val();
        /*$.post("clientPrice/findByCondition",{"condition":search},function (data) {
            if(null == data){
                $("#clientPrice-list tbody").html("");
                return;
            }
            var str = "";
            for(var i = 0; i < data.length; i++){
                var tr = '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="'+data[i].cpNo+'"></td>\n' +
                    '                                        <td>'+(i+1)+'</td>\n' +
                    '                                        <td>'+data[i].username+'</td>\n' +
                    '                                        <td>'+data[i].name+'</td>\n' +
                    '                                        <td>'+data[i].phone+'</td>\n' +
                    '                                        <td>'+data[i].typeno+'</td>\n' +
                    '                                        <td>'+data[i].cname+'</td>\n' +
                    '                                        <td>'+data[i].bname+'</td>\n' +
                    '                                        <td>'+data[i].price+'</td>\n' +
                    '                                        <td>'+data[i].time+'</td>\n' +
                    '                                        <td>'+data[i].remark+'</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <input type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#changeClientPrice" onclick="findClientPriceByCpNo(\''+data[i].cpNo+'\')" value="修改"/>\n' +
                    '                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteClientPriceByCpNo(\''+data[i].cpNo+'\')" value="删除"/>\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
                str +=tr;
            }
            $("#clientPrice-list tbody").html(str);
        });*/
        var pageSize = $("#pageSize").val();
        load(1,pageSize,search);
    }


    function findClientPriceByCpNo(cpNo) {
        $.post("clientPrice/findByCpNo",{"cpNo":cpNo},function (data) {
            var str=
                '\n' +
                '                                <div class="col-sm-12 form-group"  style="text-align: center">\n' +
                '                                    <label id="changeClientPriceMsg"></label>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">用户名：</label>\n' +
                '                                    <input type="hidden" class="form-control" name="cpNo" value="'+cpNo+'">\n' +
                '                                    <input type="hidden" class="form-control" name="username" value="'+data.username+'" placeholder="请输入用户名...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="username" disabled value="'+data.username+'" placeholder="请输入用户名...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">姓名：</label>\n' +
                '                                        <input type="hidden" class="form-control" name="name" value="'+data.name+'" placeholder="请输入姓名...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="name" disabled value="'+data.name+'" placeholder="请输入姓名...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">手机号码：</label>\n' +
                '                                        <input type="hidden" class="form-control" name="phone" value="'+data.phone+'" placeholder="请输入手机号码...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="phone" disabled value="'+data.phone+'" placeholder="请输入手机号码...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">型号：</label>\n' +
                '                                        <input type="hidden" class="form-control" name="typeno" value="'+data.typeno+'" placeholder="请输入型号...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="typeno" disabled value="'+data.typeno+'" placeholder="请输入型号...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">类别：</label>\n' +
                '                                        <input type="hidden" class="form-control" name="cname" value="'+data.cname+'" placeholder="请输入类别...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="cname" disabled value="'+data.cname+'" placeholder="请输入类别...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">品牌：</label>\n' +
                '                                        <input type="hidden" class="form-control" name="bname" value="'+data.bname+'" placeholder="请输入品牌...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="bname" disabled value="'+data.bname+'" placeholder="请输入品牌...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label class="col-sm-4 control-label">售价：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="price" value="'+data.price+'" placeholder="请输入售价...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputClientPricePlace" class="col-sm-4 control-label">添加时间：</label>\n' +
                '                                        <input type="hidden" class="form-control" value="'+ data.time +'" placeholder="请输入添加时间...">\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" value="'+ changeTime(data.time) +'" disabled placeholder="请输入添加时间...">\n' +
                '                                        <span class="help-block small msg-info">Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' +
                '                                <div class="col-sm-6 form-group">\n' +
                '                                    <label for="inputClientPriceRemark" class="col-sm-4 control-label">备注：</label>\n' +
                '\n' +
                '                                    <div class="col-sm-8">\n' +
                '                                        <input type="text" class="form-control" name="remark" value="'+data.remark+'" placeholder="请输入备注...">\n' +
                '                                        <span class="help-block small msg-info" >Help block with success</span>\n' +
                '                                    </div>\n' +
                '                                </div>\n' +
                '\n' ;
            $("#changeClientPriceForm .box-body #content").html(str);
        });
    }
    function deleteClientPriceByCpNo(cpNo) {
        var result = confirm("确定删除吗？");
        if(result){
            $.post("clientPrice/deleteByCpNo",{"cpNo":cpNo},function (data) {
                if(data){
                    $(function (){
                        alert("删除成功！");
                    });
                    findAllClientPrice();
                }else{
                    $(function () {
                        alert("删除失败！");
                    });
                }
            });
        }
    }
    function addClientPrice(){
        $.post("clientPrice/add",$("#addClientPriceForm").serialize(),function (data) {
            if(data){
                $("#addClientPriceMsg").html("添加成功！");
                $("#addClientPriceMsg").css("color","green");
            }else{
                $("#addClientPriceMsg").html("已存在！添加失败！");
                $("#addClientPriceMsg").css("color","red");
            }
        });

    }
    function changeClientPriceSubmit() {
        $.post("clientPrice/change",$("#changeClientPriceForm").serialize(), function (data) {
            if(data){
                $("#changeClientPriceMsg").html("修改成功！");
                $("#changeClientPriceMsg").css("color","green");
            }else{
                $("#changeClientPriceMsg").html("修改失败！");
                $("#changeClientPriceMsg").css("color","red");
            }
        });
    }
</script>
</body>

</html>
<!---->