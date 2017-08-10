<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2017/8/5
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="jq/jquery-1.7.2.js"></script>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
    </script>
    <link rel="stylesheet" type="text/css" href="styles/simditor.css" />

    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="scripts/module.min.js"></script>
    <script type="text/javascript" src="scripts/hotkeys.min.js"></script>
    <script type="text/javascript" src="scripts/uploader.min.js"></script>
    <script type="text/javascript" src="scripts/simditor.min.js"></script>
</head>
<body>
<form action="/Jd/textUI">
<textarea id="editor" name="message" placeholder="Balabala" autofocus></textarea>
    <input type="submit" value="确定" class="btn btn-primary">
</form>
<script>
    var editor = new Simditor({
        textarea: $('#editor')
        //optional options
    });
</script>
</body>
</html>
