<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script src="${app_static_root}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        //$(":radio").attr("readonly",true);
        $(":text").attr("disabled", true);
    });
</script>
<body>
<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx }/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li><a href="#">核算规则管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
    <li class="active">核算规则详情</li>
</ul>
<div class="container">
    <!-- middle -->
    <div class="row">
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
                                <input type="text" id="rulesName" name="rulesName" class="form-control" value="${rules.rulesName}"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="control-label col-md-3">交易鉴定类别 <span class="must"></span></label>

                            <div class="col-sm-3">
                                <label class="checkbox-inline" disabled="disabled">
                                    <input type="radio" name="tradeIdentifyType" value="${identify.key}" <c:if test="${rules.tradeIdentifyType == 1}"> checked="checked"</c:if>/> 平行时点鉴定
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
                                <label class="checkbox-inline" disabled="disabled">
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
                                <label class="checkbox-inline" disabled="disabled">
                                    <input type="radio" name="tradeIdentifyType" value="3" <c:if test="${rules.tradeIdentifyType eq 3}"> checked="checked"</c:if>>实时鉴定
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="control-label col-md-3"></label>

                            <div class="col-sm-3">
                                <label class="checkbox-inline" disabled="disabled">
                                    <input type="radio" name="tradeIdentifyType" value="4" <c:if test="${rules.tradeIdentifyType eq 4}"> checked="checked"</c:if>>每周日鉴定
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="control-label col-md-3">会员有效期 <span class="must"></span></label>

                            <div class="col-sm-3">
                                <select id="rulesValidityType" name="rulesValidityType" style="width:132px;" class="form-control" disabled="disabled">
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
                                <label class="checkbox-inline" disabled="disabled">
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
                                            <label class="col-md-5" style="text-align: left" disabled="disabled">
                                                <c:choose>
                                                    <c:when test="${cpa.settleType == 0}">
                                                        <input type="radio" id="cpa_IdentifyType_radio_${IdentifyType.key}" name="cpa_IdentifyType_radio" value="${IdentifyType.key}" <c:if test="${cpa.identifyType eq IdentifyType.key}">checked="checked"</c:if>/> ${IdentifyType.name}
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
                                                    <input type="text" name="cpa_IdentifyTypeDayRadio" class="form-control" id="cpa_IdentifyTypeDayRadio" value="<fmt:formatNumber pattern='#,##0.00' value='${cpa.commissionPercentage*0.001}'/>"/>
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
                                                    <label class="col-md-5" style="text-align: left" disabled="disabled" >
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
                                                    <label class="col-md-5" style="text-align: left" disabled="disabled" >
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
                            <div class="tab-pane fade in active" id="cpaLevelType1">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <table class="table table-bordered" id="tab_Type_01" >
                                            <thead>
                                            <tr>
                                                <th >首投当日累计投资额下限</th>
                                                <th>单价(元)</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:if  test="${cpa.settleType eq 1}">
                                                <c:forEach var="openCpa" items="${cpaList}">
                                                    <tr align="center">
                                                        <td align="center">
                                                            <fmt:formatNumber pattern="#,#00.00" value="${openCpa.identifyLimit*0.001}"/>
                                                        </td>
                                                        <td align="center">
                                                            <fmt:formatNumber pattern="#,#00.00" value="${openCpa.commissionPercentage*0.001}"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade " id="cpaLevelType2">
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <table class="table table-bordered" id="tab_Type_02" >
                                            <thead>
                                            <tr>
                                                <th>首笔投资投资额下限</th>
                                                <th>单价(元)</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:if  test="${cpa.settleType != 1}">
                                                <c:forEach var="openCpa" items="${cpaList}">
                                                    <tr align="center">
                                                        <td align="center">
                                                            <fmt:formatNumber pattern="#,#00.00" value="${openCpa.identifyLimit*0.001}"/>
                                                        </td>
                                                        <td align="center">
                                                            <fmt:formatNumber pattern="#,#00.00" value="${openCpa.commissionPercentage*0.001}"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            </tbody>
                                        </table>
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
                                <label class="checkbox-inline" disabled="disabled">
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
                                    <select id="cps_tradeType" name="cps_tradeType"  class="form-control" disabled="disabled">
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
                                            <label class="checkbox-inline" class="col-md-5" disabled="disabled">
                                                <input name="cps_commissionType" type="radio" value="${commissionType.key}" <c:if test="${cps.commissionType eq commissionType.key}">checked="checked"</c:if>/>${commissionType.name}
                                            </label>
                                        </div>
                                        <c:choose>
                                            <c:when test="${commissionType.key==1}">
                                                <div class="col-sm-5">
                                                    <input type="text" name="cps_commissionTypeVal" class="form-control" <c:if test="${cps.commissionType eq commissionType.key}">value="<fmt:formatNumber type="PERCENT" pattern="#0.00%" value="${cps.commission*0.0001}"/>"</c:if>/>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="col-sm-5">
                                                    <input type="text" name="cps_commissionTypeVal" class="form-control"  <c:if test="${cps.commissionType eq commissionType.key}">value="<fmt:formatNumber pattern="#,#00.00元" value="${cps.commission*0.001}"/>"</c:if>/>
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="openCps" items="${cpsList}">
                                        <tr align="center">
                                            <td align="center">
                                                <fmt:formatNumber pattern="#,#00.00" value="${openCps.identifyLimit*0.001}"/>
                                            </td>
                                            <td align="center">
                                                ${openCps.bidDay}
                                            </td>
                                            <td align="center">
                                                <c:choose>
                                                    <c:when test="${openCps.commissionType eq 1}">
                                                        <fmt:formatNumber type="PERCENT" pattern="#0.00%" value="${openCps.commission*0.0001}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber pattern="#,#00.00" value="${openCps.commission*0.001}"/> 元
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
                                <c:forEach var="openApp" items="${appList}">
                                    <div class="col-md-3">
                                        <label class="col-md-12" style="text-align: left" disabled="disabled">
                                            <input id="channelIds" name="channelIds" type="checkbox" value="${openApp.channelId}" checked="checked" />${openApp.channelName}
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>















            <%--<div class="panel panel-primary">--%>
                <%--<!-----------------------------RULES-页面处理--------------------------------------->--%>
                <%--<div class="panel-heading"><span><i class="icon-table"></i>核算规则基本信息</span></div>--%>
                <%--&lt;%&ndash;<div class="panel-body" id="rules">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<label class="control-label col-md-1">核算规则名称 <span class="must"></span></label>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="controls col-md-10">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="text" id="rulesName" name="rulesName" class="col-xs-4"&ndash;%&gt;--%>
                                   <%--&lt;%&ndash;value="${rules.rulesName}"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<label class="control-label col-md-1">交易鉴定类别<span class="must"></span></label>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="controls col-md-5">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:when test="${rules.tradeIdentifyType eq 1}">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="radio" name="tradeIdentifyType" value="${identify.key}"&ndash;%&gt;--%>
                                           <%--&lt;%&ndash;checked="checked">${identify.name}&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="text" id="identify_day_1" name="tradeIdentifyDay"&ndash;%&gt;--%>
                                           <%--&lt;%&ndash;value="${rules.tradeIdentifyDay}"> 天后鉴定&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="radio" name="tradeIdentifyType"&ndash;%&gt;--%>
                                           <%--&lt;%&ndash;value="${identify.key}">${identify.name}&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="text" id="identify_day_1" name="tradeIdentifyDay"> 天后鉴定&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:when test="${rules.tradeIdentifyType eq 2}">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="radio" name="tradeIdentifyType" value="2" checked="checked">固定时点鉴定,次月&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="text" id="identify_day_2" name="tradeIdentifyDay"&ndash;%&gt;--%>
                                           <%--&lt;%&ndash;value="${rules.tradeIdentifyDay}">号鉴定&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="radio" name="tradeIdentifyType" value="2">固定时点鉴定,次月&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="text" id="identify_day_2" name="tradeIdentifyDay">号鉴定&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:when test="${rules.tradeIdentifyType eq 3}"><input type="radio"&ndash;%&gt;--%>
                                                                                      <%--&lt;%&ndash;name="tradeIdentifyType" value="3"&ndash;%&gt;--%>
                                                                                      <%--&lt;%&ndash;checked="checked">实时鉴定</c:when>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="radio" name="tradeIdentifyType" value="3">实时鉴定&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<label class="control-label col-md-1">会员有效期<span class="must"></span></label>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="controls col-md-5">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<c:forEach var="validity" items="${rulesValidity}">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:when test="${validity.key eq rules.rulesValidityType}">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<input type="radio" name="rulesValidityType"&ndash;%&gt;--%>
                                               <%--&lt;%&ndash;id="rulesValidityType_${validity.key}" value="${validity.key}"&ndash;%&gt;--%>
                                               <%--&lt;%&ndash;checked="checked"/>${validity.name}&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<input type="text" name="rulesValidityDay" id="rulesValidityDay_${validity.key}"&ndash;%&gt;--%>
                                               <%--&lt;%&ndash;value="${rules.rulesValidityDay}"/> 天 &nbsp;&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<input type="radio" name="rulesValidityType"&ndash;%&gt;--%>
                                               <%--&lt;%&ndash;id="rulesValidityType_${validity.key}"&ndash;%&gt;--%>
                                               <%--&lt;%&ndash;value="${validity.key}"/>${validity.name}&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<input type="text" name="rulesValidityDay"&ndash;%&gt;--%>
                                               <%--&lt;%&ndash;id="rulesValidityDay_${validity.key}"/> 天 &nbsp;&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                <%--<!-- --------------------------CPA页面处理--------------------------------------->--%>
                <%--<c:if test="${fn:length(cpaList)>0}">--%>
                    <%--<div class="panel-heading">--%>
                        <%--<span><input id="cpa" name="cpa" type="checkbox" checked="checked"--%>
                                     <%--class="must"/>CPA[按行为结算]</span>--%>
                    <%--</div>--%>
                    <%--&lt;%&ndash;<div class="panel-body" id="cpa_div">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<!--梯度核算/非梯度核算-->&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div style="text-align: center;">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<c:forEach var="rulesType" items="${rulesType}">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="controls col-md-5">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:when test="${rulesType.key eq cpa.isLevel}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<span><input id="cpa_isLevel_${rulesType.key}" value="${rulesType.key}"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;class="cpa_isLeveSty" name="cpaIsLevel" type="radio"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;checked="checked"/>${rulesType.name}</span>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<span><input id="cpa_isLevel_${rulesType.key}" value="${rulesType.key}"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;class="cpa_isLeveSty" name="cpaIsLevel"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;type="radio"/>${rulesType.name}</span>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<c:if test="${cpa.isLevel eq 1}">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<!--独立结算/组合结算-->&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div id="CpaNoLevelIdentifyType" style="margin-top: 30px;text-align: center;"&ndash;%&gt;--%>
                                 <%--&lt;%&ndash;align="center">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<ul class="nav nav-tabs" id="myCpaTab1">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:when test="${cpa.settleType eq 0}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li class="active">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#CpaNoLevelIdentifyType_radio" data-toggle="tab">独立结算</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#CpaNoLevelIdentifyType_checkbox" data-toggle="tab">组合结算</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#CpaNoLevelIdentifyType_radio" data-toggle="tab">独立结算</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li class="active">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#CpaNoLevelIdentifyType_checkbox" data-toggle="tab">组合结算</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
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
                                                                           <%--name="cpa_IdentifyType_radio" type="radio"--%>
                                                                           <%--value="${IdentifyType.key}"--%>
                                                                           <%--checked="checked"/>${IdentifyType.name}--%>
                                                                <%--</c:when>--%>
                                                                <%--<c:otherwise>--%>
                                                                    <%--<input id="cpa_IdentifyType_radio_${IdentifyType.key}"--%>
                                                                           <%--name="cpa_IdentifyType_radio" type="radio"--%>
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
                                        <%--</c:when>--%>
                                        <%--<c:otherwise>--%>
                                            <%--<!--组合结算类型-->--%>
                                            <%--<div class="tab-pane fade in active" id="CpaNoLevelIdentifyType_checkbox">--%>
                                                <%--<c:forEach var="openCpa" items="${cpaList}">--%>
                                                    <%--<div class="col-md-3">--%>
                                                        <%--<c:forEach var="IdentifyType" items="${cpaNoLevelIdentifyType}">--%>
                                                            <%--<c:if test="${openCpa.identifyType eq IdentifyType.key}">--%>
                                                                <%--<input type="checkbox" name="cpa_IdentifyType_box"--%>
                                                                       <%--value="${IdentifyType.key}"--%>
                                                                       <%--id="cpa_IdentifyType_box_${IdentifyType.key}"--%>
                                                                       <%--checked="checked"/>${IdentifyType.name}--%>
                                                                <%--<input type="text" name="cpa_IdentifyTypDayBox"--%>
                                                                       <%--id="cpa_IdentifyTypDayBox_${IdentifyType.key}"--%>
                                                                       <%--value="<fmt:formatNumber pattern='#,##0.00' value='${openCpa.commissionPercentage*0.001}'/>"/>元--%>
                                                            <%--</c:if>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</div>--%>
                                                <%--</c:forEach>--%>
                                                <%--<div style="height:0; line-height:0; font-size:0;clear:both;"></div>--%>
                                            <%--</div>--%>
                                        <%--</c:otherwise>--%>
                                    <%--</c:choose>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</c:if>--%>
                        <%--&lt;%&ndash;<c:if test="${cpa.isLevel eq 2}">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<!--梯度核算-->&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div id="CpaLevelIdentifyType" style="margin-top: 30px;" align="center">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<ul class="nav nav-tabs" id="myCpaTab2">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:when test="${cpa.settleType eq 1}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li class="active">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#cpaLevelType1" data-toggle="tab">首投当日额度</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#cpaLevelType2" data-toggle="tab">首投单笔额度</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#cpaLevelType1" data-toggle="tab">首投当日额度</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<li class="active">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<a href="#cpaLevelType2" data-toggle="tab">首投单笔额度</a>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="tab-content">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:when test="${cpa.settleType eq 1}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<div class="tab-pane fade in active" id="cpaLevelType1">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<table width="100%" id="tab_Type_01">&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<c:forEach var="openCpa" items="${cpaList}">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<tr align="center">&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;<td align="center">首投当日累计投资额下限: <fmt:formatNumber&ndash;%&gt;--%>
                                                                    <%--&lt;%&ndash;pattern="#,#00.00"&ndash;%&gt;--%>
                                                                    <%--&lt;%&ndash;value="${openCpa.identifyLimit*0.001}"/> 元&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;<td align="center">单价: <fmt:formatNumber pattern="#,#00.00"&ndash;%&gt;--%>
                                                                                                     <%--&lt;%&ndash;value="${openCpa.commissionPercentage*0.001}"/>&ndash;%&gt;--%>
                                                                <%--&lt;%&ndash;元&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<div class="tab-pane fade" id="cpaLevelType2">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<table width="100%" id="tab_Type_02">&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<tr align="center">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<td align="center">首笔投资投资额下限: <input type="text"&ndash;%&gt;--%>
                                                                                             <%--&lt;%&ndash;name="cpa_2_identifyLimit"/>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<td align="center">单价: <input type="text"&ndash;%&gt;--%>
                                                                                      <%--&lt;%&ndash;name="cpa_2_commissionPercentage"/>&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;元&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<div class="tab-pane fade" id="cpaLevelType1">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<table width="100%" id="tab_Type_01">&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<tr align="center">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<td align="center">首投当日累计投资额下限: <input type="text"&ndash;%&gt;--%>
                                                                                               <%--&lt;%&ndash;name="cpa_1_identifyLimit"/>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<td align="center">单价: <input type="text"&ndash;%&gt;--%>
                                                                                      <%--&lt;%&ndash;name="cpa_1_commissionPercentage"/>&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;元&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                                            <%--&lt;%&ndash;<div class="tab-pane fade in active" id="cpaLevelType2">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<table width="100%" id="tab_Type_02">&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<c:forEach var="openCpa" items="${cpaList}">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<tr align="center">&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;<td align="center">首笔投资投资额下限: <fmt:formatNumber&ndash;%&gt;--%>
                                                                    <%--&lt;%&ndash;pattern="#,#00.00"&ndash;%&gt;--%>
                                                                    <%--&lt;%&ndash;value="${openCpa.identifyLimit*0.001}"/> 元&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;<td align="center">单价: <fmt:formatNumber pattern="#,#00.00"&ndash;%&gt;--%>
                                                                                                     <%--&lt;%&ndash;value="${openCpa.commissionPercentage*0.001}"/>&ndash;%&gt;--%>
                                                                <%--&lt;%&ndash;元&ndash;%&gt;--%>
                                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</c:if>--%>
                <%--<!-----------------------------CPS页面处理--------------------------------------->--%>
                <%--<c:if test="${fn:length(cpsList)>0}">--%>
                    <%--<div class="panel-heading">--%>
                        <%--<span><input id="cps" name="cps" type="checkbox" class="must"--%>
                                     <%--checked="checked"/>CPS[按投资交易结算]</span>--%>
                    <%--</div>--%>
                    <%--<div class="panel-body" id="cps_div">--%>
                        <%--<!--梯度核算/非梯度核算-->--%>
                        <%--&lt;%&ndash;<div style="text-align: center;">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<c:forEach var="rulesType" items="${rulesType}">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="controls col-md-5">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:when test="${rulesType.key eq cps.isLevel}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<span><input id="cps_isLevel_${rulesType.key}" value="${rulesType.key}"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;class="cps_isLeveSty" name="cps_isLevel" type="radio"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;checked="checked"/>${rulesType.name}</span>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<span><input id="cps_isLevel_${rulesType.key}" value="${rulesType.key}"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;class="cps_isLeveSty" name="cps_isLevel"&ndash;%&gt;--%>
                                                         <%--&lt;%&ndash;type="radio"/>${rulesType.name}</span>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--<!--交易指标-->--%>
                        <%--<div class="controls col-md-12 bottom-line top-line" id="tradeType">--%>
                            <%--&lt;%&ndash;<label class="control-label col-md-1">交易指标<span class="must"></span></label>&ndash;%&gt;--%>

                            <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<c:forEach var="tradeType" items="${cpsTradeType}">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="controls col-md-3" id="cps_tradeType_${tradeType.key}">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<c:when test="${tradeType.key eq cps.identifyType}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<input id="tradeType_${tradeType.key}" name="cps_tradeType" type="radio"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;value="${tradeType.key}" checked="checked"/>${tradeType.name}&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<input id="tradeType_${tradeType.key}" name="cps_tradeType" type="radio"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;value="${tradeType.key}"/>${tradeType.name}&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--</div>--%>
                        <%--<c:if test="${cps.isLevel eq 1}">--%>
                            <%--<!--CPS:非梯度核算-->--%>
                            <%--<div class="controls col-md-12 bottom-line top-line" id="cps_NO_LevelType_1">--%>
                                <%--&lt;%&ndash;<label class="control-label col-md-1">结算佣金<span class="must"></span></label>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:forEach var="commissionType" items="${commissionType}">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<c:if test="${cps.commissionType eq commissionType.key}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<input id="commissionType_${commissionType.key}"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;name="cps_commissionType" type="radio"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;value="${commissionType.key}"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;checked="checked"/>${commissionType.name}&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<c:when test="${commissionType.key==1}">&ndash;%&gt;--%>

                                                    <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<fmt:formatNumber pattern="#,#00.00"&ndash;%&gt;--%>
                                                                          <%--&lt;%&ndash;value="${cps.commission*0.001}"/> 元&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;产品周期下限<input type="text" name="cps_bid_Day" id="cps_bid_day"&ndash;%&gt;--%>
                                                     <%--&lt;%&ndash;value="${cps.bidDay}"/> &nbsp;天&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--</div>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${cps.isLevel eq 2}">--%>
                            <%--<!--CPS:梯度核算-->--%>
                            <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line" id="cps_LevelType_2">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<table width="100%" id="cps_tab">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:forEach var="openCps" items="${cpsList}">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<tr align="center">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<td align="center">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;累计投资额度下限:<fmt:formatNumber pattern="#,#00.00"&ndash;%&gt;--%>
                                                                           <%--&lt;%&ndash;value="${openCps.identifyLimit*0.001}"/>元&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<td align="center">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;产品周期下限:${openCps.bidDay}天&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<td align="center">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;佣金:&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<c:when test="${openCps.commissionType eq 1}">&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<fmt:formatNumber type="PERCENT" pattern="#0.00%"&ndash;%&gt;--%>
                                                                          <%--&lt;%&ndash;value="${openCps.commission*0.0001}"/>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                                        <%--&lt;%&ndash;<fmt:formatNumber pattern="#,#00.00"&ndash;%&gt;--%>
                                                                          <%--&lt;%&ndash;value="${openCps.commission*0.001}"/> 元&ndash;%&gt;--%>
                                                    <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</table>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--</c:if>--%>
                    <%--</div>--%>
                <%--</c:if>--%>
                <%--<!-----------------------------ROI页面处理--------------------------------------->--%>
                <%--<c:if test="${fn:length(roiList)>0}">--%>
                    <%--&lt;%&ndash;<div class="panel-heading">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span><input id="roi" name="roi" type="checkbox" checked="checked"&ndash;%&gt;--%>
                                     <%--&lt;%&ndash;class="must"/>ROI[按投资转换率结算]</span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="panel-body" id="roi_div">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="col-sm-2 control-label">首投投资回报率</label>&ndash;%&gt;--%>

                            <%--&lt;%&ndash;<div class="col-sm-3">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input type="text" name="roiA" value="${roi.molecular}">&nbsp;:&nbsp;<input type="text"&ndash;%&gt;--%>
                                                                                                            <%--&lt;%&ndash;name="roiB"&ndash;%&gt;--%>
                                                                                                            <%--&lt;%&ndash;value="${roi.denominator}">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<label class="col-sm-2 control-label">最低投资总额</label>&ndash;%&gt;--%>

                            <%--&lt;%&ndash;<div class="col-sm-3">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input type="text" name="roiAmountLimit"&ndash;%&gt;--%>
                                       <%--&lt;%&ndash;value=" <fmt:formatNumber pattern='#,#00.00' value='${roi.identifyLimit*0.001}'/> ">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;元&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</c:if>--%>
                <%--<!-----------------------------APP页面处理--------------------------------------->--%>
                <%--<c:if test="${fn:length(appList)>0}">--%>
                    <%--&lt;%&ndash;<div class="panel-heading">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span><input id="app" name="app" type="checkbox" class="must"&ndash;%&gt;--%>
                                     <%--&lt;%&ndash;checked="checked"/>APP[APP推广结算]</span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="panel-body" id="app_div">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<label class="control-label col-md-1">结算类别<span class="must"></span></label>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:if test="${app.priceType eq 1}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input id="priceType" name="priceType" type="radio" value="${app.priceType}"&ndash;%&gt;--%>
                                                   <%--&lt;%&ndash;checked="checked"/>下载量&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<label class="control-label col-md-1">佣金<span class="must"></span></label>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<fmt:formatNumber pattern='#,#00.00' value='${app.priceUnit*0.001}'/> 元(单价 )&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<label class="control-label col-md-1">结算指标<span class="must"></span></label>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<c:when test="${app.billingIndexType eq 1}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<input id="billingIndexType" name="billingIndexType" type="radio"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;value="${app.billingIndexType}" checked="checked"/>下载注册率&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<input id="billingIndexType" name="billingIndexType" type="radio"&ndash;%&gt;--%>
                                                       <%--&lt;%&ndash;value="${app.billingIndexType}"/>下载注册率&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<label class="control-label col-md-1">指标值<span class="must"></span></label>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<fmt:formatNumber type="PERCENT" pattern="#0.00%"&ndash;%&gt;--%>
                                                          <%--&lt;%&ndash;value="${app.billingIndex*0.0001}"/>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class="controls col-md-12 bottom-line top-line">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<label class="control-label col-md-1">APP渠道<span class="must"></span></label>&ndash;%&gt;--%>

                                <%--&lt;%&ndash;<div class="divClear">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<c:forEach var="openApp" items="${appList}">&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<div class="controls col-md-3">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<input id="channelIds" name="channelIds" type="checkbox"&ndash;%&gt;--%>
                                                   <%--&lt;%&ndash;value="${openApp.channelId}"&ndash;%&gt;--%>
                                                   <%--&lt;%&ndash;checked="checked"/>${openApp.channelName}&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</c:if>--%>
            <%--</div>--%>
        </div>
        <div class="form-actions controls col-md-12">
            <button type="reset" class="btn btn-default" onclick="history.back();"><i class="icon-off"></i>返回</button>
        </div>
    </div>
</div>
</body>