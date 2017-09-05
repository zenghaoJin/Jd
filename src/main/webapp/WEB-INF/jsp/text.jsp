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
    <script type="text/javascript">
        function remember(){
            var remFlag = $("input[type='checkbox']").is(':checked');
            if(remFlag==true){ //如果选中设置remFlag为1
                var conFlag = confirm("记录密码功能不宜在公共场所(如网吧等)使用,以防密码泄露." +
                    "您确定要使用此功能吗?");
                if(conFlag){ //确认标志
                    alert("1")
                    $("#remFlag").val("1");
                }else{
                    $("input[type='checkbox']").removeAttr('checked');
                    $("#remFlag").val("0");
                }
            }else{ //如果没选中设置remFlag为""
                $("#remFlag").val("0");
            }
        }
        $(document).ready(function(){ //记住密码功能
            var str = getCookie("loginInfo");
        });
        function getCookie(cname) {
            var ca = document.cookie.split(';');
            for(var i=0;i<ca.length;i++){
                var c = ca[i];
                alert(ca[i].split("=")[0])
                if(c.split("=")[0].trim()==cname) {
                    c = c.split("=")[1];
                    var name = c.split(",")[0];
                    var passWord = c.split(",")[1];
                    $("input[name='name']").val(name.substring(1, name.length));
                    $("input[name='passWord']").val(passWord.substring(0, passWord.length - 1));
//                    alert(name.substring(1, name.length))
//                    alert(passWord.substring(0, passWord.length - 1))
                }
            }
        }
    </script>
</head>
<body>
<%--<form action="/Jd/textUI" method="post" enctype="multipart/form-data">--%>
<%--&lt;%&ndash;<input type="text" name="name">&ndash;%&gt;--%>
    <%--<input type="file" name="xls" />--%>
    <%--<input type="submit" value="确定" class="btn btn-primary">--%>
<%--</form>--%>
<form action="/Jd/textUI" method="post">
    账号:<input type="text" name="name" /><br>
    密码:<input type="password" name="passWord"/><br>
        <label>
            <input name="checkbox" id="remFlag" type="checkbox" onclick="remember();" value="1">
            记住密码
        </label>
    <input type="submit" value="确定" class="btn btn-primary">
</form>

${message}
</body>
</html>
