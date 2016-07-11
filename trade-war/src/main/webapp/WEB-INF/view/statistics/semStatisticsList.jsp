<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="landingPageManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>关键字</th>
			<th>推广单元</th>
			<th>推广计划</th>
			<th>注册人数</th>
			<th>实名人数</th>
			<th>充值人数</th>
			<th>充值金额</th>
			<th>投资人数</th>
			<th>投资金额</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(semStatisticsPage.result) > 0}">
				<c:forEach items="${semStatisticsPage.result}" var="semStatistics" varStatus="status">
					<tr>
						<td width="100px;" align="center">${semStatistics.keyword}</td>
						<td width="100px;" align="center">${semStatistics.unitTitle}</td>
						<td width="100px;" align="center">${semStatistics.planTitle}</td>
						<td width="100px;" align="center">${semStatistics.registerNum}</td>
						<td width="100px;" align="center">${semStatistics.realNameNum}</td>
						<td width="100px;" align="center">${semStatistics.rechangeNum}</td>
						<td width="100px;" align="center">
							<fmt:formatNumber value="${semStatistics.rechangeAmount/1000}" pattern="#,##0.00#" maxFractionDigits="2"/>
						</td>
						<td width="100px;" align="center">${semStatistics.investNum}</td>
						<td width="100px;" align="center">
							<fmt:formatNumber value="${semStatistics.investAmount/1000}" pattern="#,##0.00#" maxFractionDigits="2"/>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(semStatisticsPage.result) == 0}">
				<tr align="center">
					<td colspan="9">无sem统计信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
</table>
<div>
	<li:pagination methodName="semStatisticsManageList" pageBean="${semStatisticsPage}" sytleName="black2" />
</div>