<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/1
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <script src="js/Blob.js"></script>
    <script src="js/FileSaver.js"></script>
    <script src="js/tableExport.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>订单明细</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        function prom(oid,v) {
            var state=prompt("请输入对订单的操作，0为未发货，1为发货，2为撤回发货","");//将输入的内容赋给变量 name ，
            if(state=="2"){
                $.ajax({
                    url: "${pageContext.request.contextPath}/updateJdOrder_state?state="+state+"&oid="+oid,
                    type: 'POST',
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (val) {}
                })
                $(v).html("撤回商品")
            }else if(state=="1"){
                $.ajax({
                    url: "${pageContext.request.contextPath}/updateJdOrder_state?state="+state+"&oid="+oid,
                    type: 'POST',
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (val) {}
                })
                $(v).html("已发货")
            }else if(state=="0"){
                $.ajax({
                    url: "${pageContext.request.contextPath}/updateJdOrder_state?state="+state+"&oid="+oid,
                    type: 'POST',
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (val) {}
                })
                $(v).html("未发货")
            }else{
                alert("输入有误")
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
                    <a class="active-menu" href="/Jd/s_table?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-table fa-3x"></i>订单明细</a>
                </li>
                <li  >
                    <a  href="/Jd/s_select?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-edit fa-3x"></i> 查看自己的商品 </a>
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
                                            <th width="80">用户id</th>
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
                                                        <td><a href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}">${JdOrder[i].uid}</a></td>
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
                                                    <td><a href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}">${JdOrder[i].uid}</a></td>
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
                                                    <td><a href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}">${JdOrder[i].uid}</a></td>
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
                                                    <td><a href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}">${JdOrder[i].uid}</a></td>
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
                                                    <td><a href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}">${JdOrder[i].uid}</a></td>
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
                                                    <td><a href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}">${JdOrder[i].uid}</a></td>
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
                        <div class="col-md-12">
                            <center>
                                <br>
                            <div id="export">
                                <a data-type="xls" class="btn btn-info btn-sm" href="javascript:;">导出excel</a>
                            </div>
                            </center>
                            <input type="hidden" name="stoid" value="${stoid}">
                            <script>
                                var $exportLink = document.getElementById('export');
                                $exportLink.addEventListener('click', function(e){
                                    e.preventDefault();
                                    if(e.target.nodeName === "A"){
                                        <jsp:useBean id="now" class="java.util.Date" scope="page"/>
                                        tableExport('table2', '订单（<fmt:formatDate value="${now}" type="date" dateStyle="default"/>）', e.target.getAttribute('data-type'));
                                    }
                                }, false);
                            </script>
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
