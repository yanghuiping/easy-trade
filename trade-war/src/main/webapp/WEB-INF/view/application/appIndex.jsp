<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/application/application.js" charset="UTF-8"></script>
<body >
<ul class="breadcrumb">
	<li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i class="icon-angle-right"></i></span></li>
	<li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
	<li class="active">广告申请管理</li>
</ul>
<!-- searchForm -->
<div class="container-fluid" style="background-color: #DDEDFB;">
	<form id="searchForm" name="searchForm" class="form-horizontal">
		<table class="responsive table" >
			 	<tr>						 		
					<td width="80px" align="center">合作渠道商：</td>
					<td align="left" width="200px">
						<select class="col-md-7" name="channelId">
							<option value="0">全部渠道</option>
							<c:forEach var="channel" items="${channelList}">
				            	<option value="${channel.id}">${channel.channelName}</option>
				   		    </c:forEach>
						</select>
					</td>
					<td width="80px" align="center">申请单状态：</td>
					<td align="left" width="200px">
						<select class="col-md-7" name="state">
							<option value="0">全部状态</option>
							<c:forEach var="state" items="${stateList}">
				            	<option value="${state.key}">${state.name}</option>
				   		    </c:forEach>
						</select>
					</td>
					<td align="left">
						<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="appList(1,0,10);">
						<i class="icon-search icon-on-right bigger-110"></i>查询 </button>
						<input type="hidden" name="advertisListUrl" id="advertisListUrl" value="${ctx}/applicationManage/appList.do"/>
					</td>	
				</tr>
		</table>
	</form>
</div>
<div class="widget-container" id="advertisList">
</div>
</body>