package com.ez.util;


import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

public class Common {
	/**
	 * 判断变量是否为空
	 * 
	 * @param s
	 * @return
	 */
	public static boolean isEmpty(String s) {
		if (null == s || "".equals(s) || "".equals(s.trim()) || "null".equalsIgnoreCase(s)) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	* @author doukang
	* @Title: isNumber 
	* @Description: (判断是否为整数)
	* @param str
	* @return boolean 返回类型
	* @date 2016年3月7日 下午2:52:43
	 */
	public static boolean isNumber(String str){
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");    
	    return pattern.matcher(str).matches();
	}
	
	/**
	 * 使用率计算
	 * 
	 * @return
	 */
	public static String fromUsage(long free, long total) {
		Double d = new BigDecimal(free * 100 / total).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		return String.valueOf(d);
	}
	/**
	 * 返回当前时间　格式：yyyy-MM-dd hh:mm:ss
	 * @return String
	 */
	public static String fromDateH(){
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format1.format(new Date());
	}
	/**
	 * 返回当前时间　格式：yyyy-MM-dd
	 * @return String
	 */
	public static String fromDateY(){
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		return format1.format(new Date());
	}
	/**
	 * 用来去掉List中空值和相同项的。
	 * 
	 * @param list
	 * @return
	 */
	public static List<String> removeSameItem(List<String> list) {
		List<String> difList = new ArrayList<String>();
		for (String t : list) {
			if (t != null && !difList.contains(t)) {
				difList.add(t);
			}
		}
		return difList;
	}

	/**
	 * 返回用户的IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String toIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * 传入原图名称，，获得一个以时间格式的新名称
	 * 
	 * @param fileName
	 *            　原图名称
	 * @return
	 */
	public static String generateFileName(String fileName) {
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return formatDate + random + extension;
	}

	/**
	 * 取得html网页内容 UTF8编码
	 * 
	 * @param urlStr
	 *            网络地址
	 * @return String
	 */
	public static String getInputHtmlUTF8(String urlStr) {
		URL url = null;
		try {
			url = new URL(urlStr);
			HttpURLConnection httpsURLConnection = (HttpURLConnection) url.openConnection();

			httpsURLConnection.setRequestMethod("GET");
			httpsURLConnection.setConnectTimeout(5 * 1000);
			httpsURLConnection.connect();
			if (httpsURLConnection.getResponseCode() == 200) {
				// 通过输入流获取网络图片
				InputStream inputStream = httpsURLConnection.getInputStream();
				String data = readHtml(inputStream, "UTF-8");
				inputStream.close();
				return data;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return null;

	}

	/**
	 * 取得html网页内容 GBK编码
	 * 
	 * @param urlStr
	 *            网络地址
	 * @return String
	 */
	public static String getInputHtmlGBK(String urlStr) {
		URL url = null;
		try {
			url = new URL(urlStr);
			HttpURLConnection httpsURLConnection = (HttpURLConnection) url.openConnection();

			httpsURLConnection.setRequestMethod("GET");
			httpsURLConnection.setConnectTimeout(5 * 1000);
			httpsURLConnection.connect();
			if (httpsURLConnection.getResponseCode() == 200) {
				// 通过输入流获取网络图片
				InputStream inputStream = httpsURLConnection.getInputStream();
				String data = readHtml(inputStream, "GBK");
				inputStream.close();
				return data;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return null;

	}

	/**
	 * @param inputStream
	 * @param uncode
	 *            编码 GBK 或 UTF-8
	 * @return
	 * @throws Exception
	 */
	public static String readHtml(InputStream inputStream, String uncode) throws Exception {
		InputStreamReader input = new InputStreamReader(inputStream, uncode);
		BufferedReader bufReader = new BufferedReader(input);
		String line = "";
		StringBuilder contentBuf = new StringBuilder();
		while ((line = bufReader.readLine()) != null) {
			contentBuf.append(line);
		}
		return contentBuf.toString();
	}

	/**
	 * 
	 * @return 返回资源的二进制数据 @
	 */
	public static byte[] readInputStream(InputStream inputStream) {

		// 定义一个输出流向内存输出数据
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		// 定义一个缓冲区
		byte[] buffer = new byte[1024];
		// 读取数据长度
		int len = 0;
		// 当取得完数据后会返回一个-1
		try {
			while ((len = inputStream.read(buffer)) != -1) {
				// 把缓冲区的数据 写到输出流里面
				byteArrayOutputStream.write(buffer, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				byteArrayOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}

		// 得到数据后返回
		return byteArrayOutputStream.toByteArray();

	}
	
	/**
	 * 返回日利率
	 *  由于数据库中全部保存的是年利率   
	 * @param bsnsrt
	 * @return
	 */
	public static BigDecimal getBsnsrt(BigDecimal bsnsrt){
		BigDecimal big_decimal = BigDecimal.ZERO;
		if(bsnsrt != null){ 
			big_decimal=bsnsrt.divide(new BigDecimal(360),6,BigDecimal.ROUND_HALF_EVEN); 
		}  
		return big_decimal; 
	}
	
	/**
	 * 格式化时间为yyyyMMdd格式
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	public static Date stringToyyyyMMdd(String date) throws ParseException{
			SimpleDateFormat f=new SimpleDateFormat("yyyyMMdd"); 
			return f.parse(date);
	
	}
	
	/**
	 * @author doukang
	 *  制定时间后几天
	 * @param date
	 * @param i   后几天
	 * @return
	 */
	public static Date getAfterDay(Date date,int i){
		GregorianCalendar gc = instance(date);
		gc.setTime(date);
		gc.add(Calendar.DATE, i);
		return gc.getTime();
	}
	
	private static GregorianCalendar instance(Date date) {
		GregorianCalendar gc=new GregorianCalendar();
		gc.setTime(date);
		return gc;
	}
	
	public  static Long getOverdueDays(Date endDate){
		
		long  diff = (new Date().getTime())-endDate.getTime();
		
		 long days = diff / (1000 * 60 * 60 * 24); 
		 
		 return days;
		
	}
	
	/**
	* @author doukang
	* @Title: getBetweenDays 
	* @Description: TODO(计算两个日期之间的天数) 
	* @param time1
	* @param time2
	* @return Long 返回类型
	* @date 2016-1-8 上午09:37:27
	 */
	public static Long getBetweenDays(Date time1, Date time2){
		long quot = 0;
		quot = time1.getTime() - time2.getTime();
		quot = quot / (1000 * 60 * 60 * 24);
		return quot;
	}
	
	/**
	* @author doukang
	* @Title: castArrayStrToBd 
	* @Description: TODO(String[] 数组转换为 BigDecimal[]数组) 
	* @param oArr
	* @return BigDecimal[] 返回类型
	* @date 2016年5月25日 下午2:13:02
	 */
	public static BigDecimal[] castArrayStrToBd(Object[] oArr){
		BigDecimal bd = null;
		BigDecimal[] bdArr = new BigDecimal[oArr.length];
		String amt = null;
		for(int k = 0; k < oArr.length; k++){
			amt = (String)oArr[k];
			if (isEmpty(amt)) {
				bd = BigDecimal.ZERO;
			} else {
				bd = new BigDecimal(amt);
			}
			bdArr[k] = bd;
		}
		return bdArr;
	}

	/**
	 * doukang
	 * 数字格式化：去除小数点后多余的0
	 * @param num
	 * @return
     */
	public static BigDecimal numberFormat(BigDecimal num){
		NumberFormat nf = NumberFormat.getInstance();
		return new BigDecimal(nf.format(num));
	}

	public static void main(String[] args) {
		
	 
 
	}
	
}
