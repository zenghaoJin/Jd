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
        function Changeimg(x,v) {
            $(v).parent().parent().prev().find("img").attr("src",x);
        }
        function page(num) {
            <%--alert(${sessionScope.jdStores.stoid})--%>
            $.ajax({
                url: "${pageContext.request.contextPath}/s_page?pagenum="+num+"&stoid=${sessionScope.jdStores.stoid}" ,  /*这是处理文件上传的servlet*/
                type: 'POST',
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (val) {
                    var Json = eval("("+val+")")
//                    alert("当前页数"+Json.pagenum);
//                    alert("商品长度回显:"+Json.prods.length);
//                    alert("总页数"+Json.total);
                    $("#prods").empty();
                    for(var i=0;i<Json.prods.length;i++){
                        $("#prods").append(
                            "<div class='product-grid love-grid'>"+
                                "<a href='/Jd/selectP?proid="+Json.prods[i].proid+"'>"+
                                    "<div class='more-product'><span> </span></div>"+
                            "<div class='product-img b-link-stripe b-animate-go  thickbox'>"+
                                    "<img src='${pageContext.request.contextPath}/upload/"+Json.prods[i].zimg+"' height='380' width='150'/>"+
                            "<div class='b-wrapper'>"+
                                        "<h4 class='b-animate b-from-left  b-delay03'>"+
                                        "<button class='btns'>查看商品</button>"+
                                        "</h4>"+
                            "</div>"+
                            "</div>"+
                                "</a>"+
                            "<div class='product-info simpleCart_shelfItem'>"+
                            "<div class='product-info-cust prt_name'>"+"<h4>"+Json.prods[i].name+"</h4>"+
                                "<span class='item_price'>￥："+Json.prods[i].price+"元</span>"+
                            "</div>"+
                            "</div>"+
                            "</div>")
                        for(var j=0;j<Json.Img.length;j++){
                            var v = $("#prods").children("div");
                            for(var z=0;z<i;z++){
                                v = v.next();
                            }
                            v = v.children("div").children("div");
                            if(Json.prods[i].proid==Json.Img[j].proid){
                                v.prepend("<img src='${pageContext.request.contextPath}/upload/"+Json.Img[j].img+"'onmousemove='Changeimg($(this).attr('src'),this)' height='40' width='40' />");
                            }
                        }
                    }

                    $("#page").empty();
//                    alert(Json.total)
//                    alert(Json.pagenum)
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
                    <a  class="active-menu" href="/Jd/s_select?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-edit fa-3x"></i> 查看自己的商品 </a>
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
            <div class="row">
                <div class="col-md-12">
                    <h2>浏览商品</h2>
                    <hr />
                    <!--补充区域-->
                    补充区域
                    <!--补充区域-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            所有商品信息
                        </div>
                        <div class="panel-body" id="prods">
                            <c:if test="${prods!=null}">
                                <c:forEach items="${prods}" var="prods">
                            <div class="product-grid love-grid">
                                <a href="/Jd/s_selectP?proid=${prods.proid}">
                                    <div class="more-product"><span> </span></div>
                                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                                        <img src="${pageContext.request.contextPath}/upload/${prods.zimg}" height="380" width="150"/>
                                        <div class="b-wrapper">
                                            <h4 class="b-animate b-from-left  b-delay03">
                                                <button class="btns">查看商品</button>
                                            </h4>
                                        </div>
                                    </div>
                                </a>
                                <div class="product-info simpleCart_shelfItem">
                                    <div class="product-info-cust prt_name">
                                    <c:if test="${Img!=null}">
                                        <c:forEach items="${Img}" var="imgs">
                                            <c:if test="${imgs.proid==prods.proid}">
                                        <img src="${pageContext.request.contextPath}/upload/${imgs.img}"  onmousemove="Changeimg($(this).attr('src'),this)" height="40" width="40" />
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                        <h4>${prods.name}</h4>
                                        <span class="item_price">￥：${prods.price}元</span>
                                        <!--补充区域-->
                                    </div>
                                </div>
                            </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
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
    <!-- /. ROW  -->
</div>
<!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
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
