package com.ruoyi.web.util;

import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Utils {
	public static String getDigest(TreeMap<String, String> map, String key, String charset){
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            sb = sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
        }
        sb.append("key").append("=").append(key);
        System.out.println("拼接后的字符："+sb.toString());
        String sign = DigestUtils.md5Hex(getContentBytes(sb.toString(), charset));
        System.out.println("加密后的签名："+sign);
        return sign;
    }
	public static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }
}
