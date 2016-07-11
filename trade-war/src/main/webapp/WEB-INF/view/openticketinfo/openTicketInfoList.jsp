<%--
  User: zhanghuan
  Date: 2016/6/27 13:35
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script language="javascript" type="text/javascript">
</script>
<table id="openTicketInfoLists" class="responsive table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>券类别</th>
        <th>券名称</th>
        <th>会员名称</th>
        <th>渠道名称</th>
        <th>获得时间</th>
        <th>券有效开始时间</th>
        <th>券有效结束时间</th>
        <th>发送方式</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${fn:length(resultPage.result) > 0}">
            <c:forEach items="${resultPage.result}" var="data" varStatus="status">
                <tr>
                    <td width="100px;" align="center">
                        <c:forEach var="ticketType" items="${ticketTypeList}">
                            <c:if test="${ticketType.key == data.ticketType}">
                                ${ticketType.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td width="100px;" align="center">${data.ticketName}</td>
                    <td width="100px;" align="center">${data.mbName}</td>
                    <td width="100px;" align="center">${data.channelName}</td>
                    <td width="100px;" align="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${data.obtainTime}"/>
                    </td>
                    <td width="100px;" align="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${data.ticketBeginTime}"/>
                    </td>
                    <td width="100px;" align="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${data.tickketEndTime}"/>
                    </td>
                    <td width="100px;" align="center">
                        <c:forEach var="sendType" items="${sendTypeList}">
                            <c:if test="${sendType.key == data.sendType}">
                                ${sendType.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td width="100px;" align="center">
                        <c:forEach var="ticketStatus" items="${ticketStatusList}">
                            <c:if test="${ticketStatus.key == data.status}">
                                ${ticketStatus.name}
                            </c:if>
                        </c:forEach>
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
    <li:pagination methodName="openTicketInfoSearchList" pageBean="${resultPage}" sytleName="black2"/>
</div>