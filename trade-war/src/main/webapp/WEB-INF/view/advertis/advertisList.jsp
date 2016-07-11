<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="advertisManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>选择</th>
			<th>广告标题</th>
			<th>活动名称</th>
			<th>广告编号</th>
			<th>广告状态</th>
			<th>广告开始时间</th>
			<th>广告结束时间</th>
			<th>是否需要审批</th>
			<th>活动状态</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(advertisPage.result) > 0}">
				<c:forEach items="${advertisPage.result}" var="advertis" varStatus="status">
					<tr>
						<td width="50px;" align="center">
							<input type="radio" name="id" id="id" value="${advertis.ID}" onclick="onCheckRadio(${advertis.ADSTATE})"/>
						</td>
						<td width="100px;" align="center">${advertis.ADVERTISNAME}</td>
						<td width="100px;" align="center">${advertis.ACTIVITYNAME}</td>
						<td width="100px;" align="center">${advertis.ADVERTISCODE}</td>
						<td width="100px;" align="center">
							<c:forEach items="${advertisStateList}" var="advertisState">
								<c:if test="${advertisState.key == advertis.ADSTATE}">
									${advertisState.name}
								</c:if>
							</c:forEach>
						</td>
						<td width="100px;" align="center">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${advertis.BEGINTIME}"/>
						</td>
						<td width="100px;" align="center">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${advertis.ENDTIME}"/>
						</td>
						<td width="100px;" align="center">
							<c:choose>
								<c:when test="${advertis.ISAPPROVAL == 1}">是</c:when>
								<c:when test="${advertis.ISAPPROVAL == 0}">否</c:when>
							</c:choose>
						</td>
						<td width="100px;" align="center">
							<c:forEach var="item" items="${activityStateList}">
				            	<c:if test="${item.key == advertis.ACSTATE}">
									${item.name}
								</c:if>
				   		    </c:forEach>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(advertisPage.result) == 0}">
				<tr align="center">
					<td colspan="9">无广告信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="addAdvertisPage('${ctx}/advertisManage/addAdvertis.do')">
					<i class="icon-plus"></i>新增
				</button>
				<button id="btnEdit" name="btnEdit" type="button" class="btn  btn-small btn-primary" onclick="advertisEditPage('${ctx}/advertisManage/addAdvertis.do')">
					<i class="icon-edit"></i>编辑 
				</button>
				<button id="btnDel" name="btnDel" type="button" class="btn  btn-small btn-primary" onclick="advertisDel('${ctx}/advertisManage/delAdvertis.do','${ctx}/advertisManage/advertisIndex.do')">
					<i class="icon-minus"></i>删除 
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="advertisDetail('${ctx}/advertisManage/advertisDetail.do')">
					<i class="icon-plus-sign"></i>详情 
				</button>
				<button id="btnAdd" name="btnPass" type="button" class="btn  btn-small btn-primary" onclick="advertisAudit('${ctx}/advertisManage/advertisAudit.do','${ctx}/advertisManage/advertisIndex.do','4')">
				<i class="icon-plus"></i>审核通过
				</button>
				<button id="btnAdd" name="btnRefuse" type="button" class="btn  btn-small btn-primary" onclick="advertisAudit('${ctx}/advertisManage/advertisAudit.do','${ctx}/advertisManage/advertisIndex.do','5')">
					<i class="icon-plus-sign"></i>审核拒绝
				</button>
			</td>
		</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="advertisManageList" pageBean="${advertisPage}" sytleName="black2" />
</div>