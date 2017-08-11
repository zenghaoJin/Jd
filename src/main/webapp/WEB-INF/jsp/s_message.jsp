<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/1
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>信息</title>
    <link rel="stylesheet" type="text/css" href="styles/simditor.css" />

    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="scripts/module.min.js"></script>
    <script type="text/javascript" src="scripts/hotkeys.min.js"></script>
    <script type="text/javascript" src="scripts/uploader.min.js"></script>
    <script type="text/javascript" src="scripts/simditor.min.js"></script>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        function add(v,x) {
            $(":input[name='uid']").val(v);
            $(":input[name='mid']").val(x);
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
                    <a class="active-menu" href="/Jd/s_message?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-table fa-3x"></i>信息回复</a>
                </li>
                <li  >
                    <a  href="/Jd/s_table?stoid=${sessionScope.jdStores.stoid}"><i class="fa fa-table fa-3x"></i>订单明细</a>
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
                            <h2>信件回复</h2>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <hr />
            <div class="row">
                <c:if test="${JdMessage!=null}">
                    <c:forEach var="i" begin="0" end="${JdMessage.size()-1}" step="1">
                <div class="col-md-4 col-sm-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            用户:${JdMessage[i].uid}
                        </div>
                        <div class="panel-body">
                            <p>${JdMessage[i].message}</p>
                        </div>
                        <div class="panel-footer">
                            <a href="javascript:void(0);" onclick="add(${JdMessage[i].uid},${JdMessage[i].mid})">回复</a>
                        </div>
                    </div>
                </div>
                    </c:forEach>
                </c:if>
            </div>
            <form action="/Jd/s_messageUI" method="post">
                <input type="hidden" name="uid" value="">
                <input type="hidden" name="mid" value="">
                <input type="hidden" name="stoid" value="${stoid}">
            <textarea class="form-control" name="message" rows="3" id="editor" placeholder="" autofocus></textarea>
                <br>
                <center><input  type="submit" class="btn btn-info btn-lg" value="确定" /></center>
            </form>
            <script>
                var editor = new Simditor({
                    textarea: $('#editor')
                    //optional options
                });
            </script>

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
