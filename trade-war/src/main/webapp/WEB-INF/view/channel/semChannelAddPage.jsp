<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript"
	src="${app_static_root}/view/channel/semChannelIndex.js" charset="UTF-8"></script>
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
		<li class="active">新增渠道</li>
	</ul>
	<!-- searchForm -->
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="channelForm" action="${ctx}/channelManage/semChannelSave.do" method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">伙伴名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="channelName" name="channelName" value="${openChannel.channelName}" class="col-md-7" type="text" maxlength="20"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">真实姓名<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="realName" name="realName" value="${openChannelDetail.realName}" class="col-md-7" type="text" maxlength="20"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">联系电话<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="phone" name="phone" value="${openChannelDetail.phone}" class="col-md-7" type="text" maxlength="20"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">电子邮件<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="email" name="email" value="${openChannelDetail.email}" class="col-md-7" type="text" maxlength="50"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">公司名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="compayName" name="compayName" value="${openChannelDetail.compayName}" class="col-md-7" type="text" maxlength="50"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">网址<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="siteUrl" name="siteUrl" value="${openChannelDetail.siteUrl}" class="col-md-7" type="text" maxlength="50"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">伙伴类型<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="channelType">
							<c:forEach var="item" items="${partnerTypeList}">
				            	<option value="${item.key}">${item.name}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">归属人<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="belongName" name="belongName" value="${openChannelDetail.belongName}" class="col-md-7" type="text" maxlength="20" readonly/>
					</div>
				</div>
				<div class="form-actions controls col-md-12">
					<button type="reset" class="btn  btn-small btn-primary" onclick="history.back();">
						<i class="icon-reply"></i>返回
					</button>
					<button type="button" class="btn  btn-small btn-primary" id="btnSave" onclick="semChannelSave();">
						<i class="icon-save"></i>保存
					</button>
					<input type="hidden" name="channelId" value="${openChannelDetail.channelId}"/>
					<input type="hidden" name="id" value="${openChannelDetail.id}"/>
				</div>
			</div>
		</form>
	</div>
</body>