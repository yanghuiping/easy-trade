<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/landingPage/landingPageIndex.js"></script>
<body >
<ul class="breadcrumb">
	<li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i class="icon-angle-right"></i></span></li>
	<li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
	<li class="active">着陆页管理</li>
</ul>
<!-- searchForm -->
<div class="container-fluid" style="background-color: #DDEDFB;">
	<form id="searchForm" name="searchForm" class="form-horizontal">
		<table class="responsive table" >
			 	<tr>						 		
					<td width="80px" align="center">着陆页编号：</td>
					<td align="left" width="200px">
						<input type="text" name="pageCode" id="pageCode" style="width: 200px" />
					</td>
					<td width="80px" align="center">着陆页名称：</td>
					<td align="left" width="200px">
						<input type="text" name="pageName" id="pageName" style="width: 200px" />
					</td>
					<td width="80px" align="center">着陆页类型：</td>
					<td align="left" width="200px">
						<select class="col-md-7" name="pageType">
							<option value="">全部</option>
							<c:forEach var="item" items="${landingPageTypeList}">
				            	<option value="${item.key}">${item.name}</option>
				   		    </c:forEach>
						</select>
					</td>
					<td width="80px" align="center">着陆页状态：</td>
					<td align="left" width="200px">
						<select class="col-md-7" name="state">
							<option value="">全部</option>
							<c:forEach var="item" items="${landingPageStateList}">
				            	<option value="${item.key}">${item.name}</option>
				   		    </c:forEach>
						</select>
					</td>
					<td align="left">
						<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="landingPageManageList(1,0,10);">
							<i class="icon-search icon-on-right bigger-110"></i>查询 </button>
						<input type="hidden" name="landingPageListUrl" id="landingPageListUrl" value="${ctx}/landingPageManage/landingPageList.do"/>
					</td>
				</tr>
		</table>
	</form>
</div>
<div class="widget-container" id="landingPageList">
</div>
</body>