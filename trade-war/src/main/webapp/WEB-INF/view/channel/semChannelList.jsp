<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="channelManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>选择</th>
			<th>渠道名称</th>
			<th>真实姓名</th>
			<th>联系电话</th>
			<th>状态</th>
			<th>注册时间</th>
			<th>网址</th>
			<th>归属人</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(channelAndDetailPage.result) > 0}">
				<c:forEach items="${channelAndDetailPage.result}" var="channelAndDetail" varStatus="status">
					<tr>
						<td width="50px;" align="center">
							<input type="radio" name="id" id="id" value="${channelAndDetail.ID}" onclick="onCheckRadio(${channelAndDetail.DELFLAG})"/>
						</td>
						<td width="100px;" align="center">${channelAndDetail.CHANNELNAME}</td>
						<td width="100px;" align="center">${channelAndDetail.REALNAME}</td>
						<td width="100px;" align="center">${channelAndDetail.PHONE}</td>
						<td width="100px;" align="center">
							<c:choose>
						         <c:when test="${channelAndDetail.DELFLAG == 0}">正常</c:when>
						         <c:when test="${channelAndDetail.DELFLAG == 1}">已注销</c:when>
						    </c:choose>
						</td>
						<td width="100px;" align="center">${channelAndDetail.CREATETIME}</td>
						<td width="100px;" align="center">${channelAndDetail.SITEURL}</td>
						<td width="100px;" align="center">${channelAndDetail.BELONGNAME}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(channelAndDetailPage.result) == 0}">
				<tr align="center">
					<td colspan="8">无渠道信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="semChannelAddPage('${ctx}/channelManage/semChannelAddPage.do')">
					<i class="icon-plus"></i>新增
				</button>
				<button id="btnEdit" name="btnEdit" type="button" class="btn  btn-small btn-primary" onclick="semChannelEditPage('${ctx}/channelManage/semChannelAddPage.do')">
					<i class="icon-edit"></i>编辑 
				</button>
				<button id="btnCancel" name="btnCancel" type="button" class="btn  btn-small btn-primary" onclick="semChannelDel('${ctx}/channelManage/delChannel.do','${ctx}/channelManage/semChannelIndex.do')">
					<i class="icon-minus"></i>注销 
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="semChannelDetail('${ctx}/channelManage/semChannelDetailPage.do')">
					<i class="icon-plus-sign"></i>详情 
				</button>
			</td>
		</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="semManageList" pageBean="${channelAndDetailPage}" sytleName="black2" />
</div>