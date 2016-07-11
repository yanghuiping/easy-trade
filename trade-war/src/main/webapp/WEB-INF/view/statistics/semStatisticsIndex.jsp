<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/statistics/semStatistics.js"></script>
<body >
<ul class="breadcrumb">
	<li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i class="icon-angle-right"></i></span></li>
	<li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
	<li class="active">sem统计报表</li>
</ul>
<!-- searchForm -->
<div class="container-fluid" style="background-color: #DDEDFB;">
	<form id="searchForm" name="searchForm" class="form-horizontal">
		<table class="responsive table" >
			 	<tr>						 		
					<td width="80px" align="center">渠道名称：</td>
					<td align="left" width="200px">
						<select class="col-md-7" name="channelId" id="channelId">
							<c:forEach var="item" items="${openChannelList}">
				            	<option value="${item.id}">${item.channelName}</option>
				   		    </c:forEach>
						</select>
					</td>
					<td width="80px" align="center">交易时间：</td>
					<td align="left" width="200px">
						<div class="controls col-md-5" >
						 	<input id="beginTime" name="beginTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" type="text" maxlength="50"   />
						 	-
						 	<input id="endTime" name="endTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" type="text" maxlength="50"   />
						 </div>
					</td>
					<td align="left">
						<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="semStatisticsManageList(1,0,10);">
							<i class="icon-search icon-on-right bigger-110"></i>查询 </button>
						<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="exportExcel('${ctx}/semStatisticsManage/exportExcel.do');">
							<i class="icon-search icon-on-right bigger-110"></i>导出 </button>
						<input type="hidden" name="semStatisticsListUrl" id="semStatisticsListUrl" value="${ctx}/semStatisticsManage/semStatisticsList.do"/>
					</td>
				</tr>
		</table>
	</form>
</div>
<div class="widget-container" id="semStatisticsList">
</div>
</body>