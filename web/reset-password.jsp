<%--
  Created by IntelliJ IDEA.
  User: L1471
  Date: 2020/5/17
  Time: 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>XX汽配系统重置密码</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
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
<body>
<div style="text-align: center">
    <h1>重置密码</h1>
    <form id="resetPasswordForm" class="form-horizontal">
        <div class="box-body">
            <div class="form-group" style="text-align: center; ">
                <span id="resetPassword-msg"></span>
            </div>
            <input type="hidden" class="form-control" name="account" value="${email}">
            <div class="col-sm-10 form-group ">
                <label class="col-sm-4 control-label">邮件：</label>
                <div class="col-sm-8" id="email">
                    <input type="text" class="form-control" disabled value="${email}" placeholder="请输入邮件...">
                    <span class="help-block small msg-info"></span>
                </div>
            </div>

            <div class="col-sm-10 form-group ">
                <label class="col-sm-4 control-label">新密码：</label>
                <div class="col-sm-8" id="newPassword">
                    <input type="password" class="form-control" name="password" placeholder="请输入新密码...">
                    <span class="help-block small msg-info" ></span>
                </div>
            </div>

            <div class="col-sm-10 form-group">
                <label class="col-sm-4 control-label">确认密码：</label>
                <div class="col-sm-8" id="newRePassword">
                    <input type="password" class="form-control" placeholder="请再次输入新密码...">
                    <span class="help-block small msg-info" ></span>
                </div>
            </div>

            <div class="col-sm-10 form-group">
                <div class="col-sm-offset-6 col-sm-2" >
                    <input type="button" class="btn btn-info" onclick="inputNewPassword();" value="提交">
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script src="dist/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="dist/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $("#newPassword > input").blur(function () {
            checkPassword();
        });

        $("#newRePassword > input").blur(function () {
            checkRePassword();
        });
    })

    function inputNewPassword() {
        if(checkPassword() && checkRePassword()){
            $.post("user/changePassword",$("#resetPasswordForm").serialize(), function (data) {
               if(data){
                   $("#resetPassword-msg").html("密码重置成功!").css({"fontsize":"8px","color":"green"}).append("去 <a href='http://localhost:8080/auto_parts_system/login.jsp'  target='_blank'>登录</a>");
               } else{
                   $("#resetPassword-msg").html("密码重置失败!").css({"fontsize":"8px","color":"red"});
               }
            });
        }
    }

    function checkPassword() {
        var password = $("#newPassword > input").val();
        var reg_password = /^\w{6,12}$/;
        if(null == password || 0 == password.length){
            $("#newPassword > span").html("密码不能为空!").css({"fontsize":"8px","color":"red"});
            return false;
        }else if(!reg_password.test(password)){
            $("#newPassword > span").html("密码必须为6-12位!").css({"fontsize":"8px","color":"red"});
            return false;
        }else{
            $("#newPassword > span").html("");
            return true;
        }
    }

    function checkRePassword() {
        var repassword = $("#newRePassword > input").val();
        var password = $("#newRePassword > input").val();
        var reg_repassword = /^\w{6,12}$/;
        if(null == repassword || 0 == repassword.length){
            $("#newRePassword > span").html("密码不能为空!").css({"fontsize":"8px","color":"red"});
            return false;
        }else if(!reg_repassword.test(repassword)){
            $("#newRePassword > span").html("密码必须为6-12位!").css({"fontsize":"8px","color":"red"});
            return false;
        }else if(repassword != password){
            $("#newRePassword > span").html("两次密码不相同!").css({"fontsize":"8px","color":"red"});
            return false;
        }else{
            $("#newRePassword > span").html("");
            return true;
        }
    }
</script>

</html>
