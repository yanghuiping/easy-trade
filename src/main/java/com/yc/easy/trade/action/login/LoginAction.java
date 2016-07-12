package com.yc.easy.trade.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.easy.trade.common.base.BaseAction;
import com.yc.easy.trade.domain.demo.UserPO;


/** 
 * @ClassName: LoginAction 
 * @Description: 用户登录
 * @author 
 */
@Controller
public class LoginAction extends BaseAction
{
	@RequestMapping(value="/toLogin.htm",method={RequestMethod.GET})
	public ModelAndView toLogin(){
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/login.htm",method={RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		String viewName = "login";
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		if("admin".equals(userName) && "admin".equals(passWord)){
			UserPO user = new UserPO();
			user.setUserName(userName);
			user.setPassWord(passWord);
			request.getSession().setAttribute("loginUser", user);
			viewName = "redirect:main.htm";
		}else{
			modelAndView.addObject("errorTips", "用户名或密码错误！");
		}
		modelAndView.setViewName(viewName);
		return modelAndView;
	}
	
	@RequestMapping(value="/main.htm",method={RequestMethod.GET})
	public ModelAndView main(){
		ModelAndView modelAndView = new ModelAndView("main");
		return modelAndView;
	}
	
	@RequestMapping(value="/loginOut.htm",method={RequestMethod.GET})
	public ModelAndView loginOut(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView("login");
		HttpSession session = request.getSession();
		if(session != null){
			session.removeAttribute("loginUser");
		}
		return modelAndView;
	}
}
