<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/7/29
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,200,600,800,700,500,300,100,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Arimo:400,700,700italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="New Fashions Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"
    />
    <script src="js/jquery.min2.js"></script>
    <script src="js/simpleCart.min.js"> </script>
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
    <!-- start menu -->
    <script type="text/javascript">
        $(function(){
            if(${sessionScope.cid!=null}){
                var url = "${pageContext.request.contextPath}/selectProdsnum";
                var args = {"cid":${sessionScope.cid},"time":new Date()};
                $.getJSON(url,args,function (date) {
                    var prodsnum = date.prodsnum;
                    $("#cart").text("购物车:("+prodsnum+"件商品)").append("<img src='images/cart.png' alt=''/>");
                })}
        });
    </script>

</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <div class="main-header">
            <div class="carting">
                <c:if test="${sessionScope.JdUser==null}">
                    <ul><li><a href="/Jd/login">登录/注册</a></li></ul>
                </c:if>
                <c:if test="${sessionScope.JdUser!=null}">
                    <ul><li><h4>欢迎!<a href="/Jd/update">${sessionScope.JdUser.name}</a></h4></li></ul>
                </c:if>
            </div>
            <div class="logo">
                <h3><a href="/Jd/prod">NEW FASHIONS</a></h3>
            </div>
            <div class="box_1" >
                <c:if test="${sessionScope.JdUser==null}">
                    <br>
                    <br>
                    <br>
                </c:if>
                <c:if test="${sessionScope.JdUser!=null}">
                    <a href="/Jd/cart?uid=${sessionScope.JdUser.uid}&cid=${sessionScope.cid==null?0:sessionScope.cid}">
                        <h3 id="cart"></h3>
                    </a>
                    <p><a href="javascript:;" class="simpleCart_empty">空购物车</a></p>
                </c:if>
            </div>

        </div>
        <!-- start header menu -->

        <ul class="megamenu skyblue">
            <li class="active grid"><a class="color1" href="/Jd/prod">首页</a></li>
            <!--循环一-->
            <c:if test="${JdMclass!=null}">
                <c:forEach var="i" begin="0" end="${JdMclass.size()-1}" step="1">
            <li class="grid"><a href="/Jd/select?mid=${JdMclass[i].mid}">${JdMclass[i].name}</a>
                <div class="megapanel">
                    <div class="row">
                    <c:if test="${JdTwoclass!=null}">
                        <c:forEach var="j" begin="0" end="${JdTwoclass.size()-1}" step="1">
                            <c:if test="${JdTwoclass[j].mid==JdMclass[i].mid}">
                        <div class="col1">
                            <div class="h_nav">
                                <h4>${JdTwoclass[j].name}</h4>
                                <c:forEach var="z" begin="0" end="${JdThreeclass.size()-1}" step="1">
                                    <c:if test="${JdTwoclass[j].tid==JdThreeclass[z].tid}">
                                    <ul>
                                        <li><a href="/Jd/select?thid=${JdThreeclass[z].thid}">${JdThreeclass[z].name}</a></li>
                                    </ul>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col1"></div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    </div>
                </div>
            </li>
                </c:forEach>
            </c:if>
        </ul>
    </div>
    <div class="caption">
        <h1>FASHION AND CREATIVITY</h1>
        <p>Sed dapibus est a lorem dictum, id dignissim lacus fermentum. Nulla ut nibh in libero maximus pretium
            Nunc vulputate vel tellus ac elementum. Duis nec tincidunt dolor, ac dictum eros.</p>
    </div>
</div>
<!--品牌-->
<div class="categoires">
    <div class="container">
        <a href="#"><div class="col-md-4 sections fashion-grid-a">
            <h4>Nike</h4>
            <p>dignissim</p>
        </div></a>
        <a href="#"><div class="col-md-4 sections fashion-grid-b">
            <h4>阿迪达斯</h4>
            <p>fermentum</p>
        </div></a>
        <a href="#"><div class="col-md-4 sections fashion-grid-c">
            <h4>特步</h4>
            <p>vulputate</p>
        </div></a>
    </div>
</div>
<!---->
<div class="features" id="features">
    <div class="container">
        <div class="tabs-box">
            <ul class="tabs-menu">
                <li><a href="#tab1">男装</a></li>
                <li><a href="#tab2">女装</a></li>
                <li><a href="#tab3">童装</a></li>
            </ul>
            <div class="clearfix"> </div>
            <!-- 			<div class="more-product-info"><span>NEW</span></div>右上角新品	 -->
            <div class="tab-grids">
                <div id="tab1" class="tab-grid1">
                    <!--表单一-->
                    <div class="product-grid">
                        <a href="single.html">
                            <div class="more-product-info">
                                <div class="more-product-info"></div>
                            </div>
                            <div class="product-img b-link-stripe b-animate-go  thickbox">
                                <img src="images/bs2.jpg" class="img-responsive" alt=""/>
                                <div class="b-wrapper">
                                    <h4 class="b-animate b-from-left  b-delay03">
                                        <button class="btns">ORDER NOW</button>
                                    </h4>
                                </div>
                            </div>
                        </a>
                        <div class="product-info simpleCart_shelfItem">
                            <div class="product-info-cust prt_name">
                                <img src="images/bs2.jpg"  height="40" width="40" />
                                <h4>名字</h4>
                                <span class="item_price">￥：钱元</span>
                            </div>
                        </div>
                    </div>

                </div>

                <!--表单二-->
                <div id="tab2" class="tab-grid2">
                    <div class="product-grid">
                        <a href="single.html">
                        <div class="more-product-info"></div>
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <img src="images/bs2.jpg" class="img-responsive" alt=""/>
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <button class="btns">ORDER NOW</button>
                                </h4>
                            </div>
                        </div>
                        </a>
                        <div class="product-info simpleCart_shelfItem">
                            <div class="product-info-cust prt_name">
                                <img src="images/bs2.jpg"  height="40" width="40" />
                                <br>
                                <h4>名字</h4>
                                <span class="item_price">￥：钱元</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!--表单三-->
                <div id="tab3" class="tab-grid3">
                    <div class="product-grid">
                        <a href="single.html">
                        <div class="more-product-info"><span>NEW</span></div>
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <img src="images/bs2.jpg" class="img-responsive" alt=""/>
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <button class="btns">ORDER NOW</button>
                                </h4>
                            </div>
                        </div>
                        </a>
                        <div class="product-info simpleCart_shelfItem">
                            <div class="product-info-cust prt_name">
                                <img src="images/bs2.jpg"  height="40" width="40" />
                                <h4>名字</h4>
                                <span class="item_price">￥：钱元</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- tabs-box -->
        <!-- Comman-js-files -->
        <script>
            $(document).ready(function() {
                $("#tab2").hide();
                $("#tab3").hide();
                $(".tabs-menu a").click(function(event){
                    event.preventDefault();
                    var tab=$(this).attr("href");
                    $(".tab-grid1,.tab-grid2,.tab-grid3").not(tab).css("display","none");
                    $(tab).fadeIn("slow");
                });
                $("ul.tabs-menu li a").click(function(){
                    $(this).parent().addClass("active a");
                    $(this).parent().siblings().removeClass("active a");
                });
            });
        </script>
        <!-- Comman-js-files -->
    </div>
</div>
<!--fotter//-->
<div class="fotter-logo">
    <div class="container">
        <div class="ftr-logo"><h3><a href="index.html">NEW FASHIONS</a></h3></div>
        <div class="ftr-info">
            <p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
        </div>	 <div class="clearfix"></div>
    </div>
</div>
<!--fotter//-->

</body>
</html>
