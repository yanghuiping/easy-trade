package com.yc.easy.trade.service.base;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.dao.base.IUserMapper;
import com.yc.easy.trade.domain.demo.UserPO;


/** 
 * @ClassName: UserService 
 * @Description: TODO
 * @author 
 *  
 */
@Service("userService")
public class UserService
{
	@Autowired
	private IUserMapper userMapper;
	
	public UserPO findUserById(int id){
		return userMapper.findUserById(id);
	}
	
	public Page queryPaged(Map<String,Object> parameterObject, int pageNo, int pageSize){
		int startIndex = Page.getStartOfPage(pageNo, pageSize);
		long totalCount = userMapper.getPagesCount(parameterObject);
		if (totalCount < 1) {
			return new Page(pageSize);
		}
		parameterObject.put("startIndex", startIndex);
		parameterObject.put("endIndex", pageNo * pageSize);
		List<Object> list = userMapper.getPages(parameterObject);
		return new Page(startIndex, totalCount, pageSize, list);
	}
}
