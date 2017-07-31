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
            var val1 = $(":input[name='email']").val();
            var str1 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            if(str1.test(val1)){
                var url = "${pageContext.request.contextPath}/forgetPass";
                var args = {"email":val1,"time":new Date()};
                $.getJSON(url,args,function (date) {
                    if(date.message=="0"){
                        $("#messageInfo").show();
                        $("#messageInfo input").val("此邮箱用户不存在").css("color","#FF0000");
                    }else{
                        $("#messageInfo").show();
                        $("#messageInfo img").attr('src','images/sign_up3.png');
                        $("#messageInfo input").val("修改邮件已经发送到你的邮箱中！").css("color","#1db31d");
                    }
                })
            }else{
                $("#emailInfo input").show();
                $("#emailInfo img").attr('src','images/sign_up1.png');
                $("#emailInfo input").val("邮箱地址有误").css("color","#FF0000");
            }
            return false;
        }
        $(function(){
        $(":input[name='email']").blur(function(){
            var val2 = $(this).val();
            val2 = $.trim(val2);
            var str2 =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            if(str2.test(val2)){
                $("#emailInfo input").hide();
                $("#emailInfo img").attr('src','images/sign_up3.png');
            }else{
                $("#emailInfo img").attr('src','images/sign_up2.png');
                $("#emailInfo input").val("邮箱地址格式有误").css("color","#FF0000");
            }
        }).focus(function(){
            $("#emailInfo").show();
            $("#emailInfo input").show();
            $("#emailInfo img").attr('src','images/sign_up1.png');
            $("#emailInfo input").val("请输入邮箱地址").css("color","#8d8a8a");
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
            <form action="" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" onsubmit="return CheckPost();">
                <h2><font size="6px"><B>忘记密码</B></font></h2>
                <div class="form-group">
                    <div class="alert alert-success" id="messageInfo" role="alert" style="display: none">
                        <input type="text" readonly style="width:250px;background:transparent;border:0;" ></div>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="邮箱" autocomplete="off">
                    <div id="emailInfo" style="display: none">
                        <img src="images/sign_up2.png" width="18" height="18" border="0">
                        <input type="text" readonly style="background:transparent;border:0;">
                    </div>
                </div>
                <div class="form-group">
                    <p><a href="login"><font color="red">登录</font></a> or <a href="sign_up"><font color="red">注册</font></a></p>
                </div>
                <div class="form-group">
                    <input type="submit" value="发送" class="btn btn-primary">
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