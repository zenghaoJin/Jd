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
            var money = $(":input[name='money']").val()
            var zprice = $(":input[name='zprice']").val()
            <%--alert(${zprice})--%>
            var length = $(":input[name='num']").size();
//            alert(length)
//            alert($("#head0").find(":input[name='pimgid']").val()==null)
            $("#message").hide();
            $(":input[name='num']").each(function(){
                if($(this).parent().parent().parent().find(":input[name='pimgid']").val()==null){
                    $("#message").show();
                    $("#message input").show();
                    $("#message img").attr('src', 'images/sign_up2.png');
                    $("#message input").val("商品的购买信息未选").css("color", "#FF0000");

                }
                if($(this).parent().parent().parent().find(":input[name='sizeid']").val()==null){
                    $("#message").show();
                    $("#message input").show();
                    $("#message img").attr('src', 'images/sign_up2.png');
                    $("#message input").val("商品的购买信息未选").css("color", "#FF0000");
                }
            })
            if(!$("#message").is(":hidden")){
                return false;
            }
            if(Number(money)<Number(zprice)){
                $("#message2").show();
                return false;
            }
        }
        function price(num,price,x){
            var str = /^([1-9]\d*|[0]{1,1})$/;
            var val = $(x).parent().find("[name='discount']").html()
            var oldnum = $(x).prev().val();
            if(str.test(num)) {
                $("#message").hide();
                $("#message input").hide();
//                alert("数量:"+num)//数量
//                alert("价格:"+price.text().substring(1, price.text().length))//价格
//                alert(val=="优惠：此商品没有折扣")
                if(val=="优惠：此商品没有折扣"){
                    if(num>oldnum){
                        var val2 = (num-oldnum) * price.text().substring(1, price.text().length)
                        $("#price").html(Number($("#price").html())+val2)
                        $("#price3").html(Number($("#price").html())-Number($("#price2").html()))
                        $(":input[name='zprice']").val($("#price3").html())
                        $(x).prev().val(num)
                    }else{
                        var val2 = (oldnum-num)*price.text().substring(1, price.text().length)
                        $("#price").html(Number($("#price").html())-val2)
                        $("#price3").html(Number($("#price").html())-Number($("#price2").html()))
                        $(":input[name='zprice']").val($("#price3").html())
                        $(x).prev().val(num)
                    }
                }else{
                    val = val.substring(3,val.length-1)
                    if(num>oldnum){
                        var val2 = (num-oldnum)*Number(price.text().substring(1, price.text().length))
                        var val3 = (num-oldnum)*Number(price.text().substring(1, price.text().length))*(val/10)
                        $("#price").html(Number($("#price").html())+val2)
                        $("#price2").html(Number($("#price2").html())+val3)
                        $("#price3").html(Number($("#price").html())-Number($("#price2").html()))
                        $(":input[name='zprice']").val($("#price3").html())
                        $(x).prev().val(num)
                    }else{
                        var val2 = (oldnum-num)*price.text().substring(1, price.text().length)
                        var val3 = (oldnum-num)*price.text().substring(1, price.text().length)*(val/10)
                        $("#price").html(Number($("#price").html())-val2)
                        $("#price2").html(Number($("#price2").html())-val3)
                        $("#price3").html(Number($("#price").html())-Number($("#price2").html()))
                        $(":input[name='zprice']").val($("#price3").html())
                        $(x).prev().val(num)
                    }
                }
            }else{
                $("#message").show();
                $("#message input").show();
                $("#message img").attr('src', 'images/sign_up2.png');
                $("#message input").val("商品数量填写有误").css("color", "#FF0000");
            }
        }
        function size(sizeid,v) {
            $(v).parent().find("a").each(function () {
                $(this).attr("style","");
            })
            $(v).attr("style","border:1px solid #cc0000;");
            $(v).parent().parent().parent().find(":input[name='sizeid']").remove()
            $(v).parent().parent().parent().append("<input type='hidden' name='sizeid' value='"+sizeid+"'>")
        }
        function change(pimgid,v) {
//            alert(pimgid)
            $.ajax({
                url: "${pageContext.request.contextPath}/selectSize?pimgid="+pimgid ,  /*这是处理文件上传的servlet*/
                type: 'POST',
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (val) {
                    var Json = eval("("+val+")")
//                    alert(Json.Jdsizes)
                    $(v).parent().parent().parent().find(":input[name='pimgid']").remove()
                    $(v).parent().parent().parent().append("<input type='hidden' name='pimgid' value='"+pimgid+"'>")
                    $(v).parent().find(":input[name='num']").nextAll("a").remove();
                    for(var i=0;i<Json.Jdsizes.length;i++){
                        $(v).parent().append("<a href='javascript:void(0);' onclick='size("+Json.Jdsizes[i].sizeid+",this)'><p class='qty'>&nbsp;&nbsp;"+Json.Jdsizes[i].size+"</p></a>")
                    }
                    $(v).parent().find("img").each(function () {
                        $(this).attr("style","");
                    })
                    $(v).children("img").attr("style","border:1px solid #cc0000;");
                }
            });
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
            <li><a href="/Jd/prod">首页</a></li>
            <li class="active">购物车</li>
        </ol>
        <!-- 		 <div class="cart-top">
                             <a href="index.html"><< home</a>
                 </div>	 -->

        <div class="col-md-9 cart-items">
        <c:if test="${prods!=null}">
            <h2 id="cartnum">我的购物车 (${prods.size()})</h2>
        </c:if>
            <c:if test="${prods==null}">
                <h2 id="cartnum">我的购物车 (0)</h2>
            </c:if>

            <form action="/Jd/Order" method = "post" id="onform" onsubmit="return CheckPost();">
            <script>$(document).ready(function(c) {
                $('.close1').each(function(){
                    $(this).on('click',function () {
                        var num = $(this).parent("div").find(":input[name='num']").val();
                        var price = $(this).parent("div").find(":input[name='num']").prev().prev().prev()
                            price = price.text().substring(1, price.text().length);
                        var discount = $(this).parent("div").find(":input[name='num']")
                            .parent().find("[name='discount']").html()
//                        alert(num)
//                        alert(price)
//                        alert(discount)
                        if(discount=="优惠：此商品没有折扣"){
                                var val = price * num;
                                $("#price").html(Number($("#price").html())-val)
                                $("#price3").html(Number($("#price").html())-Number($("#price2").html()))
                                $(":input[name='zprice']").val($("#price3").html())
                        }else{
                            var val = Number(price) * Number(num);
                            var val2 = Number(discount.substring(3,discount.length-1))/10 * Number(num) * Number(price);
                                $("#price").html(Number($("#price").html())-val)
                                $("#price2").html(Number($("#price2").html())-val2)
                                $("#price3").html(Number($("#price").html())-Number($("#price2").html()))
                                $(":input[name='zprice']").val($("#price3").html())
                        }

                        $(this).parent("div").remove()

                        $.ajax({
                            url: "${pageContext.request.contextPath}/delectCart?proid="+$(this).attr("name")+"&cid=${sessionScope.cid}" ,  /*这是处理文件上传的servlet*/
                            type: 'POST',
                            async: false,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success: function (val) {
                                var Json = eval("(" + val + ")")
                                $("#cart").text("购物车:("+Json.prodsnum+"件商品)").append("<img src='images/cart.png' alt=''/>");
                                $("#cartnum").text("我的购物车 ("+Json.prodsnum+")");

                            }
                        });
                    })
                })
//                $('.close1').on('click', function(c){
//                    $('.cart-header').fadeOut('slow', function(c){
//                        $('.cart-header').remove();
//                    });
//                });
            });
            </script>
            <c:if test="${prods.size()!=0&&prods!=null}">
                <c:forEach var="i" begin="0" end="${prods.size()-1}" step="1">
            <div class="cart-header" id="head${i}">
                <!--按钮-->
                <input type="hidden" name="proid" value="${prods[i].proid}">
                <div class="close1" id="close${i}" name="${prods[i].proid}"> </div>
                <div class="cart-sec">
                    <div class="cart-item cyc">
                        <img src="${pageContext.request.contextPath}/upload/${prods[i].zimg}"/>
                    </div>
                    <div class="cart-item-info">
                        <h3 >${prods[i].name}
                            <c:if test="${prods[i].discount<100}">
                            <span name="discount">优惠：</font>${prods[i].discount/10}折</span>
                            </c:if>
                            <c:if test="${prods[i].discount==100}">
                            <span name="discount">优惠：</font>此商品没有折扣</span>
                            </c:if>
                        </h3>
                        <c:if test="${Img!=null}">
                            <c:forEach var="j" begin="0" end="${Img.size()-1}" step="1">
                                <c:if test="${Img[j].proid==prods[i].proid}">
                        <a href="javascript:void(0);" onclick="change(${Img[j].pimgid},this)">
                            <img src="${pageContext.request.contextPath}/upload/${Img[j].img}" height="80" width="60" />
                        </a>&nbsp;&nbsp;
                        <%--<a href=""><img src="${pageContext.request.contextPath}/upload/${Img[j].img}" style="border:1px solid #cc0000;" height="80" width="60" /></a>&nbsp;&nbsp;--%>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <h4><span>￥</span>${prods[i].price}</h4>
                        <p class="qty">数量 ::</p>
                        <input type="hidden" name="oldnum" value="1">
                        <input min="1" type="number" name="num" value="1" class="form-control input-small" onchange="price($(this).val(),$(this).prev().prev().prev(),this)">
                        <br>尺寸：
                        <c:if test="${Img!=null}">
                            <c:set var="bool2" value="1"></c:set>
                            <c:forEach var="y" begin="0" end="${Img.size()-1}" step="1">
                        <c:if test="${Img[y].proid==prods[i].proid}">
                            <c:forEach var="z" begin="0" end="${Sizes.size()-1}" step="1">
                            <c:if test="${Img[y].pimgid==Sizes[z].pimgid&&bool2==1}">
                        <a href="javascript:void(0);" onclick="size(${Sizes[z].sizeid},this)"><p class="qty">&nbsp;${Sizes[z].size}</p></a>
                            </c:if>
                            </c:forEach>
                            <c:set var="bool2" value="0"></c:set>
                        </c:if>
                            </c:forEach>
                        </c:if>

                    </div>
                    <div class="clearfix"></div>
                    <div class="delivery">
                            <p>品牌：${prods[i].brand}</p>
                        <span>商品将再两到三天后寄出</span>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
                </c:forEach>
            </c:if>
        </div>


        <div class="col-md-3 cart-total">
            <a class="continue" href="/Jd/select">继续购物</a>
        <c:if test="${prods.size()!=0&&prods!=null}">
            <div class="price-details">
                <h2>账单</h2>
                <span>原价：</span>
                <span class="total" id="price">
            <c:set var="price" value="0"></c:set>
            <c:forEach var="i" begin="0" end="${prods.size()-1}" step="1">
                <c:set var="price" value="${price+prods[i].price}"></c:set>
            </c:forEach>
            <c:out value="${price}"></c:out>
        </c:if>
                </span>
                </span>
        <c:if test="${prods.size()!=0&&prods!=null}">
                <span>减免：</span>
                <span class="total" id="price2">
            <c:set var="zprice" value="0"></c:set>
            <c:forEach var="i" begin="0" end="${prods.size()-1}" step="1">
                    <c:set var="zprice" value="${zprice+prods[i].discount/100*prods[i].price}"></c:set>
            </c:forEach>
                <c:if test="${zprice==price}">
                    0
                </c:if>
                <c:if test="${zprice!=price}">
                <c:out value="${price-zprice}"></c:out>
                </c:if>

                </span>
                <div class="clearfix"></div>
            </div>
            <h4 class="last-price">折后价：</h4>
            <span class="total final" id="price3">
                <c:out value="${zprice}"></c:out>
            </span>
            <div class="clearfix"></div>
            <input type="hidden" name="zprice" value="${zprice}">
            <input type="hidden" value="${sessionScope.JdUser.money}" name="money">
            <a class="order" href="javascript:void(0)" onclick="$('#onform').submit()">支付</a>
            <div class="total-item" id="message" style="display:none">
                <img src="images/sign_up1.png" width="18" height="18">
                <input type="text" readonly style="background:transparent;border:0;">
             </div>
            <div class="total-item" id="message2" style="display:none">
                <h3>余额不足：</h3>
                <h4>请及时充值</h4>
                <a class="cpns" href="/Jd/money">充值</a>
            </div>
            </c:if>
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
