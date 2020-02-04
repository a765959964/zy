package com.ruoyi.web.util;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

public class TestUtil {
	
	private static ObjectMapper mapper = new ObjectMapper();
	
	public static void main(String[] args) {
		TreeMap<String, String> valuesMap = new TreeMap<String,String>();
		valuesMap.put("pay_type","1001");
		valuesMap.put("merchant_no", "venn");
		valuesMap.put("amount","100");
		valuesMap.put("merOrderNo","20200109");
		valuesMap.put("notify_url","http://baidu.com");
		valuesMap.put("remark","备注");
//		StringBuilder sb = new StringBuilder();
//		sb.append((String) valuesMap.get("merOrderNo"));
//		sb.append((String) valuesMap.get("merchant_no"));
//		sb.append((String) valuesMap.get("notify_url"));
//		sb.append((String) valuesMap.get("amount"));
//		sb.append((String) valuesMap.get("pay_type"));
//		sb.append((String) valuesMap.get("remark"));
//		sb.append("abc1234");

//		String signature = MD5Util.string2MD5(sb.toString()).toUpperCase();
		System.out.println(valuesMap);
		String signature = MD5Utils.getDigest(valuesMap, "abc1234", "utf-8");
		try {
			Map<String, String> map = new HashMap<String,String>();
			map.put("pay_type","1001");
			map.put("merchant_no", "venn");
			map.put("amount","100");
			map.put("merOrderNo","20200109");
			map.put("notify_url","http://baidu.com");
			map.put("remark","备注");
			map.put("sign",signature);
			String params = mapper.writeValueAsString(map);
			String response = doPost("http://127.0.0.1:8023/api/pay/order/gateway", params);
			System.out.println(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public static String doPost(String url, String params) throws Exception {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json;charset=utf8");
		StringEntity entity = new StringEntity(params, "UTF-8");
		httpPost.setEntity(entity);
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(httpPost);
			StatusLine status = response.getStatusLine();
			int statusCode = status.getStatusCode();
			System.out.println("请求地址：" + url + "，请求参数：" + params + "，请求返回状态码：" + statusCode);

			if (statusCode == HttpStatus.SC_OK) {
				HttpEntity responseEntity = response.getEntity();
				return EntityUtils.toString(responseEntity, "UTF-8");
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			if (null != response) {
				response.close();
			}
			httpClient.close();
		}
		return null;
	}
	
	
}
