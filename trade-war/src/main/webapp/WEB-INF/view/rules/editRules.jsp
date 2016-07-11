<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script src="${app_static_root}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${app_static_root}/view/rules/editRules.js"></script>
<body>
<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx }/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li><a href="#">核算规则管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
    <li class="active">修改核算规则</li>
</ul>
<div class="container">
    <!-- middle -->
    <div class="row">
        <form id="rulesForm" name="rulesForm" enctype="multipart/form-data" method="post">
            <div class="form-horizontal form-view col-md-12">
                <!----------------------------核算规则基本信息---------------------------------->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">核算规则基本信息</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">核算规则名称 <span class="must"></span></label>

                                <div class="col-sm-7">
                                    <input type="hidden" id="id" name="id" value="${rules.id}">
                                    <input type="text" id="rulesName" name="rulesName" class="form-control" value="${rules.rulesName}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">交易鉴定类别 <span class="must"></span></label>

                                <div class="col-sm-3">
                                    <label class="checkbox-inline" >
                                        <input type="radio" name="tradeIdentifyType" value="1" <c:if test="${rules.tradeIdentifyType == 1}"> checked="checked"</c:if>/> 平行时点鉴定
                                    </label>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" id="identify_day_1" name="tradeIdentifyDay" class="form-control"  <c:if test="${rules.tradeIdentifyType == 1}"> value="${rules.tradeIdentifyDay}"</c:if>>
                                </div>
                                <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;天后鉴定</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3"></label>

                                <div class="col-sm-3">
                                    <label class="checkbox-inline" >
                                        <input type="radio" name="tradeIdentifyType"  value="2" <c:if test="${rules.tradeIdentifyType == 2 }">checked="checked"</c:if>/> 固定时点鉴定,次月
                                    </label>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" id="identify_day_2" name="tradeIdentifyDay" class="form-control" <c:if test="${rules.tradeIdentifyType == 2 }">value="${rules.tradeIdentifyDay}"</c:if>>
                                </div>
                                <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;号鉴定</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3"></label>

                                <div class="col-sm-3">
                                    <label class="checkbox-inline">
                                        <input type="radio" name="tradeIdentifyType" value="3" <c:if test="${rules.tradeIdentifyType eq 3}"> checked="checked"</c:if>>实时鉴定
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3"></label>

                                <div class="col-sm-3">
                                    <label class="checkbox-inline">
                                        <input type="radio" name="tradeIdentifyType" value="4" <c:if test="${rules.tradeIdentifyType eq 4}"> checked="checked"</c:if>>每周日鉴定
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">会员有效期 <span class="must"></span></label>

                                <div class="col-sm-3">
                                    <select id="rulesValidityType" name="rulesValidityType" style="width:132px;" class="form-control">
                                        <c:forEach items="${rulesValidity}" var="staticData" varStatus="status">
                                            <option value="${staticData.key}" <c:if test="${staticData.key == rules.rulesValidityType}"> selected="selected"</c:if>>${staticData.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rulesValidityDay" class="form-control"  value="${rules.rulesValidityDay}"/>
                                </div>
                                <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;天</label>
                            </div>
                        </div>
                    </div>
                </div>

                <!----------------------------CPA页面处理--------------------------------------->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><span><input id="cpa" name="cpa" type="checkbox" class="must"<c:if test="${fn:length(cpaList) > 0}"> checked="checked"</c:if>/>CPA[按行为结算]</span>
                        </h3>
                    </div>
                    <div class="panel-body" id="cpa_div" <c:if test="${fn:length(cpaList) <= 0}">style="display: none;"</c:if>>
                        <!--梯度核算/非梯度核算-->
                        <div class="form-group">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-6">
                                <c:forEach var="rulesType" items="${rulesType}">
                                    <label class="checkbox-inline">
                                        <input type="radio" name="cpaIsLevel" class="cpa_isLeveSty" id="cpa_isLevel_${rulesType.key}" value="${rulesType.key}"<c:if test="${rulesType.key eq cpa.isLevel}"> checked="checked"</c:if>/> ${rulesType.name}
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                        <!--独立结算/组合结算-->
                        <div id="CpaNoLevelIdentifyType" style="margin-top: 30px; text-align: center;<c:if test="${cpa.isLevel != 1}">display: none;</c:if>" align="center" >
                            <ul class="nav nav-tabs" id="myCpaTab1">
                                <li <c:if test="${cpa.settleType == 0}">class="active"</c:if>>
                                    <a href="#CpaNoLevelIdentifyType_radio" data-toggle="tab">独立结算</a>
                                </li>
                                <li <c:if test="${cpa.settleType == 1}">class="active"</c:if>>
                                    <a href="#CpaNoLevelIdentifyType_checkbox" data-toggle="tab">组合结算</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <!--独立结算类型-->
                                <div class="tab-pane fade <c:if test="${cpa.settleType == 0}">in active</c:if>" id="CpaNoLevelIdentifyType_radio">
                                    <c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">
                                        <div class="form-group">
                                            <div class="col-md-2">
                                                <div class="col-md-2"></div>
                                                <label class="col-md-5" style="text-align: left">
                                                    <c:choose>
                                                        <c:when test="${cpa.settleType == 0}">
                                                            <input type="radio" id="cpa_IdentifyType_radio_${IdentifyType.key}" name="cpa_IdentifyType_radio" value="${IdentifyType.key}" <c:if test="${cpa.settleType == 0 && cpa.identifyType eq IdentifyType.key}">checked="checked"</c:if>/> ${IdentifyType.name}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="radio" id="cpa_IdentifyType_radio_${IdentifyType.key}" name="cpa_IdentifyType_radio" value="${IdentifyType.key}"/> ${IdentifyType.name}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <label class="control-label col-md-1">佣金</label>
                                            <div class="col-sm-2">
                                                <c:choose>
                                                    <c:when test="${cpa.settleType == 0}">
                                                        <input type="text" name="cpa_IdentifyTypeDayRadio" class="form-control" id="cpa_IdentifyTypeDayRadio" <c:if test="${cpa.settleType == 0}"> value="<fmt:formatNumber pattern='#,##0.00' value='${cpa.commissionPercentage*0.001}'/>"</c:if>/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" name="cpa_IdentifyTypeDayRadio" class="form-control" id="cpa_IdentifyTypeDayRadio" value=""/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;元</label>
                                        </div>
                                    </div>
                                    <div style="height:0; line-height:0; font-size:0;clear:both;"></div>
                                </div>
                                <!--组合结算类型-->
                                <div class="tab-pane fade <c:if test="${cpa.settleType == 1}">in active</c:if>" id="CpaNoLevelIdentifyType_checkbox">
                                    <c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">
                                        <c:set var="isChecked" value="0"></c:set>
                                        <c:set var="value" value=""></c:set>
                                        <c:forEach var="openCpa" items="${cpaList}">
                                            <c:if test="${openCpa.identifyType eq IdentifyType.key}">
                                                <c:set var="isChecked" value="1"></c:set>
                                                <c:set var="value" value="${openCpa.commissionPercentage}"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${cpa.settleType == 1}">
                                                <div class="form-group">
                                                    <div class="col-md-3">
                                                        <div class="col-md-1"></div>
                                                        <label class="col-md-5" style="text-align: left" >
                                                            <input type="checkbox" name="cpa_IdentifyType_box" id="cpa_IdentifyType_box_${IdentifyType.key}" value="${IdentifyType.key}" <c:if test="${isChecked == 1}">checked="checked"</c:if>/> ${IdentifyType.name}
                                                        </label>
                                                        <div class="col-md-3">
                                                            <input type="text" class="form-control col-md-1" name="cpa_IdentifyTypDayBox" id="cpa_IdentifyTypDayBox_${IdentifyType.key}" value="<fmt:formatNumber pattern='#,##0.00' value='${value*0.001}'/>"/>
                                                        </div>
                                                        <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;元</label>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="form-group">
                                                    <div class="col-md-3">
                                                        <div class="col-md-1"></div>
                                                        <label class="col-md-5" style="text-align: left" >
                                                            <input type="checkbox" name="cpa_IdentifyType_box" id="cpa_IdentifyType_box_${IdentifyType.key}" value="${IdentifyType.key}" /> ${IdentifyType.name}
                                                        </label>
                                                        <div class="col-md-3">
                                                            <input type="text" class="form-control col-md-1" name="cpa_IdentifyTypDayBox" id="cpa_IdentifyTypDayBox_${IdentifyType.key}"/>
                                                        </div>
                                                        <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;元</label>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                    <div style="height:0; line-height:0; font-size:0;clear:both;"></div>
                                </div>
                            </div>
                        </div>

                        <!--梯度核算-->
                        <div id="CpaLevelIdentifyType" style="margin-top: 30px;<c:if test="${cpa.isLevel != 2}">display: none;</c:if>" align="center" >
                            <ul class="nav nav-tabs" id="myCpaTab2">
                                <li <c:if  test="${cpa.settleType eq 1}">class="active"</c:if>>
                                    <a href="#cpaLevelType1" data-toggle="tab">首投当日额度</a>
                                </li>
                                <li <c:if  test="${cpa.settleType != 1}">class="active"</c:if>>
                                    <a href="#cpaLevelType2" data-toggle="tab">首投单笔额度</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade <c:if test="${cpa.settleType eq 1}">in active</c:if>" id="cpaLevelType1">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <table class="table table-bordered" id="tab_Type_01" >
                                                <thead>
                                                <tr>
                                                    <th >首投当日累计投资额下限</th>
                                                    <th>单价(元)</th>
                                                    <td width="60px" align="center">操作</td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:if  test="${cpa.settleType eq 1}">
                                                    <c:forEach var="openCpa" items="${cpaList}">
                                                        <tr align="center">
                                                            <td align="center">
                                                                <input type="text" name="cpa_1_identifyLimit" class="form-control" value="<fmt:formatNumber pattern="#,#00.00" value="${openCpa.identifyLimit*0.001}"/>"/>
                                                            </td>
                                                            <td align="center">
                                                                <input type="text" name="cpa_1_commissionPercentage" class="form-control" value="<fmt:formatNumber pattern="#,#00.00" value="${openCpa.commissionPercentage*0.001}"/>"/>
                                                            </td>
                                                            <td onclick="deletetr(this)">
                                                                <button type="button" class="btn btn-default">删除</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-1">
                                            <button type="button" class="btn btn-default"
                                                    id="cpa_btnAdd_type01">添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade <c:if  test="${cpa.settleType != 1}">in active</c:if>" id="cpaLevelType2">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <table class="table table-bordered" id="tab_Type_02" >
                                                <thead>
                                                <tr>
                                                    <th>首笔投资投资额下限</th>
                                                    <th>单价(元)</th>
                                                    <td width="60px" align="center">操作</td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:if  test="${cpa.settleType != 1}">
                                                    <c:forEach var="openCpa" items="${cpaList}">
                                                        <tr align="center">
                                                            <td align="center">
                                                                <input type="text" name="cpa_2_identifyLimit" class="form-control" value="<fmt:formatNumber pattern="#,#00.00" value="${openCpa.identifyLimit*0.001}"/>"/>
                                                            </td>
                                                            <td align="center">
                                                                <input type="text" name="cpa_2_commissionPercentage" class="form-control" value="<fmt:formatNumber pattern="#,#00.00" value="${openCpa.commissionPercentage*0.001}"/>"/>
                                                            </td>
                                                            <td onclick="deletetr(this)">
                                                                <button type="button" class="btn btn-default">删除</button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-1">
                                            <button type="button" class="btn btn-default"
                                                    id="cpa_btnAdd_type02">添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-----------------------------CPS页面处理--------------------------------------->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><span><input id="cps" name="cps" type="checkbox" class="must" <c:if test="${fn:length(cpsList) > 0}">checked="checked"</c:if>/>CPS[按投资交易结算]</span>
                        </h3>
                    </div>
                    <div class="panel-body" id="cps_div" <c:if test="${fn:length(cpsList) <= 0}">style="display: none;"</c:if>>
                        <!--梯度核算/非梯度核算-->
                        <div class="form-group">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-6">
                                <c:forEach var="rulesType" items="${rulesType}">
                                    <label class="checkbox-inline">
                                        <input type="radio" name="cps_isLevel" class="cps_isLeveSty" id="cps_isLevel_${rulesType.key}" value="${rulesType.key}" <c:if test="${rulesType.key eq cps.isLevel}">checked="checked"</c:if> />${rulesType.name}
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="controls" id="tradeType">
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="control-label col-md-3">交易指标 <span class="must"></span></label>

                                    <div class="col-sm-3">
                                        <select id="cps_tradeType" name="cps_tradeType"  class="form-control">
                                            <c:forEach var="tradeType" items="${cpsTradeType}">
                                                <option value="${tradeType.key}" <c:if test="${tradeType.key == cps.identifyType}">selected="selected"</c:if>>${tradeType.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="controls col-md-12" id="cps_NO_LevelType_1" <c:if test="${cps.isLevel != 1}"> style="display: none;"</c:if> >
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="control-label col-md-3">结算佣金 <span class="must"></span></label>
                                    <c:forEach var="commissionType" items="${commissionType}">
                                        <div class="col-sm-4">
                                            <div class="col-sm-5">
                                                <label class="checkbox-inline" class="col-md-5">
                                                    <input name="cps_commissionType" id="commissionType_${commissionType.key}" type="radio" value="${commissionType.key}" <c:if test="${cps.commissionType eq commissionType.key}">checked="checked"</c:if>/>${commissionType.name}
                                                </label>
                                            </div>
                                            <c:choose>
                                                <c:when test="${commissionType.key==1}">
                                                    <div class="col-sm-5">
                                                        <input type="text" name="cps_commissionTypeVal" class="form-control" id="commissionTypeVal_${commissionType.key}" <c:if test="${cps.commissionType eq commissionType.key}">value="<fmt:formatNumber type="PERCENT" pattern="#0.00%" value="${cps.commission*0.0001}"/>"</c:if>/>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="cps_commissionTypeVal" class="form-control" id="commissionTypeVal_${commissionType.key}"  <c:if test="${cps.commissionType eq commissionType.key}">value="<fmt:formatNumber pattern="#,#00.00元" value="${cps.commission*0.001}"/>"</c:if>/>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label class="control-label col-md-3">产品周期下限</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="cps_bid_Day" id="cps_bid_day" class="form-control" value="${cps.bidDay}"/>
                                    </div>
                                    <label class="control-label col-md-1" style="text-align: left">&nbsp;&nbsp;天</label>
                                </div>
                            </div>
                        </div>
                        <div class="controls col-md-12" id="cps_LevelType_2" <c:if test="${cps.isLevel != 2}"> style="display: none;"</c:if>>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <table class="table table-bordered" id="cps_tab" >
                                        <thead>
                                        <tr>
                                            <th>累计投资额度下限(元)</th>
                                            <th>产品周期下限(天)</th>
                                            <th>佣金</th>
                                            <td width="60px" align="center">操作</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="openCps" items="${cpsList}">
                                            <tr align="center">
                                                <td align="center">
                                                    <input type='text' name='cps_identifyLimit' class='form-control' value="<fmt:formatNumber pattern="#,#00.00" value="${openCps.identifyLimit*0.001}"/>">
                                                </td>
                                                <td align="center">
                                                    <input type='text' name='cps_bidDay' class='form-control' value=" ${openCps.bidDay}">
                                                </td>
                                                <td align="center">
                                                    <div class="col-md-10">
                                                        <c:choose>
                                                            <c:when test="${openCps.commissionType eq 1}">
                                                                <input id='cps_1_commissionPercentage_val' type='text' name='cps_1_commissionPercentage_val' class='form-control' value="<fmt:formatNumber type="PERCENT" pattern="#0.00%" value="${openCps.commission*0.0001}"/>">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input id='cps_1_commissionPercentage_val' type='text' name='cps_1_commissionPercentage_val' class='form-control' value="<fmt:formatNumber pattern="#,#00.00" value="${openCps.commission*0.001}"/>">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <label class="danwei control-label col-md-1" style="text-align: right">%</label>
                                                </td>
                                                <td onclick="deletetr(this)">
                                                    <button type="button" class="btn btn-default" id="cps_btnDel">删除</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-3">
                                    <label class="checkbox-inline">
                                        <input type="radio" name="cps_1_commissionPercentage" id="cps_level_commissionType_1" value="1" checked="checked"> 百分比
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="cps_1_commissionPercentage" id="cps_level_commissionType_2" value="2" checked="checked">固定额度
                                    </label>
                                    <button type="button" class="btn btn-default"
                                            id="cps_btnAdd">添加
                                    </button>
                                    <%--<button type="button" class="btn btn-default"--%>
                                    <%--id="cpa_btnDel_type02">删除--%>
                                    <%--</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-----------------------------ROI页面处理--------------------------------------->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><span><input id="roi" name="roi" type="checkbox" class="must" <c:if test="${fn:length(roiList)>0}"> checked="checked"</c:if> />ROI[按投资转换率结算]</span>
                        </h3>
                    </div>
                    <div class="panel-body" id="roi_div" <c:if test="${fn:length(roiList) <= 0}">style="display: none;"</c:if>>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">首投投资回报率 <span class="must"></span></label>

                                <div class="col-sm-7">
                                    <div class="col-sm-3">
                                        <input type="text" name="roiA" class="form-control" value="${roi.molecular}">
                                    </div>
                                    <div class="col-sm-1" align="center">
                                        :
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" name="roiB" class="form-control" value="${roi.denominator}"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">最低投资总额 <span class="must"></span></label>

                                <div class="col-sm-7">
                                    <div class="col-sm-3">
                                        <input type="text" name="roiAmountLimit" class="form-control"  value=" <fmt:formatNumber pattern='#,#00.00' value='${roi.identifyLimit*0.001}'/>"/>
                                    </div>
                                    <label class="control-label col-md-1" style="text-align: left">&nbsp;元</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-----------------------------APP页面处理--------------------------------------->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><span><input id="app" name="app" type="checkbox" class="must" <c:if test="${fn:length(appList)>0}"> checked="checked"</c:if>/>APP[APP推广结算]</span>
                        </h3>
                    </div>
                    <div class="panel-body" id="app_div" <c:if test="${fn:length(appList) <= 0}"> style="display: none;"</c:if>>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">结算类别 <span class="must"></span></label>
                                <div class="col-sm-7">
                                    <label class="checkbox-inline">
                                        <input id="priceType" name="priceType" type="radio" value="1"  <c:if test="${app.priceType eq 1}">checked="checked"</c:if>  />下载量
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">佣金 <span class="must"></span></label>
                                <div class="col-sm-7">
                                    <div class="col-sm-3">
                                        <input id="priceUnit" name="priceUnit" type="text" value="<fmt:formatNumber pattern='#,#00.00' value='${app.priceUnit*0.001}'/>" class="form-control" >
                                    </div>
                                    <label class="control-label col-md-1" style="text-align: left">&nbsp;元(单价)</label>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">结算指标 <span class="must"></span></label>
                                <div class="col-sm-7">
                                    <label class="checkbox-inline">
                                        <input id="billingIndexType" name="billingIndexType" type="radio" value="1" <c:if test="${app.billingIndexType eq 1}">checked="checked"</c:if>/>下载注册率
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">指标值 <span class="must"></span></label>

                                <div class="col-sm-7">
                                    <div class="col-sm-3">
                                        <input id="billingIndex" name="billingIndex" type="text" value="<fmt:formatNumber type="PERCENT" pattern="#0.00%" value="${app.billingIndex*0.0001}"/>" class="form-control">
                                    </div>
                                    <label class="control-label col-md-1" style="text-align: left">&nbsp; %(百分比)</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label col-md-3">APP渠道 <span class="must"></span></label>
                                <div class="col-sm-7">
                                    <c:forEach var="appCalList" items="${appCalList}">
                                        <c:set var="isAppChecked" value="0"></c:set>
                                        <c:forEach var="openApp" items="${appList}">
                                            <c:if test="${appCalList.id == openApp.channelId}">
                                                <c:set var="isAppChecked" value="1"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <div class="col-md-3">
                                            <label class="col-md-12" style="text-align: left">
                                                <input id="channelIds" name="channelIds" type="checkbox" value="${appCalList.id}" <c:if test="${isAppChecked == 1}">checked="checked"</c:if>/>${appCalList.channelName}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>













                <%--<div class="panel panel-primary">--%>
                    <%--<div class="panel-heading"><span><i class="icon-table"></i>核算规则基本信息</span></div>--%>
                    <%--<div class="panel-body" id="rules">--%>
                        <%--<div class="controls col-md-12 bottom-line top-line">--%>
                            <%--<label class="control-label col-md-1">核算规则名称 <span class="must"></span></label>--%>

                            <%--<div class="controls col-md-10">--%>
                                <%--<input type="text" id="rulesName" name="rulesName" class="col-xs-4"--%>
                                       <%--value="${rules.rulesName}"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="controls col-md-12 bottom-line top-line">--%>
                            <%--<label class="control-label col-md-1">交易鉴定方式<span class="must"></span></label>--%>

                            <%--<div class="controls col-md-5">--%>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${rules.tradeIdentifyType eq 1}">--%>
                                        <%--<input type="radio" name="tradeIdentifyType" value="1" checked="checked">平行时点鉴定--%>
                                        <%--<input type="text" id="identify_day_1" name="tradeIdentifyDay"--%>
                                               <%--value="${rules.tradeIdentifyDay}"> 天后鉴定--%>
                                    <%--</c:when>--%>
                                    <%--<c:otherwise>--%>
                                        <%--<input type="radio" name="tradeIdentifyType" value="1">平行时点鉴定--%>
                                        <%--<input type="text" id="identify_day_1" name="tradeIdentifyDay"> 天后鉴定--%>
                                    <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                                <%--&nbsp;--%>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${rules.tradeIdentifyType eq 2}">--%>
                                        <%--<input type="radio" name="tradeIdentifyType" value="2" checked="checked">固定时点鉴定,次月--%>
                                        <%--<input type="text" id="identify_day_2" name="tradeIdentifyDay"--%>
                                               <%--value="${rules.tradeIdentifyDay}">号鉴定--%>
                                    <%--</c:when>--%>
                                    <%--<c:otherwise>--%>
                                        <%--<input type="radio" name="tradeIdentifyType" value="2">固定时点鉴定,次月--%>
                                        <%--<input type="text" id="identify_day_2" name="tradeIdentifyDay">号鉴定--%>
                                    <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                                <%--&nbsp;--%>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${rules.tradeIdentifyType eq 3}">--%>
                                        <%--<input type="radio" name="tradeIdentifyType" value="3" checked="checked">实时鉴定--%>
                                    <%--</c:when>--%>
                                    <%--<c:otherwise>--%>
                                        <%--<input type="radio" name="tradeIdentifyType" value="3">实时鉴定--%>
                                    <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                            <%--</div>--%>
                            <%--<label class="control-label col-md-1">会员效期<span class="must"></span></label>--%>

                            <%--<div class="controls col-md-5">--%>
                                <%--<c:forEach var="validity" items="${rulesValidity}">--%>
                                    <%--<c:choose>--%>
                                        <%--<c:when test="${validity.key eq rules.rulesValidityType}">--%>
                                            <%--<input type="radio" name="rulesValidityType"--%>
                                                   <%--id="rulesValidityType_${validity.key}" value="${validity.key}"--%>
                                                   <%--checked="checked"/>${validity.name}--%>
                                            <%--<input type="text" name="rulesValidityDay"--%>
                                                   <%--id="rulesValidityDay_${validity.key}"--%>
                                                   <%--value="${rules.rulesValidityDay}"/> 天 &nbsp;--%>
                                        <%--</c:when>--%>
                                        <%--<c:otherwise>--%>
                                            <%--<input type="radio" name="rulesValidityType"--%>
                                                   <%--id="rulesValidityType_${validity.key}"--%>
                                                   <%--value="${validity.key}"/>${validity.name}--%>
                                            <%--<input type="text" name="rulesValidityDay"--%>
                                                   <%--id="rulesValidityDay_${validity.key}"/> 天 &nbsp;--%>
                                        <%--</c:otherwise>--%>
                                    <%--</c:choose>--%>
                                <%--</c:forEach>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!-- --------------------------CPA页面处理--------------------------------------->
                    <%--<c:choose>--%>
                        <%--<c:when test="${fn:length(cpaList)>0}">--%>
                            <%--<div class="panel-heading">--%>
                                <%--<span><input id="cpa" name="cpa" type="checkbox" class="must" checked="checked"/>CPA[按行为结算]</span>--%>
                            <%--</div>--%>
                            <%--<div class="panel-body" id="cpa_div">--%>
                                <%--<!--梯度核算/非梯度核算-->--%>
                                <%--<div style="text-align: center;">--%>
                                    <%--<c:forEach var="rulesType" items="${rulesType}">--%>
                                        <%--<div class="controls col-md-5">--%>
                                            <%--<c:choose>--%>
                                                <%--<c:when test="${rulesType.key eq cpa.isLevel}">--%>
                                                    <%--<span><input id="cpa_isLevel_${rulesType.key}"--%>
                                                                 <%--value="${rulesType.key}" class="cpa_isLeveSty"--%>
                                                                 <%--name="cpaIsLevel" type="radio"--%>
                                                                 <%--checked="checked"/>${rulesType.name}</span>--%>
                                                <%--</c:when>--%>
                                                <%--<c:otherwise>--%>
                                                    <%--<span><input id="cpa_isLevel_${rulesType.key}"--%>
                                                                 <%--value="${rulesType.key}" class="cpa_isLeveSty"--%>
                                                                 <%--name="cpaIsLevel"--%>
                                                                 <%--type="radio"/>${rulesType.name}</span>--%>
                                                <%--</c:otherwise>--%>
                                            <%--</c:choose>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                <%--</div>--%>
                                <%--<!--独立结算/组合结算-->--%>
                                <%--<div id="CpaNoLevelIdentifyType" style="margin-top: 30px;text-align: center;"--%>
                                     <%--align="center">--%>
                                    <%--<ul class="nav nav-tabs" id="myCpaTab1">--%>
                                        <%--<c:choose>--%>
                                            <%--<c:when test="${cpa.settleType eq 0}">--%>
                                                <%--<li class="active">--%>
                                                    <%--<a href="#CpaNoLevelIdentifyType_radio" data-toggle="tab">独立结算</a>--%>
                                                <%--</li>--%>
                                                <%--<li>--%>
                                                    <%--<a href="#CpaNoLevelIdentifyType_checkbox"--%>
                                                       <%--data-toggle="tab">组合结算</a>--%>
                                                <%--</li>--%>
                                            <%--</c:when>--%>
                                            <%--<c:otherwise>--%>
                                                <%--<li>--%>
                                                    <%--<a href="#CpaNoLevelIdentifyType_radio" data-toggle="tab">独立结算</a>--%>
                                                <%--</li>--%>
                                                <%--<li class="active">--%>
                                                    <%--<a href="#CpaNoLevelIdentifyType_checkbox"--%>
                                                       <%--data-toggle="tab">组合结算</a>--%>
                                                <%--</li>--%>
                                            <%--</c:otherwise>--%>
                                        <%--</c:choose>--%>
                                    <%--</ul>--%>
                                    <%--<div class="tab-content">--%>
                                        <%--<c:choose>--%>
                                            <%--<c:when test="${cpa.settleType eq 0}">--%>
                                                <%--<!--独立结算类型-->--%>
                                                <%--<div class="tab-pane fade in active" id="CpaNoLevelIdentifyType_radio">--%>
                                                    <%--<div class="form-group">--%>
                                                        <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                            <%--<div class="col-md-1">--%>
                                                                <%--<c:choose>--%>
                                                                    <%--<c:when test="${cpa.identifyType eq IdentifyType.key}">--%>
                                                                        <%--<input id="cpa_IdentifyType_radio_${IdentifyType.key}"--%>
                                                                               <%--name="cpa_IdentifyType_radio"--%>
                                                                               <%--type="radio" value="${IdentifyType.key}"--%>
                                                                               <%--checked="checked"/>${IdentifyType.name}--%>
                                                                    <%--</c:when>--%>
                                                                    <%--<c:otherwise>--%>
                                                                        <%--<input id="cpa_IdentifyType_radio_${IdentifyType.key}"--%>
                                                                               <%--name="cpa_IdentifyType_radio"--%>
                                                                               <%--type="radio"--%>
                                                                               <%--value="${IdentifyType.key}"/>${IdentifyType.name}--%>
                                                                    <%--</c:otherwise>--%>
                                                                <%--</c:choose>--%>
                                                            <%--</div>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</div>--%>
                                                    <%--<div class="form-group">--%>
                                                        <%--<label class="col-md-1">佣金</label>--%>

                                                        <%--<div class="col-md-5" align="left">--%>
                                                            <%--<input type="text" name="cpa_IdentifyTypeDayRadio"--%>
                                                                   <%--id="cpa_IdentifyTypeDayRadio"--%>
                                                                   <%--value="<fmt:formatNumber pattern='#,##0.00' value='${cpa.commissionPercentage*0.001}'/>"/>--%>
                                                            <%--元--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                    <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                                <%--</div>--%>
                                                <%--<!--组合结算类型 //FIXME M.Zhang 继续完善-->--%>
                                                <%--<div class="tab-pane fade" id="CpaNoLevelIdentifyType_checkbox">--%>
                                                    <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                        <%--<div class="col-md-3">--%>
                                                            <%--<input type="checkbox" name="cpa_IdentifyType_box"--%>
                                                                   <%--value="${IdentifyType.key}"--%>
                                                                   <%--id="cpa_IdentifyType_box_${IdentifyType.key}"/>${IdentifyType.name}--%>
                                                            <%--<input type="text" name="cpa_IdentifyTypDayBox"--%>
                                                                   <%--id="cpa_IdentifyTypDayBox_${IdentifyType.key}"/>元--%>
                                                        <%--</div>--%>
                                                    <%--</c:forEach>--%>
                                                    <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                                <%--</div>--%>
                                            <%--</c:when>--%>
                                            <%--<c:otherwise>--%>
                                                <%--<!--独立结算类型-->--%>
                                                <%--<div class="tab-pane fade" id="CpaNoLevelIdentifyType_radio">--%>
                                                    <%--<div class="form-group">--%>
                                                        <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                            <%--<div class="col-md-1">--%>
                                                                <%--<input id="cpa_IdentifyType_radio_${IdentifyType.key}"--%>
                                                                       <%--name="cpa_IdentifyType_radio" type="radio"--%>
                                                                       <%--value="${IdentifyType.key}"/>${IdentifyType.name}--%>
                                                            <%--</div>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</div>--%>
                                                    <%--<div class="form-group">--%>
                                                        <%--<label class="col-md-1">佣金</label>--%>

                                                        <%--<div class="col-md-5" align="left">--%>
                                                            <%--<input type="text" name="cpa_IdentifyTypeDayRadio"--%>
                                                                   <%--id="cpa_IdentifyTypeDayRadio"/> 元--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                    <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                                <%--</div>--%>
                                                <%--<!--组合结算类型-->--%>
                                                <%--<div class="tab-pane fade in active"--%>
                                                     <%--id="CpaNoLevelIdentifyType_checkbox">--%>
                                                    <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                        <%--<div class="col-md-3">--%>
                                                            <%--<input type="checkbox" name="cpa_IdentifyType_box"--%>
                                                                   <%--value="${IdentifyType.key}"--%>
                                                                   <%--id="cpa_IdentifyType_box_${IdentifyType.key}"/>${IdentifyType.name}--%>
                                                            <%--<input type="text" name="cpa_IdentifyTypDayBox"--%>
                                                                   <%--id="cpa_IdentifyTypDayBox_${IdentifyType.key}"/>元--%>
                                                        <%--</div>--%>
                                                    <%--</c:forEach>--%>
                                                    <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                                <%--</div>--%>
                                            <%--</c:otherwise>--%>
                                        <%--</c:choose>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<!--梯度核算-->--%>
                                <%--<div id="CpaLevelIdentifyType" style="margin-top: 30px;display: none;" align="center">--%>
                                    <%--<ul class="nav nav-tabs" id="myCpaTab2">--%>
                                        <%--<c:choose>--%>
                                            <%--<c:when test="${cpa.settleType eq 1}">--%>
                                                <%--<li class="active">--%>
                                                    <%--<a href="#cpaLevelType1" data-toggle="tab">首投当日额度</a>--%>
                                                <%--</li>--%>
                                                <%--<li>--%>
                                                    <%--<a href="#cpaLevelType2" data-toggle="tab">首投单笔额度</a>--%>
                                                <%--</li>--%>
                                            <%--</c:when>--%>
                                            <%--<c:otherwise>--%>
                                                <%--<li>--%>
                                                    <%--<a href="#cpaLevelType1" data-toggle="tab">首投当日额度</a>--%>
                                                <%--</li>--%>
                                                <%--<li class="active">--%>
                                                    <%--<a href="#cpaLevelType2" data-toggle="tab">首投单笔额度</a>--%>
                                                <%--</li>--%>
                                            <%--</c:otherwise>--%>
                                        <%--</c:choose>--%>
                                    <%--</ul>--%>
                                    <%--<div class="tab-content">--%>
                                        <%--<c:choose>--%>
                                            <%--<c:when test="${cpa.settleType eq 1}">--%>
                                                <%--<div class="tab-pane fade in active" id="cpaLevelType1">--%>
                                                    <%--<table width="100%" id="tab_Type_01">--%>
                                                        <%--<c:forEach var="openCpa" items="${cpaList}" varStatus="sub">--%>
                                                            <%--<c:choose>--%>
                                                                <%--<c:when test="${sub.index eq 0}">--%>
                                                                    <%--<tr align="center">--%>
                                                                        <%--<td align="center">首投当日累计投资额下限 <input--%>
                                                                                <%--type="text" name="cpa_1_identifyLimit"--%>
                                                                                <%--value="<fmt:formatNumber pattern='#,#00.00' value='${openCpa.identifyLimit*0.001}'/>"/>--%>
                                                                        <%--</td>--%>
                                                                        <%--<td align="center">单价 <input type="text"--%>
                                                                                                     <%--name="cpa_1_commissionPercentage"--%>
                                                                                                     <%--value="<fmt:formatNumber pattern="#,#00.00" value='${openCpa.commissionPercentage*0.001}'/>"/>--%>
                                                                            <%--元--%>
                                                                        <%--</td>--%>
                                                                        <%--<td>--%>
                                                                            <%--<div class="btn-group">--%>
                                                                                <%--<button type="button"--%>
                                                                                        <%--class="btn btn-default"--%>
                                                                                        <%--id="cpa_btnAdd_type01">添加--%>
                                                                                <%--</button>--%>
                                                                                <%--<button type="button"--%>
                                                                                        <%--class="btn btn-default"--%>
                                                                                        <%--id="cpa_btnDel_type01">删除--%>
                                                                                <%--</button>--%>
                                                                            <%--</div>--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                <%--</c:when>--%>
                                                                <%--<c:otherwise>--%>
                                                                    <%--<tr align="center">--%>
                                                                        <%--<td align="center">首投当日累计投资额下限 <input--%>
                                                                                <%--type="text" name="cpa_1_identifyLimit"--%>
                                                                                <%--value="<fmt:formatNumber pattern='#,#00.00' value='${openCpa.identifyLimit*0.001}'/>"/>--%>
                                                                        <%--</td>--%>
                                                                        <%--<td align="center">单价 <input type="text"--%>
                                                                                                     <%--name="cpa_1_commissionPercentage"--%>
                                                                                                     <%--value="<fmt:formatNumber pattern="#,#00.00" value='${openCpa.commissionPercentage*0.001}'/>"/>--%>
                                                                            <%--元--%>
                                                                        <%--</td>--%>
                                                                        <%--<td></td>--%>
                                                                    <%--</tr>--%>
                                                                <%--</c:otherwise>--%>
                                                            <%--</c:choose>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</table>--%>
                                                <%--</div>--%>
                                                <%--<div class="tab-pane fade " id="cpaLevelType2">--%>
                                                    <%--<table width="100%" id="tab_Type_02">--%>
                                                        <%--<tr align="center">--%>
                                                            <%--<td align="center">首笔投资投资额下限<input type="text"--%>
                                                                                               <%--name="cpa_2_identifyLimit"/>--%>
                                                            <%--</td>--%>
                                                            <%--<td align="center">单价 <input type="text"--%>
                                                                                         <%--name="cpa_2_commissionPercentage"/>--%>
                                                                <%--元--%>
                                                            <%--</td>--%>
                                                            <%--<td>--%>
                                                                <%--<div class="btn-group">--%>
                                                                    <%--<button type="button" class="btn btn-default"--%>
                                                                            <%--id="cpa_btnAdd_type02">添加--%>
                                                                    <%--</button>--%>
                                                                    <%--<button type="button" class="btn btn-default"--%>
                                                                            <%--id="cpa_btnDel_type02">删除--%>
                                                                    <%--</button>--%>
                                                                <%--</div>--%>
                                                            <%--</td>--%>
                                                        <%--</tr>--%>
                                                    <%--</table>--%>
                                                <%--</div>--%>
                                            <%--</c:when>--%>
                                            <%--<c:otherwise>--%>
                                                <%--<div class="tab-pane fade" id="cpaLevelType1">--%>
                                                    <%--<table width="100%" id="tab_Type_01">--%>
                                                        <%--<tr align="center">--%>
                                                            <%--<td align="center">首投当日累计投资额下限 <input type="text"--%>
                                                                                                  <%--name="cpa_1_identifyLimit"/>--%>
                                                            <%--</td>--%>
                                                            <%--<td align="center">单价 <input type="text"--%>
                                                                                         <%--name="cpa_1_commissionPercentage"/>--%>
                                                                <%--元--%>
                                                            <%--</td>--%>
                                                            <%--<td>--%>
                                                                <%--<div class="btn-group">--%>
                                                                    <%--<button type="button" class="btn btn-default"--%>
                                                                            <%--id="cpa_btnAdd_type01">添加--%>
                                                                    <%--</button>--%>
                                                                    <%--<button type="button" class="btn btn-default"--%>
                                                                            <%--id="cpa_btnDel_type01">删除--%>
                                                                    <%--</button>--%>
                                                                <%--</div>--%>
                                                            <%--</td>--%>
                                                        <%--</tr>--%>
                                                    <%--</table>--%>
                                                <%--</div>--%>
                                                <%--<div class="tab-pane fade in active" id="cpaLevelType2">--%>
                                                    <%--<table width="100%" id="tab_Type_02">--%>
                                                        <%--<c:forEach var="openCpa" items="${cpaList}" varStatus="sub">--%>
                                                            <%--<c:choose>--%>
                                                                <%--<c:when test="${sub.index eq 0}">--%>
                                                                    <%--<tr align="center">--%>
                                                                        <%--<td align="center">首笔投资投资额下限<input type="text"--%>
                                                                                                           <%--name="cpa_2_identifyLimit"--%>
                                                                                                           <%--value="<fmt:formatNumber pattern='#,#00.00' value='${openCpa.identifyLimit*0.001}'/>"/>--%>
                                                                        <%--</td>--%>
                                                                        <%--<td align="center">单价 <input type="text"--%>
                                                                                                     <%--name="cpa_2_commissionPercentage"--%>
                                                                                                     <%--value="<fmt:formatNumber pattern="#,#00.00" value='${openCpa.commissionPercentage*0.001}'/>"/>--%>
                                                                            <%--元--%>
                                                                        <%--</td>--%>
                                                                        <%--<td>--%>
                                                                            <%--<div class="btn-group">--%>
                                                                                <%--<button type="button"--%>
                                                                                        <%--class="btn btn-default"--%>
                                                                                        <%--id="cpa_btnAdd_type02">添加--%>
                                                                                <%--</button>--%>
                                                                                <%--<button type="button"--%>
                                                                                        <%--class="btn btn-default"--%>
                                                                                        <%--id="cpa_btnDel_type02">删除--%>
                                                                                <%--</button>--%>
                                                                            <%--</div>--%>
                                                                        <%--</td>--%>
                                                                    <%--</tr>--%>
                                                                <%--</c:when>--%>
                                                                <%--<c:otherwise>--%>
                                                                    <%--<tr align="center">--%>
                                                                        <%--<td align="center">首笔投资投资额下限<input type="text"--%>
                                                                                                           <%--name="cpa_2_identifyLimit"--%>
                                                                                                           <%--value="<fmt:formatNumber pattern='#,#00.00' value='${openCpa.identifyLimit*0.001}'/>"/>--%>
                                                                        <%--</td>--%>
                                                                        <%--<td align="center">单价 <input type="text"--%>
                                                                                                     <%--name="cpa_2_commissionPercentage"--%>
                                                                                                     <%--value="<fmt:formatNumber pattern='#,#00.00' value='${openCpa.commissionPercentage*0.001}'/>"/>--%>
                                                                            <%--元--%>
                                                                        <%--</td>--%>
                                                                        <%--<td></td>--%>
                                                                    <%--</tr>--%>
                                                                <%--</c:otherwise>--%>
                                                            <%--</c:choose>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</table>--%>
                                                <%--</div>--%>
                                            <%--</c:otherwise>--%>
                                        <%--</c:choose>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:when>--%>
                        <%--<c:otherwise>--%>
                            <%--<div class="panel-heading">--%>
                                <%--<span><input id="cpa" name="cpa" type="checkbox" class="must"/>CPA[按行为结算]</span>--%>
                            <%--</div>--%>
                            <%--<div class="panel-body" id="cpa_div" style="display: none;">--%>
                                <%--<!--梯度核算/非梯度核算-->--%>
                                <%--<div style="text-align: center;">--%>
                                    <%--<c:forEach var="rulesType" items="${rulesType}">--%>
                                        <%--<div class="controls col-md-5">--%>
                                            <%--<span><input id="cpa_isLevel_${rulesType.key}" value="${rulesType.key}"--%>
                                                         <%--class="cpa_isLeveSty" name="cpaIsLevel"--%>
                                                         <%--type="radio"/>${rulesType.name}</span>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                <%--</div>--%>
                                <%--<!--独立结算/组合结算-->--%>
                                <%--<div id="CpaNoLevelIdentifyType"--%>
                                     <%--style="margin-top: 30px;display: none; text-align: center;" align="center">--%>
                                    <%--<ul class="nav nav-tabs" id="myCpaTab1">--%>
                                        <%--<li class="active">--%>
                                            <%--<a href="#CpaNoLevelIdentifyType_radio" data-toggle="tab">独立结算</a>--%>
                                        <%--</li>--%>
                                        <%--<li>--%>
                                            <%--<a href="#CpaNoLevelIdentifyType_checkbox" data-toggle="tab">组合结算</a>--%>
                                        <%--</li>--%>
                                    <%--</ul>--%>
                                    <%--<div class="tab-content">--%>
                                        <%--<!--独立结算类型-->--%>
                                        <%--<div class="tab-pane fade in active" id="CpaNoLevelIdentifyType_radio">--%>
                                            <%--<div class="form-group">--%>
                                                <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                    <%--<div class="col-md-1">--%>
                                                        <%--<input id="cpa_IdentifyType_radio_${IdentifyType.key}"--%>
                                                               <%--name="cpa_IdentifyType_radio" type="radio"--%>
                                                               <%--value="${IdentifyType.key}"/>${IdentifyType.name}--%>
                                                    <%--</div>--%>
                                                <%--</c:forEach>--%>
                                            <%--</div>--%>
                                            <%--<div class="form-group">--%>
                                                <%--<label class="col-md-1">佣金</label>--%>

                                                <%--<div class="col-md-5" align="left">--%>
                                                    <%--<input type="text" name="cpa_IdentifyTypeDayRadio"--%>
                                                           <%--id="cpa_IdentifyTypeDayRadio"/> 元--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                            <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                        <%--</div>--%>
                                        <%--<!--组合结算类型-->--%>
                                        <%--<div class="tab-pane fade " id="CpaNoLevelIdentifyType_checkbox">--%>
                                            <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                <%--<div class="col-md-3">--%>
                                                    <%--<input type="checkbox" name="cpa_IdentifyType_box"--%>
                                                           <%--value="${IdentifyType.key}"--%>
                                                           <%--id="cpa_IdentifyType_box_${IdentifyType.key}"/>${IdentifyType.name}--%>
                                                    <%--<input type="text" name="cpa_IdentifyTypDayBox"--%>
                                                           <%--id="cpa_IdentifyTypDayBox_${IdentifyType.key}"/>元--%>
                                                <%--</div>--%>
                                            <%--</c:forEach>--%>
                                            <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<!--梯度核算-->--%>
                                <%--<div id="CpaLevelIdentifyType" style="margin-top: 30px;display: none;" align="center">--%>
                                    <%--<ul class="nav nav-tabs" id="myCpaTab2">--%>
                                        <%--<li class="active">--%>
                                            <%--<a href="#cpaLevelType1" data-toggle="tab">首投当日额度</a>--%>
                                        <%--</li>--%>
                                        <%--<li>--%>
                                            <%--<a href="#cpaLevelType2" data-toggle="tab">首投单笔额度</a>--%>
                                        <%--</li>--%>
                                    <%--</ul>--%>
                                    <%--<div class="tab-content">--%>
                                        <%--<div class="tab-pane fade in active" id="cpaLevelType1">--%>
                                            <%--<table width="100%" id="tab_Type_01">--%>
                                                <%--<tr align="center">--%>
                                                    <%--<td align="center">首投当日累计投资额下限 <input type="text"--%>
                                                                                          <%--name="cpa_1_identifyLimit"/>--%>
                                                    <%--</td>--%>
                                                    <%--<td align="center">单价 <input type="text"--%>
                                                                                 <%--name="cpa_1_commissionPercentage"/> 元--%>
                                                    <%--</td>--%>
                                                    <%--<td>--%>
                                                        <%--<div class="btn-group">--%>
                                                            <%--<button type="button" class="btn btn-default"--%>
                                                                    <%--id="cpa_btnAdd_type01">添加--%>
                                                            <%--</button>--%>
                                                            <%--<button type="button" class="btn btn-default"--%>
                                                                    <%--id="cpa_btnDel_type01">删除--%>
                                                            <%--</button>--%>
                                                        <%--</div>--%>
                                                    <%--</td>--%>
                                                <%--</tr>--%>
                                            <%--</table>--%>
                                        <%--</div>--%>
                                        <%--<div class="tab-pane fade " id="cpaLevelType2">--%>
                                            <%--<table width="100%" id="tab_Type_02">--%>
                                                <%--<tr align="center">--%>
                                                    <%--<td align="center">首笔投资投资额下限<input type="text"--%>
                                                                                       <%--name="cpa_2_identifyLimit"/></td>--%>
                                                    <%--<td align="center">单价 <input type="text"--%>
                                                                                 <%--name="cpa_2_commissionPercentage"/> 元--%>
                                                    <%--</td>--%>
                                                    <%--<td>--%>
                                                        <%--<div class="btn-group">--%>
                                                            <%--<button type="button" class="btn btn-default"--%>
                                                                    <%--id="cpa_btnAdd_type02">添加--%>
                                                            <%--</button>--%>
                                                            <%--<button type="button" class="btn btn-default"--%>
                                                                    <%--id="cpa_btnDel_type02">删除--%>
                                                            <%--</button>--%>
                                                        <%--</div>--%>
                                                    <%--</td>--%>
                                                <%--</tr>--%>
                                            <%--</table>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:otherwise>--%>
                    <%--</c:choose>--%>
                    <!-----------------------------CPS页面处理--------------------------------------->
                    <%--<c:choose>--%>
                        <%--<c:when test="${cps.isLevel eq 2}">--%>
                            <%--<div class="panel-heading">--%>
                                <%--<span><input id="cps" name="cps" type="checkbox" class="must" checked="checked"/>CPS[按投资交易结算]</span>--%>
                            <%--</div>--%>
                            <%--<div class="panel-body" id="cps_div" style="display: none;">--%>
                                <%--<!--梯度核算/非梯度核算-->--%>
                                <%--<div style="text-align: center;">--%>
                                    <%--<c:forEach var="rulesType" items="${rulesType}">--%>
                                        <%--<div class="controls col-md-5">--%>
                                            <%--<span><input id="cps_isLevel_${rulesType.key}" value="${rulesType.key}"--%>
                                                         <%--class="cps_isLeveSty" name="cps_isLevel"--%>
                                                         <%--type="radio"/>${rulesType.name}</span>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                <%--</div>--%>
                                <%--<!--交易指标-->--%>
                                <%--<div class="controls col-md-12 bottom-line top-line" style="display: none;"--%>
                                     <%--id="tradeType">--%>
                                    <%--<label class="control-label col-md-1">交易指标<span class="must"></span></label>--%>

                                    <%--<div class="divClear">--%>
                                        <%--<c:forEach var="tradeType" items="${cpsTradeType}">--%>
                                            <%--<div class="controls col-md-3" id="cps_tradeType_${tradeType.key}">--%>
                                                <%--<input id="tradeType_${tradeType.key}" name="cps_tradeType" type="radio"--%>
                                                       <%--value="${tradeType.key}"/>${tradeType.name}--%>
                                            <%--</div>--%>
                                        <%--</c:forEach>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="controls col-md-12 bottom-line top-line" id="cps_NO_LevelType_1"--%>
                                     <%--style="display: none;">--%>
                                    <%--<label class="control-label col-md-1">结算佣金<span class="must"></span></label>--%>

                                    <%--<div class="divClear">--%>
                                        <%--<c:forEach var="commissionType" items="${commissionType}">--%>
                                            <%--<div class="controls col-md-3">--%>
                                                <%--<input id="commissionType_${commissionType.key}"--%>
                                                       <%--name="cps_commissionType" type="radio"--%>
                                                       <%--value="${commissionType.key}"/>${commissionType.name}--%>
                                                <%--<input type="text" name="cps_commissionTypeVal"--%>
                                                       <%--id="commissionTypeVal_${commissionType.key}"/>--%>
                                                <%--<c:choose>--%>
                                                    <%--<c:when test="${commissionType.key==1}">--%>
                                                        <%--%--%>
                                                    <%--</c:when>--%>
                                                    <%--<c:otherwise>--%>
                                                        <%--元--%>
                                                    <%--</c:otherwise>--%>
                                                <%--</c:choose>--%>
                                            <%--</div>--%>
                                        <%--</c:forEach>--%>
                                        <%--<div class="controls col-md-3">--%>
                                            <%--产品周期下限<input type="text" name="cps_bid_Day" id="cps_bid_day"/> &nbsp;天--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="controls col-md-12 bottom-line top-line" id="cps_LevelType_2"--%>
                                     <%--style="display: none;">--%>
                                    <%--<table width="100%" id="cps_tab">--%>
                                        <%--<tr align="center">--%>
                                            <%--<td align="center">--%>
                                                <%--累计投资额度下限<input type="text" name="cps_identifyLimit"/> &nbsp;元--%>
                                            <%--</td>--%>
                                            <%--<td align="center">--%>
                                                <%--产品周期下限<input type="text" name="cps_bidDay"/> &nbsp;天--%>
                                            <%--</td>--%>
                                            <%--<td align="center">--%>
                                                <%--佣金:&nbsp;<input id="cps_level_commissionType_1" value="1"--%>
                                                                <%--name="cps_1_commissionPercentage" type="radio"/>百分比--%>
                                                <%--&nbsp;<input type="text" name="cps_1_commissionPercentage_val"--%>
                                                             <%--id="cps_level_commissionType_val_1"/>&nbsp;%--%>
                                                <%--&nbsp;<input id="cps_level_commissionType_2" value="2"--%>
                                                             <%--name="cps_1_commissionPercentage" type="radio"/>固定额度--%>
                                                <%--&nbsp;<input type="text" name="cps_1_commissionPercentage_val"--%>
                                                             <%--id="cps_level_commissionType_val_2"/>&nbsp;元--%>
                                            <%--</td>--%>
                                            <%--<td>--%>
                                                <%--<div class="btn-group">--%>
                                                    <%--<button type="button" class="btn btn-default" id="cps_btnAdd">添加--%>
                                                    <%--</button>--%>
                                                    <%--<button type="button" class="btn btn-default" id="cps_btnDel">删除--%>
                                                    <%--</button>--%>
                                                <%--</div>--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
                                    <%--</table>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:when>--%>
                        <%--<c:otherwise>--%>
                            <%--<div class="panel-heading">--%>
                                <%--<span><input id="cps" name="cps" type="checkbox" class="must"/>CPS[按投资交易结算]</span>--%>
                            <%--</div>--%>
                            <%--<div class="panel-body" id="cps_div" style="display: none;">--%>
                                <%--<!--梯度核算/非梯度核算-->--%>
                                <%--<div style="text-align: center;">--%>
                                    <%--<c:forEach var="rulesType" items="${rulesType}">--%>
                                        <%--<div class="controls col-md-5">--%>
                                            <%--<span><input id="cps_isLevel_${rulesType.key}" value="${rulesType.key}"--%>
                                                         <%--class="cps_isLeveSty" name="cps_isLevel"--%>
                                                         <%--type="radio"/>${rulesType.name}</span>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                <%--</div>--%>
                                <%--<!--交易指标-->--%>
                                <%--<div class="controls col-md-12 bottom-line top-line" style="display: none;"--%>
                                     <%--id="tradeType">--%>
                                    <%--<label class="control-label col-md-1">交易指标<span class="must"></span></label>--%>

                                    <%--<div class="divClear">--%>
                                        <%--<c:forEach var="tradeType" items="${cpsTradeType}">--%>
                                            <%--<div class="controls col-md-3" id="cps_tradeType_${tradeType.key}">--%>
                                                <%--<input id="tradeType_${tradeType.key}" name="cps_tradeType" type="radio"--%>
                                                       <%--value="${tradeType.key}"/>${tradeType.name}--%>
                                            <%--</div>--%>
                                        <%--</c:forEach>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="controls col-md-12 bottom-line top-line" id="cps_NO_LevelType_1"--%>
                                     <%--style="display: none;">--%>
                                    <%--<label class="control-label col-md-1">结算佣金<span class="must"></span></label>--%>

                                    <%--<div class="divClear">--%>
                                        <%--<c:forEach var="commissionType" items="${commissionType}">--%>
                                            <%--<div class="controls col-md-3">--%>
                                                <%--<input id="commissionType_${commissionType.key}"--%>
                                                       <%--name="cps_commissionType" type="radio"--%>
                                                       <%--value="${commissionType.key}"/>${commissionType.name}--%>
                                                <%--<input type="text" name="cps_commissionTypeVal"--%>
                                                       <%--id="commissionTypeVal_${commissionType.key}"/>--%>
                                                <%--<c:choose>--%>
                                                    <%--<c:when test="${commissionType.key==1}">--%>
                                                        <%--%--%>
                                                    <%--</c:when>--%>
                                                    <%--<c:otherwise>--%>
                                                        <%--元--%>
                                                    <%--</c:otherwise>--%>
                                                <%--</c:choose>--%>
                                            <%--</div>--%>
                                        <%--</c:forEach>--%>
                                        <%--<div class="controls col-md-3">--%>
                                            <%--产品周期下限<input type="text" name="cps_bid_Day" id="cps_bid_day"/> &nbsp;天--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="controls col-md-12 bottom-line top-line" id="cps_LevelType_2"--%>
                                     <%--style="display: none;">--%>
                                    <%--<table width="100%" id="cps_tab">--%>
                                        <%--<tr align="center">--%>
                                            <%--<td align="center">--%>
                                                <%--累计投资额度下限<input type="text" name="cps_identifyLimit"/> &nbsp;元--%>
                                            <%--</td>--%>
                                            <%--<td align="center">--%>
                                                <%--产品周期下限<input type="text" name="cps_bidDay"/> &nbsp;天--%>
                                            <%--</td>--%>
                                            <%--<td align="center">--%>
                                                <%--佣金:&nbsp;<input id="cps_level_commissionType_1" value="1"--%>
                                                                <%--name="cps_1_commissionPercentage" type="radio"/>百分比--%>
                                                <%--&nbsp;<input type="text" name="cps_1_commissionPercentage_val"--%>
                                                             <%--id="cps_level_commissionType_val_1"/>&nbsp;%--%>
                                                <%--&nbsp;<input id="cps_level_commissionType_2" value="2"--%>
                                                             <%--name="cps_1_commissionPercentage" type="radio"/>固定额度--%>
                                                <%--&nbsp;<input type="text" name="cps_1_commissionPercentage_val"--%>
                                                             <%--id="cps_level_commissionType_val_2"/>&nbsp;元--%>
                                            <%--</td>--%>
                                            <%--<td>--%>
                                                <%--<div class="btn-group">--%>
                                                    <%--<button type="button" class="btn btn-default" id="cps_btnAdd">添加--%>
                                                    <%--</button>--%>
                                                    <%--<button type="button" class="btn btn-default" id="cps_btnDel">删除--%>
                                                    <%--</button>--%>
                                                <%--</div>--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
                                    <%--</table>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:otherwise>--%>
                    <%--</c:choose>--%>
                    <%--<!-----------------------------ROI页面处理--------------------------------------->--%>
                    <%--<c:choose>--%>
                        <%--<c:when test="${fn:length(roiList)>0}">--%>
                            <%--<div class="panel-heading">--%>
                                <%--<span><input id="roi" name="roi" type="checkbox" class="must" checked="checked"/>ROI[按投资转换率结算]</span>--%>
                            <%--</div>--%>
                            <%--<div class="panel-body" id="roi_div" style="display: none;">--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-2 control-label">首投投资回报率</label>--%>

                                    <%--<div class="col-sm-3">--%>
                                        <%--<input type="text" name="roiA">&nbsp;:&nbsp;<input type="text" name="roiB">--%>
                                    <%--</div>--%>
                                    <%--<label class="col-sm-2 control-label">最低投资总额</label>--%>

                                    <%--<div class="col-sm-3">--%>
                                        <%--<input type="text" name="roiAmountLimit"> 元--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:when>--%>
                        <%--<c:otherwise>--%>
                            <%--<div class="panel-heading">--%>
                                <%--<span><input id="roi" name="roi" type="checkbox" class="must"/>ROI[按投资转换率结算]</span>--%>
                            <%--</div>--%>
                            <%--<div class="panel-body" id="roi_div" style="display: none;">--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-2 control-label">首投投资回报率</label>--%>

                                    <%--<div class="col-sm-3">--%>
                                        <%--<input type="text" name="roiA">&nbsp;:&nbsp;<input type="text" name="roiB">--%>
                                    <%--</div>--%>
                                    <%--<label class="col-sm-2 control-label">最低投资总额</label>--%>

                                    <%--<div class="col-sm-3">--%>
                                        <%--<input type="text" name="roiAmountLimit"> 元--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:otherwise>--%>
                    <%--</c:choose>--%>
                <%--</div>--%>
            <%--</div>--%>
        </form>
        <div class="form-actions controls col-md-12">
            <button type="button" class="btn btn-success" id="btnSave"
                    onclick="ruleEditSave('${ctx}/rulesManage/ruleEditSave.do','${ctx}/rulesManage/rulesIndex.do');"><i
                    class="icon-ok"></i>保存
            </button>
            <button type="reset" class="btn btn-default" onclick="history.back();"><i class="icon-off"></i>返回</button>
        </div>
    </div>
</div>
</body>