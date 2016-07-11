<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/activity/indexAct.js"></script>
<body >
<ul class="breadcrumb">
	<li><a class="icon-home" href="${ctx }/sys/main.do?style=mainstyle"></a><span class="divider "><i class="icon-angle-right"></i></span></li>
	<li><a href="${ctx }/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
	<li class="active">广告活动管理</li>
</ul>
<!-- searchForm -->
<div class="container-fluid" style="background-color: #DDEDFB;">
	<form id="actForm" name="searchForm" class="form-horizontal">
		<table class="responsive table" >
			<tr>
				<td width="80px" align="center"><span>活动名称</span></td>
				<td align="left" width="200px">
					<input type="text" name="activityName" id="txtPname"/>
				</td>
				<td width="80px" align="center"><span>活动状态</span></td>
				<td align="left" width="200px" nowrap="nowrap">
					<select id="state" name="state" style="width:132px;">
						<option value="">全部</option>
						<c:forEach items="${stateList}" var="staticData" varStatus="status">
							<option value="${staticData.key}">${staticData.name}</option>
						</c:forEach>
					</select>
				</td>
				<td width="80px" align="center"><span></span></td>
				<td align="left" width="200px" nowrap="nowrap">
				</td>
				<td width="20px" align="center"><span></span></td>

			</tr>
			<tr>
				<td colspan="4">
					<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary">
					<i class="icon-search icon-on-right bigger-110"></i>查询 </button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div class="widget-container" id="actList">
</div>
</body>