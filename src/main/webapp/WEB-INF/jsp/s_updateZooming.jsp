<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/4
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>缩放图修改</title>

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
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <!-- start menu -->

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
            $(":input[name='img']").each(function(){
                var num = $(this).attr("id");
                num = num.substr(num.length-1,1);
                var val = this.value;
                var str = /(?:jpg|gif|png|jpeg)$/;
                if(val.length<=0){
                    $("#showImg"+num).attr("src","");
                    $("#zoomImgInfo").show();
                    $("#zoomImgInfo input").show();
                    $("#zoomImgInfo img").attr('src', 'images/sign_up2.png');
                    $("#zoomImgInfo input").val("第" + num + "张缩放图未填").css("color", "#FF0000");
                    return false;
                }else {
                    if (!str.test(val)) {
                        $("#zoomImgInfo").show();
                        $("#zoomImgInfo input").show();
                        $("#zoomImgInfo img").attr('src', 'images/sign_up2.png');
                        $("#zoomImgInfo input").val("第" + num + "张缩放图格式有误").css("color", "#FF0000");
                        return false;
                    }
                }
            })
            if(!$("#zoomImgInfo").is(":hidden")){
                return false;
            }
        }
        function addProdimg (v){
            if($(":input[name='img']").length<v){
                var num = Number($(":input[name='img']").length)+1;
                for(; num<=v;num++){
                    $("#zoomImg").append("<input type='file'id='img"+num+"' name='img' onchange='checkImg(this)'/>")
                }
            }else{
                var num = Number($(":input[name='img']").length);
                for(;v<num;num--){
                    $("#zoomImg").children("input:last-child").remove();
                }
                $("#zoomImgInfo").hide();
                $("#zoomImgInfo input").hide();
            }
            if($("#showImg").children("div").length!=0){
            if($("#showImg").children("div").length<v){
                var num = Number($("#showImg").children("div").length)+1;
                for(; num<=v;num++){
                    $("#showImg").append("<div class='col-md-6'>"+
                    "<label>款式"+num+"图片:</label>"+
                    "<img id='showImg"+num+"' src='' height='260' width='180'/>"+
                        "</div>")
                }
            }else{
                var num = Number($("#showImg").children("div").length);
                for(;v<num;num--){
                    $("#showImg").children("div:last-child").remove();
                }
            }
            }else{
                    var num = 1;
                    for(; num<=v;num++){
                        $("#showImg").append("<div class='col-md-6'>"+
                            "<label>款式"+num+"图片:</label>"+
                            "<img id='showImg"+num+"' src='' height='260' width='180'/>"+
                            "</div>")
                    }
            }
        }
        function checkImg(v) {
            var num = $(v).attr("id");
            num = num.substr(num.length-1,1);
            var val = v.value;
            var str = /(?:jpg|gif|png|jpeg)$/;
            if(str.test(val)){
                doUpload(num-1)
                $("#zoomImgInfo").hide();
                $("#zoomImgInfo input").hide();
            }else{
                $("#showImg"+num).attr("src","");
                $("#zoomImgInfo").show();
                $("#zoomImgInfo input").show();
                $("#zoomImgInfo img").attr('src', 'images/sign_up2.png');
                $("#zoomImgInfo input").val("第"+num+"张缩放图格式有误").css("color", "#FF0000");
            }
        }
        function doUpload(v) {
            var formData = new FormData($( "#uploadForm" )[0]);
            $.ajax({
                url: "${pageContext.request.contextPath}/showImg?index="+v ,  /*这是处理文件上传的servlet*/
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (val) {
                    var Json = eval("("+val+")")
                    $("#showImg"+(Number(v)+1)).attr("src","${pageContext.request.contextPath}/upload/"+Json.img);
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
font-size: 16px;"><a href="login.html" class="btn btn-danger square-btn-adjust">注销</a> </div>
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
            <form  action="/Jd/s_updateZoomingUI" method="post" enctype="multipart/form-data" onsubmit="return CheckPost();" id="uploadForm">
            <div class="row">
                <div class="col-md-12">
                    <h2>修改缩放图</h2>
                    <hr />
                    <!--补充区域-->
                    <div class="row">
                        <div class="col-md-5">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    设置款式缩放图
                                </div>
                                <div class="panel-body">
                                    <div class="form-group" >
                                        <label>缩放图数量：</label>
                                        <c:if test="${JdZooming!=null}">
                                        <select class="form-control" id="imgSelect"  onchange="addProdimg(this.options[this.options.selectedIndex].value)">
                                            <option ${JdZooming.size()==1?'selected':''}>1</option>
                                            <option ${JdZooming.size()==2?'selected':''}>2</option>
                                            <option ${JdZooming.size()==3?'selected':''}>3</option>
                                            <option ${JdZooming.size()==4?'selected':''}>4</option>
                                            <option ${JdZooming.size()==5?'selected':''}>5</option>
                                            <option ${JdZooming.size()==6?'selected':''}>6</option>
                                        </select>
                                        </c:if>
                                        <c:if test="${JdZooming.size()==0}">
                                            <select class="form-control" id="imgSelect"  onchange="addProdimg(this.options[this.options.selectedIndex].value)">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                            </select>
                                        </c:if>
                                    </div>
                                    <div class="row" >
                                        <!--一个款式-->
                                        <div class="col-md-4">
                                            <div class="form-group" id="zoomImg">
                                                <label>款式缩放图:</label>
                                            <c:if test="${JdZooming!=null}">
                                                <c:forEach var="i" begin="1" end="${JdZooming.size()}" step="1">
                                                <input type="file" id="img${i}" name="img" onchange="checkImg(this)"/>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${JdZooming.size()==0}">
                                                <input type="file" id="img1" name="img" onchange="checkImg(this)"/>
                                            </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <!--框内-->
                            </div>
                        </div>

                        <!--框二-->
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    款式缩放图展示
                                </div>
                                <div class="panel-body">
                                    <div class="row" id="showImg">
                                    <c:if test="${JdZooming!=null}">
                                        <c:forEach var="i" begin="1" end="${JdZooming.size()}" step="1">
                                        <div class="col-md-6">
                                            <label>款式${i}图片:</label>
                                            <img id="showImg${i}" src="${pageContext.request.contextPath}/upload/${JdZooming[i-1].img}" height="260" width="180"/>
                                        </div>
                                        </c:forEach>
                                    </c:if>
                                    <%--<c:if test="${JdZooming.size()==0}">--%>
                                            <%--<div class="col-md-6">--%>
                                                <%--<label>款式1图片:</label>--%>
                                                <%--<img id="showImg1" src="" height="260" width="180"/>--%>
                                            <%--</div>--%>
                                    <%--</c:if>--%>
                                    </div>


                                    <!--框内-->
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /. ROW  -->
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <center>
            <p class="help-block" id="zoomImgInfo" style="display:none">
                <img src="images/sign_up1.png" width="18" height="18">
                <input type="text" readonly style="background:transparent;border:0;">
            </p>
                <c:if test="${JdZooming!=null}">
                    <c:forEach var="i" begin="1" end="${JdZooming.size()}" step="1">
                <input type="hidden" name="zoomimgid" value="${JdZooming[i-1].zoomimgid}" >
                    </c:forEach>
                </c:if>
                <input type="hidden" name="proid" value="${proid}">
                <input type="hidden" name="pimgid" value="${pimgid}" >
                <input type="submit" value="提交" class="btn btn-info btn-lg">
                <a href="/Jd/s_selectP?proid=${proid}&pimgid=${pimgid}" class="btn btn-danger btn-lg">返回</a>
            </center>
            </form>
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
