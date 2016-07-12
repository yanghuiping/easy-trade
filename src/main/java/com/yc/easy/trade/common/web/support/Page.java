package com.yc.easy.trade.common.web.support;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * 分页基本类
 * @see www.springside.org.cn
 * @date Sep 18, 2007 2:33:45 PM
 * @version
 */
public class Page implements Serializable {
	
	private static final long serialVersionUID = 6952374745215033084L;

	public static final String PAGE_SIZE_COOKIE_NAME = "demo_pageSize";

	public static final int DEFAULT_PAGE_SIZE = 20;   // 每页数目

	private int pageSize = DEFAULT_PAGE_SIZE;         // 每页数目

	private long start;                               // 开始

	private Object data;                              // 查询数据List

	private long totalCount;                          // 总个数

	public Page() {
		this(0, 0, DEFAULT_PAGE_SIZE, new ArrayList<Object>());
	}
	
	public Page(int pageSize) {
		this(0, 0, pageSize, new ArrayList<Object>());
	}

	public Page(long start, long totalCount, int pageSize, Object data) {
		this.pageSize = pageSize;
		this.start = start;
		this.data = data;
		this.totalCount = totalCount;
	}

	/**
	 * 计算总页数
	 * 
	 * @return
	 */
	public long getTotalPageCount() {
		if (totalCount % pageSize == 0) {
			return totalCount / pageSize;
		} else {
			return totalCount / pageSize + 1;
		}
	}

	/**
	 * 计算当前页码
	 * 
	 * @return
	 */
	public long getCurrentPageNo() {
		return start / pageSize + 1;
	}

	/**
	 * 是否有下一页
	 * 
	 * @return
	 */
	public boolean hasNextPage() {
		return this.getCurrentPageNo() < this.getTotalPageCount() - 1;
	}

	/**
	 * 是否有前一页
	 * 
	 * @return
	 */
	public boolean hasPerviousPage() {
		return this.getCurrentPageNo() > 1;
	}

	/**
	 * 当前也开始下标
	 * 
	 * @see #getStartOfPage(int, int)
	 */
	public static final int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	/**
	 * 当前页
	 * 
	 * @param pageNo 页码
	 * @param pageSize 每页数
	 * @return
	 */
	public static final int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}