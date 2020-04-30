<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统产品管理页面</title>
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

        <%--    品牌展示    --%>
        <div id="showAllBrand">
            <!-- 品牌内容头部 -->
            <section class="content-header">
                <h1>
                    品牌展示
                    <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                    <li><a href="#">品牌展示</a></li>
                    <li class="active">数据列表</li>
                </ol>
            </section>
            <!-- 品牌内容头部 /-->
            <!-- 品牌正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">品牌列表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-success" title="新增" onclick="addBrand()"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default btn-danger" title="批量删除" onclick="deleteByNames()"><i class="fa fa-trash-o"></i> 批量删除</button>
                                        <button type="button" class="btn btn-default btn-info" title="刷新" onclick="findAllBrand()"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" id="search" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="brand-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="brand-selall" type="checkbox">
                                    </th>
                                    <th class="sorting_asc">#</th>
                                    <th class="sorting_desc">品牌名</th>
                                    <th class="sorting_asc sorting_asc_disabled">厂家</th>
                                    <th class="sorting_desc sorting_desc_disabled">产地</th>
                                    <th class="sorting">备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${brands}" var="brand" varStatus="vs">
                                    <tr>
                                        <td><input name="ids" type="checkbox" value="${brand.name}"></td>
                                        <td>${vs.index + 1}</td>
                                        <td>${brand.name}</td>
                                        <td>${brand.factory}</td>
                                        <td>${brand.place}</td>
                                        <td>${brand.remark}</td>
                                        <td class="text-center">
                                            <input type="button" class="btn btn-info btn-xs" onclick="findByName('${brand.name}')" value="修改"/>
                                            <input type="button" class="btn btn-danger btn-xs" onclick="deleteBrand('${brand.name}')" value="删除"/>
                                        </td>
                                    </tr>
                                </c:forEach>
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
            <!-- 品牌正文区域 /-->
        </div>

        <%--   品牌新增    --%>
        <div id="addBrand">
                <!-- 品牌新增内容头部 -->
                <section class="content-header">
                    <h1>
                        品牌新增
                        <small>提交表单</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                        <li><a href="#">品牌</a></li>
                        <li class="active">品牌新增</li>
                    </ol>
                </section>
                <!-- 品牌内容头部 /-->
                <!-- 品牌正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">品牌新增</h3>
                        </div>
                        <!-- 数据表单 -->
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/brand/add" method="post">
                        <div class="box-body">

                            <div class="col-sm-6 form-group">
                                <label for="inputBrandName" class="col-sm-3 control-label">产品品牌：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputBrandName" name="name" placeholder="请输入品牌名...">
                                    <span class="help-block small msg-info">Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label for="inputBrandFactory" class="col-sm-3 control-label">产品厂家：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputBrandFactory" name="factory" placeholder="请输入厂家...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label for="inputBrandPlace" class="col-sm-3 control-label">产品产地：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputBrandPlace" name="place" placeholder="请输入产地...">
                                    <span class="help-block small msg-info">Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label for="inputBrandRemark" class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="inputBrandRemark" name="remark" placeholder="请输入备注...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="submit" class="btn btn-success col-sm-2" value="提交" />
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" onclick="goBackBrand()" value="返回"/>
                            </div>
                        </div>
                        </form>

                        <!-- 数据表单 /-->
                    </div>
                    <!-- /.box-body -->
                </section>
                <!-- 品牌正文区域 /-->
            </div>

        <%--   品牌修改    --%>
        <div id="changeBrand">
                <!-- 品牌修改内容头部 -->
                <section class="content-header">
                    <h1>
                        品牌修改
                        <small>修改表单</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                        <li><a href="#">品牌</a></li>
                        <li class="active">品牌修改</li>
                    </ol>
                </section>
                <!-- 品牌内容头部 /-->
                <!-- 品牌正文区域 -->
                <section class="content row">
                    <!-- .box-body -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">品牌修改</h3>
                        </div>
                        <!-- 数据表单 -->
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/brand/change" method="post">
                            <div class="box-body">

                                <div class="col-sm-6 form-group">
                                    <label for="inputBrandName" class="col-sm-3 control-label">产品品牌：</label>
                                    <input type="hidden" class="form-control" name="name" value="${brand.name}" placeholder="请输入品牌名...">

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="name" value="${brand.name}" disabled placeholder="请输入品牌名...">
                                        <span class="help-block small msg-info">Help block with success</span>
                                    </div>
                                </div>


                                <div class="col-sm-6 form-group">
                                    <label for="inputBrandFactory" class="col-sm-3 control-label">产品厂家：</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="factory" value="${brand.factory}" placeholder="请输入厂家...">
                                        <span class="help-block small msg-info" >Help block with success</span>
                                    </div>
                                </div>

                                <div class="col-sm-6 form-group">
                                    <label for="inputBrandPlace" class="col-sm-3 control-label">产品产地：</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="place" value="${brand.place}" placeholder="请输入产地...">
                                        <span class="help-block small msg-info">Help block with success</span>
                                    </div>
                                </div>


                                <div class="col-sm-6 form-group">
                                    <label for="inputBrandRemark" class="col-sm-3 control-label">备注：</label>

                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="remark" value="${brand.remark}" placeholder="请输入备注...">
                                        <span class="help-block small msg-info" >Help block with success</span>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer">
                                <div class="col-sm-offset-4 col-sm-8" >
                                    <input type="submit" class="btn btn-success col-sm-2" value="提交"/>
                                    <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                    <input type="button" class="btn btn-danger col-sm-1" value="返回"/>
                                </div>
                            </div>
                        </form>

                        <!-- 数据表单 /-->
                    </div>
                    <!-- /.box-body -->
                </section>
                <!-- 品牌正文区域 /-->
            </div>

        <%--   类别展示    --%>
        <div>
            <!-- 类别内容头部 -->
            <section class="content-header">
                <h1>
                    类别展示
                    <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                    <li><a href="#">类别展示</a></li>
                    <li class="active">数据列表</li>
                </ol>
            </section>
            <!-- 类别内容头部 /-->
            <!-- 类别正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">类别列表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="批量删除"><i class="fa fa-trash-o"></i> 批量删除</button>
                                        <button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="category-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="category-selall" type="checkbox" onclick="selectAllOrNone(this);">
                                    </th>
                                    <th class="sorting_asc">#</th>
                                    <th class="sorting_desc">产品类别名</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品单位</th>
                                    <th class="sorting">备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>方向机</td>
                                    <td>台</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input name="ids" type="checkbox"  class="checkbox_select" ></td>
                                    <td>1</td>
                                    <td>方向机</td>
                                    <td>台</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input name="ids" type="checkbox"  class="checkbox_select" ></td>
                                    <td>1</td>
                                    <td>方向机</td>
                                    <td>台</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input name="ids" type="checkbox"  class="checkbox_select" ></td>
                                    <td>1</td>
                                    <td>方向机</td>
                                    <td>台</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
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
            <!-- 类别正文区域 /-->
        </div>

        <%--   类别新增    --%>
        <div>
            <!-- 类别新增内容头部 -->
            <section class="content-header">
                <h1>
                    类别新增
                    <small>提交表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                    <li><a href="#">类别</a></li>
                    <li class="active">类别新增</li>
                </ol>
            </section>
            <!-- 类别内容头部 /-->
            <!-- 类别正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">类别新增</h3>
                    </div>
                    <!-- 数据表单 -->
                    <form class="form-horizontal">
                        <div class="box-body">


                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品类别名：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_name" placeholder="请输入产品类别名...">
                                    <span class="help-block small msg-info">Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品单位：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_unit" placeholder="请输入产品单位...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_remark" placeholder="请输入备注...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="submit" class="btn btn-success col-sm-2" value="提交"/>
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                </div>
                <!-- /.box-body -->
            </section>
            <!-- 类别正文区域 /-->
        </div>

        <%--   类别修改    --%>
        <div>
            <!-- 类别修改内容头部 -->
            <section class="content-header">
                <h1>
                    类别修改
                    <small>修改表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                    <li><a href="#">类别</a></li>
                    <li class="active">类别修改</li>
                </ol>
            </section>
            <!-- 品牌内容头部 /-->
            <!-- 品牌正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">类别修改</h3>
                    </div>
                    <!-- 数据表单 -->
                    <form class="form-horizontal">
                        <div class="box-body">


                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品类别名：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_name" placeholder="请输入产品类别名...">${category.name}
                                    <span class="help-block small msg-info">Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品单位：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_unit" placeholder="请输入产品单位...">${category.unit}
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_remark" placeholder="请输入备注...">${category.remark}
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="submit" class="btn btn-success col-sm-2" value="提交"/>
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                </div>
                <!-- /.box-body -->
            </section>
            <!-- 品牌正文区域 /-->
        </div>

        <%--  品牌类别关联    --%>
        <div>
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
                                        <button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="批量删除"><i class="fa fa-trash-o"></i> 批量删除</button>
                                        <button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->

                            <!--数据列表-->
                            <table id="cate-bra-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="cate-bra-selall" type="checkbox">
                                    </th>
                                    <th>#</th>
                                    <th>产品类别名</th>
                                    <th>产品单位</th>
                                    <th>产品品牌名</th>
                                    <th>产品厂家</th>
                                    <th>产品产地</th>
                                    <th>备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>方向机</td>
                                    <td>台</td>
                                    <td>世宝</td>
                                    <td>世宝</td>
                                    <td>杭州</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
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
            <!-- 品牌和类别关联正文区域 /-->
        </div>

        <%--   品牌类别关联新增    --%>
        <div>
            <!-- 品牌类别关联内容头部 -->
            <section class="content-header">
                <h1>
                    品牌类别关联
                    <small>提交表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                    <li><a href="#">品牌类别关联</a></li>
                    <li class="active">品牌类别关联新增</li>
                </ol>
            </section>
            <!-- 类别内容头部 /-->
            <!-- 类别正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">品牌类别关联新增</h3>
                    </div>
                    <!-- 数据表单 -->
                    <form class="form-horizontal">
                        <div class="box-body">


                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品类别名：</label>

                                <div class="col-sm-9">
                                    <select class="form-control select2" style="width: 100%;">
                                    <option selected="selected">Alabama</option>
                                    <option>Alaska</option>
                                    <option>California</option>
                                    <option>Delaware</option>
                                    <option>Tennessee</option>
                                    <option>Texas</option>
                                    <option>Washington</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品品牌名：</label>

                                <div class="col-sm-9">
                                    <select class="form-control select2" style="width: 100%;">
                                        <option selected="selected">Alabama</option>
                                        <option>Alaska</option>
                                        <option>California</option>
                                        <option>Delaware</option>
                                        <option>Tennessee</option>
                                        <option>Texas</option>
                                        <option>Washington</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_remark" placeholder="请输入备注...">
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="submit" class="btn btn-success col-sm-2" value="提交"/>
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                </div>
                <!-- /.box-body -->
            </section>
            <!-- 类别正文区域 /-->
        </div>

        <%--   品牌类别关联修改    --%>
        <div>
            <!-- 品牌类别关联内容头部 -->
            <section class="content-header">
                <h1>
                    品牌类别关联
                    <small>提交表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 产品管理</a></li>
                    <li><a href="#">品牌类别关联</a></li>
                    <li class="active">品牌类别关联修改</li>
                </ol>
            </section>
            <!-- 类别内容头部 /-->
            <!-- 类别正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">品牌类别关联修改</h3>
                    </div>
                    <!-- 数据表单 -->
                    <form class="form-horizontal">
                        <div class="box-body">


                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品类别名：</label>

                                <div class="col-sm-9">
                                    <select class="form-control select2" style="width: 100%;">
                                        <option selected="selected">Alabama</option>
                                        <option>Alaska</option>
                                        <option>California</option>
                                        <option>Delaware</option>
                                        <option>Tennessee</option>
                                        <option>Texas</option>
                                        <option>Washington</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品品牌名：</label>

                                <div class="col-sm-9">
                                    <select class="form-control select2" style="width: 100%;">
                                        <option selected="selected">Alabama</option>
                                        <option>Alaska</option>
                                        <option>California</option>
                                        <option>Delaware</option>
                                        <option>Tennessee</option>
                                        <option>Texas</option>
                                        <option>Washington</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_remark" placeholder="请输入备注...">
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="submit" class="btn btn-success col-sm-2" value="保存"/>
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                </div>
                <!-- /.box-body -->
            </section>
            <!-- 类别正文区域 /-->
        </div>
        <%--    产品展示    --%>
        <div>
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
                                        <button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="批量删除"><i class="fa fa-trash-o"></i> 批量删除</button>
                                        <button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="input-group input-group-sm" style="width: 200px;">
                                    <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                    <div class="input-group-btn">
                                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
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
                                    <th class="sorting_desc">产品型号</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品类别</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品品牌</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品厂家</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品产地</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品单位</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品图片</th>
                                    <th class="sorting_asc sorting_asc_disabled">产品描述</th>
                                    <th class="sorting">备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>32290336</td>
                                    <td>方向机</td>
                                    <td>世宝</td>
                                    <td>世宝</td>
                                    <td>杭州</td>
                                    <td>台</td>
                                    <td>img/001.png</td>
                                    <td>适用于XX车</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>32290336</td>
                                    <td>方向机</td>
                                    <td>世宝</td>
                                    <td>世宝</td>
                                    <td>杭州</td>
                                    <td>台</td>
                                    <td>img/001.png</td>
                                    <td>适用于XX车</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </td>
                                </tr>
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
            <!-- 产品正文区域 /-->
        </div>
        <%--    产品新增    --%>
        <div>
            <!-- 内容头部 -->
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
            <!-- 内容头部 /-->
            <!-- 正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">产品新增</h3>
                    </div>

                    <!-- 数据表单 -->
                    <form class="form-horizontal">
                        <div class="box-body">


                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品类别名：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_name" placeholder="请输入产品类别名...">
                                    <span class="help-block small msg-info">Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">产品单位：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_unit" placeholder="请输入产品单位...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                            <div class="col-sm-6 form-group">
                                <label class="col-sm-3 control-label">备注：</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="c_remark" placeholder="请输入备注...">
                                    <span class="help-block small msg-info" >Help block with success</span>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer">
                            <div class="col-sm-offset-4 col-sm-8" >
                                <input type="submit" class="btn btn-success col-sm-2" value="提交"/>
                                <input type="reset"  style="margin: 0 10px;"  class="btn btn-warning col-sm-1" value="重置"/>
                                <input type="button" class="btn btn-danger col-sm-1" value="返回"/>
                            </div>
                        </div>
                    </form>

                    <!-- 数据表单 /-->
                    <!-- /.box-body -->
                </div>
            </section>
            <!-- 产品正文区域 /-->
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
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    $(function () {
        selectAllOrNone("#brand-selall","#brand-list");
    });
    //全选全不选
    function selectAllOrNone(checkId,tabId) {
        $(checkId).click(function () {
            $(tabId+" tr td input[type='checkbox']").prop("checked",$(checkId).prop("checked"));
        });
    }
    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("admin-index");
    });
</script>
<script src="all-javascript.jsp" type="text/javascript"></script>
</body>

</html>
<!---->