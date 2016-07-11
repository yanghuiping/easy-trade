<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script language="javascript" type="text/javascript">
</script>
<table id="spreadKeywordList" class="responsive table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th>选择</th>
			<th>推广计划名称</th>
			<th>推广单元名称</th>
			<th>批次号</th>
			<th>关键词数量</th>
			<th>计划开始时间</th>
			<th>计划结束时间</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(spreadKeywordDtoPage.result) > 0}">
				<c:forEach items="${spreadKeywordDtoPage.result}" var="spreadKeywordDto" varStatus="status">
					<tr>
						<td width="50px;" align="center">
							<input type="radio" name="batchNo" id="batchNo" value="${spreadKeywordDto.batchNo}"/>
						</td>
						<td width="100px;" align="center">${spreadKeywordDto.planTitle}</td>
						<td width="100px;" align="center">${spreadKeywordDto.unitTitle}</td>
						<td width="100px;" align="center">${spreadKeywordDto.batchNo}</td>
						<td width="100px;" align="center">${spreadKeywordDto.totalNum}</td>
						<td width="100px;" align="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${spreadKeywordDto.beginTime}"/>
						</td>
						<td width="100px;" align="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${spreadKeywordDto.endTime}"/>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(spreadKeywordDtoPage.result) == 0}">
				<tr align="center">
					<td colspan="7">无关键词信息！</td>
				</tr>
			</c:when>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="spreadKeywordImport('${ctx}/spreadKeywordManage/importSpreadKeyword.do')">
					<i class="icon-plus"></i>导入
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="spreadKeywordDel('${ctx}/spreadKeywordManage/delSpreadKeyword.do','${ctx}/spreadKeywordManage/spreadKeywordIndex.do')">
					<i class="icon-minus"></i>删除 
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="exportExcel('${ctx}/spreadKeywordManage/exportExcel.do')">
					<i class="icon-plus-sign"></i>下载
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="generateUrl('${ctx}/spreadKeywordManage/generateUrl.do')">
					<i class="icon-plus-sign"></i>生成URL
				</button>
				<button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary" onclick="downlondTemplate('${app_static_root}/files/kewwordTemplate/keyword_template.xls')">
					<i class="icon-plus-sign"></i>导入模版下载
				</button>
			</td>
		</tr>
	</tfoot>
</table>
<div>
	<li:pagination methodName="spreadKeywordList" pageBean="${spreadKeywordDtoPage}" sytleName="black2" />
</div>