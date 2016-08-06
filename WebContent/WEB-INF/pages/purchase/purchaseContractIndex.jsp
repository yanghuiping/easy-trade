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
	<form name="managerForm" id="managerForm" action="purchaseCountractIndex.htm" method="post">
	<table border="0" cellpadding="0" cellspacing="0" background="../images/web/tab/images/tab_05.gif">
		<tr>
			<td width="15" height="30"><img src="../images/web/tab/images/tab_03.gif" width="15" height="30" /></td>
			<td align="left" class="STYLE1">合同编号：</td>
			<td align="left" class="STYLE1">
				<input name="contractCode" id="contractCode" type="text" value="${purchaseContract.contractCode}" style="width: 150px" />
			</td>
			<td align="left" class="STYLE1">合同名称：</td>
			<td align="left" class="STYLE1">
				<input type="text" name="contractName" id="contractName" value="${purchaseContract.contractName}"/>
			</td>
			<td align="left" class="STYLE1">结束时间：</td>
			<td align="left" class="STYLE1">
				<input type="text" name="createTime" id="createTime" class="Wdate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${purchaseContract.createTime}" />" onClick="WdatePicker()" style="cursor: pointer" readonly/>
			</td>
			<td align="left" class="STYLE1">
				<input name="cx" type="submit" value="查询" style="cursor: pointer" />
			</td>
			<td align="left" class="STYLE1">
				<input name="cz" type="reset" id="resetBtn" value="重置" style="cursor: pointer" />
			</td>
		</tr>
	</table>
</form>
	<form name="managerhiddenForm" id="managerhiddenForm" action="${ctx}/purchaseManage/purchaseCountractIndex.htm"
		method="post">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
		    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="15" height="30"><img src="../images/web/tab/images/tab_03.gif" width="15" height="30" /></td>
		        <td width="1101" background="../images/web/tab/images/tab_05.gif"><img src="../images/web/tab/images/311.gif" width="16" height="16" /> <span class="STYLE4">办公用品采购列表</span></td>
		        <td width="281" background="../images/web/tab/images/tab_05.gif"><table border="0" align="center" cellpadding="0" cellspacing="0">
		            <tr>
		              <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center">
		                        <input type="checkbox" name="checkbox62" value="checkbox" />
		                    </div></td>
		                    <td class="STYLE1"><div align="center">全选</div></td>
		                  </tr>
		              </table></td>
		              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="../images/web/tab/images/001.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1">
		                    	<div align="center">
		                    		<a href="${ctx}/purchaseManage/addPurchaseContract.htm">新增</a>
		                    	</div>
		                    </td>
		                  </tr>
		              </table></td>
		              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="../images/web/tab/images/114.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1"><div align="center">修改</div></td>
		                  </tr>
		              </table></td>
		              <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
		                  <tr>
		                    <td class="STYLE1"><div align="center"><img src="../images/web/tab/images/083.gif" width="14" height="14" /></div></td>
		                    <td class="STYLE1"><div align="center">删除</div></td>
		                  </tr>
		              </table></td>
		            </tr>
		        </table></td>
		        <td width="14"><img src="../images/web/tab/images/tab_07.gif" width="14" height="30" /></td>
		      </tr>
		    </table></td>
		  </tr>
		  <tr>
		  	<td>
				<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
					<tr>
						<td width="5%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
						<td width="15%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">合同编号</div></td>
						<td width="20%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">合同名称</div></td>
						<td width="15%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">签订时间</div></td>
						<td width="15%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">添加时间</div></td>
						<td width="15%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">供方公司</div></td>
						<td width="15%" height="18" background="../images/web/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">供方联系人</div></td>
					</tr>
					<c:forEach items="${page.data}" var="purchaseContract" varStatus="serial">
						<tr id="${serial.index+1 }" align="center"
							onmouseover="this.style.backgroundColor='#fffcdd'"
							onmouseout="this.style.backgroundColor='#ffffff'">
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${serial.index+1+page.pageSize*(page.currentPageNo-1)}</div></td>
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${purchaseContract.contractCode}</div></td>
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${purchaseContract.contractName}</div></td>
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${purchaseContract.effectiveTime}</div></td>
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${purchaseContract.createTime}"/>
							</div></td>
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${purchaseContract.sellCompanyName}</div></td>
							<td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">${purchaseContract.sellContactsName}</div></td>
						</tr>
					</c:forEach>
					<c:if test="${fn:length(page.data)==0}">
						<tr bgcolor="white">
							<td colspan="7">没有数据</td>
						</tr>
					</c:if>
					<tr>
						<td height="18" bgcolor="#FFFFFF" class="STYLE2" align="right" colspan="7">
							<div align="right" class="STYLE2 STYLE1">
								<yc:page pageSize="${page.pageSize}"
									currentPageNo="${page.currentPageNo }"
									formId="managerhiddenForm" totalCount="${page.totalCount }"
									totalPageCount="${page.totalPageCount }" />
							</div>
						</td>
					</tr>
				</table>  	
		  	</td>
		  </tr>
  	</table>
</form>
</body>
</html>