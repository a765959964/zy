package com.ruoyi.web.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import javax.servlet.http.HttpServletRequest;

public class HttpUtil {
	
	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");

		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getHeader("Proxy-Client-IP");
		}

		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}

		if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}

	public static String doGet(String url, String param) {
		BufferedReader in = null;
		String result = "";
		try {
			String urlNameString = url + "?" + param;

			URL realUrl = new URL(urlNameString);

			URLConnection connection = realUrl.openConnection();

			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");

			connection.connect();

			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result = result + line;
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;
	}

	public static String doPost(String url, String param) {
		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		try {
			URL realUrl = new URL(url);

			URLConnection conn = realUrl.openConnection();

			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("connection", "Keep-Alive");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");

			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);

			out = new PrintWriter(conn.getOutputStream());

			out.print(param);
			out.flush();

			in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result = result + line;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}

				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}

		return result;
	}
}
