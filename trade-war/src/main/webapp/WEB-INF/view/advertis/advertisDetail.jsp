<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript"
	src="${app_static_root}/view/advertis/advertisIndex.js" charset="UTF-8"></script>
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
		<li class="active">
			广告详情
		</li>
	</ul>
	<!-- searchForm -->
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="advertisForm" action="${ctx}/advertisManage/saveAdvertis.do" method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">推广活动<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="activityId" disabled>
							<c:forEach var="item" items="${activityList}">
				            	<option value="${item.id}" <c:if test="${item.id == advertis.activityId}">selected</c:if>>${item.activityName}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告标题<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="advertisName" name="advertisName" value="${advertis.advertisName}" class="col-md-7" type="text" maxlength="50" disabled/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告类型<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="type" disabled>
							<c:forEach var="item" items="${advertisTypeList}">
				            	<option value="${item.key}" <c:if test="${item.key == advertis.type}">selected</c:if>>${item.name}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告编码<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="advertisCode" name="advertisCode" value="${advertis.advertisCode}" class="col-md-7" type="text" maxlength="50" readonly/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">审核广告承接<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input type="radio" name="isApproval" value="1" <c:if test="${advertis.isApproval == 1}">checked</c:if> disabled/>是
						&nbsp;
						<input type="radio" name="isApproval" value="0" <c:if test="${advertis.isApproval == 0}">checked</c:if> disabled/>否
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">着陆页面<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" id="pageId" name="pageId" onchange="selectLandingPage(this);" disabled>
							<c:forEach var="item" items="${landingPageList}">
				            	<option value="${item.id}" <c:if test="${item.id == advertis.pageId}">selected</c:if> dataUrl="${item.pageUrl}">
				            		${item.pageName}
				            	</option>
				   		    </c:forEach>
						</select>
						<c:forEach var="item" items="${landingPageList}">
				            <c:if test="${item.id == advertis.pageId}">
				            	<a href="${item.pageUrl}" target="_blank" id="lookLandingPageId">点击预览</a>
				            </c:if>
				   		</c:forEach>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告起止时间<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="beginTime" name="beginTime" value="<fmt:formatDate value="${advertis.beginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="col-md-4" type="text" maxlength="50" class="Wdate"  onfocus="WdatePicker({lang:'zh-cn',dateFmt: 'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H %m %s'});" disabled/>
						至
						<input id="endTime" name="endTime" value="<fmt:formatDate value="${advertis.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="col-md-4" type="text" maxlength="50" class="Wdate"  onfocus="WdatePicker({lang:'zh-cn',dateFmt: 'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'beginTime\')}'});" disabled/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">图片预览<span
						class="must"></span></label>
					<div class="controls col-md-3">
						&nbsp;<img id="imageId" src="${ndfs_url}${advertis.advertisImg}" style="width: 200px;height: 100px;" />
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告URL<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="advertisUrl" name="advertisUrl" value="${advertis.advertisUrl}" class="col-md-9" type="text" maxlength="50" disabled/>
					</div>
				</div>
				<div class="form-actions controls col-md-12">
					<button type="reset" class="btn  btn-small btn-primary" onclick="history.back();">
						<i class="icon-reply"></i>返回
					</button>
				</div>
			</div>
		</form>
	</div>
</body>