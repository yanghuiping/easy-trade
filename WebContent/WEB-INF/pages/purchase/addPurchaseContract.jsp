<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/staticresource.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="managerForm" id="managerForm" action="${ctx}/purchaseManage/savePurchaseContract.htm" method="post">
	<table border="0" cellpadding="0" cellspacing="0" background="../images/web/tab/images/tab_05.gif">
		<tr>
			<td width="15" height="30"><img src="../images/web/tab/images/tab_03.gif" width="15" height="30" /></td>
			<td align="left" class="STYLE1">合同编号：</td>
			<td align="left" class="STYLE1">
				<input name="contractCode" id="contractCode" type="text" value="${purchaseContract.contractCode}" style="width: 150px" />
			</td>
			<td align="left" class="STYLE1">合同名称：</td>
			<td align="left" class="STYLE1">
				<input type="text" name="contractName" id="contractName" value="${purchaseContract.contractName}" style="cursor: pointer"/>
			</td>
			<td align="left" class="STYLE1">结束时间：</td>
			<td align="left" class="STYLE1">
				<%-- <input type="text" name="createTime" id="createTime"class="Wdate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${purchaseContract.createTime}" />" onClick="WdatePicker()" style="cursor: pointer" readonly/> --%>
			</td>
			<td align="left" class="STYLE1">结束时间：</td>
			<td align="left" class="STYLE1">
				<%-- <input type="text" name="createTime" id="createTime" class="Wdate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${purchaseContract.createTime}" />" onClick="WdatePicker()" style="cursor: pointer" readonly/> --%>
			</td>
		</tr>
		<tr>
			<td align="right" class="STYLE1" colspan="">
				<input name="cx" type="submit" value="保存" style="cursor: pointer" />
			</td>
			<td align="left" class="STYLE1" colspan="8">
				<input name="cz" type="reset" id="resetBtn" value="重置" style="cursor: pointer" />
				
				<a href="${ctx}/purchaseManage/exportExcel.htm">导出excel测试</a>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>合同编号</td>
			<td>
				<input type="text" name="contractCode" id="contractCode" value="${purchaseContract.contractCode}"/>
			</td>
			<td>合同名称</td>
			<td>
				<input type="text" name="contractName" id="contractName" value="${purchaseContract.contractName}"/>
			</td>
			<td>供方公司名称</td>
			<td>
				<input type="text" name="sellCompanyName" id="sellCompanyName" value="${purchaseContract.sellCompanyName}"/>
			</td>
			<td>供方联系人姓名</td>
			<td>
				<input type="text" name="sellContactsName" id="sellContactsName" value="${purchaseContract.sellContactsName}"/>
			</td>
		</tr>
		<tr>
			<td>供方联系人电话</td>
			<td>
				<input type="text" name="sellContactsTel" id="sellContactsTel" value="${purchaseContract.sellContactsTel}"/>
			</td>
			<td>需方公司名称</td>
			<td>
				<input type="text" name="buyCompanyName" id="buyCompanyName" value="${purchaseContract.buyCompanyName}"/>
			</td>
			<td>需方联系人姓名</td>
			<td>
				<input type="text" name="buyContactsName" id="buyContactsName" value="${purchaseContract.buyContactsName}"/>
			</td>
			<td>需方联系人电话</td>
			<td>
				<input type="text" name="buyContactsTel" id="buyContactsTel" value="${purchaseContract.buyContactsTel}"/>
			</td>
		</tr>
		<tr>
			<td>合同签订时间</td>
			<td>
				<input type="text" name="effectiveTime" id="effectiveTime" value="${purchaseContract.effectiveTime}"/>
			</td>
			<td>备注</td>
			<td>
				<input type="text" name="remark" id="remark" value="${purchaseContract.remark}"/>
			</td>
			<td></td>
			<td>
				
			</td>
			<td></td>
			<td>
				
			</td>
		</tr>
	</table>
</form>
</body>
</html>