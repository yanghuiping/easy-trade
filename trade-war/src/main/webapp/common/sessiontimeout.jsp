<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.niwodai.tech.base.common.properties.CommonConfiguration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<%@ include file="/common/staticresource.jsp"%>
<title>会话超时错误</title>
</head>

<body>
	<div class="row-fluid">
	<div class="span12 offset5">
	   <h1>会话超时错误.</h1>
	</div>
	</div>
    <div class="row-fluid">
	 <div class="span12 offset6">
	    <h5><a href="<%=CommonConfiguration.getStrProperties("cas.logout")%>?service=<%=CommonConfiguration.getStrProperties("cas.client.sys")%>">重新登录</a></h5>
	  </div>
	</div>
</body>
</html>