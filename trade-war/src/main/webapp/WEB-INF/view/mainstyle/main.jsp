<%@page	import="com.common.item.base.common.properties.CommonConfiguration"%>
<%@page import="com.xcm.inf.acms.client.DynamicConfigLoader" %>
<%@page import="com.xcm.sys.security.SecSysUser"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.xcm.sys.model.TSysFunction"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="app_static_root" value='<%=DynamicConfigLoader.get("open.static")%>'/>
<!DOCTYPE html>
<html>
<title><decorator:title /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="开放平台后台">
<meta name="author" content="User">
<link href="${app_static_root}/css/bootstrap.min.css" rel="stylesheet">
<link href="${app_static_root}/css/jquery.gritter.css" rel="stylesheet">
<link href="${app_static_root}/css/font-awesome.css" rel="stylesheet">
<link href="${app_static_root}/css/ace.min.css" rel="stylesheet">
<link href="${app_static_root}/css/tablecloth.css" rel="stylesheet">
<link href="${app_static_root}/css/styles.css" rel="stylesheet">
<link href="${app_static_root}/other/fonts.googleapis.com/css-family-Dosis.css" rel='stylesheet' type='text/css'>
<link href="${app_static_root}/css/index.ext.css" rel="stylesheet">
<%-- <script src="${app_static_root}/js/artDialog4.1.7/jquery.artDialog.js" type="text/javascript"></script> --%>
<script src="${app_static_root}/js/jquery/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${app_static_root}/js/bootstrap.js"></script>
<script src="${app_static_root}/js/jquery.tablecloth.js"></script>
<script src="${app_static_root}/js/jquery.collapsible.js"></script>
<script src="${app_static_root}/js/accordion.nav.js"></script>
<script src="${app_static_root}/js/ace.min.js"></script>
</head>
<body style="font-size: 12px;">
<input type="hidden" id="access_mo" name="access_mo" value="${access_mo }">
<input type="hidden" id="access_mu" name="access_mu" value="${access_mu }">
	<div class="navbarext navbar-default" id="navbar" style="postrion: fixed;" >
		<table id="_TableHeader" style="width: 100%" >
			<tbody>
				<tr>
					<td  align="left" valign="top" width="250px;">
						<img src="${app_static_root}/images/header.png" width="250px" style="margin-top: 5px;margin-left: 5px;margin-bottom: 8px;">
					</td>
					<td align="left">
					</td>
					<td >
						<div style="text-align: right;">
							<h4 style="color: white">欢迎:${secSysUser.realname }</h4>
							 <a  id="changePassword"  href="javascript:void(0);" style="color: white">修改密码</a>
							 <a href="${ctx }/j_spring_security_logout" style="color: white">退出登录</a> <span> </span>
						</div>	
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="sidebar clearfix" id="sidebar" >
		<ul class="nav-list">
			<li class="active">
				<a href="javaScript:void(0);"><i class="icon-sitemap"></i>
					<span class="menu-text" >菜单列表</span>
				</a>
			</li>
			<%
        	 	List<TSysFunction> _sys_functions=(List<TSysFunction>)session.getAttribute("_sys_functions");
				Object access_mo=session.getAttribute("access_mo");
				Object access_mu=session.getAttribute("access_mu");
				int jj=0;
         		for(int i=0;_sys_functions!=null&&i<_sys_functions.size();i++){
         			TSysFunction sysFunction=_sys_functions.get(i);
         			if(sysFunction!=null && (sysFunction.getPid()==null || sysFunction.getPid()==0)){
         				jj++;
         			%>
         			<li class="menu_position <%  if(jj==1){%>open<%} %>">
         				<%-- <a href="javaScript:void(0);" class="dropdown-toggle" id="MO<%= sysFunction.getId()%>">
	         				<i class="icon-desktop"></i>
	         				<span class="menu-text"><%= sysFunction.getFunctionname()%></span>
	         				<b class="arrow icon-angle-down"></b>
         				</a> --%>
         				<ul class="submenu" id="MO<%= sysFunction.getId()%>" <%  if(jj==1){%>style="display: block;"<%} %>>
         				<%
         				for(int j=0;_sys_functions!=null&&j<_sys_functions.size();j++){
         					TSysFunction nodeFunction=_sys_functions.get(j);	
         					if(null!=nodeFunction && null!=nodeFunction.getPid() && nodeFunction.getPid()!=0 && nodeFunction.getPid().compareTo(sysFunction.getId())==0){
         				%>
         					<li id="MU<%= nodeFunction.getId()%>" style="background-color: #5093E1">
         				<%
         					if(StringUtils.isNotEmpty(nodeFunction.getFunctionurl()) && !nodeFunction.getFunctionurl().contains("?")){
         				%>
         					<a  href="<%=nodeFunction.getFunctionurl() %>?MO=MO<%= sysFunction.getId()%>&MU=MU<%= nodeFunction.getId()%>" style="hover:red"> 
         				<%		
							}else if(StringUtils.isNotEmpty(nodeFunction.getFunctionurl()) && nodeFunction.getFunctionurl().contains("?")){
						%>
         					<a  href="<%=nodeFunction.getFunctionurl() %>&MO=MO<%= sysFunction.getId()%>&MU=MU<%= nodeFunction.getId()%>"> 
         				<%	
						}
         				%>
									<i class="icon-folder-close-alt" style="color: white;"></i><span style="color: white;"><%=nodeFunction.getFunctionname() %></span>
								</a>
							</li>
						<%		
         					}
         				}
         				%>
         					</ul>
         				<% 
         			}
         		}
			%>
		</ul>
	</div>
	<div class="main-content" style="margin-left: 201px;">
		<div class="page-content">
			<decorator:body />
		</div>		
	</div>
</body>
</html>