<%--
  User: zhanghuan
  Date: 2016/6/27 13:35
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/staticresource.jsp" %>
<script type="text/javascript" src="${app_static_root}/view/openTicketInfo/openTicketInfoIndex.js" charset="UTF-8"></script>
<body>

<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li class="active">发送券</li>
</ul>

<!-- 查询条件 start  -->
<div class="widget-container">
    <div class="container-fluid" style="background-color: #DDEDFB;">
        <form id="searchForm" name="searchForm" class="form-horizontal" onsubmit="return false;">
            <table class="responsive table">
                <tr>
                    <td width="80px" align="center"><span>渠道名称:</span></td>
                    <td align="left" width="200px">
                        <select id="channelId" name="channelId" style="width:132px;">
                            <option value="">全部</option>
                            <c:forEach items="${openChannelList}" var="staticData" varStatus="status">
                                <option value="${staticData.id}">${staticData.channelName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="80px" align="center"><span>会员名称:</span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                        <input type="text" name="mbName" id="mbName" />
                    </td>
                    <td width="80px" align="center"><span>发送方式</span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                        <select id="sendType" name="sendType" style="width:132px;">
                            <option value="">全部</option>
                            <c:forEach items="${sendTypeList}" var="staticData" varStatus="status">
                                <option value="${staticData.key}">${staticData.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="20px" align="center"><span></span></td>
                </tr>
                <tr>
                    <td width="80px" align="center"><span>券类别:</span></td>
                    <td align="left" width="200px">
                        <select id="ticketType" name="ticketType" style="width:132px;">
                            <option value="">全部</option>
                            <c:forEach items="${ticketTypeList}" var="staticData" varStatus="status">
                                <option value="${staticData.key}">${staticData.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="80px" align="center"><span>券有效期间</span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                        <input type="text" name="begCreateTime" id="begCreateTime"
                               onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"/>
                        &nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
                        <input type="text" name="endCreateTime" id="endCreateTime"
                               onClick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"/>
                    </td>
                    <td width="80px" align="center"><span>状态</span></td>
                    <td align="left" width="200px" nowrap="nowrap">
                        <select id="status" name="status" style="width:132px;">
                            <option value="">全部</option>
                            <c:forEach items="${ticketStatusList}" var="staticData" varStatus="status">
                                <option value="${staticData.key}">${staticData.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td width="20px" align="center"><span></span></td>

                </tr>
                <tr>
                    <td colspan="4">
                        <button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary"
                                onclick="openTicketInfoSearchList(1,0,10);">
                            <i class="icon-search icon-on-right bigger-110"></i>查询
                        </button>
                        <button type="button" id="btnSend" class="btn btn-primary" onclick="send('${ctx}/openTicketInfo/frame/initSendMessageInfo.do','${ctx}/openTicketInfo/frame/sendMessageInfo.do');">
                            <i class="icon-download-alt" ></i>发送
                        </button>
                        <button type="button" id="btnUpload" class="btn btn-primary" onclick="uploadPage('${ctx}/openTicketInfo/initUploadTicketInfo.do');">
                            <i class="icon-download-alt" ></i>上传
                        </button>
                        <button type="button" id="btnTemplate" class="btn btn-primary" onclick="downlondTemplate('${app_static_root}/files/ticketTemplate/ticket_template.xls')">
                            <i class="icon-plus-sign"></i>导入模版下载
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="widget-container" id="openTicketInfoList"></div>
<input type="hidden" name="openTicketInfoUrl" id="openTicketInfoUrl" value="${ctx}/openTicketInfo/initOpenTicketInfoList.do"/>
</body>

</html>