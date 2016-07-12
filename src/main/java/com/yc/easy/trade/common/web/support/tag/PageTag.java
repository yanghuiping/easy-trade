package com.yc.easy.trade.common.web.support.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 分页
 * @author yanghuiping
 */
public class PageTag extends TagSupport {

	private static final long serialVersionUID = -5784043607741818040L;

	private static String DEFAULT_PAGE_NO_NAME = "page_no_demo";

	private String formId;

	private String pageNoParamName = DEFAULT_PAGE_NO_NAME;

	private int totalCount;

	private int currentPageNo;

	private int totalPageCount;

	private int pageSize;

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.println(buildStyles());
			out.println(buildPage());
			out.println(buildScript());
		} catch (IOException e) {
			throw new JspException(e);
		}

		return super.doEndTag();
	}

	private String buildPage() {
		//pages
		StringBuffer pageBuffer = new StringBuffer();
		pageBuffer.append("请选择");
//		pageBuffer.append("<select class=\"input\" name=\"page.pageSize\"").append(totalPageCount == 0 ? " disabled=\"disabled\" " : "").append(" onchange=\"go(this.value);\" >").append("\n");
		pageBuffer.append("<select class=\"input\" name=\"pageSize\"").append(totalPageCount == 0 ? " disabled=\"disabled\" " : "").append(" onchange=\"go(this.value);\" >").append("\n");
		pageBuffer.append("<option value=\"5\"").append(isSelected(5)).append(">5</option>").append("\n");
		pageBuffer.append("<option value=\"10\"").append(isSelected(10)).append(">10</option>").append("\n");
		pageBuffer.append("<option value=\"20\"").append(isSelected(20)).append(">20</option>").append("\n");
		pageBuffer.append("<option value=\"30\"").append(isSelected(30)).append(">30</option>").append("\n");
		pageBuffer.append("<option value=\"40\"").append(isSelected(40)).append(">40</option>").append("\n");
		pageBuffer.append("<option value=\"50\"").append(isSelected(50)).append(">50</option>").append("\n");
		pageBuffer.append("<option value=\"60\"").append(isSelected(60)).append(">60</option>").append("\n");
		pageBuffer.append("<option value=\"70\"").append(isSelected(70)).append(">70</option>").append("\n");
		pageBuffer.append("<option value=\"80\"").append(isSelected(80)).append(">80</option>").append("\n");
		pageBuffer.append("<option value=\"90\"").append(isSelected(90)).append(">90</option>").append("\n");
		pageBuffer.append("<option value=\"100\"").append(isSelected(100)).append(">100</option>").append("\n");
		pageBuffer.append("<option value=\"200\"").append(isSelected(200)).append(">200</option>").append("\n");
		pageBuffer.append("<option value=\"500\"").append(isSelected(500)).append(">500</option>").append("\n");
		pageBuffer.append("<option value=\"1000\"").append(isSelected(1000)).append(">1000</option>").append("\n");
		pageBuffer.append("</select>").append("\n");
		pageBuffer.append("��").append("<span class=\"red\">").append("&nbsp;" + totalCount + "&nbsp;").append("</span>����¼&nbsp;").append("\n");;
		pageBuffer.append("��ǰ��").append("&nbsp;" + currentPageNo + "/" + totalPageCount + "&nbsp;").append("ҳ").append("\n");;
		
		pageBuffer.append("<span class=\"an7\">").append("\n");;
		if(currentPageNo > 1){
			pageBuffer.append("<a href=\"#\" onclick=\"firstPage();\">��ҳ</a>").append("\n");;
		}else{
			pageBuffer.append("<span>��ҳ</span>").append("\n");;
		}
		if(currentPageNo > 1){
			pageBuffer.append("<a href=\"#\" onclick=\"previousPage();\">��һҳ</a>").append("\n");
		}else{
			pageBuffer.append("<span>��һҳ</span>").append("\n");
		}
		if(currentPageNo < totalPageCount){
			pageBuffer.append("<a href=\"#\" onclick=\"nextPage();\">��һҳ</a>").append("\n");
		}else{
			pageBuffer.append("<span>��һҳ</span>").append("\n");
		}
		if(currentPageNo < totalPageCount){
			pageBuffer.append("<a href=\"#\" onclick=\"lastPage();\">βҳ</a>").append("\n");
		}else{
			pageBuffer.append("<span>βҳ</span>").append("\n");
		}
		pageBuffer.append("&nbsp;&nbsp;");
		pageBuffer.append("<span>").append("\n");
		pageBuffer.append("<input type=\"hidden\" name=\"pageNo\" value=\"").append(currentPageNo).append("\"/>").append("\n");
		pageBuffer.append("<input type=\"text\" class=\"input\" ").append(totalPageCount == 0 ? " disabled=\"disabled\" " : "").append(" name=\"jumpPageNo\" id=\"jumpPageNo\" size=\"4\"/>").append("\n");
		if(totalPageCount == 0) {
			pageBuffer.append("<font color=\"gray\">ת��&nbsp;</font>");
		} else {
			pageBuffer.append("<a href=\"#\"").append(" onclick=\"jump();\" >").append("ת��").append("</a>").append("\n");
		}
		pageBuffer.append("</span>").append("\n");
		return pageBuffer.toString();
	}

	private String buildScript() {
		StringBuffer scriptBuffer = new StringBuffer();
		scriptBuffer.append("<script type=\"text/javascript\">").append("\n");
		scriptBuffer.append("document.getElementById(\"").append(formId).append("\").onsubmit = function() {").append("\n");
		scriptBuffer.append("this.pageNo.value = 1;").append("\n");
		scriptBuffer.append("}").append("\n");
		scriptBuffer.append("function checkIsInteger(str){").append("\n");
		scriptBuffer.append("if(/^(\\-?)(\\d+)$/.test(str))").append("\n");
		scriptBuffer.append("return true;").append("\n");
		scriptBuffer.append("else").append("\n");
		scriptBuffer.append("return false;}").append("\n");
		scriptBuffer.append("function jump(){").append("\n");
		scriptBuffer.append("var form = document.getElementById('").append(formId).append("');").append("\n");
		scriptBuffer.append("var jumpPageNo = form.jumpPageNo.value;").append("\n");
		scriptBuffer.append("if(jumpPageNo == \"\"){").append("\n");
		scriptBuffer.append("alert(\"������Ҫ��ת��ҳ��!\");return;}").append("\n");
		scriptBuffer.append("if(!checkIsInteger(jumpPageNo)){").append("\n");
		scriptBuffer.append("alert(\"ҳ�����������!\");return;}").append("\n");
		scriptBuffer.append("if(jumpPageNo < 1){alert(\"ҳ�벻��С��1\");return;}").append("\n");
		scriptBuffer.append("if(jumpPageNo > ").append(totalPageCount).append("){").append("\n");
		scriptBuffer.append("alert(\"�����ҳ�泬�����ҳ�淶Χ!\");return;}").append("\n");
		scriptBuffer.append("form.pageNo.value = jumpPageNo; form.submit();}").append("\n");
		scriptBuffer.append("function firstPage(){").append("\n");
		scriptBuffer.append("var form = document.getElementById('").append(formId).append("');").append("\n");
		scriptBuffer.append("form.pageNo.value = 1;form.submit();}").append("\n");
		scriptBuffer.append("function lastPage(){").append("\n");
		scriptBuffer.append("var form = document.getElementById('").append(formId).append("');").append("\n");
		scriptBuffer.append("form.pageNo.value = ").append(totalPageCount).append(";").append("\n");
		scriptBuffer.append("form.submit();}").append("\n");
		scriptBuffer.append("function previousPage(){").append("\n");
		scriptBuffer.append("var form = document.getElementById('").append(formId).append("');").append("\n");
		scriptBuffer.append("form.pageNo.value = ").append(this.currentPageNo - 1).append(";\n");
		scriptBuffer.append("form.submit();}").append("\n");
		scriptBuffer.append("function nextPage(){").append("\n");
		scriptBuffer.append("var form = document.getElementById('").append(formId).append("');").append("\n");
		scriptBuffer.append("form.pageNo.value = ").append(this.currentPageNo + 1).append(";\n");
		scriptBuffer.append("form.submit();}").append("\n");
		
		scriptBuffer.append("function setCookie(c_name,value,expiredays){").append("\n");
		scriptBuffer.append("var exdate=new Date();").append("\n");
		scriptBuffer.append("exdate.setDate(exdate.getDate()+expiredays);").append("\n");
		scriptBuffer.append("document.cookie=c_name+ \"=\" +escape(value)+((expiredays==null) ? \"\" : \";expires=\"+exdate.toGMTString()) + \";path=/\";").append("\n");
		scriptBuffer.append("}").append("\n");
		
		
		scriptBuffer.append("function go(pageSize){").append("\n");
		scriptBuffer.append("var form = document.getElementById('").append(formId).append("');").append("\n");
		scriptBuffer.append("setCookie('page_no_demo_pageSize', pageSize, 200);").append("\n");
		scriptBuffer.append("form.pageNo.value = 1;").append("\n");
		scriptBuffer.append("form.submit();}").append("\n");
		scriptBuffer.append("</script>").append("\n");
		return scriptBuffer.toString();
	}

	private String buildStyles() {
		StringBuffer styleBuffer = new StringBuffer();
		styleBuffer.append("<style type=\"text/css\">").append("\n");
		styleBuffer.append("<!--").append("\n");
		styleBuffer.append("-->").append("\n");
		styleBuffer.append("</style>").append("\n");
		return styleBuffer.toString();
	}
	
	
	private String isSelected(int value){
		if(this.pageSize == value){
			return " selected=\"selected\" ";
		}
		return "";
	}
	
	/**
	 * @return the formId
	 */
	public String getFormId() {
		return formId;
	}

	/**
	 * @param formId the formId to set
	 */
	public void setFormId(String formId) {
		this.formId = formId;
	}

	/**
	 * @return the pageNoParamName
	 */
	public String getPageNoParamName() {
		return pageNoParamName;
	}

	/**
	 * @param pageNoParamName the pageNoParamName to set
	 */
	public void setPageNoParamName(String pageNoParamName) {
		this.pageNoParamName = pageNoParamName;
	}

	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @return the currentPageNo
	 */
	public int getCurrentPageNo() {
		return currentPageNo;
	}

	/**
	 * @param currentPageNo the currentPageNo to set
	 */
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	/**
	 * @return the totalPageCount
	 */
	public int getTotalPageCount() {
		return totalPageCount;
	}

	/**
	 * @param totalPageCount the totalPageCount to set
	 */
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
