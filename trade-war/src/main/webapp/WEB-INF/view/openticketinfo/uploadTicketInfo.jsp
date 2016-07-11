<%--
  User: Administrator
  Date: 2016/6/28 14:53
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script src="${app_static_root}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${app_static_root}/view/openTicketInfo/uploadTicketInfo.js" charset="UTF-8"></script>
<body >

<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li class="active">导入券</li>
</ul>
<div class="container">
    <div class="row">
        <form class="form-horizontal" id="uploadFileFrom" name="uploadFileFrom" enctype="multipart/form-data" action="${ctx}/openTicketInfo/ajax/uploadFileInfo.do" method="post">
            <div class="form-group">
                <div class="col-sm-6">
                    <label class="col-sm-3 control-label">导入数据<span class="must"></span></label>
                    <div class="col-sm-7">
                        <input id="uploadFile" name="uploadFile" type="file" style="display:none">
                        <div class="input-append">
                            <input id="photoCover" class="input-large" type="text" style="height:30px;" readonly>
                            <a class="btn" onclick="$('input[id=uploadFile]').click();">选择文件</a>
                            <a class="btn" name="fileSubmit" onclick="saveUploadFile('${ctx}/openTicketInfo/initOpenTicketInfo.do')" id="fileSubmit">上传</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>