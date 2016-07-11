<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript"
	src="${app_static_root}/view/spreadkeyword/spreadKeywordIndex.js" charset="UTF-8"></script>
<body>
	<ul class="breadcrumb">
		<li>
			<a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a>
			<span class="divider ">
				<i class="icon-angle-right"></i>
			</span>
		</li>
		<li>
			<a href="${ctx}/sys/main.do?style=mainstyle">首页</a>
			<span class="divider">
				<i class="icon-angle-right"></i>
			</span>
		</li>
		<li class="active">导入关键词</li>
	</ul>
	<!-- searchForm -->
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="spreadKeywordForm" enctype="multipart/form-data" action="${ctx}/spreadKeywordManage/ajax/fileUpload.do" method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">SEM渠道选择<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<c:forEach var="item" items="${openChannelList}">
							<input type="checkbox" name="channelId" value="${item.id}"/>${item.channelName}&nbsp;
						</c:forEach>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">推广计划名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="planTitle" name="planTitle" class="col-md-7" type="text" maxlength="50"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">推广单元名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="unitTitle" name="unitTitle" class="col-md-7" type="text" maxlength="50"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					 <label class="control-label col-md-1">计划起止时间<span style="color: red">*</span></label>
                     <div class="controls col-md-5">
                         <input id="beginTime" name="beginTime" value="<fmt:formatDate value="${advertis.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate"
                                onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"
                                type="text" maxlength="50"/>
                         -
                         <input id="endTime" name="endTime" value="<fmt:formatDate value="${advertis.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="Wdate"
                                onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})"
                                type="text" maxlength="50"/>
                     </div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">关键词文件上传<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="spreadKeywordFile" name="spreadKeywordFile" class="col-md-7" type="file"/>
						<input type="button"  name="fileSubmit" onclick="saveSreadKeywordFile()" id="fileSubmit" value="上传"/>
						<input type="hidden" name="filePath" value="" id="filePath"/>
					</div>
				</div>
				<div class="form-actions controls col-md-12">
					<button type="reset" class="btn  btn-small btn-primary" onclick="history.back();">
						<i class="icon-reply"></i>返回
					</button>
					<button type="button" class="btn  btn-small btn-primary" id="btnSave" onclick="spreadKeywordSave('${ctx}/spreadKeywordManage/saveSpreadKeyword.do');">
						<i class="icon-save"></i>保存
					</button>
					<input type="hidden" name="id" value="${openLandingPage.id}"/>
				</div>
			</div>
		</form>
	</div>
</body>