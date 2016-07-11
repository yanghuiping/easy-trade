<%--
  
  User: Administrator
  Date: 2016/6/27 15:11
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<script src="${app_static_root}/js/bootstrap.min.js"></script>
<body >
<div class="container">
    <div class="row">
        <form class="form-horizontal" role="form" id="sendFrom" name="sendFrom" action="#" method="post">
            <div class="form-group">
                <label class="col-sm-3 control-label">渠道名称<span class="must"></span></label>

                <div class="col-sm-7">
                    <select id="channelId" name="channelId" class="form-control">
                        <c:forEach items="${openChannelList}" var="staticData" varStatus="status">
                            <option value="${staticData.id}">${staticData.channelName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">券类型<span class="must"></span></label>

                <div class="col-sm-7">
                    <select id="ticketType" name="ticketType" class="form-control">
                        <c:forEach items="${ticketTypeList}" var="staticData" varStatus="status">
                            <option value="${staticData.key}">${staticData.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">短信模板<span class="must"></span></label>

                <div class="col-sm-7">
                    <select id="sendTemplateId" name="sendTemplateId" class="form-control">
                        <c:forEach items="${sendTemplateIdList}" var="staticData" varStatus="status">
                            <option value="${staticData.key}">${staticData.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </form>
    </div>
</div>
</body>