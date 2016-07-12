package com.yc.easy.trade.dao.demo;

import com.yc.easy.trade.domain.demo.UserPO;


/** 
 * @ClassName: IUserMapper 
 * @Description: TODO
 * @author 
 *  
 */
public interface IUserMapper extends IBasePageMapper
{
	public UserPO findUserById(int id);
}
