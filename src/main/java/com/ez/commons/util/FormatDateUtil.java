package com.ez.commons.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class FormatDateUtil {

	/**
	 * 
	 * @param format:需要转换成的格式
	 * @return
	 */
	public static String getFormatDate(String format){
		Date date = new Date();
		SimpleDateFormat sf=new SimpleDateFormat(format);
		return sf.format(date);
	}

	public static String getStringDate(String date){
		String year=date.substring(0,4);
		String yue=date.substring(4,6);
		String ri=date.substring(6,8);
		return year+"年"+yue+"月"+ri+"日";
	}
	/**
	 * Created by chenez on 2016/8/11 16:24.
	 * 获取两个日期之间相差的月数
	 */
	public static int getMonthSpace(String date1, String date2) throws ParseException {
		int result = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(sdf.parse(date1));
		c2.setTime(sdf.parse(date2));
		result = c2.get(Calendar.MONDAY) - c1.get(Calendar.MONTH);

		return result == 0 ? 1 : Math.abs(result);

	}
}
