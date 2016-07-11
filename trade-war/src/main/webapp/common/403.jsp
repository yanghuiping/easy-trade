<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.niwodai.tech.base.common.properties.CommonConfiguration"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/staticresource.jsp"%>
	<title>403 - 缺少权限</title>
</head>

<body>
<div>
	<div><h1>你没有访问该页面的权限，可以更改用户。</h1></div>
	<div> <a href="<%=CommonConfiguration.getStrProperties("cas.logout")%>?service=<%=CommonConfiguration.getStrProperties("cas.client.sys")%>">登录</a></div>
</div>
</body>
</html>