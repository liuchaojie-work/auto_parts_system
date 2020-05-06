<%--
  Created by IntelliJ IDEA.
  User: L1471
  Date: 2020/4/27
  Time: 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 页面头部 -->
    <header class="main-header">

        <!-- Logo -->
        <a href="index.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><strong>汽配</strong></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><strong>汽配</strong>后台管理</span>
        </a>


        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="./dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">liuchaojie</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="./dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    张猿猿 - 数据管理员
                                    <small>最后登录 11:20AM</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">退出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="./dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>liuchaojie</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>


            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">菜单</li>

                <li id="admin-index">
                    <a href="index.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>

                <!-- 菜单 -->
                <!--    产品管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>产品管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="brand">
                            <a href="brand-manage.jsp?#showAllBrand" onclick="findAllBrand();">
                                <i class="fa fa-circle-o"></i> 品牌
                            </a>
                        </li>

                        <li id="category">
                            <a href="category-manage.jsp?#showAllCategory" onclick="findAllCategory();">
                                <i class="fa fa-circle-o"></i> 类别
                            </a>
                        </li>

                        <li id="category-brand">
                            <a href="category-brand-manage.jsp?#showAllCategoryBrand" onclick="findAllCategoryBrand();">
                                <i class="fa fa-circle-o"></i> 品牌和类别关联
                            </a>
                        </li>

                        <li id="product">
                            <a href="product-manage.jsp?#showAllProduct" onclick="findAllProduct();">
                                <i class="fa fa-circle-o"></i> 产品
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    产品管理结束    -->

                <!--    销售管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>销售管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="payment">
                            <a href="payment-manage.jsp#showAllPayment">
                                <i class="fa fa-circle-o"></i> 支付方式
                            </a>
                        </li>

                        <li id="pro-sell">
                            <a href="sale-manage.jsp">
                                <i class="fa fa-circle-o"></i> 销售
                            </a>
                        </li>

                        <li id="sell">
                            <a href="sale-manage.jsp">
                                <i class="fa fa-circle-o"></i> 销售表单
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    销售管理结束    -->

                <!--    进货管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>进货管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="location">
                            <a href="location-manage.jsp#showAllLocation">
                                <i class="fa fa-circle-o"></i> 库位
                            </a>
                        </li>

                        <li id="client-price">
                            <a href="purchase-manage.jsp">
                                <i class="fa fa-circle-o"></i> 部分客户价格表
                            </a>
                        </li>

                        <li id="purchase">
                            <a href="purchase-manage.jsp">
                                <i class="fa fa-circle-o"></i> 进货
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    进货管理结束    -->

                <!--    库存管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>库存管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="inventory">
                            <a href="inventory-manage.jsp">
                                <i class="fa fa-circle-o"></i> 库存
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    对账管理结束    -->

                <!--    对账管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>对账管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="pay-list">
                            <a href="reconciliation-manage.jsp">
                                <i class="fa fa-circle-o"></i> 付款记录
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    对账管理结束    -->

                <!--    购物车管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>购物车管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="cart">
                            <a href="cart-manage.jsp">
                                <i class="fa fa-circle-o"></i> 预订单
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    购物车管理结束    -->

                <!--    用户管理开始    -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>用户管理</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="logistics">
                            <a href="logistics-manage.jsp?#showAllLogistics">
                                <i class="fa fa-circle-o"></i> 物流
                            </a>
                        </li>

                        <li id="user">
                            <a href="account-manage.jsp">
                                <i class="fa fa-circle-o"></i> 账号
                            </a>
                        </li>

                        <li id="customer">
                            <a href="user-manage.jsp">
                                <i class="fa fa-circle-o"></i> 客户
                            </a>
                        </li>

                        <li id="admin">
                            <a href="user-manage.jsp">
                                <i class="fa fa-circle-o"></i> 管理员
                            </a>
                        </li>

                        <li id="login-info">
                            <a href="user-manage.jsp">
                                <i class="fa fa-circle-o"></i> 登录信息记录
                            </a>
                        </li>

                    </ul>
                </li>
                <!--    用户管理结束    -->
                <!-- 菜单 /-->

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->
