package com.ez.commons.util;

import org.apache.commons.lang3.StringUtils;

import java.security.MessageDigest;

public class MD5 {

	public static String md5(String str) {
		try {
			if (StringUtils.isNotBlank(str)){
				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(str.getBytes());
				byte b[] = md.digest();

				int i;

				StringBuffer buf = new StringBuffer("");
				for (int offset = 0; offset < b.length; offset++) {
					i = b[offset];
					if (i < 0)
						i += 256;
					if (i < 16)
						buf.append("0");
					buf.append(Integer.toHexString(i));
				}
				str = buf.toString();
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return str;
	}
	public static void main(String[] args) {
		System.out.println(md5("31119@qq.com"+"123456"));
		System.out.println(md5(null));
	}
}
