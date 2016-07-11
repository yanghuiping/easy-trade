<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录系统后台</title>
</head>
<body >
 系统登录成功
<%
 //进入SITEMESH 页面
 response.sendRedirect(request.getContextPath()+"/sys/main.do?style=mainstyle");
 //response.sendRedirect(request.getContextPath()+"/sys/main.do");
%>
</body>
</html>


