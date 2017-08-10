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
            $(":input[name='Zname']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<=val.length&&val.length<=5){
                    $("#oneInfo img").attr('src','images/sign_up3.png');
                    $("#oneInfo input").hide();
                }else{
                    $("#oneInfo img").attr('src','images/sign_up2.png');
                    $("#oneInfo input").val("主类名字格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#oneInfo").show();
                $("#oneInfo input").show();
                $("#oneInfo img").attr('src','images/sign_up1.png');
                $("#oneInfo input").val("主类名字长度小于6位").css("color","#8d8a8a");
            })
            $(":input[name='Cname']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<=val.length&&val.length<=5){
                    $("#twoInfo img").attr('src','images/sign_up3.png');
                    $("#twoInfo input").hide();
                }else{
                    $("#twoInfo img").attr('src','images/sign_up2.png');
                    $("#twoInfo input").val("子类名字格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#twoInfo").show();
                $("#twoInfo input").show();
                $("#twoInfo img").attr('src','images/sign_up1.png');
                $("#twoInfo input").val("子类名字长度小于6位").css("color","#8d8a8a");
            })
            $(":input[name='CCname']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<=val.length&&val.length<=5){
                    $("#threeInfo img").attr('src','images/sign_up3.png');
                    $("#threeInfo input").hide();
                }else{
                    $("#threeInfo img").attr('src','images/sign_up2.png');
                    $("#threeInfo input").val("子子类名字格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#threeInfo").show();
                $("#threeInfo input").show();
                $("#threeInfo img").attr('src','images/sign_up1.png');
                $("#threeInfo input").val("子子类名字长度小于6位").css("color","#8d8a8a");
            })
        })
        function updateM() {
            var val = $(":input[name='Zname']").val();
            var val2 = $("#Zone option:selected").attr("name");
//            alert(val2);
            var url = "${pageContext.request.contextPath}/updateJdMclass";
            var args = {"name":val,"mid":val2,"time":new Date()};
            if(val2.length!=0){
                if(0<=val.length&&val.length<=5){
                    $.getJSON(url,args,function (date) {
                        if(date.name=="0"){
                            $("#oneInfo").show();
                            $("#oneInfo input").show();
                            $("#oneInfo img").attr('src','images/sign_up2.png');
                            $("#oneInfo input").val("主类名字已存在").css("color","#FF0000");
                        }else if(date.name==null){
                            $("#oneInfo").show();
                            $("#oneInfo input").show();
                            $("#oneInfo img").attr('src','images/sign_up3.png');
                            $("#oneInfo input").val("主类名字不能为空").css("color","#c90011");
                        }else{
                            $("#Zone option").each(function(){
                                if($(this).attr("name")==date.mid){
                                    $(this).text(date.name)
                                }
                            })
                            $("#Ztwo option").each(function(){
                                if($(this).attr("name")==date.mid){
                                    $(this).text(date.name)
                                }
                            })
                            $("#Zthree option").each(function(){
                                if($(this).attr("name")==date.mid){
                                    $(this).text(date.name)
                                }
                            })
                            $("#oneInfo").show();
                            $("#oneInfo input").show();
                            $("#oneInfo img").attr('src','images/sign_up3.png');
                            $("#oneInfo input").val("修改成功").css("color","#1db31d");
                        }
                    })
                }else{
                    $("#oneInfo").show();
                    $("#oneInfo input").show();
                    $("#oneInfo img").attr('src','images/sign_up2.png');
                    $("#oneInfo input").val("主类名字格式有误").css("color","#FF0000");
                }
        }else{
                $("#oneInfo").show();
                $("#oneInfo input").show();
                $("#oneInfo img").attr('src','images/sign_up2.png');
                $("#oneInfo input").val("请选择你要修改的主类").css("color","#FF0000");
            }
        }
        function updateC() {
            var val = $(":input[name='Cname']").val();
            var val2 = $("#Ttwo option:selected").attr("name");
            var url = "${pageContext.request.contextPath}/updateJdTwoclass";
            var args = {"name":val,"tid":val2,"time":new Date()};
            if(val2.length!=0){
                if(0<=val.length&&val.length<=5){
                    $.getJSON(url,args,function (date) {
                        if(date.name=="0"){
                            $("#twoInfo").show();
                            $("#twoInfo input").show();
                            $("#twoInfo img").attr('src','images/sign_up2.png');
                            $("#twoInfo input").val("子类名字已存在").css("color","#FF0000");
                        }else if(date.name==null){
                            $("#twoInfo").show();
                            $("#twoInfo input").show();
                            $("#twoInfo img").attr('src','images/sign_up3.png');
                            $("#twoInfo input").val("子类名字不能为空").css("color","#c90011");
                        }else{
                            $("#Ttwo option").each(function(){
                                if($(this).attr("name")==val2){
                                    $(this).text(date.name)
                                }
                            })
                            $("#Tthree option").each(function(){
                                if($(this).attr("name")==val2){
                                    $(this).text(date.name)
                                }
                            })
                            $("#twoInfo").show();
                            $("#twoInfo input").show();
                            $("#twoInfo img").attr('src','images/sign_up3.png');
                            $("#twoInfo input").val("修改成功").css("color","#1db31d");
                        }
                    })
                }else{
                    $("#twoInfo").show();
                    $("#twoInfo input").show();
                    $("#twoInfo img").attr('src','images/sign_up2.png');
                    $("#twoInfo input").val("子类名字格式有误").css("color","#FF0000");
                }
            }else{
                $("#twoInfo").show();
                $("#twoInfo input").show();
                $("#twoInfo img").attr('src','images/sign_up2.png');
                $("#twoInfo input").val("请选择你要修改的子类").css("color","#FF0000");
            }
        }
        function updateCC() {
            var url = "${pageContext.request.contextPath}/updateJdThreeclass";
            var val = $(":input[name='CCname']").val();
            var val2 = $("#Thone option:selected").attr("name");
            var args = {"name":val,"thid":val2,"time":new Date()};
            if(val2.length!=0){
                    if(0<=val.length&&val.length<=5){
                        $.getJSON(url,args,function (date) {
                            if(date.name=="0"){
                                $("#threeInfo").show();
                                $("#threeInfo input").show();
                                $("#threeInfo img").attr('src','images/sign_up2.png');
                                $("#threeInfo input").val("子子类名字已存在").css("color","#FF0000");
                            }else if(date.name==null){
                                $("#threeInfo").show();
                                $("#threeInfo input").show();
                                $("#threeInfo img").attr('src','images/sign_up3.png');
                                $("#threeInfo input").val("子子类名字不能为空").css("color","#c90011");
                            }else{
                                $("#Thone option").each(function(){
                                    if($(this).attr("name")==val2){
                                        $(this).text(date.name)
                                    }
                                })
                                $("#threeInfo").show();
                                $("#threeInfo input").show();
                                $("#threeInfo img").attr('src','images/sign_up3.png');
                                $("#threeInfo input").val("修改成功").css("color","#1db31d");
                            }
                        })
                    }else{
                        $("#threeInfo").show();
                        $("#threeInfo input").show();
                        $("#threeInfo img").attr('src','images/sign_up2.png');
                        $("#threeInfo input").val("子子分类名字格式有误").css("color","#FF0000");
                    }
            }else {
                $("#threeInfo").show();
                $("#threeInfo input").show();
                $("#threeInfo img").attr('src','images/sign_up2.png');
                $("#threeInfo input").val("请选择你要修改的子子类").css("color","#FF0000");
            }
        }
        function showT(x,v) {
            var bool = $(v).attr("id");
            bool = bool.substr(1, bool.length);
            var val = $(v.options[v.options.selectedIndex]).attr("name");
            var url = "${pageContext.request.contextPath}/selectJdTwoclass";
            var args = {"mid":val,"time":new Date()};
            $.getJSON(url,args,function (date) {
                if(date.name=="0"){
                    $("#T"+bool).empty();//清空info内容
                    $("#T"+bool).append("" +
                        "<option name='' disabled='disabled' selected = 'selected'>选择你要增加到的子类：</option>")
                    $("#"+bool+"Info").show();
                    $("#"+bool+"Info"+" input").show();
                    $("#"+bool+"Info"+" img").attr('src','images/sign_up2.png');
                    $("#"+bool+"Info"+" input").val("此主类没有子类").css("color","#FF0000");
                }else{

                    $("#"+bool+"Info").hide();
                    $("#"+bool+"Info"+" input").hide();

                    $("#T"+bool).empty();//清空info内容
                    $("#T"+bool).append("" +
                        "<option name='' disabled='disabled' selected = 'selected'>选择你要增加到的子类：</option>")
                    $.each(date,function(i, item) {
                        $("#T"+bool).append("<option name='"+date[i].tid+"'>"+date[i].name+"</option>");
                    });

                }
            })
        }
        function showTh(x,v) {
            var val = $(v.options[v.options.selectedIndex]).attr("name");
            var url = "${pageContext.request.contextPath}/selectJdThreeclass";
            var args = {"tid":val,"time":new Date()};
            $.getJSON(url,args,function (date) {
                if(date.name=="0"){
                    $("#Thone").empty();//清空info内容
                    $("#Thone").append("" +
                        "<option name='' disabled='disabled' selected = 'selected'>选择你要增加到的子子类：</option>")
                    $("#threeInfo").show();
                    $("#threeInfo input").show();
                    $("#threeInfo img").attr('src','images/sign_up2.png');
                    $("#threeInfo input").val("此子类没有子子类").css("color","#FF0000");
                }else{
                    $("#threeInfo").hide();
                    $("#threeInfo input").hide();
                    $("#Thone").empty();//清空info内容
                    $("#Thone").append("" +
                        "<option name='' disabled='disabled' selected = 'selected'>选择你要增加到的子子类：</option>")
                    $.each(date,function(i, item) {
                        $("#Thone").append("<option name='"+date[i].thid+"'>"+date[i].name+"</option>");
                    });
                }
            })
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
font-size: 16px;"> 时间。。。。。 &nbsp; <a href="/Jd/outAdmin" class="btn btn-danger square-btn-adjust">注销</a> </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                </li>
                <li>
                    <a  href="index.html"><i class="fa fa-dashboard fa-3x"></i> 款式一</a>
                </li>
                <li>
                    <a  href="ui.html"><i class="fa fa-desktop fa-3x"></i> 款式二</a>
                </li>
                <li>
                    <a  href="tab-panel.html"><i class="fa fa-qrcode fa-3x"></i> 款式三</a>
                </li>
                <li  >
                    <a  href="chart.html"><i class="fa fa-bar-chart-o fa-3x"></i> 款式四</a>
                </li>
                <li  >
                    <a  href="table.html"><i class="fa fa-table fa-3x"></i> 款式五</a>
                </li>
                <li  >
                    <a  href="form.html"><i class="fa fa-edit fa-3x"></i> 款式六 </a>
                </li>
                <li  >
                    <a  class="active-menu" href="/Jd/update-pseries"><i class="fa fa-laptop fa-3x"></i>修改商品分类</a>
                </li>
                <li  >
                    <a   href="/Jd/add_pseries"><i class="fa fa-square-o fa-3x"></i> 增加商品类别</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>增加分类</h2>
                    <hr />
                    <!--补充区域-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    修改主类表
                                </div>
                                <div class="panel-body">
                                    <div class="form-group" >
                                        <label>主分类表浏览：</label>
                                        <select class="form-control" id="Zone" onchange="s1()">
                                            <option name="" disabled="disabled" selected = "selected">选择你要修改的主分类：</option>
                                            <c:if test="${JdMclass!=null}">
                                                <c:forEach items="${JdMclass}" var="JdMclass">
                                                    <option name="${JdMclass.mid}">${JdMclass.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <br>
                                        <div class="form-group">
                                            <label>主类名字：</label>
                                            <input class="form-control" name="Zname"/>
                                        </div>
                                        <center>
                                            <a href="javascript:void(0);" onclick="updateM()" class="btn btn-info">确定</a>
                                            <p class="help-block" id="oneInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                        </center>
                                    </div>
                                </div>
                                <!--框内-->
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    修改子类
                                </div>
                                <div class="panel-body">
                                    <div class="form-group" >
                                        <label>主类表浏览：</label>
                                        <select class="form-control" id="Ztwo" onchange="showT(this.options[this.options.selectedIndex].value,this)">
                                            <option name="" disabled="disabled" selected = "selected">选择你要增加到的主分类：</option>
                                            <c:if test="${JdMclass!=null}">
                                                <c:forEach items="${JdMclass}" var="JdMclass">
                                                    <option name="${JdMclass.mid}">${JdMclass.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <br>
                                        <label>子类表浏览：</label>
                                        <select class="form-control"  id="Ttwo">
                                            <option name="" disabled="disabled" selected = "selected">选择你要修改的子类：</option>
                                        </select>
                                        <br>
                                        <div class="form-group">
                                            <label>子分类名字：</label>
                                            <input class="form-control" name="Cname"/>
                                        </div>
                                        <center>
                                            <a href="javascript:void(0);" onclick="updateC()" class="btn btn-info">确定</a>
                                            <p class="help-block" id="twoInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--框内-->
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    修改子子类
                                </div>
                                <div class="panel-body">
                                    <div class="form-group" >
                                        <label>主分类表浏览：</label>
                                        <select name="" class="form-control" id="Zthree" onchange="showT(this.options[this.options.selectedIndex].value,this)">
                                            <option disabled="disabled" selected = "selected">选择你要增加到的主分类：</option>
                                            <c:if test="${JdMclass!=null}">
                                                <c:forEach items="${JdMclass}" var="JdMclass">
                                                    <option name="${JdMclass.mid}">${JdMclass.name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <br>
                                        <label>子分类表浏览：</label>
                                        <select class="form-control" id="Tthree"  onchange="showTh(this.options[this.options.selectedIndex].value,this)">
                                            <option disabled="disabled" selected = "selected">选择你要增加到的子类：</option>
                                        </select>
                                        <br>
                                        <label>子子分类表浏览：</label>
                                        <select class="form-control" id="Thone">
                                            <option disabled="disabled" name="" selected = "selected">选择你要增加到的子子类：</option>
                                        </select>
                                        <br>
                                        <center>
                                            <div class="form-group">
                                                <label>子子分类名字：</label>
                                                <input class="form-control" name="CCname"/>
                                            </div>
                                            <a href="javascript:void(0);" onclick="updateCC()" class="btn btn-info">确定</a>
                                            <p class="help-block" id="threeInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                        </center>
                                    </div>
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
