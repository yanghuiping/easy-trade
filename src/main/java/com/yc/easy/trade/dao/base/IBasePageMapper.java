package com.yc.easy.trade.dao.base;

import java.util.List;
import java.util.Map;


/** 
 * @ClassName: IBaseMapper 
 * @Description: TODO
 * @author 
 *  
 */

public interface IBasePageMapper
{
	/**
	 * 
	 * @Title: getPages 
	 * @Description: 查询数据
	 * @param parameterObject
	 * @return
	 */
	public List<Object> getPages(Map<String,Object> parameterObject);
	/**
	 * 
	 * @Title: getPagesCount 
	 * @Description: 查询总数
	 * @param parameterObject
	 * @return
	 */
	public long getPagesCount(Map<String,Object> parameterObject);
}
