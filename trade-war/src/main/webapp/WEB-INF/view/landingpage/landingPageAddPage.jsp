<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript"
	src="${app_static_root}/view/landingPage/landingPageIndex.js" charset="UTF-8"></script>
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
		<li class="active">新增着陆页</li>
	</ul>
	<!-- searchForm -->
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="landingPageForm" action="${ctx}/landingPageManage/landingPageSave.do" method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">着陆页名称<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="pageName" name="pageName" value="${openLandingPage.pageName}" class="col-md-7" type="text" maxlength="20"/>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">着陆页类型<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="pageType">
							<c:forEach var="item" items="${landingPageTypeList}">
				            	<option value="${item.key}" <c:if test="${item.key == openLandingPage.pageType}">selected</c:if>>${item.name}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">着陆页状态<span class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<select class="col-md-7" name="state">
							<c:forEach var="item" items="${landingPageStateList}">
				            	<option value="${item.key}" <c:if test="${item.key == openLandingPage.state}">selected</c:if>>${item.name}</option>
				   		    </c:forEach>
						</select>
					</div>
				</div>
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">url地址(http://开头)<span
						class="must"><span style="color: red">*</span></span></label>
					<div class="controls col-md-3">
						<input id="pageUrl" name="pageUrl" value="${openLandingPage.pageUrl}" class="col-md-7" type="text" maxlength="100"/>
					</div>
				</div>
				<div class="form-actions controls col-md-12">
					<button type="reset" class="btn  btn-small btn-primary" onclick="history.back();">
						<i class="icon-reply"></i>返回
					</button>
					<button type="button" class="btn  btn-small btn-primary" id="btnSave" onclick="landingPageSave();">
						<i class="icon-save"></i>保存
					</button>
					<input type="hidden" name="id" value="${openLandingPage.id}"/>
				</div>
			</div>
		</form>
	</div>
</body>