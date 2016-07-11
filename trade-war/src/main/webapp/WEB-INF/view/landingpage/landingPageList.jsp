<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="landingPageManageList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>选择</th>
			<th>着陆页编号</th>
			<th>着陆页名称</th>
			<th>URL地址</th>
			<th>着陆页状态</th>
			<th>着陆页类型</th>
			<th>添加时间</th>
			<th>添加人</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(openLandingPage.result) > 0}">
				<c:forEach items="${openLandingPage.result}" var="landingPage" varStatus="status">
					<tr>
						<td width="50px;" align="center">
							<input type="radio" name="id" id="id" value="${landingPage.id}"/>
						</td>
						<td width="100px;" align="center">${landingPage.pageCode}</td>
						<td width="100px;" align="center">${landingPage.pageName}</td>
						<td width="100px;" align="center">${landingPage.pageUrl}</td>
						<td width="100px;" align="center">
							<c:forEach items="${landingPageStateList}" var="landingPageState">
								<c:if test="${landingPageState.key == landingPage.state}">
									${landingPageState.name}
								</c:if>
							</c:forEach>
						</td>
						<td width="100px;" align="center">
							<c:forEach items="${landingPageTypeList}" var="landingPageType">
								<c:if test="${landingPageType.key == landingPage.pageType}">
									${landingPageType.name}
								</c:if>
							</c:forEach>
						</td>
						<td width="100px;" align="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${landingPage.createTime}"/>
						</td>
						<td width="100px;" align="center">${landingPage.createName}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(channelAndDetailPage.result) == 0}">
				<tr align="center">
					<td colspan="8">无着陆页信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="landingPageAddPage('${ctx}/landingPageManage/landingPageAddPage.do')">
					<i class="icon-plus"></i>新增
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="landingPageEditPage('${ctx}/landingPageManage/landingPageAddPage.do')">
					<i class="icon-edit"></i>编辑 
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="landingPageDel('${ctx}/landingPageManage/delLandingPage.do','${ctx}/landingPageManage/landingPageIndex.do')">
					<i class="icon-minus"></i>删除 
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="landingPageDetail('${ctx}/landingPageManage/landingPageDetail.do')">
					<i class="icon-plus-sign"></i>详情 
				</button>
			</td>
		</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="landingPageManageList" pageBean="${openLandingPage}" sytleName="black2" />
</div>