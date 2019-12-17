package com.ruoyi.web.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

	public static String parseDateToStr(Date time, String timeFromat) {
		DateFormat dateFormat = new SimpleDateFormat(timeFromat);

		return dateFormat.format(time);
	}

	public static Date todayFirstDate() {
		Calendar calendar = Calendar.getInstance();

		calendar.set(11, 0);
		calendar.set(12, 0);
		calendar.set(13, 0);
		calendar.set(14, 0);

		return calendar.getTime();
	}

	public static Date todayLastDate() {
		Calendar calendar = Calendar.getInstance();

		calendar.set(11, 23);
		calendar.set(12, 59);
		calendar.set(13, 59);
		calendar.set(14, 999);

		return calendar.getTime();
	}

	public static Date getFirstDate(int date) {
		Calendar calendar = Calendar.getInstance();

		calendar.add(5, date);
		calendar.set(11, 0);
		calendar.set(13, 0);
		calendar.set(12, 0);
		calendar.set(14, 0);

		return calendar.getTime();
	}

	public static Date getLastDate(int date) {
		Calendar calendar = Calendar.getInstance();

		calendar.add(5, date);
		calendar.set(11, 23);
		calendar.set(12, 59);
		calendar.set(13, 59);
		calendar.set(14, 999);

		return calendar.getTime();
	}

	public static void main(String[] args) {
		System.out.println(parseDateToStr(todayFirstDate(), "yyyy-MM-dd HH:mm:ss"));
		System.out.println(parseDateToStr(todayLastDate(), "yyyy-MM-dd HH:mm:ss"));
		System.out.println(parseDateToStr(getFirstDate(-1), "yyyy-MM-dd HH:mm:ss"));
		System.out.println(parseDateToStr(getLastDate(-1), "yyyy-MM-dd HH:mm:ss"));
	}
}
