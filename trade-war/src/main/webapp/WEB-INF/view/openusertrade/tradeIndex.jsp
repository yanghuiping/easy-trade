<%--
  User: Administrator
  Date: 2016/6/24 9:23
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/staticresource.jsp" %>
<script type="text/javascript" src="${app_static_root}/view/openusertrade/userTrade.js" charset="UTF-8"></script>
<body>

<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li class="active">交易明细</li>
</ul>

<!-- 查询条件 start  -->
<div class="widget-container">
    <div class="container-fluid" style="background-color: #DDEDFB;">
        <form id="searchForm" name="searchForm" class="form-horizontal" onsubmit="return false;">
            <table class="responsive table">
                <tr>
                    <td width="80px" align="center"><span>渠道名称:</span></td>
                    <td align="left" width="200px">
                        <select id="beChannelId" name="beChannelId" style="width:132px;">
                            <c:if test="${empty noSys || noSys!=1}">
                        		<option value="">全部</option>
                        	</c:if>
                            <c:forEach items="${openChannelList}" var="staticData" varStatus="status">
                                <option value="${staticData.id}">${staticData.channelName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="80px" align="center"><span>交易时间:</span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                        <input type="text" name="begCreateTime" id="begCreateTime"
                               onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"/>
                        &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
                        <input type="text" name="endCreateTime" id="endCreateTime"
                               onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"/>
                    </td>
                    <td width="80px" align="center"><span></span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                    </td>
                    <td width="20px" align="center"><span></span></td>
                </tr>
                <tr>
                	<td width="80px" align="center"><span>交易类型:</span></td>
                    <td align="left" width="200px">
                        <select id="tradeType" name="tradeType" style="width:132px;">
                            <option value="">全部</option>
                            <c:forEach items="${tradeTypeList}" var="tradeType">
                                <option value="${tradeType.key}">${tradeType.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="80px" align="center"><span>鉴定状态:</span></td>
                    <td align="left" width="200px">
                        <c:forEach var="state" items="${identifyState}" varStatus="status">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="identifyStates" id="identifyStates" value="${state.key}">&nbsp;${state.name}&nbsp;&nbsp;
                            </label>
                        </c:forEach>
                    </td>
                    <td width="80px" align="center"><span></span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                    </td>
                    <td width="80px" align="center"><span></span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                    </td>
                    <td width="20px" align="center"><span></span></td>

                </tr>
                <tr>
                    <td colspan="4">
                        <button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary"
                                onclick="cpaOpenUserTradeSearchList(1,0,10);">
                            <i class="icon-search icon-on-right bigger-110"></i>查询
                        </button>
                        <button type="button" id="btnExport" class="btn btn-primary">
                            <i class="icon-download-alt" ></i>导出
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="widget-container" id="cpaOpenUserTradeList"></div>
<input type="hidden" name="cpaOpenUserTradeUrl" id="cpaOpenUserTradeUrl" value="${ctx}/openUserTrade/tradeList.do"/>
</body>

</html>