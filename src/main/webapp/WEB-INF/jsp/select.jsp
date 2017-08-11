<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/6
  Time: 0:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部商品</title>
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
    function price(price,pagenum) {
        var mid = $(":input[name='mid']").val();
        var tid = $(":input[name='tid']").val();
        var thid = $(":input[name='thid']").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/select_price?pagenum="+pagenum+"&price="+price+"&mid="+mid+"&tid="+tid+"&thid="+thid ,  /*这是处理文件上传的servlet*/
            type: 'POST',
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (val) {
                var Json = eval("("+val+")")
            $("#prods").empty();
        for(var i=0;i<Json.prods.length;i++){
            $("#prods").append(
                "<div class='product-grid love-grid'>"+
                "<a href='/Jd/selectP?proid="+Json.prods[i].proid+"'>"+
                "<div class='more-product'><span> </span></div>"+
                "<div class='product-img b-link-stripe b-animate-go  thickbox'>"+
                "<img src='${pageContext.request.contextPath}/upload/"+Json.prods[i].zimg+"' height='340' width='130'/>"+
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
        $("#page").append("<a href='javascript:void(0);' onclick='price(price,1)' class='btn btn-primary btn-xs'>首页</a>&nbsp")
        if((Number(Json.pagenum)-1)>0){
            $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+(Json.pagenum-1)+")' class='btn btn-default btn-xs'>上一页</a>&nbsp")
        }else{
            $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+1+")' class='btn btn-default btn-xs'>上一页</a>&nbsp")
        }
        for(var i=1;i<=Number(Json.total);i++){
            if(Json.pagenum==(Number(i))){
                $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+i+")' class='btn btn-primary btn-xs'>"+(i)+"</a>&nbsp")
            }else{
                $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+i+")' class='btn btn-default btn-xs'>"+(i)+"</a>&nbsp")
            }
        }
        if((Number(Json.pagenum)+1)<=Json.total){
            $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+(Number(Json.pagenum)+1)+")' class='btn btn-default btn-xs'>下一页</a>&nbsp")
        }else{
            $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+Json.total+")' class='btn btn-default btn-xs'>下一页</a>&nbsp")
        }
        $("#page").append("<a href='javascript:void(0);' onclick='price("+price+","+Json.total+")' class='btn btn-primary btn-xs'>尾页</a>")
            }
    })}
    function Changeimg(x,v) {
    $(v).parent().parent().prev().find("img").attr("src",x);
    }
    function page(num) {
        var mid = $(":input[name='mid']").val();
        var tid = $(":input[name='tid']").val();
        var thid = $(":input[name='thid']").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/select_page?pagenum="+num+"&mid="+mid+"&tid="+tid+"&thid="+thid ,  /*这是处理文件上传的servlet*/
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
                        "<img src='${pageContext.request.contextPath}/upload/"+Json.prods[i].zimg+"' height='340' width='130'/>"+
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
<div class="product-model">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/Jd/prod">首页</a></li>
            <li><a href="/Jd/select">所有商品</a></li>
        </ol>
        <div class="col-md-9 product-model-sec">
            <div id="prods">
            <c:if test="${prods!=null}">
                <c:forEach items="${prods}" var="prods">
                    <div class="product-grid love-grid">
                        <a href="/Jd/selectP?proid=${prods.proid}">
                            <div class="more-product"><span> </span></div>
                            <div class="product-img b-link-stripe b-animate-go  thickbox">
                                <img src="${pageContext.request.contextPath}/upload/${prods.zimg}" height="340" width="130"/>
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
                                <h4><br>${prods.name}<br></h4>
                                <span class="item_price">￥：${prods.price}元</span>
                                <!--补充区域-->
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            </div>
            <c:if test="${prods.size()==0}">
                <center><h2>没有此类商品！</h2></center>
            </c:if>
        </div>
        <c:if test="${tid!=null}">
            <input type="hidden" name="tid" value="${tid}">
        </c:if>
        <c:if test="${tid==null}">
            <input type="hidden" name="tid" value="0">
        </c:if>
        <c:if test="${mid!=null}">
            <input type="hidden" name="mid" value="${mid}">
        </c:if>
        <c:if test="${mid==null}">
            <input type="hidden" name="mid" value="0">
        </c:if>
        <c:if test="${thid!=null}">
            <input type="hidden" name="thid" value="${thid}">
        </c:if>
        <c:if test="${thid==null}">
            <input type="hidden" name="thid" value="0">
        </c:if>

        <div class="rsidebar span_1_of_left">
            <section  class="sky-form">
                <div class="product_right">
                    <h3 class="m_2">款式分类：</h3>
                    <c:if test="${JdMclass!=null}">
                        <c:forEach var="i" begin="0" end="${JdMclass.size()-1}" step="1">
                    <div class="tab${i+1}">
                        <ul class="place">
                            <li class="sort">${JdMclass[i].name}</li>
                            <li class="by"><img src="images/do.png" alt=""></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <c:if test="${JdTwoclass!=null}">
                                <c:forEach var="j" begin="0" end="${JdTwoclass.size()-1}" step="1">
                                    <c:if test="${JdTwoclass[j].mid==JdMclass[i].mid}">
                            <a href="/Jd/select?tid=${JdTwoclass[j].tid}"><p>${JdTwoclass[j].name}</p></a>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                        </c:forEach>
                    </c:if>
                    <!--script-->
                    <script>
                        $(document).ready(function(){
                            $(".tab1 .single-bottom").hide();
                            $(".tab2 .single-bottom").hide();
                            $(".tab3 .single-bottom").hide();
                            $(".tab4 .single-bottom").hide();
                            $(".tab5 .single-bottom").hide();

                            $(".tab1 ul").click(function(){
                                $(".tab1 .single-bottom").slideToggle(300);
                                $(".tab2 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                                $(".tab4 .single-bottom").hide();
                                $(".tab5 .single-bottom").hide();
                            })
                            $(".tab2 ul").click(function(){
                                $(".tab2 .single-bottom").slideToggle(300);
                                $(".tab1 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                                $(".tab4 .single-bottom").hide();
                                $(".tab5 .single-bottom").hide();
                            })
                            $(".tab3 ul").click(function(){
                                $(".tab3 .single-bottom").slideToggle(300);
                                $(".tab4 .single-bottom").hide();
                                $(".tab5 .single-bottom").hide();
                                $(".tab2 .single-bottom").hide();
                                $(".tab1 .single-bottom").hide();
                            })
                            $(".tab4 ul").click(function(){
                                $(".tab4 .single-bottom").slideToggle(300);
                                $(".tab5 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                                $(".tab2 .single-bottom").hide();
                                $(".tab1 .single-bottom").hide();
                            })
                            $(".tab5 ul").click(function(){
                                $(".tab5 .single-bottom").slideToggle(300);
                                $(".tab4 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                                $(".tab2 .single-bottom").hide();
                                $(".tab1 .single-bottom").hide();
                            })
                        });
                    </script>
                    <!-- script -->
            <section  class="sky-form">
                <h4>品牌</h4>
                <div class="row row1 scroll-pane">
                    <div class="col col-4">
                        <label class="checkbox"><a href="/Jd/select2?brand=1">Nike</a></label>
                    </div>
                    <div class="col col-4">
                        <label class="checkbox"><a href="/Jd/select2?brand=2">阿迪达斯</a></label>
                    </div>
                    <div class="col col-4">
                        <label class="checkbox"><a href="/Jd/select2?brand=3">特步</a></label>
                    </div>
                </div>
            </section>
                    <h4>价格</h4>
                    <div class="row row1 scroll-pane">
                        <div class="col col-2">
                            <label class="checkbox"><input type="radio" name="checkbox" onclick="price(1,1)"><i></i>降序</label>
                            <label class="checkbox"><input type="radio" name="checkbox" onclick="price(0,1)"><i></i>升序</label>
                        </div>
                    </div>
        </div>
            </section>
    </div>

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
<br>
<br>

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
