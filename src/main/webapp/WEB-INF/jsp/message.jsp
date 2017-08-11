<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/1
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        function addmessage(v) {
            $(":input[name='stoid']").val(v);
            $(":input[name='mid']").val("0");
            $("#message").html("联系商家:"+v)
//            alert($(":input[name='stoid']").next().find("h4").html("联系商家："+v))
        }
        function change(v,x) {
            $("#message").html("回复商家:"+x)
            $(":input[name='mid']").val(v);
            $(":input[name='stoid']").val(x);
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
    </div>
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>订单</h2>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    订单明细
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table" id="table2">
                                                    <thead>
                                                    <tr>
                                                        <th width="80">商家id</th>
                                                        <th>地址</th>
                                                        <th width="250">收件人信息</th>
                                                        <th>订单状态</th>
                                                        <th>下单时间</th>
                                                        <th width="150">商品信息<br>（数目和尺寸）</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="JdOrder">
                                                    <c:if test="${JdOrder!=null}">
                                                        <c:forEach var="i" begin="0" end="${JdOrder.size()-1}" step="1">
                                                            <c:if test="${(i+1)%6==1}">
                                                                <tr class="success">
                                                                    <td><a href="javascript:void(0);" onclick="addmessage(${oid[i]})">${oid[i]}</a></td>
                                                                    <td>${JdOrder[i].address}</td>
                                                                    <td>${JdOrder[i].message}</td>
                                                                    <c:if test="${JdOrder[i].state==0}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">未发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==1}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">已发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==2}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">撤回货物</a></td>
                                                                    </c:if>
                                                                    <td><fmt:formatDate value="${JdOrder[i].date}" type="date" dateStyle="default"/></td>
                                                                    <c:forEach var="j" begin="0" end="${Sizes.size()-1}" step="1">
                                                                        <c:if test="${Sizes[j].sizeid==JdOrder[i].sizeid}">
                                                                            <td width="150">尺寸：${Sizes[j].size}（${JdOrder[i].num}件）</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${(i+1)%6==2}">
                                                                <tr class="info">
                                                                    <td><a href="javascript:void(0);" onclick="addmessage(${oid[i]})">${oid[i]}</a></td>
                                                                    <td>${JdOrder[i].address}</td>
                                                                    <td>${JdOrder[i].message}</td>
                                                                    <c:if test="${JdOrder[i].state==0}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">未发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==1}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">已发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==2}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">撤回货物</a></td>
                                                                    </c:if>
                                                                    <td><fmt:formatDate value="${JdOrder[i].date}" type="date" dateStyle="default"/></td>
                                                                    <c:forEach var="j" begin="0" end="${Sizes.size()-1}" step="1">
                                                                        <c:if test="${Sizes[j].sizeid==JdOrder[i].sizeid}">
                                                                            <td width="150">尺寸：${Sizes[j].size}（${JdOrder[i].num}件）</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${(i+1)%6==3}">
                                                                <tr class="warning">
                                                                    <td><a href="javascript:void(0);" onclick="addmessage(${oid[i]})">${oid[i]}</a></td>
                                                                    <td>${JdOrder[i].address}</td>
                                                                    <td>${JdOrder[i].message}</td>
                                                                    <c:if test="${JdOrder[i].state==0}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">未发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==1}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">已发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==2}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">撤回货物</a></td>
                                                                    </c:if>
                                                                    <td><fmt:formatDate value="${JdOrder[i].date}" type="date" dateStyle="default"/></td>
                                                                    <c:forEach var="j" begin="0" end="${Sizes.size()-1}" step="1">
                                                                        <c:if test="${Sizes[j].sizeid==JdOrder[i].sizeid}">
                                                                            <td width="150">尺寸：${Sizes[j].size}（${JdOrder[i].num}件）</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${(i+1)%6==4}">
                                                                <tr class="danger">
                                                                    <td><a href="javascript:void(0);" onclick="addmessage(${oid[i]})">${oid[i]}</a></td>
                                                                    <td>${JdOrder[i].address}</td>
                                                                    <td>${JdOrder[i].message}</td>
                                                                    <c:if test="${JdOrder[i].state==0}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">未发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==1}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">已发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==2}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">撤回货物</a></td>
                                                                    </c:if>
                                                                    <td><fmt:formatDate value="${JdOrder[i].date}" type="date" dateStyle="default"/></td>
                                                                    <c:forEach var="j" begin="0" end="${Sizes.size()-1}" step="1">
                                                                        <c:if test="${Sizes[j].sizeid==JdOrder[i].sizeid}">
                                                                            <td width="150">尺寸：${Sizes[j].size}（${JdOrder[i].num}件）</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${(i+1)%6==5}">
                                                                <tr class="success">
                                                                    <td><a href="javascript:void(0);" onclick="addmessage(${oid[i]})">${oid[i]}</a></td>
                                                                    <td>${JdOrder[i].address}</td>
                                                                    <td>${JdOrder[i].message}</td>
                                                                    <c:if test="${JdOrder[i].state==0}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">未发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==1}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">已发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==2}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">撤回货物</a></td>
                                                                    </c:if>
                                                                    <td><fmt:formatDate value="${JdOrder[i].date}" type="date" dateStyle="default"/></td>
                                                                    <c:forEach var="j" begin="0" end="${Sizes.size()-1}" step="1">
                                                                        <c:if test="${Sizes[j].sizeid==JdOrder[i].sizeid}">
                                                                            <td width="150">尺寸：${Sizes[j].size}（${JdOrder[i].num}件）</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${(i+1)%6==0}">
                                                                <tr class="info">
                                                                    <td><a href="javascript:void(0);" onclick="addmessage(${oid[i]})">${oid[i]}</a></td>
                                                                    <td>${JdOrder[i].address}</td>
                                                                    <td>${JdOrder[i].message}</td>
                                                                    <c:if test="${JdOrder[i].state==0}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">未发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==1}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">已发货</a></td>
                                                                    </c:if>
                                                                    <c:if test="${JdOrder[i].state==2}">
                                                                        <td><a href="javascript:void(0);" onclick="prom(${JdOrder[i].oid},this)">撤回货物</a></td>
                                                                    </c:if>
                                                                    <td><fmt:formatDate value="${JdOrder[i].date}" type="date" dateStyle="default"/></td>
                                                                    <c:forEach var="j" begin="0" end="${Sizes.size()-1}" step="1">
                                                                        <c:if test="${Sizes[j].sizeid==JdOrder[i].sizeid}">
                                                                            <td width="150">尺寸：${Sizes[j].size}（${JdOrder[i].num}件）</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="row">
                    <c:if test="${JdMessage!=null}">
                        <c:forEach var="i" begin="0" end="${JdMessage.size()-1}" step="1">
                            <div class="col-md-4 col-sm-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        商家:${JdMessage[i].stoid}
                                    </div>
                                    <div class="panel-body">
                                        <p>商家信息：${JdMessage[i].message}</p>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="javascript:void(0);" onclick="change(${JdMessage[i].mid},${JdMessage[i].stoid})">回复</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                </div>
            </div>
            <form action="/Jd/messageUI" method="post">
                <input type="hidden" name="uid" value="${sessionScope.JdUser.uid}">
                <input type="hidden" name="stoid" value="">
                <input type="hidden" name="mid" value="">
                <div class="form-group">
                    <label><h4 id="message">联系商家：</h4></label>
                <textarea class="form-control" name="message" rows="3"></textarea>
                <br>
                <center><input  type="submit" class="btn btn-info btn-lg" value="确定" /></center>
                </div>
            </form>
            <!-- /. ROW  -->


        </div>
        <!-- /. PAGE INNER  -->
    </div>
</div>

</body>
</html>
