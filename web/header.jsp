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
                        <c:choose>
                            <c:when test="${empty user}">
                                <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                            </c:when>
                            <c:when test="${not empty user}">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <%-- 图片地址 img --%>
                                    <img src="./dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">${user.username}</span>
                                </a>
                            </c:when>
                        </c:choose>

                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="./dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>

                                    ${user.name} --
                                        <c:if test="${0 eq user.iden}"> 客户</c:if>
                                        <c:if test="${1 eq user.iden}"> 管理员</c:if>
                                        <c:if test="${999 eq user.iden}"> 超级管理员</c:if>
                                    <small>最后登录 11:20AM</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#changePassword">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat" onclick="$.get('user/exit',{},function() {
                                      
                                    });">退出</a>
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
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${user.username}</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                        </div>
                    </div>
                </c:when>
            </c:choose>

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
                            <a href="clientPrice-manage.jsp">
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
                            <a href="admin-manage.jsp">
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
    <div id="changePassword" class="modal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>

                <div class="modal-body">
                    <form id="changePasswordForm" class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group" style="text-align: center; ">
                                <span id="changePassword-msg"></span>
                            </div>
                            <input type="hidden" class="form-control" name="account" value="${user.username}">
                            <div class="col-sm-10 form-group">
                                <label class="col-sm-4 control-label">旧密码：</label>
                                <div class="col-sm-8"  id="oldpassword" >
                                    <input type="password" class="form-control" placeholder="请输入旧密码...">
                                    <span class="help-block small msg-info"></span>
                                </div>
                            </div>
                            <div class="col-sm-10 form-group">
                                <label class="col-sm-4 control-label">新密码：</label>
                                <div class="col-sm-8"  id="password" >
                                    <input type="password" class="form-control" name="password" placeholder="请输入新密码...">
                                    <span class="help-block small msg-info"></span>
                                </div>
                            </div>
                            <div class="col-sm-10 form-group">
                                <label class="col-sm-4 control-label">确认密码：</label>
                                <div class="col-sm-8"  id="repassword" >
                                    <input type="password" class="form-control" placeholder="请再次输入新密码...">
                                    <span class="help-block small msg-info"></span>
                                </div>
                            </div>
                            <div class="col-sm-10 form-group">
                                <div class="col-sm-offset-6 col-sm-2" >
                                    <input type="button" class="btn btn-info" onclick="changePassword();" value="保存">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

<script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script>
    $(function () {
        $("#password > input").blur(function () {
            checkPassword();
        });

        $("#repassword > input").blur(function () {
            checkRePassword();
        });

        $("#oldpassword > input").blur(function () {
            checkOldPassword();
        });
    });

    function checkOldPassword() {
        var oldpassword = $("#oldpassword > input").val();
        $.post("user/findByUsername",{"account":"${user.username}"},function (data) {
           if(data.password == oldpassword){
               $("#oldpassword > span").html("");
               return true;
           }else {
               $("#oldpassword > span").html("旧密码错误！").css({"fontsize":"8px","color":"red"});
               return false;
           }
        });
    }
    function checkPassword() {
        var password = $("#password > input").val();
        var reg_password = /^\w{6,12}$/;
        if(null == password || 0 == password.length){
            $("#password > span").html("密码不能为空!").css({"fontsize":"8px","color":"red"});
            return false;
        }else if(!reg_password.test(password)){
            $("#password > span").html("密码必须为6-12位!").css({"fontsize":"8px","color":"red"});
            return false;
        }else{
            $("#password > span").html("");
            return true;
        }
    }

    function checkRePassword() {
        var repassword = $("#repassword > input").val();
        var password = $("#password > input").val();
        var reg_repassword = /^\w{6,12}$/;
        if(null == repassword || 0 == repassword.length){
            $("#repassword > span").html("密码不能为空!").css({"fontsize":"8px","color":"red"});
            return false;
        }else if(!reg_repassword.test(repassword)){
            $("#repassword > span").html("密码必须为6-12位!").css({"fontsize":"8px","color":"red"});
            return false;
        }else if(repassword != password){
            $("#repassword > span").html("两次密码不相同!").css({"fontsize":"8px","color":"red"});
            return false;
        }else{
            $("#repassword > span").html("");
            return true;
        }
    }

    function changePassword() {
        if(checkOldPassword && checkPassword && checkRePassword){
            $.post("user/changePassword",$("#changePasswordForm").serialize(), function (data) {
               if(data){
                   $("#changePassword-msg").html("修改成功!").css({"fontsize":"8px","color":"green"});
               } else{
                   $("#changePassword-msg").html("修改失败!").css({"fontsize":"8px","color":"red"});
               }
            });
        }
    }
</script>