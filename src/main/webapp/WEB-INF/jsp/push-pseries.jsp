<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/6
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>商家查看</title>

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/jquery.min2.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,200,600,800,700,500,300,100,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Arimo:400,700,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="New Fashions Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"
    />
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/jquery.min2.js"></script>
    <script src="js/simpleCart.min.js"> </script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        $(function(){

        })
        function CheckPost(){
            var val = $(":input[name='ex']").val();
            var str = /(?:xls|xlsx)$/;
            if(val!=null&&val!=""){
                if(!str.test(val)){
                    $("#exInfo").show();
                    $("#exInfo input").show();
                    $("#exInfo img").attr('src', 'images/sign_up2.png');
                    $("#exInfo input").val("导入格式有误").css("color", "#FF0000");
                    return false;
                }
            }else{
                $("#exInfo").show();
                $("#exInfo input").show();
                $("#exInfo img").attr('src', 'images/sign_up2.png');
                $("#exInfo input").val("ex表不能为空").css("color", "#FF0000");
                return false;
            }
        }
        function checkEX(v) {
            var val = v.value;
            var str = /(?:xls|xlsx)$/;
            if(val!=null&&val!=""){
            if(str.test(val)){
                $("#exInfo").hide();
                $("#exInfo input").hide();
            }else{
                $("#exInfo").show();
                $("#exInfo input").show();
                $("#exInfo img").attr('src', 'images/sign_up2.png');
                $("#exInfo input").val("导入格式有误").css("color", "#FF0000");
            }
            }
        }
    </script>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">${sessionScope.jdAdmin.name}</a>
        </div>
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="/Jd/outAdmin" class="btn btn-danger square-btn-adjust">注销</a> </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                </li>
                <li  >
                    <a   href="/Jd/update-pseries"><i class="fa fa-laptop fa-3x"></i>修改商品分类</a>
                </li>
                <li  >
                    <a  href="/Jd/add_pseries"><i class="fa fa-square-o fa-3x"></i>增加商品类别</a>
                </li>
                <li  >
                    <a class="active-menu"  href=""><i class="fa fa-sitemap fa-3x"></i> 更新商品类别</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>更新分类表</h2>
                    <hr />
                    <!--补充区域-->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <label><font size="4">例子：</font></label>
                                <img src="${pageContext.request.contextPath}/upload/example.jpg" height="300" width="800">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <form action="/Jd/push_pseriesUI" method="post" enctype="multipart/form-data" onsubmit="return CheckPost();">
                                <div class="panel-heading">
                                    导入分类表
                                </div>
                                <div class="panel-body">
                                    <div class="form-group" >
                                        <label><font size="4" color="red">注意：</font>导入之后，之前的分类表将删除</label>
                                        <br>
                                        <br>
                                        <div class="form-group">
                                            <label>请选择你要导入的<font color="red"><b>EX表</b></font>：</label>
                                            <input type="file" name="ex" onchange="checkEX(this)"/>
                                        </div>
                                    </div>
                                    <center>
                                        <center><input type="submit" value="确定" class="btn btn-info"></center>
                                    <p class="help-block" id="exInfo" style="display:none">
                                        <img src="images/sign_up1.png" width="18" height="18">
                                        <input type="text" readonly style="background:transparent;border:0;">
                                    </p>
                                    </center>
                                </div>
                                <!--框内-->
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
    </div>
</div>
        <!-- /. WRAPPER  -->
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>

</body>
</html>
