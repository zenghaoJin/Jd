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
    <title>修改商品基本信息</title>
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
            var val5 = $(":input[name='promessage']").val();
            var val6 = $("input[name='sizeCheckbox']:checked").length;
            var val8 = $(":input[name='zhuimg']").val();
            var str =new RegExp("^[0-9]+(.[0-9]+)?$");
            var str2 = new RegExp("^(\\d|[1-9]\\d|100)$");
            var str3 = /^[0-9]*$/;
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
            $("input[name='sizeCheckbox']:checked").each(function(){
                if(!(0<$(this).val().length&&$(this).val().length<=8)){
                    $("#sizeInfo").show();
                    $("#sizeInfo input").show();
                    $("#sizeInfo img").attr('src', 'images/sign_up2.png');
                    $("#sizeInfo input").val("尺寸描述格式有误").css("color", "#FF0000");
                }
                var str = /^[0-9]*$/;
                if(!str.test($(this).parent().next().next().val())){
                    $("#numInfo").show();
                    $("#numInfo input").show();
                    $("#numInfo img").attr('src', 'images/sign_up2.png');
                    $("#numInfo input").val("数量格式有误").css("color", "#FF0000");
                }
            })

            if(!$("#sizeInfo").is(":hidden")||!$("#numInfo").is(":hidden")){
                return false;
            }
            if(val8.length>0){
                if(str2.test(val8)){
                    $("#zhuimg").children("img").attr("src","");
                    $("#ZimgInfo").show();
                    $("#ZimgInfo input").show();
                    $("#ZimgInfo img").attr('src','images/sign_up2.png');
                    $("#ZimgInfo input").val("主图格式有误").css("color","#FF0000");
                    return false;
                }
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
            $(":input[name='promessage']").blur(function(){
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
            var val = $("input[name='sizeCheckbox']:checked").length;
            if(val>0&&$("#sizeInfo input").val()=="至少有一种尺寸"){
                $("#sizeInfo").hide();
                $("#sizeInfo input").hide();
            }
        }
        function checkSize(v,x) {
            var val = $.trim(v);
            if($(x).prev().children('input[name="sizeCheckbox"]').is(':checked')){
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
        function checkSize3(v,x) {
            var val = $.trim(v);
            var str = /^[0-9]*$/;
            if($(x).prev().prev().children('input[name="sizeCheckbox"]').is(':checked')){
                if (str.test(val)) {
                    $("#numInfo").hide();
                    $("#numInfo input").hide();
                } else {
                    $("#numInfo img").attr('src', 'images/sign_up2.png');
                    $("#numInfo input").val("数量格式有误").css("color", "#FF0000");
                }
            }else{
                $("#numInfo").hide();
                $("#numInfo input").hide();
            }
        }
        function checkSize4() {
            $("#numInfo").show();
            $("#numInfo input").show();
            $("#numInfo img").attr('src','images/sign_up1.png');
            $("#numInfo input").val("请填入对应尺寸的数量").css("color","#8d8a8a");
        }
        function checkZimg(v) {
            var val = v.value;
            var str = /(?:jpg|gif|png|jpeg)$/;
            if(str.test(val)){
                alert(val)
                doUpload()
//                $("#zhuimg").children("img").attr("src",v);
                $("#ZimgInfo").hide();
                $("#ZimgInfo input").hide();
            }else{
                $("#zhuimg").children("img").attr("src","");
                $("#ZimgInfo").show();
                $("#ZimgInfo input").show();
                $("#ZimgInfo img").attr('src', 'images/sign_up2.png');
                $("#ZimgInfo input").val("主图格式有误").css("color", "#FF0000");
            }
        }
        function addSize (){
            var num ;
            if($("#size").children("div:last-child").find(":input[name='sizeCheckbox']").val()==null){
                num = -1;
            }else{
                num = $("#size").children("div:last-child").find(":input[name='sizeCheckbox']").val();
            }

            if($("#size").children("div").length<7){
                $("#size").append("<div class='col-md-4'>"+
                    "<br>"+
                    "<div class='form-group input-group'>"+
                    "<span class='input-group-addon'>"+
                    "<input type='checkbox' name='sizeCheckbox' value='"+(Number(num)+1)+"' onclick='sizeNum()'/>"+
                    "</span>"+
                    "<input type='text' class='form-control' name='size' onfocus='checkSize2()' onblur='checkSize(this.value,this)'/>"+
                    "<input type='text' class='form-control' name='number' onfocus='' onblur=''/>"+
                    "</div>"+
                    "</div>");
            }
        }
        function doUpload() {
            var formData = new FormData($( "#uploadForm" )[0]);
            $.ajax({
                url: "${pageContext.request.contextPath}/showImg" ,  /*这是处理文件上传的servlet*/
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (val) {
                    var Json = eval("("+val+")")
                    $("#zhuimg").find("img").attr("src","${pageContext.request.contextPath}/upload/"+Json.img);
//                    alert(Json.img)
                    <%--attr("src","${pageContext.request.contextPath}/upload/"+Json.img);--%>
                }
            });
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
font-size: 16px;"><a href="/Jd/out" class="btn btn-danger square-btn-adjust">注销</a> </div>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                </li>
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
                    <a class="active-menu" href="/Jd/s_select?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-edit fa-3x"></i> 查看自己的商品 </a>
                </li>
                <li  >
                    <a   href="/Jd/s_update"><i class="fa fa-laptop fa-3x"></i>个人信息</a>
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
            <form  action="/Jd/s_updateProdsUI" method="post" enctype="multipart/form-data" onsubmit="return CheckPost();" id="uploadForm">
                <div class="row">
                    <div class="col-md-12">
                        <h2>修改商品页面</h2>
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
                                                    <textarea class="form-control" rows="3" name="promessage">${prods.promessage}</textarea>
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
                                            <div class="col-md-12"><label>尺寸描述：（第一个框为尺寸，第二个框为数量）</label></div>
                                        <c:if test="${sizes.size()!=0}">
                                            <c:forEach var="i" begin="0" end="${sizes.size()-1}" step="1">
                                            <div class="col-md-4">
                                                <br>
                                                <div class="form-group input-group">
										            <span class="input-group-addon">
								                         <input type="checkbox" name="sizeCheckbox" value="${i}" onclick="sizeNum()"/>
									                </span>
                                                    <input type="text" class="form-control" name="size" value="${sizes[i].size}" onfocus="checkSize2()" onblur="checkSize(this.value,this)"/>
                                                    <input type="text" class="form-control" name="number" value="${sizes[i].number}" onfocus="checkSize4()" onblur="checkSize3(this.value,this)"/>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </c:if>
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
                                        <p class="help-block" id="numInfo" style="display:none">
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
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        设置主图
                                    </div>
                                    <div class="panel-body" >
                                        <input type="file" name="img" onchange="checkZimg(this)"/>
                                    <P class="help-block" id="zhuimg">
                                    主图浏览：
                                    <img src="${pageContext.request.contextPath}/upload/${prods.zimg}"height="80" width="60">
                                    </P>
                                    <input type="hidden" name="proid" value="${prods.proid}">
                                    <input type="hidden" name="stoid" value="${prods.stoid}">
                                    <input type="hidden" name="pimgid" value="${pimgid}">
                                    <c:if test="${sizes!=null}">
                                        <c:forEach items="${sizes}" var="sizes">
                                            <input type="hidden" name="sizeid" value="${sizes.sizeid}">
                                        </c:forEach>
                                    </c:if>
                                    <center>
                                        <p class="help-block" id="ZimgInfo" style="display:none">
                                            <img src="images/sign_up1.png" width="18" height="18">
                                            <input type="text" readonly style="background:transparent;border:0;">
                                        </p>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                </div>

                <%--<input type="hidden" name="stoid" value="${sessionScope.jdStores.stoid}">--%>

                <center><input type="submit" value="提交" class="btn btn-info btn-lg">
                    <a href="/Jd/s_selectP?proid=${prods.proid}&pimgid=${pimgid}" class="btn btn-danger btn-lg">返回</a></center>
            </form>
            <center>
                <c:if test="${message!=null}">
                    <c:forEach items="${message}" var="error">
                        <img src="images/sign_up2.png" width="18" height="18">
                        <input type="text" readonly style="color:'#FF0000';background:transparent;border:0;" value="${error.defaultMessage}"><br>
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
