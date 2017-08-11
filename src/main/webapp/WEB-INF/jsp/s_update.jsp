<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/1
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>商家个人信息修改</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        function CheckPost(){
            var val = $(":input[name='name']").val();
            var val2 = $(":input[name='pass']").val();
            var val3 = $(":input[name='repass']").val();
            if(!(0<val.length&&val.length<=6)){
                $("#nameInfo").show();
                $("#nameInfo input").show();
                $("#nameInfo img").attr('src','images/sign_up2.png');
                $("#nameInfo input").val("名字格式有误").css("color","#FF0000");
                $(":input[name='name']").focus();
                return false;
            }
            if(val2.length!=6){
                $("#passInfo").show();
                $("#passInfo input").show();
                $("#passInfo img").attr('src','images/sign_up2.png');
                $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                $(":input[name='pass']").focus();
                return false;
            }
            if(val2!=val3){
                $("#repassInfo").show();
                $("#repassInfo input").show();
                $("#repassInfo img").attr('src','images/sign_up2.png');
                $("#repassInfo input").val("两次密码输入不一致").css("color","#FF0000");
                $(":input[name='repass']").focus();
                return false;
            }
        }
        $(function(){
            $(":input[name='name']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<val.length&&val.length<=6){
                    $("#nameInfo img").attr('src','images/sign_up3.png');
                    $("#nameInfo input").hide();
                }else{
                    $("#nameInfo img").attr('src','images/sign_up2.png');
                    $("#nameInfo input").val("名字格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#nameInfo").show();
                $("#nameInfo input").show();
                $("#nameInfo img").attr('src','images/sign_up1.png');
                $("#nameInfo input").val("名字长度小于6位").css("color","#8d8a8a");
            })
            $(":input[name='pass']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                var val2 = $(":input[name='repass']").val();
                val2 = $.trim(val2);
                if(val.length==0){
                    $("#passInfo").hide();
                    $("#passInfo input").hide();
                    $("#repassInfo").hide();
                    $("#repassInfo input").hide();
                }else{
                if(val.length==6){
                    $("#passInfo img").attr('src','images/sign_up3.png');
                    $("#passInfo input").hide();
                }else{
                    $("#passInfo img").attr('src','images/sign_up2.png');
                    $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                }
                if(val2!=val&&val2.length!=0){
                    $("#repassInfo").show();
                    $("#repassInfo input").show();
                    $("#repassInfo img").attr('src','images/sign_up2.png');
                    $("#repassInfo input").val("两次密码输入不一致").css("color","#FF0000");
                }
                }
            }).focus(function(){
                $("#passInfo").show();
                $("#passInfo input").show();
                $("#passInfo img").attr('src','images/sign_up1.png');
                $("#passInfo input").val("密码长度为6位").css("color","#8d8a8a");
            })
            $(":input[name='repass']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                var val2 = $(":input[name='pass']").val();
                val2 = $.trim(val2);
                    if(val2!=val){
                        $("#repassInfo").show();
                        $("#repassInfo input").show();
                        $("#repassInfo img").attr('src','images/sign_up2.png');
                        $("#repassInfo input").val("两次密码输入不一致").css("color","#FF0000");
                    }else{
                        $("#repassInfo img").attr('src','images/sign_up3.png');
                        $("#repassInfo input").hide();
                    }
            }).focus(function(){
                $("#repassInfo").show();
                $("#repassInfo input").show();
                $("#repassInfo img").attr('src','images/sign_up1.png');
                $("#repassInfo input").val("请再次输入密码").css("color","#8d8a8a");
            })
        })
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
            <a class="navbar-brand" href="index.html">${sessionScope.jdStores.name}</a>
        </div>
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="/Jd/out" class="btn btn-danger square-btn-adjust">注销</a> </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                </li>
                <li  >
                    <a  href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-table fa-3x"></i>信息回复</a>
                </li>
                <li  >
                    <a  href="/Jd/s_table?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-table fa-3x"></i>订单明细</a>
                </li>
                <li  >
                    <a  href="/Jd/s_select?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-edit fa-3x"></i> 查看自己的商品 </a>
                </li>
                <li  >
                    <a class="active-menu"  href="/Jd/s_update"><i class="fa fa-laptop fa-3x"></i>个人信息</a>
                </li>
                <li  >
                    <a   href="/Jd/addProd"><i class="fa fa-square-o fa-3x"></i> 增加商品页面</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>个人信息</h2>
                    <hr />
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Form Elements -->
                            <form action="/Jd/s_updateUI" onsubmit="return CheckPost();">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    修改个人信息
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>账号：</label>
                                                <input class="form-control" value="${sessionScope.jdStores.pname}" readonly/>
                                            </div>
                                            <div class="form-group">
                                                <label>名字：</label>
                                                <input class="form-control" name="name" value="${sessionScope.jdStores.name}"/>
                                            </div>
                                            <p class="help-block" id="nameInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                            <div class="form-group">
                                                <label>密码：</label>
                                                <input type="password" class="form-control" name="pass" />
                                            </div>
                                            <p class="help-block" id="passInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                            <div class="form-group">
                                                <label>确定密码：</label>
                                                <input type="password" class="form-control" name="repass"/>
                                            </div>
                                            <p class="help-block" id="repassInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                        </div>
                                    </div>
                                    <input type="hidden" name="stoid" value="${sessionScope.jdStores.stoid}">
                                    <input type="hidden" name="pname" value="${sessionScope.jdStores.pname}">
                                    <center>
                                        <input  type="submit" class="btn btn-info btn-lg" value="确定" />
                                    </center>
                                </div>
                            </div>
                            </form>
                            <center>
                                <c:if test="${message!=null}">
                                    <c:forEach items="${message}" var="error">
                                        <img src="images/sign_up2.png" width="18" height="18">
                                        <input type="text" readonly style="background:transparent;border:0;color:'#FF0000';" value="${error.defaultMessage}"><br>
                                    </c:forEach>
                                </c:if>
                            </center>
                        </div>
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
