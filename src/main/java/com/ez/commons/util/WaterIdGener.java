package com.ez.commons.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WaterIdGener {
	private static int currIndex = 0;
	private static int _suffix = 0;
	public static synchronized String getWaterId(){
		try{
			Thread.sleep(10L);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		Date now = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		if (currIndex > 9) {
			currIndex = 0;
		}
		String l_waterid = f.format(now) + currIndex;
		currIndex += 1;
		return l_waterid;
	}
	
	public static String formatDate(Date date, String format) {
	     if (date == null) {
	    	 date=new Date();
	     }
	     String s1 = "";
	 
	     SimpleDateFormat simpledateformat = new SimpleDateFormat(format);
	     s1 = simpledateformat.format(date);
	     return s1;
	}
	
	public static synchronized String genPKWithPrefix(String _prefix){
		try{
			Thread.sleep(10L);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	 
		String strTmp = formatDate(new Date(), "yyyyMMddHHmmssSSS");
		if (_suffix > 9) {
			_suffix = 0;
		}
		strTmp = _prefix + strTmp + _suffix;
		_suffix += 1;
		return strTmp;
	}
}
