package com.ruoyi.web.utils;

import java.util.ResourceBundle;

public class ConfigUtil {
	private static ResourceBundle rb = null;
	private static final String CONFIG_FILE_NAME = "config";

	public static String getValue(String key) {
		return rb.getString(key);
	}

	public static void main(String[] args) {
		System.out.println(getValue("jump_url"));
	}

	static {
		rb = ResourceBundle.getBundle("config");
	}
}
