<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="actManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>选择</th>
			<th>操作</th>
			<th>活动名称</th>
			<th>活动编号</th>
			<th>活动负责人</th>
			<th>活动预算</th>
			<th>目标活动交易金额</th>
			<th>活动状态</th>
			<th>定向合作渠道</th>
			<th>核算规则编号</th>
			<th>核算规则名称</th>
			<th>检测指标</th>
			<th>活动开始时间</th>
			<th>活动结束时间</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(resultPage.result) > 0}">
				<c:forEach items="${resultPage.result}" var="act" varStatus="status">
					<tr>
						<td width="60px;" align="center">
							<input type="radio" name="id" id="id" value="${act.id}"/>
						</td>
						<td width="60px;" align="center">
							<button type="button" class="btn btn-link" onclick="act(${act.id},'${ctx}/activityManage/detailAct.do');">详情</button>
							<button type="button" class="btn btn-link" onclick="act(${act.id},'${ctx}/activityManage/editAct.do');" <c:if test="${act.state == 5}">disabled</c:if>>编辑</button>
						</td>
						<td width="150px;" align="left">${act.activityName}</td>
						<td width="100px;" align="left">${act.activityCode}</td>
						<td width="150px;" align="right">${act.managerName}</td>
						<td width="100px;" align="right"><fmt:formatNumber pattern="#,#00.00" value="${act.activitiyBudgetAmount*0.001}"/></td>
						<td width="150px;" align="left"><fmt:formatNumber pattern="#,#00.00" value="${act.aimActivitiyAmount*0.001}"/></td>
						<td width="100px;" align="right">
							<c:choose>
								<c:when test="${act.state==1}">活动未审核</c:when>
								<c:when test="${act.state==2}">活动未开始</c:when>
								<c:when test="${act.state==3}">活动进行中</c:when>
								<c:when test="${act.state==4}">活动结束</c:when>
								<c:when test="${act.state==5}">活动审核通过</c:when>
								<c:when test="${act.state==6}">活动审核拒绝</c:when>
							</c:choose>
						</td>
						<td width="100px;" align="left">${act.channelName}</td>
						<td width="100px;" align="center">${act.rulesCode}</td>
						<td width="100px;" align="center">${act.rulesName}</td>
						<td width="100px;" align="center"><fmt:formatNumber type="PERCENT" pattern="#0.00%" value="${act.checkIndicator*0.0001}"/></td>
						<td width="100px;" align="center"><fmt:formatDate value="${act.beginTime}" pattern="yyyy-MM-dd"/></td>
						<td width="100px;" align="center"><fmt:formatDate value="${act.endTime}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(resultPage.result) == 0}">
				<tr align="center">
					<td colspan="100">无有效活动信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="100">
			<button id="btnAdd" name="btnAdd" type="button" class="btn  btn-small btn-primary" onclick="addAct()">
				<i class="icon-pencil"></i>新增活动
			</button>
			<button id="btnAdd" name="btnPass" type="button" class="btn  btn-small btn-primary" onclick="actAudit('${ctx}/activityManage/actAudit.do','${ctx}/activityManage/actIndex.do','5')">
				<i class="icon-plus"></i>通过
			</button>
			<button id="btnAdd" name="btnRefuse" type="button" class="btn  btn-small btn-primary" onclick="actAudit('${ctx}/activityManage/actAudit.do','${ctx}/activityManage/actIndex.do','6')">
				<i class="icon-plus-sign"></i>拒绝
			</button>
		</td>
	</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="actList" pageBean="${resultPage}" sytleName="black2" />
</div>