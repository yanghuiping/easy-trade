<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="appManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>选择</th>
			<th>活动名称</th>
			<th>广告标题</th>
			<th>申请渠道</th>
			<th>活动状态</th>
			<th>单据状态</th>
			<th>申请时间</th>
			<th>二维码图片</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(resultPage.result) > 0}">
				<c:forEach items="${resultPage.result}" var="app" varStatus="status">
					<tr>
						<td width="50px;" align="center">
							<input type="radio" name="id" id="id" value="${app.id}" onclick="validateUpload('${app.state}');"/>
						</td>
						<td width="100px;" align="center">${app.activityName}</td>
						<td width="100px;" align="center">${app.advertisName}</td>
						<td width="100px;" align="center">${app.channelName}</td>
						<td width="100px;" align="center">
							<c:choose>
								<c:when test="${app.actState==1}">活动未审核</c:when>
								<c:when test="${app.actState==2}">活动未开始</c:when>
								<c:when test="${app.actState==3}">活动进行中</c:when>
								<c:otherwise>活动结束</c:otherwise>
							</c:choose>
						</td>
						<td width="100px;" align="center">
							<c:choose>
								<c:when test="${app.state==1}">未审批</c:when>
								<c:when test="${app.state==2}">已通过</c:when>
								<c:otherwise>已拒绝</c:otherwise>
							</c:choose>
						</td>
						<td width="100px;" align="center">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${app.createTime}"/>
						</td>
						<td width="100px;" align="center">
							<c:if test="${empty app.imageUrl}">
								还未上传
							</c:if>
							<c:if test="${not empty app.imageUrl}">
								<a href="${app.imageUrl}" target="_blank">点击查看</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(advertisPage.result) == 0}">
				<tr align="center">
					<td colspan="9">无广告申请单信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<button id="btnDetail" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="detailAct('${ctx}/applicationManage/detailAct.do')">
					<i class="icon-plus"></i>详情
				</button>
				<c:if test="${isDisabled == 'no'}">
					<button id="btnPass" name="btnPass" type="button" class="btn  btn-small btn-primary" onclick="appAudit('${ctx}/applicationManage/appAudit.do','${ctx}/applicationManage/appIndex.do','2')">
						<i class="icon-plus"></i>通过
					</button>
					<button id="btnFail" name="btnCannel" type="button" class="btn  btn-small btn-primary" onclick="appAudit('${ctx}/applicationManage/appAudit.do','${ctx}/applicationManage/appIndex.do','3')">
						<i class="icon-plus-sign"></i>拒绝
					</button>
					<button id="uploadId" name="uploadName" type="button" class="btn  btn-small btn-primary" onclick="uploadImageIndex('${ctx}/applicationManage/uploadImageIndex.do')">
						<i class="icon-plus-sign"></i>上传二维码
					</button>
				</c:if>
			</td>
		</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="appList" pageBean="${resultPage}" sytleName="black2" />
</div>