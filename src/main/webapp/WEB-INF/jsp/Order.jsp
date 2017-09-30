<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/6
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <title>购物车</title>
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
    <!-- start menu -->
    <script type="text/javascript">
        function CheckPost() {
            var address = $(":input[name='address']").val();
            var phonenum = $(":input[name='phonenum']").val();
            var name = $(":input[name='name']").val();
            var message = $(":input[name='message']").val();
            var str =/^1[34578]\d{9}$/;
            if(address.length<=0){
                $("#messageInfo").show();
                $("#messageInfo img").attr('src','images/sign_up2.png');
                $("#messageInfo input").val("收件人地址不能为空").css("color","#FF0000");
                return false;
            }
            if(phonenum.length<=0){
                $("#messageInfo").show();
                $("#messageInfo img").attr('src','images/sign_up2.png');
                $("#messageInfo input").val("收件人电话号码不能为空").css("color","#FF0000");
                return false;
            }
            if(name.length<=0){
                $("#messageInfo").show();
                $("#messageInfo img").attr('src','images/sign_up2.png');
                $("#messageInfo input").val("收件人称呼不能为空").css("color","#FF0000");
                return false;
            }
            if(!str.test(phonenum)){
                $("#messageInfo").show();
                $("#messageInfo img").attr('src','images/sign_up2.png');
                $("#messageInfo input").val("手机格式有误").css("color","#FF0000");
                return false;
            }
        }
        $(function(){
            if(${sessionScope.cid!=null}){
                var url = "${pageContext.request.contextPath}/selectProdsnum";
                var args = {"cid":${sessionScope.cid==null?0:sessionScope.cid},"time":new Date()};
                $.getJSON(url,args,function (date) {
                    var prodsnum = date.prodsnum;
                    $("#cart").text("购物车:("+prodsnum+"件商品)").append("<img src='images/cart.png' alt=''/>");
                })
            }
        });
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
            <div class="box_1" >
                <c:if test="${sessionScope.JdUser==null}">
                    <br>
                    <br>
                    <br>
                </c:if>
                <c:if test="${sessionScope.JdUser!=null}">
                    <a href="/Jd/cart?uid=${sessionScope.JdUser.uid}&cid=${sessionScope.cid==null?0:sessionScope.cid}">
                        <h3 id="cart"></h3></a>
                    <p><a href="/Jd/message?uid=${sessionScope.JdUser.uid}" class="simpleCart_empty">查看订单</a></p>
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
</div>

<!--header//-->
<div class="cart">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="men.html">首页</a></li>
            <li class="active">购物车</li>
        </ol>
        <!-- 		 <div class="cart-top">
                             <a href="index.html"><< home</a>
                 </div>	 -->

        <div class="col-md-8 cart-items">
            <c:if test="${JdProds!=null}">
                <h2 id="cartnum">我的订单 (${JdProds.size()})</h2>
            </c:if>
            <c:if test="${JdProds==null}">
                <h2 id="cartnum">我的订单 (0)</h2>
            </c:if>

            <form action="/Jd/OrderUI" method = "post" id="onform" onsubmit="return CheckPost();">
                <c:if test="${JdProds!=null}">
                <c:forEach var="i" begin="0" end="${JdProds.size()-1}" step="1">
                <input type="hidden" name="proid" value="${JdProds[i].proid}">
                <div class="cart-header" id="head${i}">
                    <div class="cart-sec">
                        <div class="cart-item cyc">
                            <img src="${pageContext.request.contextPath}/upload/${JdProds[i].zimg}"/>
                        </div>
                        <div class="cart-item-info">
                            <h3 >${JdProds[i].name}
                                <c:if test="${JdProds[i].discount<100}">
                                    <span name="discount">优惠：</font>${JdProds[i].discount/10}折</span>
                                </c:if>
                                <c:if test="${JdProds[i].discount==100}">
                                    <span name="discount">优惠：</font>此商品没有折扣</span>
                                </c:if>
                            </h3>
                            <img src="${pageContext.request.contextPath}/upload/${JdProdimg[i].img}" height="80" width="60" />&nbsp;&nbsp;
                            <h4><span>￥</span>${JdProds[i].price}</h4>
                            <p class="qty">数量 ::</p>
                            <input type="hidden" name="oldnum" value="1">
                            <input readonly="readonly" type="number" name="num" value="${num[i]}" class="form-control input-small" onchange="price($(this).val(),$(this).prev().prev().prev(),this)">
                            <br>尺寸：
                            <a href="javascript:void(0);" ><p class="qty">&nbsp;${JdSizes[i].size}</p></a>


                        </div>
                        <div class="clearfix"></div>
                        <div class="delivery">
                            <p>品牌：${JdProds[i].brand}</p>
                            <span>商品将再两到三天后寄出</span>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                </c:if>
        </div>

        <c:if test="${JdProds!=null}">
            <c:forEach var="i" begin="0" end="${JdProds.size()-1}" step="1">
                <input type="hidden" name="pimgid" value="${pimgid[i]}">
                <input type="hidden" name="sizeid" value="${sizeid[i]}">
            </c:forEach>
        </c:if>
        <div class="col-md-4 cart-total">
            <a class="continue" href="/Jd/select">退出订单，继续购物</a>
            <div class="subscribe">
                <h4>收件人信息：</h4>
                <input type="text" placeholder="地址" name="address"required="" />
                <input type="text" placeholder="手机号码" name="phonenum" value="${sessionScope.JdUser.phonenumber}" required="" />
                <input type="text" placeholder="收件人称呼" name="name"required="" />
                <input type="text" placeholder="备注信息" name="message" required="" />
            </div>
            <h4 class="last-price">折后价：</h4>
            <span class="total final" id="price3">
                ￥：${zprice}
            </span>
            <div class="clearfix"></div>
            <input type="hidden" name="zprice" value="${zprice}">
            <input type="hidden" value="${sessionScope.JdUser.uid}" name="uid">
            <a class="order" href="javascript:void(0)" onclick="$('#onform').submit()">支付</a>
            <div class="total-item" id="messageInfo" style="display:none">
                <img src="images/sign_up1.png" width="18" height="18">
                <input type="text" readonly style="background:transparent;border:0;">
            </div>
            </form>
        </div>
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
