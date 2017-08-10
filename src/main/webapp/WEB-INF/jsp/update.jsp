<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />




    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function CheckPost (){
            var val1 = $(":input[name='name']").val();
            var val3 = $(":input[name='pass']").val();
            var str1 = new RegExp("([\u4e00-\u9fa5]{4,7})|([A-Za-z0-9 ]{4,7})");
            var str2 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            var str3 =/^[A-Za-z0-9]{6}$/;
            var str4 =/^1[34578]\d{9}$/;
            if(str1.test(val1)){
                if(val1!=${sessionScope.JdUser.name}){
                var url = "${pageContext.request.contextPath}/checkUname";
                var args = {"name":val1,"time":new Date()};
                $.getJSON(url,args,function (date) {
                    if(date.message=="0"){
                        $("#nameInfo").show();
                        $("#nameInfo img").attr('src','images/sign_up2.png');
                        $("#nameInfo input").val("用户名已经被使用").css("color","#FF0000");
                    }
                })
                if($("#nameInfo input").val()=="用户名已经被使用"){
                    return false;
                }
                }
            }else{
                $("#nameInfo").show();
                $("#nameInfo img").attr('src','images/sign_up2.png');
                $("#nameInfo input").val("用户名格式有误").css("color","#FF0000");
                return false;
            }
            if(!str3.test(val3)){
                $("#passInfo").show();
                $("#passInfo img").attr('src','images/sign_up2.png');
                $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                return false;
            }

        }
        $(function(){
            $(":input[name='name']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                var str = new RegExp("([\u4e00-\u9fa5]{4,7})|([A-Za-z0-9 ]{4,7})");
                if(str.test(val)){
                    var url = "${pageContext.request.contextPath}/checkUname";
                    var args = {"name":val,"time":new Date()};
                    $.getJSON(url,args,function (date) {
                        if(date.message=="0"){
                            $("#nameInfo img").attr('src','images/sign_up2.png');
                            $("#nameInfo input").val("用户名已经被使用").css("color","#FF0000");
                        }else{
                            $("#nameInfo img").attr('src','images/sign_up3.png');
                            $("#nameInfo input").val("用户名可以使用").css("color","#1db31d");
                        }
                    })
                }else{
                    $("#nameInfo").show();
                    $("#nameInfo img").attr('src','images/sign_up2.png');
                    $("#nameInfo input").val("用户名格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#nameInfo").show();
                $("#nameInfo img").attr('src','images/sign_up1.png');
                $("#nameInfo input").val("用户名为4-7位中文或字母和数字").css("color","#8d8a8a");
            });
            $(":input[name='pass']").blur(function(){
                var val3 = $(this).val();
                val3 = $.trim(val3);
                var str3 =/^[A-Za-z0-9]{6}$/;
                if(str3.test(val3)){
                    $("#passInfo input").hide();
                    $("#passInfo img").attr('src','images/sign_up3.png');
                }else{
                    $("#passInfo img").attr('src','images/sign_up2.png');
                    $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#passInfo").show();
                $("#passInfo input").show();
                $("#passInfo img").attr('src','images/sign_up1.png');
                $("#passInfo input").val("请输入6位数的密码").css("color","#8d8a8a");
            });
        })
    </script>
</head>
<body class="style-2">

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <br>
            <a href=""><img src="images/1.jpg" width="200px" height="100px"></a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">


            <!-- Start Sign In Form -->
            <form action="/Jd/updateUI" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" onsubmit="return CheckPost();">
                <h2><font size="6px" ><B>修改个人信息</B></font></h2>
                <c:if test="${message!=null}">
                    <div class="form-group">
                        <div class="alert alert-success" role="alert" >
                            <c:forEach items="${message}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach> </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="name" class="sr-only">Name</label>
                    <input type="hidden" name="uid" value="${sessionScope.JdUser.uid}">
                    <input type="text" class="form-control" id="name" name="name"placeholder="账号名" autocomplete="off" value="${sessionScope.JdUser.name}">
                    <div id="nameInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email"readonly="readonly" class="form-control" id="email" name="email"placeholder="邮箱" autocomplete="off" value="邮箱：${sessionScope.JdUser.email}">
                    <div id="emailInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="password" name="pass"placeholder="密码" autocomplete="off" value="${jdUser.pass}">
                    <div id="passInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="width:250px;background:transparent;border:0;" >
                    </div>
                </div>
                <div class="form-group">
                    <input type="text"readonly="readonly" class="form-control" id="phonenumber" name="phonenumber"placeholder="手机号码" autocomplete="off" value="电话号码：${sessionScope.JdUser.phonenumber}">
                    <div id="phoneInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>


                <div class="form-group">
                    <p>余额不足？ <a href="/Jd/money"><font color="red">充值</font></a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="确定" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign In Form -->


        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;">
        <div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></small></p></div>
    </div>
</div>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="js/main.js"></script>

</body>
</html>