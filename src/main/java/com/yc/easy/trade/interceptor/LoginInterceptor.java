package com.yc.easy.trade.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yc.easy.trade.domain.demo.UserPO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		UserPO loginUser = (UserPO)session.getAttribute("loginUser");
		String requestUrl = request.getRequestURI();
  		if(loginUser != null || "/easy-trade/toLogin.htm".equals(requestUrl) 
  				|| "/easy-trade/login.htm".equals(requestUrl)){
  			return true;
  		}else{
  			PrintWriter out = response.getWriter();
            out.print("<script>window.top.location='"+request.getContextPath()+"/toLogin.htm';</script>");
  			return false;
  		}
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
