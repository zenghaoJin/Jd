<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>忘记密码</title>
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
            var val1 = $(":input[name='pass']").val();
            var val2 = $(":input[name='rep_pass']").val();
            var str1 =/^[A-Za-z0-9]{6}$/;
            if(!str1.test(val1)){
                $("#passInfo").show();
                $("#passInfo img").attr('src','images/sign_up2.png');
                $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                return false;
            }
            if(val1!=val2){
                $("#rep_passInfo").show();
                $("#rep_passInfo input").show();
                $("#rep_passInfo img").attr('src','images/sign_up2.png');
                $("#rep_passInfo input").val("两次输入的密码不一致").css("color","#FF0000");
                return false;
            }
        }
        $(function(){
            $(":input[name='pass']").blur(function(){
                var val2 = $(":input[name='rep_pass']").val();
                val2 = $.trim(val2);
                var val = $(this).val();
                val = $.trim(val);
                var str =/^[A-Za-z0-9]{6}$/;
                if(str.test(val)){
                    $("#passInfo input").hide();
                    $("#passInfo img").attr('src','images/sign_up3.png');
                }else{
                    $("#passInfo img").attr('src','images/sign_up2.png');
                    $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                }
                if(val2!=null&&val2.length!=0){
                if(val2==val){
                    $("#rep_passInfo input").hide();
                    $("#rep_passInfo img").attr('src','images/sign_up3.png');
                }else{
                    $("#rep_passInfo input").show();
                    $("#rep_passInfo img").attr('src','images/sign_up2.png');
                    $("#rep_passInfo input").val("两次输入的密码不一致").css("color","#FF0000");
                }}
            }).focus(function(){
                $("#passInfo").show();
                $("#passInfo input").show();
                $("#passInfo img").attr('src','images/sign_up1.png');
                $("#passInfo input").val("请输入6位数的密码").css("color","#8d8a8a");
            })
            $(":input[name='rep_pass']").blur(function(){
                var val2 = $(this).val();
                val2 = $.trim(val2);
                var val3 = $(":input[name='pass']").val();
                val3 = $.trim(val3);
                if(val3==null||val3.length==0){
                    $("#rep_passInfo").hide();
                }else{
                if(val2==val3){
                    $("#rep_passInfo input").hide();
                    $("#rep_passInfo img").attr('src','images/sign_up3.png');
                }else{
                    $("#rep_passInfo img").attr('src','images/sign_up2.png');
                    $("#rep_passInfo input").val("两次输入的密码不一致").css("color","#FF0000");
                }}
            }).focus(function(){
                $("#rep_passInfo").show();
                $("#rep_passInfo input").show();
                $("#rep_passInfo img").attr('src','images/sign_up1.png');
                $("#rep_passInfo input").val("确认密码").css("color","#8d8a8a");
            })
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
            <form action="forgetPassUI" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" onsubmit="return CheckPost();">
                <h2><font size="6px"><B>修改密码</B></font></h2>
                <c:if test="${message!=null}">
                    <div class="form-group">
                        <div class="alert alert-success" role="alert" >
                            <c:forEach items="${message}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach> </div>
                    </div>
                </c:if>
                账号名：<font size="5" color="#cc0000">${name}</font>
                <br/><br/>
                <div class="form-group">
                    <input type="hidden" name="name" value="${name}">
                    <input type="password" class="form-control" id="pass" name="pass" placeholder="密码" autocomplete="off">
                    <div id="passInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="rep_pass" name="rep_pass" placeholder="确认密码" autocomplete="off">
                    <div id="rep_passInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
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