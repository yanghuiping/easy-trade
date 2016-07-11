<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/popularize/popularize.js" charset="UTF-8"></script>
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
			申请单详情
		</li>
	</ul>
	<!-- searchForm -->
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="advertisForm"  method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">活动名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input type="text" value="${act.activityName}"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input  value="${adv.advertisName}" class="col-md-7" type="text" maxlength="50" disabled/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告类型<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="type" disabled>
							<c:forEach var="item" items="${advertisTypeList}">
								<option value="${item.key}" <c:if test="${item.key == adv.type}">selected</c:if>>${item.name}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告编码<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="advertisCode" name="advertisCode" value="${adv.advertisCode}" class="col-md-7" type="text" maxlength="50" readonly/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告URL<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
					   <label>${app.advertisUrl}</label>
					   <c:if test="${app.advertisUrl ne null}">
						  <a href="${app.advertisUrl}" target="_blank">点击预览</a>
					   </c:if>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">广告起止时间<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-5" >
					 	<input id="beginTime" name="beginTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})" type="text" maxlength="50" disabled="disabled"  value="<fmt:formatDate value='${adv.beginTime}' pattern='yyyy-MM-dd'/>" />
					 	-
					 	<input id="endTime" name="endTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})" type="text" maxlength="50"  disabled="disabled" value="<fmt:formatDate value='${adv.endTime}' pattern='yyyy-MM-dd'/>"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">图片预览<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						&nbsp;<img id="imageId" src="${ndfs_url}${adv.advertisImg}" style="width: 200px;height: 100px;" />
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">二维码图片<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						&nbsp;<img id="imageId" src="${app.imageUrl}" style="width: 200px;height: 100px;" />
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