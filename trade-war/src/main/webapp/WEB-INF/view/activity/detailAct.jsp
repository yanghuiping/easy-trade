<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script src="${app_static_root}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(":text").attr("disabled", true);
    })
</script>
<body>
<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx }/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li><a href="#">活动管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
    <li class="active">活动详情</li>
</ul>
<div class="container">
    <!-- middle -->
    <div class="row">
        <form id="actForm" name="actForm" enctype="multipart/form-data" method="post">
            <div class="form-horizontal form-view col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading"><span><i class="icon-leaf"></i>活动信息</span></div>
                    <div class="panel-body" id="rules">
                        <input type="hidden" value="${act.id}" name="id">

                        <div class="controls col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">活动名称 <span class="must"></span></label>

                            <div class="controls col-md-5">
                                <input type="text" id="activityName" name="activityName" class="col-xs-4"
                                       value="${act.activityName}"/>
                            </div>
                            <label class="control-label col-md-1">活动预算 <span class="must"></span></label>

                            <div class="controls col-md-5">
                                <input type="text" id="activitiyBudgetAmount" name="activitiyBudgetAmount"
                                       class="col-xs-4" value="<fmt:formatNumber value="${act.activitiyBudgetAmount/1000 }" pattern="#,##0.00#" maxFractionDigits="2"/>"/>&nbsp;元
                            </div>
                        </div>
                        <div class="controls col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">目标年化交易额 <span class="must"></span></label>

                            <div class="controls col-md-5">
                                <input type="text" id="aimYearAmount" name="aimYearAmount" class="col-xs-4"
                                       value="<fmt:formatNumber value="${act.aimYearAmount/1000 }" pattern="#,##0.00#" maxFractionDigits="2"/>"/> &nbsp;元
                            </div>
                            <label class="control-label col-md-1">目标活动交易额<span class="must"></span></label>

                            <div class="controls col-md-5">
                                <input type="text" id="aimActivitiyAmount" name="aimActivitiyAmount" class="col-xs-4"
                                       value="<fmt:formatNumber value="${act.aimActivitiyAmount/1000 }" pattern="#,##0.00#" maxFractionDigits="2"/>"/> &nbsp;元
                            </div>
                        </div>
                        <div class="controls col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">检测指标 <span class="must"></span></label>

                            <div class="controls col-md-5">
                                <input type="text" id="checkIndicator" name="checkIndicator" class="col-xs-4"
                                       value="${act.checkIndicator}"/> &nbsp;%
                            </div>
                            <label class="control-label col-md-1">定向合作渠道</label>

                            <div class="controls col-md-5">
                                <select name="channelId" id="channelId" class="controls col-md-4" disabled>
                                    <option value="0">请选择定向合作渠道</option>
                                    <c:forEach var="channel" items="${channelList}">
                                        <option value="${channel.id}" <c:if test="${act.channelId eq channel.id}">selected="selected"</c:if>>${channel.channelName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="controls col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">核算规则 <span class="must"></span></label>

                            <div class="controls col-md-5">
                                <select name="rulesId" id="rulesId" class="controls col-xs-4" disabled>
                                    <option>请选择核算规则</option>
                                    <c:forEach var="rule" items="${ruleList}">
                                        <c:choose>
                                            <c:when test="${act.rulesId eq rule.id}">
                                                <option value="${rule.id}"
                                                        selected="selected">${rule.rulesName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${rule.id}">${rule.rulesName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <label class="control-label col-md-1">活动负责人<span class="must"></span></label>

                            <div class="controls col-md-5">
                                <select name="managerId" id="managerId" class="controls col-md-4" disabled>
                                    <option value="${act.managerId}">${act.managerName}</option>
                                </select>
                            </div>
                        </div>
                        <div class="controls col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">活动启止时间 <span class="must"></span></label>

                            <div class="controls col-md-5">
                                <input id="beginTime" name="beginTime" class="Wdate"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"
                                       type="text" maxlength="50"
                                       value="<fmt:formatDate value='${act.beginTime}' pattern='yyyy-MM-dd'/>"/>
                                -
                                <input id="endTime" name="endTime" class="Wdate"
                                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}'})"
                                       type="text" maxlength="50"
                                       value="<fmt:formatDate value='${act.endTime}' pattern='yyyy-MM-dd'/>"/>
                            </div>
                        </div>
                        <div class="controls-group col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">活动描述 <span class="must"></span></label>
                            <textarea class="controls col-xs-8" rows="3"
                                      name="activityAims" readonly>${act.activityAims}</textarea>
                        </div>
                        <div class="controls-group col-md-12 bottom-line top-line">
                            <label class="control-label col-md-1">活动策略描述 </label>
                            <textarea class="controls col-xs-8" rows="3"
                                      name="activitiyPolicy" readonly>${act.activitiyPolicy}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="form-actions controls col-md-12">
            <button type="reset" class="btn btn-default" onclick="history.back();"><i class="icon-off"></i>返回</button>
        </div>
    </div>
</div>
</body>