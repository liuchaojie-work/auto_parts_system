<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>(单独)汽配销售系统用户管理页面</title>
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
        <!--  物流      -->
        <div>
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    发货物流展示
                    <small>物流列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 用户管理</a></li>
                    <li><a href="#">物流</a></li>
                    <li class="active">物流列表</li>
                </ol>
            </section>
            <!-- 内容头部 /-->
            <!-- 正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">发货物流列表</h3>
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
                            <table id="logistics-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="logistics-selall" type="checkbox">
                                    </th>
                                    <th class="sorting_asc">#</th>
                                    <th class="sorting_desc">物流名</th>
                                    <th class="sorting_asc sorting_asc_disabled">物流电话</th>
                                    <th class="sorting_asc sorting_asc_disabled">物流地址</th>
                                    <th class="sorting">备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>恒邦</td>
                                    <td>15113651212</td>
                                    <td>星沙</td>
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
            <!-- 支付方式正文区域 /-->
        </div>
        <!-- 账号信息表 -->
        <div>
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>用户管理<small>账号信息表</small></h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 用户管理 </a></li>
                    <li><a href="#"> 账号 </a></li>
                    <li class="active"> 账号信息表 </li>
                </ol>
            </section>
            <!-- 产品销售内容头部 /-->
            <!-- 产品销售正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">账号信息表</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
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
                            <table id="user-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="user-selall" type="checkbox">
                                    </th>
                                    <th>#</th>
                                    <th>用户ID</th>
                                    <th>用户名</th>
                                    <th>手机号码</th>
                                    <th>邮箱</th>
                                    <th>激活码</th>
                                    <th>激活状态</th>
                                    <th>注册时间</th>
                                    <th>备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>id</td>
                                    <td>liu</td>
                                    <td>刘</td>
                                    <td>13403254521</td>
                                    <td>123454@qq.com</td>
                                    <td>852451</td>
                                    <td>1</td>
                                    <td>2020年04月28日 hh:mm:ss</td>
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
            <!-- 产品销售正文区域 /-->
        </div>
        <!--  客户信息表      -->
        <div>
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    客户
                    <small>客户信息表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 用户管理</a></li>
                    <li><a href="#">客户</a></li>
                    <li class="active">客户信息表</li>
                </ol>
            </section>
            <!-- 内容头部 /-->
            <!-- 正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">客户信息表</h3>
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
                            <table id="pro-sell-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="category-selall" type="checkbox">
                                    </th>
                                    <th>#</th>
                                    <th>客户ID</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>地址</th>
                                    <th>收货地址</th>
                                    <th>发货物流</th>
                                    <th>头像</th>
                                    <th>备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>id</td>
                                    <td>李四</td>
                                    <td>男</td>
                                    <td>湖南</td>
                                    <td>湖南邵阳</td>
                                    <td>恒邦</td>
                                    <td>img</td>
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
            <!-- 正文区域 /-->
        </div>
        <!-- 管理员信息表 -->
        <div>
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    管理员
                    <small>管理员信息表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 用户管理</a></li>
                    <li><a href="#">管理员</a></li>
                    <li class="active">管理员信息表</li>
                </ol>
            </section>
            <!-- 内容头部 /-->
            <!-- 正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">管理员信息表</h3>
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
                            <table id="admin-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="admin-selall" type="checkbox">
                                    </th>
                                    <th>#</th>
                                    <th>管理员ID</th>
                                    <th>用户名</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>级别</th>
                                    <th>手机号</th>
                                    <th>注册时间</th>
                                    <th>头像</th>
                                    <th>备注</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>id</td>
                                    <td>liuchaojie</td>
                                    <td>刘超杰</td>
                                    <td>男</td>
                                    <td>0</td>
                                    <td>15116340325</td>
                                    <td>20200428</td>
                                    <td>img</td>
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
        <!-- 登录信息记录 -->
        <div>
            <!-- 登录信息记录内容头部 -->
            <section class="content-header">
                <h1>
                    访问记录
                    <small>登录信息列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-folder"></i> 用户管理</a></li>
                    <li><a href="#">访问记录</a></li>
                    <li class="active">登录信息列表</li>
                </ol>
            </section>
            <!-- 内容头部 /-->
            <!-- 正文区域 -->
            <section class="content row">
                <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">访问记录</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
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
                            <table id="login-info-list" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="login-info-selall" type="checkbox">
                                    </th>
                                    <th>#</th>
                                    <th>登录时间</th>
                                    <th>用户ID</th>
                                    <th>用户名</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>电话</th>
                                    <th>邮箱</th>
                                    <th>地址</th>
                                    <th>备注</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td><input name="ids" type="checkbox"></td>
                                    <td>1</td>
                                    <td>2020年04月28日 hh:mm:ss</td>
                                    <td>U20200428001</td>
                                    <td>liuchaojie</td>
                                    <td>刘超杰</td>
                                    <td>男</td>
                                    <td>151164340325</td>
                                    <td>1471806481@qq.com</td>
                                    <td>河南</td>
                                    <td></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-info btn-xs">查看</button>
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
            <!-- 正文区域 /-->
        </div>
    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->
    <!-- /.col -->
<jsp:include page="footer.jsp"></jsp:include>
</div>
<!-- 内容区域 /-->



<script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
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

        // 全选操作
        $("#brand-selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#brand-list td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#brand-list td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });


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
</body>

</html>
<!---->