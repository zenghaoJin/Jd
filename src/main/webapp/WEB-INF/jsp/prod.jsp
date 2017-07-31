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
    <title>Title</title>
</head>
<body>
    尺寸介绍：${size}<br>
    款式名称：${iname}<br>
    款式数量：${number}<br>
    款式图案：${img}
<img src="${pageContext.request.contextPath}/upload/${img}">
</body>
</html>
