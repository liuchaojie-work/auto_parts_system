<%--
  Created by IntelliJ IDEA.
  User: L1471
  Date: 2020/4/27
  Time: 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <!-- 页面meta -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>(单独)汽配销售系统后台首页</title>
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

    <!-- 内容头部 -->
    <section class="content-header">
      <h1>
        主要产品展示
        <small>数据列表</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="#">主要产品展示</a></li>
        <li class="active">数据列表</li>
      </ol>
    </section>
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content row">
      <div class="col-md-6">
        <div class="box box-solid">
          <div class="box-header with-border">
            <h3 class="box-title">方向机</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="steering" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
              </ol>
              <div class="carousel-inner">
                <div class="item active">
                  <img src="http://placehold.it/900x500/39CCCC/ffffff&text=I+Love+Bootstrap" alt="First slide">

                  <div class="carousel-caption">
                    First Slide
                  </div>
                </div>
                <div class="item">
                  <img src="http://placehold.it/900x500/3c8dbc/ffffff&text=I+Love+Bootstrap" alt="Second slide">

                  <div class="carousel-caption">
                    Second Slide
                  </div>
                </div>
                <div class="item">
                  <img src="http://placehold.it/900x500/f39c12/ffffff&text=I+Love+Bootstrap" alt="Third slide">

                  <div class="carousel-caption">
                    Third Slide
                  </div>
                </div>
              </div>
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="fa fa-angle-left"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="fa fa-angle-right"></span>
              </a>
            </div>
          </div>
          <!-- /.box-body -->
        </div>
      </div>
      <!-- /.box -->
      <div class="col-md-6">
        <div class="box box-solid">
          <div class="box-header with-border">
            <h3 class="box-title">助力泵</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="booster-pump" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
              </ol>
              <div class="carousel-inner">
                <div class="item active">
                  <img src="http://placehold.it/900x500/39CCCC/ffffff&text=I+Love+Bootstrap" alt="First slide">

                  <div class="carousel-caption">
                    First Slide
                  </div>
                </div>
                <div class="item">
                  <img src="http://placehold.it/900x500/3c8dbc/ffffff&text=I+Love+Bootstrap" alt="Second slide">

                  <div class="carousel-caption">
                    Second Slide
                  </div>
                </div>
                <div class="item">
                  <img src="http://placehold.it/900x500/f39c12/ffffff&text=I+Love+Bootstrap" alt="Third slide">

                  <div class="carousel-caption">
                    Third Slide
                  </div>
                </div>
              </div>
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="fa fa-angle-left"></span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                <span class="fa fa-angle-right"></span>
              </a>
            </div>
          </div>
          <!-- /.box-body -->
        </div>
      </div>
    </section>
    <!-- 正文区域 /-->
    <!-- 内容头部 -->
    <section class="content-header">
      <h1>
        更多产品展示
        <small>数据列表</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="#">更多产品展示</a></li>
        <li class="active">数据列表</li>
      </ol>
    </section>
    <!-- 内容头部 /-->
    <!-- 正文区域 -->
    <section class="content row">
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
      <div class="col-md-6">
        <div class="attachment-block clearfix">
          <img class="attachment-img" src="dist/img/photo1.png" alt="Attachment Image">

          <div class="attachment-pushed">
            <h4 class="attachment-heading"><a href="http://www.lipsum.com/">Lorem ipsum text generator</a></h4>

            <div class="attachment-text">
              Description about the attachment can be placed here. Lorem Ipsum is simply dummy text of the printing and typesetting industry... <a href="#">more</a>
            </div>
            <!-- /.attachment-text -->
          </div>
          <!-- /.attachment-pushed -->
        </div>
      </div>
    </section>
    <!-- 正文区域 /-->
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
