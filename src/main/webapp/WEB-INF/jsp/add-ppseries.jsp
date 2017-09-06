<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/1
  Time: 18:15
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
        function CheckPost() {
            var size = $("#size").text();
            size = size.substr(5,size.length-8);
            if(size==0){
                $("#message").show();
                $("#message input").show();
                $("#message img").attr('src','images/sign_up2.png');
                $("#message input").val("该分类的商品数量不能为0").css("color","#c90011");
                return false;
            }
        }
        function add(v) {
            var bool = 0;
            var val = $(v).next().next();
            var size = $("#size").children(":first").text();
                size = size.substr(5,size.length-8);
            var id = val.attr("id");
                id = id.substr(3,id.length);
            $("#message").hide();
            $("#message input").hide();
//            alert("数量："+size)
//            alert("自己的id："+id)
            if($(v).next().next().is(":hidden")){
                $(v).next().next().show();
                $("#size").children(":first").text("你已经选了"+(Number(size)+1)+"个商品");
                $(":input[name='proids']").each(function () {
                    if($(this).val()==id){
                        bool = 1;
                    }
                })
                if(bool!=1){
                $("#size").append("<input type='hidden' name='proids' value='"+id+"'>")
                    bool = 0;
                }
            }else{
                $(v).next().next().hide();
                $("#size").children(":first").text("你已经选了"+(Number(size)-1)+"个商品");
                $(":input[name='proids']").each(function () {
                    if($(this).val()==id){
                        $(this).remove();
                    }
                })
            }
        }
        function page(num) {
            var formData = new FormData($( "#uploadForm" )[0]);
            $.ajax({
                url: "${pageContext.request.contextPath}/page?pagenum="+num ,  /*这是处理文件上传的servlet*/
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (val) {
                    var Json = eval("("+val+")")
//                    alert("当前页数"+Json.pagenum);
//                    alert("商品长度回显:"+Json.prods.length);
//                    alert("总页数"+Json.total);
                    $("#prod").empty();
                    for(var i=0;i<Json.prods.length;i++){
                        var bool = 0;
                        $("#prod").append("<div class='product-grid love-grid'>"+
                        "<a href='javascript:void(0);' onclick='add(this)'>"+
                            "<div class='more-product'><span></span></div>"+
                            "<div class='product-img b-link-stripe b-animate-go  thickbox'>"+
                            "<img src='${pageContext.request.contextPath}/upload/"+Json.prods[i].img+"' height='380' width='150'/>"+
                            "</div>"+
                            "</a>"+
                            "<div class='product-info simpleCart_shelfItem'>"+
                            "<div class='product-info-cust prt_name'>"+
                            "<h4>"+Json.prods[i].name+"</h4>"+
                            "<span class='item_price'>￥："+Json.prods[i].price+"元</span>"+
                        "</div>"+
                        "</div></div>")
                        $(":input[name='proids']").each(function () {
                            if($(this).val()==Json.prods[i].proid){
                                bool = 1;
                            }
                        })
                        if(bool=="1"){
                            $("#prod").children("div").append("<div id='num"+Json.prods[i].proid+"'style=''>"+
                            "<center>"+
                            "<img src='images/sign_up3.png'  height='40' width='40' />"+
                            "</center>"+
                            "</div>");
                        }
                        if(bool=="0"){
                            $("#prod").children("div").append("<div id='num"+Json.prods[i].proid+"' style='display:none'>"+
                                "<center>"+
                                "<img src='images/sign_up3.png'  height='40' width='40' />"+
                                "</center>"+
                                "</div>");
                        }
                    }
                    $("#page").empty();
                    alert(Json.total)
                    alert(Json.pagenum)
                    $("#page").append("<a href='javascript:void(0);' onclick='page(1)' class='btn btn-primary btn-xs'>首页</a>&nbsp")
                    if((Number(Json.pagenum)-1)>0){
                        $("#page").append("<a href='javascript:void(0);' onclick='page("+(Json.pagenum-1)+")' class='btn btn-default btn-xs'>上一页</a>&nbsp")
                    }else{
                        $("#page").append("<a href='javascript:void(0);' onclick='page(1)' class='btn btn-default btn-xs'>上一页</a>&nbsp")
                    }
                            for(var i=1;i<=Number(Json.total);i++){
                                if(Json.pagenum==(Number(i))){
                                    $("#page").append("<a href='javascript:void(0);' onclick='page("+(i)+")' class='btn btn-primary btn-xs'>"+(i)+"</a>&nbsp")
                                }else{
                                    $("#page").append("<a href='javascript:void(0);' onclick='page("+(i)+")' class='btn btn-default btn-xs'>"+(i)+"</a>&nbsp")
                                }
                            }
                    if((Number(Json.pagenum)+1)<=Json.total){
                        $("#page").append("<a href='javascript:void(0);' onclick='page("+(Number(Json.pagenum)+1)+")' class='btn btn-default btn-xs'>下一页</a>&nbsp")
                    }else{
                        $("#page").append("<a href='javascript:void(0);' onclick='page("+Json.total+")' class='btn btn-default btn-xs'>下一页</a>&nbsp")
                    }
                        $("#page").append("<a href='javascript:void(0);' onclick='page("+Json.total+")' class='btn btn-primary btn-xs'>尾页</a>")


//                    alert("proids的数目:"+$(":input[name='proids']").size())
//                    alert(Json.proids[0]);
//                    alert(Json.proids.length)
//                        $("#size").append("<input type='hidden' name='proids' value=''>")
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
                <li  >
                    <a   href="/Jd/update-pseries"><i class="fa fa-laptop fa-3x"></i>修改商品分类</a>
                </li>
                <li  >
                    <a class="active-menu"  href="/Jd/add_pseries"><i class="fa fa-square-o fa-3x"></i> 增加商品类别</a>
                </li>
                <li  >
                    <a   href="/Jd/push-pseries"><i class="fa fa-sitemap fa-3x"></i> 更新商品类别</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <form action="/Jd/add-ppseriesUI" method="post" onsubmit="return CheckPost();" id="uploadForm">
                <div class="col-md-12">
                    <h2>全部商品</h2>
                    <hr />
                    <!--补充区域-->
                    <div id="size">
                        <h5>你已经选了0个商品</h5>
                    </div>
                    <!--补充区域-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            设置类别
                        </div>
                        <div class="panel-body" id="prod">
                            <c:if test="${prods!=null}">
                                <c:forEach items="${prods}" var="prods">
                                    <div class="product-grid love-grid">
                                        <a href="javascript:void(0);" onclick="add(this)">
                                            <div class="more-product"><span></span></div>
                                            <div class="product-img b-link-stripe b-animate-go  thickbox">
                                                <img src="${pageContext.request.contextPath}/upload/${prods.zimg}" height="380" width="150"/>
                                            </div>
                                        </a>
                                        <div class="product-info simpleCart_shelfItem">
                                            <div class="product-info-cust prt_name">
                                                <h4>${prods.name}</h4>
                                                <span class="item_price">￥：${prods.price}元</span>
                                                <!--补充区域-->
                                            </div>
                                        </div>
                                        <div id="num${prods.proid}" style="display:none">
                                            <center>
                                        <img src="images/sign_up3.png"  height="40" width="40" />
                                            </center>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>

                            <input type="hidden" name="thid" value="${thid}">
                    <center>
                        <input  type="submit"  class="btn btn-info" value="确定" /><a href="/Jd/add_pseries" class="btn btn-info">返回</a>
                        <p class="help-block" id="message" style="display:none">
                            <img src="images/sign_up1.png" width="18" height="18">
                            <input type="text" readonly style="background:transparent;border:0;">
                        </p>
                    </center>
                </form>
                <!--分页插件-->
                <center>
                    <br>
                    <c:if test="${total>1}">
                    <div id="page">
                        <a href="javascript:void(0);" onclick="page(1)" class="btn btn-primary btn-xs">首页</a>
                        <c:if test="${page-1<=0}">
                            <a href="javascript:void(0);" onclick="page(1)" class="btn btn-default btn-xs">上一页</a>
                        </c:if>
                        <c:if test="${page-1>0}">
                            <a href="javascript:void(0);" onclick="page(${page-1})" class="btn btn-default btn-xs">上一页</a>
                        </c:if>
                <c:if test="${total!=null}">
                    <c:forEach var="i" begin="1" end="${total}" step="1">
                        <c:if test="${page==i}">
                            <a href="javascript:void(0);" onclick="page(${i})" class="btn btn-primary btn-xs">${i}</a>
                        </c:if>
                        <c:if test="${page!=i}">
                            <a href="javascript:void(0);" onclick="page(${i})" class="btn btn-default btn-xs">${i}</a>
                        </c:if>
                    </c:forEach>
                </c:if>
                        <c:if test="${page+1>total}">
                            <a href="javascript:void(0);" onclick="page(${total})" class="btn btn-default btn-xs">下一页</a>
                        </c:if>
                        <c:if test="${page+1<=total}">
                            <a href="javascript:void(0);" onclick="page(${page+1})" class="btn btn-default btn-xs">下一页</a>
                        </c:if>
                        <a href="javascript:void(0);" onclick="page(${total})" class="btn btn-primary btn-xs">尾页</a>
                    </div>
                    </c:if>
                </center>
            </div>
                </div>
            </div>
        </div>
</div>
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
