package com.ruoyi.web.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class GenerateOrderUtil {
	private static GenerateOrderUtil g = null;

	private static int count = 0;
	private static final int total = 9999;
	private static String now = null;

	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

	public static synchronized GenerateOrderUtil getInstance() {
		if (g == null) {
			g = new GenerateOrderUtil();
		}

		return g;
	}

	private static String getNowDateStr() {
		return sdf.format(new Date());
	}

	public synchronized String GenerateOrder() {
		String datastr = getNowDateStr();

		if (datastr.equals(now)) {
			count += 1;
		} else {
			count = 1;
			now = datastr;
		}

		int countInteger = String.valueOf(9999).length() - String.valueOf(count).length();

		String bu = "";

		for (int i = 0; i < countInteger; i++) {
			bu = bu + "0";
		}

		bu = bu + String.valueOf(count);

		if (count >= 9999) {
			count = 0;
		}

		return datastr + bu;
	}

	public static void main(String[] args) {
		System.out.println(getInstance().GenerateOrder());
		System.out.println(UUID.randomUUID().toString().replace("-", "").toLowerCase());
	}
}
