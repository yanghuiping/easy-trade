<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/staticresource.jsp" %>
<script type="text/javascript" src="${app_static_root}/view/advertis/advertisIndex.js"></script>
<body>
<ul class="breadcrumb">
    <li><a class="icon-home" href="${ctx}/sys/main.do?style=mainstyle"></a><span class="divider "><i
            class="icon-angle-right"></i></span></li>
    <li><a href="${ctx}/sys/main.do?style=mainstyle">首页</a><span class="divider"><i class="icon-angle-right"></i></span>
    </li>
    <li class="active">广告管理</li>
</ul>
<!-- searchForm -->
<div class="container-fluid" style="background-color: #DDEDFB;">
    <form id="searchForm" name="searchForm" class="form-horizontal">
        <table class="responsive table">
            <tr>
                <td width="80px" align="center">广告编号：</td>
                <td align="left" width="200px">
                    <input type="text" name="advertisCode" id="advertisCode" style="width: 200px"/>
                </td>
                <td width="80px" align="center">广告名称：</td>
                <td align="left" width="200px">
                    <input type="text" name="advertisName" id="advertisName" style="width: 200px"/>
                </td>
                <td width="80px" align="center">广告类型：</td>
                <td align="left" width="200px">
                    <select class="col-md-7" name="type">
                        <c:forEach var="item" items="${advertisTypeList}">
                            <option value="${item.key}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td width="80px" align="center">广告状态：</td>
                <td align="left" width="200px">
                    <select class="col-md-7" name="state">
                        <option value="">请选择</option>
                        <c:forEach var="item" items="${advertisStateList}">
                            <option value="${item.key}">${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <td align="left">
                    <button id="btnQuery" name="btnQuery" type="button" class="btn  btn-small btn-primary"
                            onclick="advertisManageList(1,0,10);">
                        <i class="icon-search icon-on-right bigger-110"></i>查询
                    </button>
                    <input type="hidden" name="advertisListUrl" id="advertisListUrl"
                           value="${ctx}/advertisManage/advertisList.do"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<div class="widget-container" id="advertisList">
</div>
</body>