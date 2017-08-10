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
        function CheckPost() {
            $(":input[name='img']").each(function(){
                var val = $(this).prev().prev().text().substring(2,3);
                var str = /(?:jpg|gif|png|jpeg)$/;
                if(!($(this).val().length>0)){
                    $("#imgInfo").show();
                    $("#imgInfo input").show();
                    $("#imgInfo img").attr('src', 'images/sign_up2.png');
                    $("#imgInfo input").val("款式"+val+"的缩放图未填满").css("color", "#FF0000");
                    return false;
                }else{
                    if(!str.test($(this).val())){
                        $("#imgInfo").show();
                        $("#imgInfo input").show();
                        $("#imgInfo img").attr('src', 'images/sign_up2.png');
                        $("#imgInfo input").val("款式"+val+"的缩放图格式有误").css("color", "#FF0000");
                        return false;
                    }
                }
            })
            if(!$("#imgInfo").is(":hidden")){
                return false;
            }
        }
        function addProdimg(x,v) {
//            alert($(x).parent().next().find("input[type='file']").length);
//            alert(v);
//            alert($(x).parent().next().find("input[type='hidden']").val())
            $(x).parent().next().find("input[type='hidden']").val(v)
            if($(x).parent().next().find("input[type='file']").length<v){
                var num = $(x).parent().next().find("input[type='file']").length;
                for(; num<v;num++){
                    $(x).parent().next().find("input[type='file']").parent().append("" +
                        "<input type='file' name='img' onchange='checkImg(this)'/>")
                }
            }else{
                var num = $(x).parent().next().find("input[type='file']").length;
                for(;v<num;num--){
                    $(x).parent().next().find("input[type='file']").parent().children("input:last-child").remove();
                }
            }
        }
        function checkImg(x) {
            var val2 = $(x).prev().prev().text().substring(2,3);
            var val = $(x).val();
            var str = /(?:jpg|gif|png|jpeg)$/;
            if(str.test(val)) {
                $("#imgInfo").hide();
                $("#imgInfo input").hide();
            }else{
                $("#imgInfo").show();
                $("#imgInfo input").show();
                $("#imgInfo img").attr('src', 'images/sign_up2.png');
                $("#imgInfo input").val("款式"+val2+"的缩放图格式有误").css("color", "#FF0000");
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
                    <a  href="/Jd/s_table?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-table fa-3x"></i>订单明细</a>
                </li>
                <li  >
                    <a  href="/Jd/s_select?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-edit fa-3x"></i> 查看自己 </a>
                </li>
                <li  >
                    <a   href="/Jd/s_update"><i class="fa fa-laptop fa-3x"></i> 个人信息</a>
                </li>
                <li  >
                    <a class="active-menu"  href="/Jd/addProd"><i class="fa fa-square-o fa-3x"></i> 增加商品页面</a>
                </li>
            </ul>

        </div>

    </nav>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <form  action="/Jd/addProdUI2" method="post" enctype="multipart/form-data" onsubmit="return CheckPost();">
                <div class="row">
                    <div class="col-md-12">
                        <h2>款式缩放图页面</h2>
                        <h5>XX </h5>
                        <hr />
                        <div class="row">
                                <c:if test="${length!=null}">
                                <c:forEach var="i" begin="1" end="${length}" step="1">
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        设置款式缩放图
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group" >
                                            <label><font color="#6a5acd">款式${i}</font>压缩图数量：</label>
                                        <select class="form-control" onchange="addProdimg(this,this.options[this.options.selectedIndex].value)">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                        </select>
                                        </div>
                                        <div class="row" >
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>款式${i}压缩图:</label>
                                                    <input type="hidden" name="imgLength" value="1"/>
                                                    <input type="file" name="img" onchange="checkImg(this)"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </c:forEach>
                                </c:if>
                                <c:if test="${proimgID!=null}">
                                    <c:forEach items="${proimgID}" var="proimgIDs">
                                        <input type="hidden" name="proimgID" value="${proimgIDs}"/>
                                    </c:forEach>
                                </c:if>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                </div>
                <center>
                <p class="help-block" id="imgInfo" style="display:none">
                    <img src="images/sign_up1.png" width="18" height="18">
                    <input type="text" readonly style="background:transparent;border:0;">
                </p>
                <input type="submit" value="提交" class="btn btn-info btn-lg"></center>
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
