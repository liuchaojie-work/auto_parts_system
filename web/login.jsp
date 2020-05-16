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
                <div id="login-error-msg" style="text-align: center;color: red"></div>
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
                        <button type="button" class="btn btn-primary btn-block btn-flat" onclick="login();">登录</button>
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
                <div class="form-group" style="text-align: center; ">
                    <span id="register-error-msg"></span>
                </div>
                <div class="form-group has-feedback" id="register-username" >
                    <input type="text" class="form-control" name="username" placeholder="用户名">
                    <span class="glyphicon glyphicon-user form-control-feedback" ></span>
                    <div></div>
                </div>
                <div class="form-group has-feedback" id="register-phone" >
                    <input type="text" class="form-control" name="phone" placeholder="手机号">
                    <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                    <div></div>
                </div>
                <div class="form-group has-feedback" id="register-email" >
                    <input type="email" class="form-control" name="email" placeholder="邮箱">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    <div></div>
                </div>
                <div class="form-group has-feedback" id="register-password" >
                    <input type="password" class="form-control" name="password" placeholder="密码">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    <div></div>
                </div>
                <div class="form-group has-feedback" id="register-repassword" >
                    <input type="password" class="form-control" name="repassword" placeholder="确认密码">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                    <div></div>
                </div>
                <div class="form-group has-feedback" id="register-checkcode" >
                    <input type="text" class="form-control" style="width: 50%; float: left" name="checkcode" placeholder="验证码">
                    <img id="checkCodeImg" style="margin: 0 10px;"  src="checkCode" onclick="changeCheckCode(this);">
                    <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                    <div></div>
                </div>

                <div class="row">
                    <div class="col-xs-8">
                        <label >
                            <input type="checkbox" id="register-checkbox"> 我同意 <a href="#">协议</a>
                            <div id="checkbox-error-msg"></div>
                        </label>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <button type="button" class="btn btn-primary btn-block btn-flat" onclick="register();">注册</button>
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
            checkLoginAccount();
        });
        $("#login-password").blur(function () {
            checkLoginPassword();
        });

        $("#register-username > input").blur(function () {
            checkRegisterUsername();
        });

        $("#register-phone > input").blur(function () {
            checkRegisterPhone();
        });

        $("#register-email > input").blur(function () {
            checkRegisterEmail();
        });

        $("#register-password > input").blur(function () {
            checkRegisterPassword();
        });

        $("#register-repassword > input").blur(function () {
            checkRegisterRePassword();
        });

        $("#register-checkcode > input").blur(function () {
            checkRegisterCheckcode();
        });

    });

    function changeCheckCode(img){
        img.src="checkCode?"+new Date().getTime();
    }

    function login() {
        if(checkLoginAccount && checkLoginPassword){
            var account = $("#login-account").val();
            var password = $("#login-password").val();
            $("#login-error-msg").html("");
            $.post("user/login",$("#loginForm").serialize(), function (data) {
                if( null == data){
                    $("#login-error-msg").html("密码错误!").css({"fontsize":"8px","color":"red"});
                }else if(null != data && "1" != data.activeStatus){
                    $("#login-error-msg").html("账号未激活!").css({"fontsize":"8px","color":"red"});
                }else{
                    location.href = "${pageContext.request.contextPath}/index.jsp";
                }
            });
        }
    }

    function register() {
        var checkbox = $("#register-checkbox").is(":checked");
        if(checkbox){
            $("#checkbox-error-msg").html("");
            var flag = checkRegisterUsername && checkRegisterPhone && checkRegisterEmail &&
                checkRegisterPassword && checkRegisterRePassword && checkRegisterCheckcode;
            if(flag){
                $.post("user/register",$("#registForm").serialize(),function (data) {
                    if(data){
                        $("#register-error-msg").html("注册成功！请登录邮箱激活！").css({"fontsize":"8px","color":"green"});
                    }
                });
            }
        }else{
            $("#checkbox-error-msg").html("请同意协议!").css({"fontsize":"8px","color":"red"});
            return;
        }
    }
    function checkLoginPassword() {
        var password = $("#login-password").val();
        if(null == password || 0 == password.length){
            $("#login-password-msg").html("密码不能为空！");
            $("#login-password-msg").css({"fontsize":"8px","color":"red"});
            return false;
        }else {
            $("#login-password-msg").html("");
            return true;
        }

    }
     function checkLoginAccount() {
         var account = $("#login-account").val();
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


     function checkRegisterUsername() {
         var username = $("#register-username > input").val();
         if(null == username || 0 == username.length){
             $("#register-username > div").html("用户名不能为空!").css({"fontsize":"8px","color":"red"});
             return false;
         }else{
             $.post("user/findByUsername",{"account":username}, function (data) {
                 if(null != data){
                     $("#register-username > div").html("用户名已存在!").css({"fontsize":"8px","color":"red"});
                     return false;
                 }else{
                     $("#register-username > div").html("");
                     return true;
                 }
             });
         }

     }

     function checkRegisterPhone() {
         var phone = $("#register-phone > input").val();
         var reg_phone = /^[0-9]{11}$/;
         if(null == phone || 0 == phone.length){
             $("#register-phone > div").html("手机号码不能为空!").css({"fontsize":"8px","color":"red"});
             return false;
         }else if(!reg_phone.test(phone)){
             $("#register-phone > div").html("手机号码必须为11位!").css({"fontsize":"8px","color":"red"});
             return false;
         }else{
             $.post("user/findByPhone",{"account":phone},function (data) {
                 if(null != data){
                     $("#register-phone > div").html("手机号码已存在!").css({"fontsize":"8px","color":"red"});
                     return false;
                 }else{
                     $("#register-phone > div").html("");
                     return true;
                 }
             });
         }
     }

     function checkRegisterEmail() {
         var email = $("#register-email > input").val();
         var reg_email = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
         if(null == email || 0 == email.length){
             $("#register-email > div").html("邮箱不能为空!").css({"fontsize":"8px","color":"red"});
             return false;
         }else if(!reg_email.test(email)){
             $("#register-email > div").html("邮箱格式错误!").css({"fontsize":"8px","color":"red"});
             return false;
         }else{
             $.post("user/findByEmail",{"account":email},function (data) {
                 if(null != data){
                     $("#register-email > div").html("邮箱已存在!").css({"fontsize":"8px","color":"red"});
                     return false;
                 }else{
                     $("#register-email > div").html("");
                     return true;
                 }
             });
         }
     }

     function checkRegisterPassword() {
         var password = $("#register-password > input").val();
         var reg_password = /^\w{6,12}$/;
         if(null == password || 0 == password.length){
             $("#register-password > div").html("密码不能为空!").css({"fontsize":"8px","color":"red"});
             return false;
         }else if(!reg_password.test(password)){
             $("#register-password > div").html("密码必须为6-12位!").css({"fontsize":"8px","color":"red"});
             return false;
         }else{
             $("#register-password > div").html("");
             return true;
         }
     }
     
     function checkRegisterRePassword() {
         var repassword = $("#register-repassword > input").val();
         var password = $("#register-password > input").val();
         var reg_repassword = /^\w{6,12}$/;
         if(null == repassword || 0 == repassword.length){
             $("#register-repassword > div").html("密码不能为空!").css({"fontsize":"8px","color":"red"});
             return false;
         }else if(!reg_repassword.test(repassword)){
             $("#register-repassword > div").html("密码必须为6-12位!").css({"fontsize":"8px","color":"red"});
             return false;
         }else if(repassword != password){
             $("#register-repassword > div").html("两次密码不相同!").css({"fontsize":"8px","color":"red"});
             return false;
         }else{
             $("#register-repassword > div").html("");
             return true;
         }
     }

     function checkRegisterCheckcode() {
         var checkcode = $("#register-checkcode > input").val();
         $.post("user/checkCode",{"checkcode":checkcode},function (data) {
            if(!data){
                $("#register-checkcode > div").html("验证码错误!").css({"fontsize":"8px","color":"red"});
                return false;
            } else{
                $("#register-checkcode > div").html("");
                return true;
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