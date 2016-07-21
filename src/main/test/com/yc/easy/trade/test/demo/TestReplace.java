package com.yc.easy.trade.test.demo;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TestReplace {
	
	private final static String yyyymmmddhhmmss = "yyyy-MM-dd HH:mm:ss";

	public static void main(String[] args) {
		SimpleDateFormat format = new SimpleDateFormat(yyyymmmddhhmmss);
		Date currentDate = new Date();
		System.out.println(format.format(currentDate));
		
		Date resultDate = getDayAgo(currentDate, -1);
		System.out.println(format.format(resultDate));
	}

	public static Date getDayAgo(Date date,int day){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, day);
		return calendar.getTime();
	}
	
}
