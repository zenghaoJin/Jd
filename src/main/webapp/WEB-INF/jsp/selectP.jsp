<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/6
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浏览商品</title>
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
        function addCart(uid,cid,proid){
            var url = "${pageContext.request.contextPath}/addcart";
            var args = {"uid":uid,"cid":cid,"proid":proid,"time":new Date()};
//            alert($("#cart").text().substring(5,$("#cart").text().length-4))
            var num = $("#cart").text().substring(5,$("#cart").text().length-4);
            $.getJSON(url,args,function (date) {
                if(date.message=="0"){
                    $("#cartInfo").show();
                    $("#cartInfo img").attr('src','images/sign_up2.png');
                    $("#cartInfo input").val("商品已经在购物车内").css("color","#FF0000");
                }else{
                    $("#cartInfo").show();
                    $("#cartInfo img").attr('src','images/sign_up3.png');
                    $("#cartInfo input").val("添加成功").css("color","#5fff3a");
                    $("#cart").text("购物车:("+(Number(num)+1)+"件商品)").append("<img src='images/cart.png' alt=''/>");
                }
            })
        }
    </script>
</head>
<body>
<!--header-->
<div class="header2 text-center">
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
            <div class="box_1">
                <c:if test="${sessionScope.JdUser==null}">
                    <br>
                    <br>
                    <br>
                </c:if>
                <c:if test="${sessionScope.JdUser!=null}">
                    <a href="/Jd/cart?uid=${sessionScope.JdUser.uid}&cid=${sessionScope.cid==null?0:sessionScope.cid}"><h3 id="cart"></h3></a>
                    <p><a href="javascript:;" class="simpleCart_empty">空购物车</a></p>
                </c:if>
            </div>

            <div class="clearfix"></div>
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
</div>
<!--header//-->
<!--Single Page starts Here-->
<div class="product-main">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/Jd/select">所有商品</a></li>
            <li class="active">商品浏览</li>
        </ol>

        <div class="ctnt-bar cntnt">
            <div class="content-bar">
                <div class="single-page">
                    <!--Include the Etalage files-->
                    <link rel="stylesheet" href="css/etalage.css">
                    <script src="js/jquery.etalage.min.js"></script>
                    <!-- Include the Etalage files -->
                    <script>
                        jQuery(document).ready(function($){

                            $('#etalage').etalage({
                                thumb_image_width: 300,
                                thumb_image_height: 400,
                                source_image_width: 700,
                                source_image_height: 800,
                                show_hint: true,
                                click_callback: function(image_anchor, instance_id){
                                    alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
                                }
                            });
                            // This is for the dropdown list example:
                            $('.dropdownlist').change(function(){
                                etalage_show( $(this).find('option:selected').attr('class') );
                            });

                        });
                    </script>
                    <!--//details-product-slider-->
                    <div class="details-left-slider">
                        <ul id="etalage">
                            <c:if test="${jdZoomimgs.size()!=0}">
                                <c:forEach items="${jdZoomimgs}" var="jdZoomimgs">
                                    <li>
                                        <a href="optionallink.html">
                                            <img class="etalage_thumb_image" src="${pageContext.request.contextPath}/upload/${jdZoomimgs.img}" />
                                            <img class="etalage_source_image" src="${pageContext.request.contextPath}/upload/${jdZoomimgs.img}" />
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${jdZoomimgs.size()==0}">
                                <li>
                                    <a href="optionallink.html">
                                        <img class="etalage_thumb_image" src="${pageContext.request.contextPath}/upload/${prod.zimg}" />
                                        <img class="etalage_source_image" src="${pageContext.request.contextPath}/upload/${prod.zimg}" />
                                    </a>
                                </li>
                            </c:if>

                            <div class="clearfix">
                            </div>
                        </ul>
                    </div>
                    <div class="details-left-info">
                        <c:if test="${prod!=null&&jdProdName!=null}">
                            <h2>${jdProdName}</h2>
                            <h4>温馨提示·支持7天无理由退货 </h4>
                            <font color="#b5b5b5" size="4">Sp价格：</font>
                            <font color="#ff0000" size="4">￥&nbsp;</font>
                            <font color="#ff0000" size="5">${prod.price}</font><br><br>
                            <font color="#b5b5b5" size="5">品牌：</font>${prod.brand}<br>
                            <c:if test="${prod.discount<100}">
                                <br>
                                <font color="#b5b5b5" size="5">优惠：</font>${prod.discount/10}折
                            </c:if>
                            <c:if test="${prod.discount==100}">
                                <br>
                                <font color="#b5b5b5" size="5">优惠：</font>此商品没有折扣
                            </c:if>
                            <div class="flower-type">
                                <p>尺寸  ::
                                    <c:if test="${size!=null}">
                                        <c:forEach items="${size}" var="size">
                                            ${size.size}&nbsp;(存量：${size.number})&nbsp;&nbsp;
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${size.size()==0}">
                                        目前没有存货
                                    </c:if>
                                </p>

                                <p>款式  ::
                                    <c:if test="${jdProdimg!=null}">
                                        <%--<c:forEach items="${jdProdimg}" var="jdProdimg">--%>
                                        <c:if test="${pimgid==null}">
                                            <a href="/Jd/selectP?proid=${prod.proid}&pimgid=${jdProdimg[0].pimgid}"><img src="${pageContext.request.contextPath}/upload/${jdProdimg[0].img}" style="border:1px solid #cc0000;" height="80" width="60" /></a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:forEach var="i" begin="${pimgid==null?1:0}" end="${jdProdimg.size()-1}" step="1">
                                            <c:if test="${pimgid==jdProdimg[i].pimgid}">
                                                <a href="/Jd/selectP?proid=${prod.proid}&pimgid=${jdProdimg[i].pimgid}"><img src="${pageContext.request.contextPath}/upload/${jdProdimg[i].img}" style="border:1px solid #cc0000;" height="80" width="60" /></a>&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${pimgid!=jdProdimg[i].pimgid}">
                                                <a href="/Jd/selectP?proid=${prod.proid}&pimgid=${jdProdimg[i].pimgid}"><img src="${pageContext.request.contextPath}/upload/${jdProdimg[i].img}" height="80" width="60" /></a>&nbsp;&nbsp;
                                            </c:if>
                                        </c:forEach>
                                        <%--</c:forEach>--%>
                                    </c:if>
                                </p>
                            </div>
                            <h3>商品信息  ::</h3>
                            <p class="desc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${prod.promessage}</p>
                            <c:if test="${sessionScope.JdUser!=null}">
                            <div class="btn_form">
                                <a href="javascript:void(0);" onclick="addCart(${sessionScope.JdUser.uid},${sessionScope.cid},${prod.proid})">加入购物车</a>
                            </div>
                            </c:if>
                            <c:if test="${sessionScope.JdUser==null}">
                                <div class="btn_form">
                                    <a href="/Jd/login">请登录后，加入购物车</a>
                                </div>
                            </c:if>
                            <p class="help-block" id="cartInfo" style="display:none">
                                <img src="images/sign_up1.png" width="18" height="18">
                                <input type="text" readonly style="background:transparent;border:0;">
                            </p>
                        </c:if>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--fotter-->
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
