<%--
  User: Administrator
  Date: 2016/6/24 9:24
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script language="javascript" type="text/javascript">
</script>
<table id="cpaOpenUserTradeList" class="responsive table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>渠道名称</th>
        <th>会员名称</th>
        <th>交易类型</th>
        <th>交易额度</th>  
        <th>实际额度</th>  
        <th>交易时间</th>
        <th>鉴定状态</th>
        <th>鉴定时间</th>
        <th>交易成本</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${fn:length(resultPage.result) > 0}">
            <c:forEach items="${resultPage.result}" var="data" varStatus="status">
                <tr>
                    <td width="100px;" align="center">${data.channelName}</td>
                    <td width="100px;" align="center">${data.userName}</td>
                    <td width="100px;" align="center">
                    	 <c:forEach items="${tradeTypeList}" var="tradeType">
                   	 		<c:if test="${tradeType.key == data.tradeType}">
                  	 			${tradeType.name}
                  	 		</c:if>                   	 	  	
                         </c:forEach>
                    </td>
                    <td width="100px;" align="right">
                         <fmt:formatNumber value="${data.tradeAmount*0.001}" pattern="#,##0.00"/>
                    </td>
                    <td width="100px;" align="right">
                         <fmt:formatNumber value="${data.identifyAmount*0.001}" pattern="#,##0.00"/>
                    </td>                                           
                    <td width="100px;" align="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${data.tradeBeginTime}"/>
                    </td>
                    <td width="100px;" align="center">
                        <c:forEach var="identifyState" items="${identifyState}">
                            <c:if test="${identifyState.key == data.identifyState}">
                                ${identifyState.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td width="100px;" align="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${data.identifyTime}"/>
                    </td>
                    <td width="100px;" align="center">
                        <fmt:formatNumber value="${data.tradeCost*0.001}" pattern="#,##0.00"/>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:when test="${fn:length(resultPage.result) == 0}">
            <tr align="center">
                <td colspan="100">无数据信息！</td>
            </tr>
        </c:when>
    </c:choose>
    </tbody>
</table>
<div>
    <li:pagination methodName="cpaOpenUserTradeSearchList" pageBean="${resultPage}" sytleName="black2"/>
</div>