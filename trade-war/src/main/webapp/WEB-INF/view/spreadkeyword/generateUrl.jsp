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
		<li class="active">URL生成</li>
	</ul>
	<!-- searchForm -->
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="generateForm" action="${ctx}/spreadKeywordManage/startGenerateUrl.do" method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">关键词批次<span class="must"><span style="color: red"></span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="batchNo">
							<c:forEach var="item" items="${batchNoList}">
				            	<option value="${item}">${item}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">PC端着陆页<span class="must"><span style="color: red"></span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="pc" id="pcId" onchange="selectPcLandingPage();">
							<c:forEach var="item" items="${pcList}">
				            	<option value="${item.pageUrl}">${item.pageName}</option>
				   		    </c:forEach>
						</select>
						<a href="${(fn:length(pcList)) > 0 ? pcList[0].pageUrl:'#'}" target="_blank" id="pcLandingPageId">点击预览</a>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">WAP端着陆页<span
						class="must"><span style="color: red"></span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="wap" id="wapId"  onchange="selectWapLandingPage();">
							<c:forEach var="item" items="${wapList}">
				            	<option value="${item.pageUrl}">${item.pageName}</option>
				   		    </c:forEach>
						</select>
						<a href="${(fn:length(wapList)) > 0 ? wapList[0].pageUrl:'#'}" target="_blank" id="wapLandingPageId">点击预览</a>
					</div>
				</div>
				<div class="form-actions controls col-md-12">
					<button type="reset" class="btn  btn-small btn-primary" onclick="history.back();">
						<i class="icon-reply"></i>返回
					</button>
					<button type="button" class="btn  btn-small btn-primary" id="btnSave" onclick="startGenerateUrl('${ctx}/spreadKeywordManage/startGenerateUrl.do','${ctx}/spreadKeywordManage/spreadKeywordIndex.do');">
						<i class="icon-save"></i>生成URL
					</button>
				</div>
			</div>
		</form>
	</div>
</body>