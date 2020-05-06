<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>汽配销售系统客户登录|注册界面</title>


    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- Theme style -->
    <!-- iCheck -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <![endif]-->
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <link rel="stylesheet" href="dist/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="dist/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="dist/plugins/iCheck/square/blue.css">
</head>
<body class="hold-transition " style="background-color: #d2d6de">
<%--登录--%>
<div id="login" class="login-page">
    <div class="login-box">
        <div class="login-logo">


            <a href="#"><strong>汽配</strong>销售系统</a>


        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">登录系统</p>

            <form id="loginForm">
                <div id="login-msg" style="text-align: center;color: red"></div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" id="login-account" name="account" placeholder="用户名/手机号/邮箱">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    <div id="login-account-msg" ></div>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" id="login-password" name="password" placeholder="密码">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    <div id="login-password-msg" ></div>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label><input type="checkbox"> 记住 下次自动登录</label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat" >登录</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <!-- /.social-auth-links -->

            <a href="#">忘记密码</a><span> | </span><a href="#register" onclick="goRegister();" class="text-center">新用户注册</a>
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->


</div>
<%--注册--%>
<div hidden="hidden" id="register" class="register-page">
    <div class="register-box">
        <div class="register-logo">


            <a href="#"><strong>汽配</strong>销售系统</a>


        </div>

        <div class="register-box-body">
            <p class="login-box-msg">新用户注册</p>

            <form id="registForm">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="username" placeholder="用户名">
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="phone" placeholder="手机号">
                    <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="email" class="form-control" name="email" placeholder="邮箱">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="password" placeholder="密码">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" name="repassword" placeholder="确认密码">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" style="width: 50%; float: left" name="checkcode" placeholder="验证码">
                    <img id="checkCodeImg" style="margin: 0 10px;"  src="checkCode" onclick="changeCheckCode(this);">
                </div>
                <div class="form-group" style="text-align: center; color: red;">
                    <span>ERRORINFO</span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox icheck">
                            <label>
                                <input type="checkbox"> 我同意 <a href="#">协议</a>
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat" >注册</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <a href="#login" onclick="goLogin();" class="text-center">我有账号，现在就去登录</a>
        </div>
        <!-- /.form-box -->
    </div>
    <!-- /.register-box -->

</div>
</body>
<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="dist/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        $("#login-account").blur(function () {
            var account = $("#login-account").val();
            checkLoginAccount(account);
        });
        $("#login-password").blur(function () {
            var password = $("#login-password").val();
            var flag = checkLoginPassword(password);
        });


    });

    function changeCheckCode(img){
        img.src="checkCode?"+new Date().getTime();
    }
    $("#loginForm").onsubmit = function () {
        var account = $("#login-account").val();
        var password = $("#login-password").val();
        if(checkLoginAccount(account) && checkLoginPassword(password)){
            $.post("user/findByThreeCondition",{"account":account}, function (data) {
                if(data && data.password === password){
                    $("#login-msg").html("登录成功!");
                }else{
                    $("#login-msg").html("密码错误！");
                }
            });
        }
    }

    function checkLoginPassword(password) {
        if(null == password && 0 === password.length){
            $("#login-password-msg").html("密码不能为空！");
            $("#login-password-msg").css({"fontsize":"8px","color":"red"});
            return false;
        }else {
            $("#login-password-msg").html("");
            return true;
        }

    }
     function checkLoginAccount(account) {
         $.post("user/findByThreeCondition",{"account":account}, function (data) {
             if(data){
                 $("#login-account-msg").html("");
                 return true;
             }else{
                 $("#login-account-msg").html("该用户不存在！");
                 $("#login-account-msg").css({"fontsize":"8px","color":"red"});
                 return false;
             }
         });
     }

     function goRegister(){
        $("#login").attr("hidden","hidden");
        $("#register").removeAttr("hidden");
    }
    function goLogin(){
        $("#login").removeAttr("hidden");
        $("#register").attr("hidden","hidden");
    }
</script>
</html>