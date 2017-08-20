package com.ez.commons.util;

import java.util.UUID;

public class UuidUtil {
	//32位UUID
	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}
	
	public static void main(String[] args) {
		System.out.println(get32UUID());
	}
}

