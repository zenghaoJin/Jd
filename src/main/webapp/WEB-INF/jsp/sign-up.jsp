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
            var val2 = $(":input[name='email']").val();
            var val3 = $(":input[name='pass']").val();
            var val4 = $(":input[name='phonenumber']").val();
            var val5 = $(":input[name='pnum']").val();
            var val6 = $(":input[name='acticode']").val();
            var str1 = new RegExp("([\u4e00-\u9fa5]{4,7})|([A-Za-z0-9 ]{4,7})");
            var str2 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            var str3 =/^[A-Za-z0-9]{6}$/;
            var str4 =/^1[34578]\d{9}$/;
            if(str1.test(val1)){
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
            }else{
                $("#nameInfo").show();
                $("#nameInfo img").attr('src','images/sign_up2.png');
                $("#nameInfo input").val("用户名格式有误").css("color","#FF0000");
                return false;
            }
            if(str2.test(val2)){
                var url = "${pageContext.request.contextPath}/checkUname";
                var args = {"email":val2,"time":new Date()};
                $.getJSON(url,args,function (date) {
                    if(date.message=="0"){
                        $("#emailInfo").show();
                        $("#emailInfo img").attr('src','images/sign_up2.png');
                        $("#emailInfo input").val("邮箱已经被使用").css("color","#FF0000");
                    }
                })
                if($("#emailInfo input").val()=="邮箱已经被使用"){
                    return false;
                }
            }else{
                $("#emailInfo").show();
                $("#emailInfo img").attr('src','images/sign_up2.png');
                $("#emailInfo input").val("邮箱地址格式有误").css("color","#FF0000");
                return false;
            }
            if(!str3.test(val3)){
                $("#passInfo").show();
                $("#passInfo img").attr('src','images/sign_up2.png');
                $("#passInfo input").val("密码格式有误").css("color","#FF0000");
                return false;
            }
            if(!str4.test(val4)){
                $("#phoneInfo").show();
                $("#phoneInfo img").attr('src','images/sign_up2.png');
                $("#phoneInfo input").val("手机格式有误").css("color","#FF0000");
                return false;
            }
            if(val5==null||val5.length==0){
                $("#pnumInfo").show();
                $("#pnumInfo img").attr('src','images/sign_up2.png');
                $("#pnumInfo input").val("验证码不能为空").css("color","#FF0000");
                return false;
            }
            if(val6!=val5){
                $("#pnumInfo").show();
                $("#pnumInfo img").attr('src','images/sign_up2.png');
                $("#pnumInfo input").val("验证码不正确或已过期，请重新获取").css("color","#FF0000");
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
            $(":input[name='email']").blur(function(){
                var val2 = $(this).val();
                val2 = $.trim(val2);
                var str2 =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
                if(str2.test(val2)){
                    var url = "${pageContext.request.contextPath}/checkEmail";
                    var args = {"email":val2,"time":new Date()};
                    $.getJSON(url,args,function (date){
                        if(date.message=="0"){
                            $("#emailInfo img").attr('src','images/sign_up2.png');
                            $("#emailInfo input").val("邮箱已经被使用").css("color","#FF0000");
                        }else{
                            $("#emailInfo input").hide();
                            $("#emailInfo img").attr('src','images/sign_up3.png');
                        }
                    })}else{
                    $("#emailInfo img").attr('src','images/sign_up2.png');
                    $("#emailInfo input").val("邮箱地址格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#emailInfo").show();
                $("#emailInfo input").show();
                $("#emailInfo img").attr('src','images/sign_up1.png');
                $("#emailInfo input").val("请输入邮箱地址").css("color","#8d8a8a");
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
            $(":input[name='phonenumber']").blur(function(){
                var val4 = $(this).val();
                val4 = $.trim(val4);
                var str4 = /^1[34578]\d{9}$/ ;
                if(str4.test(val4)){
                    $("#phoneInfo input").hide();
                    $("#phoneInfo img").attr('src','images/sign_up3.png');
                }else{
                    $("#phoneInfo img").attr('src','images/sign_up2.png');
                    $("#phoneInfo input").val("手机格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#phoneInfo").show();
                $("#phoneInfo input").show();
                $("#phoneInfo img").attr('src','images/sign_up1.png');
                $("#phoneInfo input").val("请输入手机号码").css("color","#8d8a8a");
            });
            $('#num').click(function() {
                var url = "${pageContext.request.contextPath}/num";
                var val5 = $(":input[name='phonenumber']").val();
                val5 = $.trim(val5);
                var args = {"phonenum":val5,"time":new Date()};
                var str5 = /^1[34578]\d{9}$/ ;
                if(str5.test(val5)){
                $.getJSON(url,args,function (date) {
                    $("#acticode").val(date.pnum);
//                    alert("验证码提示："+date.pnum);
                })
                }else{
                    $("#phoneInfo ").show();
                    $("#phoneInfo img").attr('src','images/sign_up2.png');
                    $("#phoneInfo input").val("手机格式有误").css("color","#FF0000");
                }
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
            <form action="sign_upUI" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" onsubmit="return CheckPost();">
                <h2><font size="6px" ><B>注册</B></font></h2>
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
                    <input type="text" class="form-control" id="name" name="name"placeholder="账号名" autocomplete="off" value="${jdUser.name}">
                    <div id="nameInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" class="form-control" id="email" name="email"placeholder="邮箱" autocomplete="off" value="${jdUser.email}">
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
                    <input type="text" class="form-control" id="phonenumber" name="phonenumber"placeholder="手机号码" autocomplete="off" value="${jdUser.phonenumber}">
                    <div id="phoneInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>

                <a href="javascript:void(0)" id="num"><img src= "images/2.png" width= "80" height= "30"></a>
                    <input type="hidden" id="acticode" name="acticode" value="${jdUser.acticode}">

                <div class="form-group">
                    <input type="text" class="form-control" id="pnum" name="pnum" placeholder="手机验证码" autocomplete="off" value="${pnum}">
                    <div id="pnumInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="width:250px;background:transparent;border:0;">
                    </div>
                </div>
                <div class="form-group">
                    <p>已经有账号？ <a href="login"><font color="red">登录</font></a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="注册" class="btn btn-primary">
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