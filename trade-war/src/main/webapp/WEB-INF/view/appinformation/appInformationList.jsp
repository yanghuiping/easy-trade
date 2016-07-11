<%--
  User: Administrator
  Date: 2016/6/23 11:33
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script language="javascript" type="text/javascript">
</script>
<table id="appInformationList" class="responsive table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>渠道</th>
        <th>MID</th>
        <th>会员名称</th>
        <th>交易类型</th>        
        <th>IDFA</th>
        <th>MAC</th>
        <th>IMEI</th>
        <th>加入时间</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${fn:length(resultPage.result) > 0}">
            <c:forEach items="${resultPage.result}" var="app" varStatus="status">
                <tr>
                    <td width="100px;" align="center">${app.CHANNEL_NAME}</td>
                    <td width="100px;" align="center">
                        ${app.MID}
                    </td>
                    <td width="100px;" align="center">
                        ${app.USER_NAME}
                    </td>
                    <td width="100px;" align="center">
                    	 <c:forEach items="${tradeTypeList}" var="tradeType">
                   	 		<c:if test="${tradeType.key eq app.TRADE_TYPE}">
                  	 			${tradeType.name}
                  	 		</c:if>                   	 	  	
                         </c:forEach>
                    </td>                    
                    <td width="100px;" align="center">${app.IFA}</td>
                    <td width="100px;" align="center">${app.MAC}</td>
                    <td width="100px;" align="center">
                        ${app.IMEI}
                    </td>
                    <td width="100px;" align="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${app.CREATE_TIME}"/>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:when test="${fn:length(resultPage.result) == 0}">
            <tr align="center">
                <td colspan="9">无广告申请单信息！</td>
            </tr>
        </c:when>
    </c:choose>
    </tbody>
</table>
<div>
    <li:pagination methodName="appInformationSearchList" pageBean="${resultPage}" sytleName="black2"/>
</div>