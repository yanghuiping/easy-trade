<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script type="text/javascript" src="${app_static_root}/view/application/application.js" charset="UTF-8"></script>
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
			二维码上传
		</li>
	</ul>
	<div class="container-fluid" style="background-color: #DDEDFB;">
		<form id="advertisForm" enctype="multipart/form-data" action="${ctx}/applicationManage/ajax/fileUpload.do" method="post">
			<div class="form-horizontal form-view col-md-12">
				<div class="controls col-md-12 bottom-line top-line">
					<label class="control-label col-md-1">二维码图片：<span
						class="must"><span style="color: red"></span></span></label>
					<div class="controls col-md-3">
						<c:choose>
							<c:when test="${empty imageUrl}">
								<img id="imageId" style="width: 200px;height: 100px;" />
							</c:when>
							<c:otherwise>
								<img id="imageId" src="${imageUrl}" style="width: 200px;height: 100px;" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="controls col-md-3">
						<input type="file" value="" id="photo" name="imageFile"><span>（支持格式：.png;.jpg;.jpeg;.bmp）	</span>					
						<input type="button"  name="photoSubmit" onclick="savephoto()" id="photoSubmit" value="上传"/>
						<input type="hidden" name="imageUrl" value="" id="imageUrl"/>
					</div>
				</div>
				<div class="form-actions controls col-md-12">
					<button type="reset" class="btn  btn-small btn-primary" onclick="history.back();">
						<i class="icon-reply"></i>返回
					</button>
					<button type="button" class="btn  btn-small btn-primary" id="btnSave" onclick="submitImage('${ctx}/applicationManage/submitImage.do');">
						<i class="icon-save"></i>保存
					</button>
					<input type="hidden" name="id" value="${id}"/>
				</div>
			</div>
		</form>
	</div>
</body>