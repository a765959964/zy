 package com.ruoyi.web.util;
 
 import java.security.MessageDigest;
 
 public class MD5Util
 {
   public static String string2MD5(String inStr)
   {
     MessageDigest md5 = null;
     try
     {
       md5 = MessageDigest.getInstance("MD5");
     }
     catch (Exception e) {
       e.printStackTrace();
 
       return "";
     }
 
     char[] charArray = inStr.toCharArray();
     byte[] byteArray = new byte[charArray.length];
 
     for (int i = 0; i < charArray.length; i++)
     {
       byteArray[i] = (byte)charArray[i];
     }
 
     byte[] md5Bytes = md5.digest(byteArray);
 
     StringBuffer hexValue = new StringBuffer();
 
     for (int i = 0; i < md5Bytes.length; i++)
     {
       int val = md5Bytes[i] & 0xFF;
 
       if (val < 16)
       {
         hexValue.append("0");
       }
 
       hexValue.append(Integer.toHexString(val));
     }
 
     return hexValue.toString();
   }
 
   public static void main(String[] args) throws Exception
   {
     StringBuilder sb = new StringBuilder();
 
     sb.append("OK0pmoCL6k71kh/Jqvl+ObS0kUuh2qHpfi1s2KbKFfsVpOnrgSQTtnr2MzYPvdAfnSCK7/2ohZzJYe3YqlOPkNdsSfOEjvhcwUCCRoh+zCirGyOis6KzWTKmBB9wwWbH");
 
     String pwd = string2MD5(sb.toString()).toUpperCase();
 
     System.out.println(pwd);
   }
 }

