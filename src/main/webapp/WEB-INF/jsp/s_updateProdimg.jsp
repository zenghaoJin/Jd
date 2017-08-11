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
    <title>修改商品款式</title>
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
                var val2 = this.value;
                var str = /(?:jpg|gif|png|jpeg)$/;
                var num = $(this).parent().parent().attr("id");
                num = num.substr(num.length-1,1);
                    if(val2.length>0&&val2!=""){
                        if(!str.test(val2)){
                            $("#num"+num).find("img").attr("src","");
                            $("#prodImgInfo1").show();
                            $("#prodImgInfo1 input").show();
                            $("#prodImgInfo1 img").attr('src', 'images/sign_up2.png');
                            $("#prodImgInfo1 input").val("款式"+num+"的图片格式有误").css("color", "#FF0000");
                            $(":input[name='img']").parent().next().next().attr("src","");
                            return false;
                        }
                    }else{
                        $("#num"+num).find("img").attr("src","");
                        $("#prodImgInfo1").show();
                        $("#prodImgInfo1 input").show();
                        $("#prodImgInfo1 img").attr('src', 'images/sign_up2.png');
                        $("#prodImgInfo1 input").val("款式"+num+"的图片未填").css("color", "#FF0000");
                        return false;
                    }
            })
            $(":input[name='iname']").each(function(){
                var num2 = $(this).parent().parent().attr("id");
                num2 = num2.substr(num2.length-1,1);
                if(!($(this).val().length>0)){
                    $("#prodImgInfo2").show();
                    $("#prodImgInfo2 input").show();
                    $("#prodImgInfo2 img").attr('src', 'images/sign_up2.png');
                    $("#prodImgInfo2 input").val("款式"+num2+"简介未填").css("color", "#FF0000");
                    return false;
                }else{
                    if(!($(this).val().length<=10)){
                        $("#prodImgInfo2").show();
                        $("#prodImgInfo2 input").show();
                        $("#prodImgInfo2 img").attr('src', 'images/sign_up2.png');
                        $("#prodImgInfo2 input").val("款式"+num2+"简介格式有误").css("color", "#FF0000");
                        return false;
                    }
                }
            })
            if(!$("#prodImgInfo1").is(":hidden")||!$("#prodImgInfo2").is(":hidden")){
                return false;
            }
        }
        function addProdimg (v){
//            alert(v);
//            alert($("#prodImg").children("div").length)
            if($(":input[name='img']").length<v){
                var num = Number($(":input[name='img']").length)+1;
                for(; num<=v;num++){
                    $("#prodImg").append("<div class='col-md-4'>"+
                    "<div class='panel panel-default'>"+
                        "<div class='panel-heading'>"+
                        "款式"+num+
                        "</div>"+
                        "<div class='panel-body'>"+
                        "<div class='row'>"+
                        "<div class='col-md-12' id='num"+num+"'>"+
                        "<div class='form-group'>"+
                        "<label>款式"+num+"图片:</label>"+
                    "<input type='file' name='img' onchange='checkImg(this)'/>"+
                        "</div>"+
                        "<div class='form-group input-group'>"+
                        "<span class='input-group-addon'>款式"+num+"简介：</span>"+
                    "<input type='text' class='form-control' name='iname' onfocus='checkImg2()' onblur='checkImg3(this.value,this)'>"+
                        "</div>"+
                        "<img src='' height='360' width='280'/>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>");
                }
            }else{
                var num = Number($(":input[name='img']").length);
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
        function checkImg(v) {
            var num = $(v).parent().parent().attr("id");
            num = num.substr(num.length-1,1);
            var val = v.value;
            var str = /(?:jpg|gif|png|jpeg)$/;
            if(val.length>0&&val!=""){
            if(str.test(val)){
                doUpload(num-1);
                $("#prodImgInfo1").hide();
                $("#prodImgInfo1 input").hide();
            }else{
                $("#num"+num).find("img").attr("src","");
                $("#prodImgInfo1").show();
                $("#prodImgInfo1 input").show();
                $("#prodImgInfo1 img").attr('src', 'images/sign_up2.png');
                $("#prodImgInfo1 input").val("款式"+num+"的图片格式有误").css("color", "#FF0000");
            }
            }else{
                $("#prodImgInfo1").show();
                $("#prodImgInfo1 input").show();
                $("#prodImgInfo1 img").attr('src', 'images/sign_up2.png');
                $("#prodImgInfo1 input").val("款式"+num+"的图片未填").css("color", "#FF0000");
            }
        }
        function checkImg2() {
            $("#prodImgInfo2").show();
            $("#prodImgInfo2 input").show();
            $("#prodImgInfo2 img").attr('src','images/sign_up1.png');
            $("#prodImgInfo2 input").val("款式简介最大长度为10").css("color","#8d8a8a");
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
                $("#prodImgInfo2 input").val("款式"+num+"简介格式有误").css("color", "#FF0000");
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
//                    alert(Json.img)
                    $("#num"+(Number(v)+1)).find("img").attr("src","${pageContext.request.contextPath}/upload/"+Json.img);
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
            <form  action="s_updateProdimgUI" method="post" enctype="multipart/form-data" onsubmit="return CheckPost();" id="uploadForm">
                <div class="row">
                    <div class="col-md-12">
                        <h2>增加商品页面</h2>
                        <h5>XX </h5>
                        <hr />
                        <div class="row" id="prodImg">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        设置款式
                                    </div>

                                    <div class="panel-body">
                                        <div class="form-group" >
                                            <label>款式数量：</label>
                                            <c:if test="${JdProdimg.size()!=null}">
                                                <select class="form-control" id="imgSelect"  onchange="addProdimg(this.options[this.options.selectedIndex].value)">
                                                    <option ${JdProdimg.size()==1?'selected':''}>1</option>
                                                    <option ${JdProdimg.size()==2?'selected':''}>2</option>
                                                    <option ${JdProdimg.size()==3?'selected':''}>3</option>
                                                    <option ${JdProdimg.size()==4?'selected':''}>4</option>
                                                    <option ${JdProdimg.size()==5?'selected':''}>5</option>
                                                    <option ${JdProdimg.size()==6?'selected':''}>6</option>
                                                </select>
                                            </c:if>
                                            <c:if test="${JdProdimg.size()==0}">
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
                                    </div>

                                </div>
                            </div>
            <c:if test="${JdProdimg!=null}">
                 <c:forEach var="i" begin="0" end="${JdProdimg.size()-1}" step="1">
                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        款式${i+1}
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <!--一个款式-->
                                            <div class="col-md-12" id="num${i+1}">
                                                <div class="form-group">
                                                    <label>款式${i+1}图片:</label>
                                                    <input type="file" name="img" onchange="checkImg(this)"/>
                                                </div>
                                                <div class="form-group input-group">
                                                    <span class="input-group-addon">款式${i+1}简介：</span>
                                                    <input type="text" class="form-control" name="iname" value="${JdProdimg[i].iname}" onfocus="checkImg2()" onblur="checkImg3(this.value,this)">
                                                </div>
                                                <img src="${pageContext.request.contextPath}/upload/${JdProdimg[i].img}" height="360" width="280"/>
                                                <input type="hidden" name="pimgid" value="${JdProdimg[i].pimgid}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </c:if>


                        </div>
                    </div>
                    <!-- /. ROW  -->
                </div>
                <input type="hidden" name="proid" value="${JdProdimg[0].proid}">
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
                    <input type="submit" value="提交" class="btn btn-info btn-lg">
                    <a href="/Jd/s_selectP?proid=${JdProdimg[0].proid}&pimgid=${JdProdimg[0].pimgid}" class="btn btn-danger btn-lg">返回</a></center>
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
