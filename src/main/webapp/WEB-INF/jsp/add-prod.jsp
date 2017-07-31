<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/7/27
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>增加商品</title>
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
            var val2 = $(":input[name='brand']").val();
            var val3 = $(":input[name='price']").val();
            var val4 = $(":input[name='discount']").val();
            var val5 = $(":input[name='proMessage']").val();
            var val6 = $("input[id='sizeCheckbox']:checked").length;
            var val7 = Number($("#imgSelect option:selected").val());
            var str =new RegExp("^[0-9]+(.[0-9]+)?$");
            var str2 = new RegExp("^(\\d|[1-9]\\d|100)$");
            var str3 = /(?:jpg|gif|png|jpeg)$/;
            var str4 = /^[0-9]*$/;
            if(!(0<val.length&&val.length<11)){
                $("#nameInfo").show();
                $("#nameInfo input").show();
                $("#nameInfo img").attr('src','images/sign_up2.png');
                $("#nameInfo input").val("名字格式有误").css("color","#FF0000");
                return false;
            }
            if(!(0<val2.length&&val2.length<11)){
                $("#brandInfo").show();
                $("#brandInfo input").show();
                $("#brandInfo img").attr('src','images/sign_up2.png');
                $("#brandInfo input").val("品牌名字格式有误").css("color","#FF0000");
                return false;
            }
            if(!str.test(val3)){
                $("#priceInfo").show();
                $("#priceInfo input").show();
                $("#priceInfo img").attr('src','images/sign_up2.png');
                $("#priceInfo input").val("价格格式有误").css("color","#FF0000");
                return false;
            }
            if(!str2.test(val4)){
                $("#discountInfo").show();
                $("#discountInfo input").show();
                $("#discountInfo img").attr('src','images/sign_up2.png');
                $("#discountInfo input").val("折扣格式有误").css("color","#FF0000");
                return false;
            }
            if(!(0<val5.length&&val5.length<=100)){
                $("#proMessageInfo").show();
                $("#proMessageInfo input").show();
                $("#proMessageInfo img").attr('src','images/sign_up2.png');
                $("#proMessageInfo input").val("商品信息有误").css("color","#FF0000");
                return false;
            }
            if(val6<=0){
                $("#sizeInfo").show();
                $("#sizeInfo input").show();
                $("#sizeInfo img").attr('src', 'images/sign_up2.png');
                $("#sizeInfo input").val("至少有一种尺寸").css("color", "#FF0000");
                return false;
            }
            var num1 = $("#prodImg").find(":input[name='img']");
            var num2 = $("#prodImg").find(":input[name='iname']");
            var num3 = $("#prodImg").find(":input[name='number']");
            if (!(num1.val().length > 0 && num2.val().length > 0 && num3.val().length > 0)) {
                $("#prodImgInfo1").show();
                $("#prodImgInfo1 input").show();
                $("#prodImgInfo1 img").attr('src', 'images/sign_up2.png');
                $("#prodImgInfo1 input").val("款式信息填写有遗漏").css("color", "#FF0000");
                return false;
            }

        }
        $(function(){
            $(":input[name='name']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<val.length&&val.length<11){
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
                $("#nameInfo input").val("商品名字长度为10位").css("color","#8d8a8a");
            })
            $(":input[name='brand']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<val.length&&val.length<11){
                    $("#brandInfo img").attr('src','images/sign_up3.png');
                    $("#brandInfo input").hide();
                }else{
                    $("#brandInfo img").attr('src','images/sign_up2.png');
                    $("#brandInfo input").val("品牌名字格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#brandInfo").show();
                $("#brandInfo input").show();
                $("#brandInfo img").attr('src','images/sign_up1.png');
                $("#brandInfo input").val("品牌名字最大长度为10位").css("color","#8d8a8a");
            })
            $(":input[name='price']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                var str =new RegExp("^[0-9]+(.[0-9]+)?$");
                if(str.test(val)){
                    $("#priceInfo img").attr('src','images/sign_up3.png');
                    $("#priceInfo input").hide();
                }else{
                    $("#priceInfo img").attr('src','images/sign_up2.png');
                    $("#priceInfo input").val("价格格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#priceInfo").show();
                $("#priceInfo input").show();
                $("#priceInfo img").attr('src','images/sign_up1.png');
                $("#priceInfo input").val("正确格式：8.88").css("color","#8d8a8a");
            })
            $(":input[name='discount']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                var str =new RegExp("^(\\d|[1-9]\\d|100)$");
                if(str.test(val)){
                    $("#discountInfo img").attr('src','images/sign_up3.png');
                    $("#discountInfo input").hide();
                }else{
                    $("#discountInfo img").attr('src','images/sign_up2.png');
                    $("#discountInfo input").val("折扣格式有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#discountInfo").show();
                $("#discountInfo input").show();
                $("#discountInfo img").attr('src','images/sign_up1.png');
                $("#discountInfo input").val("正确格式：1-100").css("color","#8d8a8a");
            })
            $(":input[name='proMessage']").blur(function(){
                var val = $(this).val();
                val = $.trim(val);
                if(0<val.length&&val.length<=100){
                    $("#proMessageInfo img").attr('src','images/sign_up3.png');
                    $("#proMessageInfo input").hide();
                }else{
                    $("#proMessageInfo img").attr('src','images/sign_up2.png');
                    $("#proMessageInfo input").val("商品信息有误").css("color","#FF0000");
                }
            }).focus(function(){
                $("#proMessageInfo").show();
                $("#proMessageInfo input").show();
                $("#proMessageInfo img").attr('src','images/sign_up1.png');
                $("#proMessageInfo input").val("商品信息少于等于100字").css("color","#8d8a8a");
            })
        })
        function sizeNum() {
            var val = $("input[id='sizeCheckbox']:checked").length;
            if(val>0&&$("#sizeInfo input").val()=="至少有一种尺寸"){
                $("#sizeInfo").hide();
                $("#sizeInfo input").hide();
            }
        }
        function checkSize(v,x) {
                var val = $.trim(v);
                if($(x).prev().children('#sizeCheckbox').is(':checked')){
                    if (0 < val.length && val.length <= 8) {
                        $("#sizeInfo").hide();
                        $("#sizeInfo input").hide();
                    } else {
                        $("#sizeInfo img").attr('src', 'images/sign_up2.png');
                        $("#sizeInfo input").val("尺寸描述格式有误").css("color", "#FF0000");
                    }
                }else{
                    $("#sizeInfo").hide();
                    $("#sizeInfo input").hide();
                }
        }
        function checkSize2() {
            $("#sizeInfo").show();
            $("#sizeInfo input").show();
            $("#sizeInfo img").attr('src','images/sign_up1.png');
            $("#sizeInfo input").val("如：XL/175(少于8个字)").css("color","#8d8a8a");
        }
        function checkImg(v) {
            var num = $(v).parent().parent().attr("id");
            num = num.substr(num.length-1,1);
            var val = v.value;
            var str = /(?:jpg|gif|png|jpeg)$/;
            if(str.test(val)){
                $("#prodImgInfo1").hide();
                $("#prodImgInfo1 input").hide();
            }else{
                $("#prodImgInfo1").show();
                $("#prodImgInfo1 input").show();
                $("#prodImgInfo1 img").attr('src', 'images/sign_up2.png');
                $("#prodImgInfo1 input").val("款式"+num+"的图片格式有误").css("color", "#FF0000");
            }
        }
        function checkImg2() {
            $("#prodImgInfo2").show();
            $("#prodImgInfo2 input").show();
            $("#prodImgInfo2 img").attr('src','images/sign_up1.png');
            $("#prodImgInfo2 input").val("款式介绍最大长度为10").css("color","#8d8a8a");
        }
        function checkImg3(v,x) {
            var num = $(x).parent().parent().attr("id");
            num = num.substr(num.length-1,1);
            var val = $.trim(v);
            if (0 < val.length && val.length <= 10) {
                $("#prodImgInfo2").hide();
                $("#prodImgInfo2 input").hide();
            } else {
                $("#prodImgInfo2 img").attr('src', 'images/sign_up2.png');
                $("#prodImgInfo2 input").val("款式"+num+"介绍格式有误").css("color", "#FF0000");
            }
        }
        function checkImg4(v,x) {
            var num = $(x).parent().parent().attr("id");
            num = num.substr(num.length-1,1);
            var val = $.trim(v);
            var str = /^[0-9]*$/;
            if (str.test(val)&&val.length>0) {
                $("#prodImgInfo3").hide();
                $("#prodImgInfo3 input").hide();
            } else {
                $("#prodImgInfo3").show();
                $("#prodImgInfo3 input").show();
                $("#prodImgInfo3 img").attr('src', 'images/sign_up2.png');
                $("#prodImgInfo3 input").val("款式"+num+"的数量填写有误").css("color", "#FF0000");
            }
        }
        function addSize (){
            if($("#size").children("div").length<6){
                $("#size").append("<div class='col-md-4'>"+
                "<label><br></label>"+
                "<div class='form-group input-group'>"+
                    "<span class='input-group-addon'>"+
                    "<input type='checkbox' id='sizeCheckbox' onclick='sizeNum()'/>"+
                    "</span>"+
                    "<input type='text' class='form-control' name='size' onfocus='checkSize2()' onblur='checkSize(this.value,this)'/>"+
                    "</div>"+
                    "</div>");
            }
        }
        function addProdimg (v){
//            alert(v);
//            alert($("#prodImg").children("div").length)
            if($("#prodImg").children("div").length<v){
                var num = Number($("#prodImg").children("div").length)+1;
                for(; num<=v;num++){
                    $("#prodImg").append("<div class='col-md-4' id='num"+num+"'>"+
                    "<div class='form-group'>"+
                        "<label>款式"+num+"图片:</label>"+
                    "<input type='file' name='img' onchange='checkImg(this)'/>"+
                        "</div>"+
                        "<div class='form-group input-group'>"+
                        "<span class='input-group-addon'>款式"+num+"简介：</span>"+
                    "<input type='text' class='form-control'  name='iname'onfocus='checkImg2()' onblur='checkImg3(this.value,this)'>"+
                        "</div>"+
                        "<div class='form-group input-group'>"+
                        "<span class='input-group-addon'>数量：</span>"+
                    "<input type='text' class='form-control'  name='number' onblur='checkImg4(this.value,this)'>"+
                        "<span class='input-group-addon'>件</span>"+
                        "</div>"+
                        "</div>");
                }
            }else{
                var num = Number($("#prodImg").children("div").length);
                for(;v<num;num--){
                   $("#prodImg").children("div:last-child").remove();
                }
                $("#prodImgInfo1").hide();
                $("#prodImgInfo1 input").hide();
                $("#prodImgInfo2").hide();
                $("#prodImgInfo2 input").hide();
                $("#prodImgInfo3").hide();
                $("#prodImgInfo3 input").hide();
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
            <a class="navbar-brand" href="index.html">${sessionScope.jdStores.name}</a>
        </div>
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> 时间。。。。。 &nbsp; <a href="/Jd/out" class="btn btn-danger square-btn-adjust">注销</a> </div>
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
                    <a   href="registeration.html"><i class="fa fa-laptop fa-3x"></i> 款式七</a>
                </li>
                <li  >
                    <a class="active-menu"  href="addProd"><i class="fa fa-square-o fa-3x"></i> 增加商品页面</a>
                </li>
            </ul>

        </div>

    </nav>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <form  action="/Jd/addProdUI" method="post" enctype="multipart/form-data" onsubmit="return CheckPost();">
            <div class="row">
                <div class="col-md-12">
                    <h2>增加商品页面</h2>
                    <h5>XXX </h5>
                    <hr />
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Form Elements -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    设置商品基本信息
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>名字：</label>
                                                <input class="form-control" name="name" value="${prods.name}" />
                                            </div>
                                            <%--style="display:none"--%>
                                            <p class="help-block" id="nameInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                            <div class="form-group">
                                                <label>品牌：</label>
                                                <input class="form-control" name="brand" value="${prods.brand}"/>
                                            </div>
                                            <p class="help-block" id="brandInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                        </div>
                                        <div class="col-md-6">
                                            <label>价格：</label>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon">￥</span>
                                                <input type="text" class="form-control" name="price" value="${prods.price}">
                                                <span class="input-group-addon">元</span>
                                            </div>
                                            <p class="help-block" id="priceInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                            <label>折扣：</label>
                                            <div class="form-group input-group">
                                                <input type="text" class="form-control" name="discount" value="${prods.discount}">
                                                <span class="input-group-addon">%</span>
                                            </div>
                                            <p class="help-block" id="discountInfo" style="display:none">
                                                <img src="images/sign_up1.png" width="18" height="18">
                                                <input type="text" readonly style="background:transparent;border:0;">
                                            </p>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>商品信息：</label>
                                                <textarea class="form-control" rows="3" name="proMessage" value="${prods.proMessage}"></textarea>
                                                <p class="help-block" id="proMessageInfo" style="display:none">
                                                    <img src="images/sign_up1.png" width="18" height="18">
                                                    <input type="text" readonly style="background:transparent;border:0;">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    设置尺寸
                                </div>
                                <div class="panel-body" >
                                    <!--一个尺寸-->
                                    <div class="row" id="size">
                                    <div class="col-md-4" >
                                        <label>尺寸描述：</label>
                                        <div class="form-group input-group">
										    <span class="input-group-addon">
								                <input type="checkbox" id="sizeCheckbox" onclick="sizeNum()"/>
									        </span>
                                            <input type="text" class="form-control" name="size" onfocus="checkSize2()" onblur="checkSize(this.value,this)"/>
                                        </div>
                                    </div>
                                    <!--
                                     <div class="col-md-4">
                                    <label><br></label>
                                         <div class="form-group input-group">
                                           <span class="input-group-addon">
                                           <input type="checkbox" />
                                           </span>
                                           <input type="text" class="form-control" name="size"/>
                                        </div>
                                    </div>
                                    -->
                                    </div>
                                    <p class="help-block" id="sizeInfo" style="display:none">
                                        <img src="images/sign_up1.png" width="18" height="18">
                                        <input type="text" readonly  width="400" style="background:transparent;border:0;" ;>
                                    </p>
                                    <div class="col-md-12">
                                        <p>
                                        <a href="javascript:void(0)" class="btn btn-info" onclick="addSize()">更多</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    设置款式
                                </div>
                                <div class="panel-body">
                                    <div class="form-group" >
                                        <label>款式数量：</label>
                                        <select class="form-control" id="imgSelect" onchange="addProdimg(this.options[this.options.selectedIndex].value)">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                        </select>
                                    </div>
                                    <div class="row" id="prodImg">
                                        <!--一个款式-->
                                        <div class="col-md-4" id="num1">
                                            <div class="form-group">
                                                <label>款式1图片:</label>
                                                <input type="file" name="img" onchange="checkImg(this)"/>
                                            </div>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon">款式1简介：</span>
                                                <input type="text" class="form-control" name="iname" onfocus="checkImg2()" onblur="checkImg3(this.value,this)">
                                            </div>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon">数量：</span>
                                                <input type="text" class="form-control" name="number" onblur="checkImg4(this.value,this)">
                                                <span class="input-group-addon">件</span>
                                            </div>
                                        </div>
                                    </div>
                                    <center>
                                        <p class="help-block" id="prodImgInfo1" style="display:none">
                                            <img src="images/sign_up1.png" width="18" height="18">
                                            <input type="text" readonly style="background:transparent;border:0;">
                                        </p>
                                        <p class="help-block" id="prodImgInfo2" style="display:none">
                                            <img src="images/sign_up1.png" width="18" height="18">
                                            <input type="text" readonly style="background:transparent;border:0;">
                                        </p>
                                        <p class="help-block" id="prodImgInfo3" style="display:none">
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
                <input type="hidden" name="stoId" value="${sessionScope.jdStores.sto_Id}">
                <center><input type="submit" value="提交" class="btn btn-info btn-lg"></center>
            </form>
            <center>
    <c:if test="${message!=null}">
    <c:forEach items="${message}" var="error">
        <img src="images/sign_up2.png" width="18" height="18">
        <input type="text" readonly style="background:transparent;border:0;color: '#FF0000'" value="${error.defaultMessage}"><br>
    </c:forEach>
    </c:if>
            </center>
            <!-- /. PAGE INNER  -->
        </div>
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
