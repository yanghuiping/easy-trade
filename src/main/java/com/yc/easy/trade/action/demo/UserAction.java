package com.yc.easy.trade.action.demo;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yc.easy.trade.common.base.BaseAction;
import com.yc.easy.trade.common.web.support.Page;
import com.yc.easy.trade.domain.demo.UserPO;
import com.yc.easy.trade.service.base.UserService;


/** 
 * @ClassName: UserAction 
 * @Description: demo
 * @author 
 */
@RequestMapping("/user")
@Controller
public class UserAction extends BaseAction
{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/demo.htm")
	public ModelAndView queryUserPages(@Param("user")UserPO user,@Param("pageNo") String pageNo,@Param("pageSize") String pageSize){
		ModelAndView modelAndView = new ModelAndView("demo");
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		int pageNoInt = 1;
		if(pageNo == null || "".equals(pageNo)){
			pageNoInt = 1;
		}else{
			pageNoInt = Integer.valueOf(pageNo);
		}
		int pageSizeInt = 10;
		if(pageSize != null){
			pageSizeInt = Integer.valueOf(pageSize);
		}
		if(user != null){
			modelAndView.addObject("user", user);
			if(user.getStartTime() != null){
				parameterMap.put("startTime", user.getStartTime());
			}
			if(user.getEndTime() != null){
				parameterMap.put("endTime", user.getEndTime());
			}
			if(user.getUserName() != null && !"".equals(user.getUserName().trim())){
				parameterMap.put("userName", user.getUserName());
			}
		}
		Page resultPage = userService.queryPaged(parameterMap, pageNoInt, pageSizeInt);//page.getPageSize()
		modelAndView.addObject("page", resultPage);
		return modelAndView;
	}
}
