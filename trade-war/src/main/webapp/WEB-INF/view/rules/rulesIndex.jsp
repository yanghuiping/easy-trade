<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/rules/indexRules.js"></script>
<body >
<ul class="breadcrumb">
	<li><a class="icon-home" href="${ctx }/sys/main.do?style=mainstyle"></a><span class="divider "><i class="icon-angle-right"></i></span></li>
	<li><a href="${ctx }/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span></li>
	<li class="active">核算规则管理</li>
</ul>
<!-- searchForm -->
<div class="container-fluid" style="background-color: #DDEDFB;">
	<input type="hidden" value="${ctx}/rulesManage/rulesList.do" id="listUrl"/>
	<form id="ruleForm" name="ruleForm" class="form-horizontal">
		<table class="responsive table" >
			<tr>
				<td width="80px" align="center"><span>会员有效期</span></td>
				<td align="left" width="200px">
					<select id="rulesValidityType" name="rulesValidityType" style="width:133px;">
						<option value="">全部</option>
						<c:forEach items="${rulesValidity}" var="staticData" varStatus="status">
							<option value="${staticData.key}">${staticData.name}</option>
						</c:forEach>
					</select>
				</td>
				<td width="80px" align="center"><span>交易鉴定类别</span></td>
				<td align="left" width="200px" nowrap="nowrap">
					<select id="tradeIdentifyType" name="tradeIdentifyType" style="width:132px;">
						<option value="">全部</option>
						<c:forEach items="${rulesIdentify}" var="staticData" varStatus="status">
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
				<td>
					<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="queryRules(1,0,10);">
					<i class="icon-search icon-on-right bigger-110"></i>查询 </button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div class="widget-container" id="rulesList">
</div>
</body>