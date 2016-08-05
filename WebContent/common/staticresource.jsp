<%@include file="/common/taglibs.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/common.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
var pathName=window.document.location.pathname;
//var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
var projectName = '${ctx}';
</script>
