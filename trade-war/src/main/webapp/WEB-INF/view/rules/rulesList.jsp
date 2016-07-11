<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<table id="bidManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>操作</th>
			<th>核算规则名称</th>
			<th>核算规则编号</th>
			<th>核算有效期类别</th>
			<th>核算有效期天数</th>
			<th>交易鉴定类别</th>
			<th colspan="4">核算模式</th>
			<th>规则创建人</th>
			<th>创建时间</th>
			<th>活动使用数</th>
			<th>广告申请量</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(resultPage.result) > 0}">
				<c:forEach items="${resultPage.result}" var="rules" varStatus="status">
					<tr>
						<td width="60px;" align="center">
							<button type="button" class="btn btn-link" onclick="rules(${rules.id},'${ctx}/rulesManage/detailRules.do');">详情</button>
							<button type="button" class="btn btn-link" onclick="rules(${rules.id},'${ctx}/rulesManage/editRules.do');">编辑</button>
							<c:choose>	
								<c:when test="${rules.activityNum eq 0}">
									<button type="button" class="btn btn-link" onclick="delRules(${rules.id},'${ctx}/rulesManage/delRules.do','${ctx}/rulesManage/rulesIndex.do');">删除</button>
								</c:when>
								<c:otherwise>
								    <button type="button" class="btn" disabled="disabled">删除</button>
								</c:otherwise>
							</c:choose>
						</td>
						<td width="150px;" align="left">${rules.rulesName}</td>
						<td width="150px;" align="left">${rules.rulesCode}</td>
						<td width="150px;" align="left">
							<c:choose>
						         <c:when test="${rules.rulesValidityType == 1}">自注册起</c:when>
						         <c:when test="${rules.rulesValidityType == 2}">首投次日起</c:when>
						    </c:choose>
						</td>
						<td width="150px;" align="right">${rules.rulesValidityDay} 天</td>
						<td width="100px;" align="right">
							<c:choose>
						         <c:when test="${rules.tradeIdentifyType == 1}">平行时点鉴定</c:when>
						         <c:when test="${rules.tradeIdentifyType == 2}">固定时点鉴定</c:when>
						         <c:when test="${rules.tradeIdentifyType == 3}">实时鉴定</c:when>
						    </c:choose>
						</td>
						<td width="100px;" align="right">
						<c:choose>
							<c:when test="${rules.cpa != null }">
								<span>CPA</span>
							</c:when>
							<c:otherwise>
								 --
							</c:otherwise>
						</c:choose>
						</td>
						<td width="100px;" align="right">
						<c:choose>
							<c:when test="${rules.cps != null }">
								<span>CPS</span>
							</c:when>
							<c:otherwise>
								 --
							</c:otherwise>
						</c:choose>
						</td>
						<td width="100px;" align="right">
						<c:choose>
							<c:when test="${rules.roi != null }">
								<span>ROI</span>
							</c:when>
							<c:otherwise>
								 --
							</c:otherwise>
						</c:choose>
						</td>
						<td width="100px;" align="right">
						<c:choose>
							<c:when test="${rules.app != null }">
								<span>APP</span>
							</c:when>
							<c:otherwise>
								 --
							</c:otherwise>
						</c:choose>
						</td>
						<td width="100px;" align="right">${rules.createName}</td>
						<td width="100px;" align="right"><fmt:formatDate value="${rules.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td width="100px;" align="center">${rules.activityNum}</td>
						<td width="100px;" align="center">${rules.advertisNum}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(resultPage.result) == 0}">
				<tr align="center">
					<td colspan="100">无数据信息!</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="100">
			<button id="btnAdd" name="btnAdd" type="button" class="btn  btn-small btn-primary" onclick="addRules('${ctx}/rulesManage/addRules.do')">
				<i class="icon-pencil"></i>新增核算规则
			</button>
		</td>
	</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="rulesList" pageBean="${resultPage}" sytleName="black2" />
</div>