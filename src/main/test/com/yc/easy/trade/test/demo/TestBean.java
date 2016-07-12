package com.yc.easy.trade.test.demo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.easy.trade.service.demo.UserService;


/** 
 * @ClassName: TestBean 
 * @Description: TODO
 * @author 
 *  
 */

public class TestBean
{

	/** 
	 * @Title: main 
	 * @Description: 
	 * @param args    
	 */

	public static void main(String[] args)
	{
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)ctx.getBean("userService");
		
	}

}
