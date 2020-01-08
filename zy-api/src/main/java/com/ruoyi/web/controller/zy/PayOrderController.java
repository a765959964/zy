 package com.ruoyi.web.controller.zy;
 
 import com.fasterxml.jackson.databind.ObjectMapper;
 
 import com.google.zxing.BinaryBitmap;
 import com.google.zxing.DecodeHintType;
 import com.google.zxing.LuminanceSource;
 import com.google.zxing.MultiFormatReader;
 import com.google.zxing.Result;
 import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
 import com.google.zxing.common.HybridBinarizer;
import com.ruoyi.web.utils.DateUtil;
import com.ruoyi.web.utils.GenerateOrderUtil;
import com.ruoyi.web.utils.HttpUtil;
import com.ruoyi.web.utils.MD5Util;
import com.ruoyi.zy.domain.BMerchant;
import com.ruoyi.zy.domain.BUser;
import com.ruoyi.zy.domain.BUserDeposit;
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.domain.BUserQrCode;
import com.ruoyi.zy.domain.BUserQrCodeone;
import com.ruoyi.zy.domain.MerchantOrder;
import com.ruoyi.zy.domain.SSystemParameter;
import com.ruoyi.zy.domain.UserDeposit;
import com.ruoyi.zy.service.IBMerchantService;
import com.ruoyi.zy.service.IBReceiptBankService;
import com.ruoyi.zy.service.IBUserDepositService;
import com.ruoyi.zy.service.IBUserOrderService;
import com.ruoyi.zy.service.IBUserQrCodeService;
import com.ruoyi.zy.service.IBUserQrCodeoneService;
import com.ruoyi.zy.service.IBUserReceiptService;
import com.ruoyi.zy.service.IBUserService;
import com.ruoyi.zy.service.IMerchantOrderService;
import com.ruoyi.zy.service.ISSystemParameterService;

import java.awt.image.BufferedImage;
 import java.io.InputStream;
 import java.io.PrintStream;
 import java.net.HttpURLConnection;
 import java.net.URL;
 import java.text.DecimalFormat;
 import java.util.Collections;
 import java.util.Date;
 import java.util.HashMap;
 import java.util.Hashtable;
 import java.util.Iterator;
 import java.util.List;
 import java.util.Map;
 import java.util.Random;
 import java.util.regex.Matcher;
 import java.util.regex.Pattern;
 import javax.imageio.ImageIO;
 import javax.servlet.http.HttpServletRequest;
 import org.apache.commons.lang3.StringUtils;
 import org.apache.log4j.Logger;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Controller;
 import org.springframework.web.bind.annotation.RequestMapping;
 import org.springframework.web.bind.annotation.RequestParam;
 import org.springframework.web.servlet.ModelAndView;
 
 @Controller
 @RequestMapping({"/api/pay/order"})
 public class PayOrderController
 {
   private static Logger logger = Logger.getLogger(PayOrderController.class);
   private static ObjectMapper mapper = new ObjectMapper();
 
   @Autowired
   private IBMerchantService merchantService;
 
   @Autowired
   private IMerchantOrderService merchantOrderService;
 
   @Autowired
   private IBUserDepositService userDepositService;
 
   @Autowired
   private IBUserOrderService userOrderService;
 
   @Autowired
   private IBUserService userService;
 
   @Autowired
   private ISSystemParameterService systemParameterService;
 
   @Autowired
   private IBReceiptBankService receiptBankService;
 
   @Autowired
   private IBUserQrCodeoneService userQRCodeOneService;
 
   @Autowired
   private IBUserQrCodeService userQRCodeService;
   
   @Autowired
   private IBUserReceiptService userReceiptService;
 
   private static Map<String, String> pageMap = new HashMap();
 
   static {
     pageMap.put("1001", "pay/wxsm");
     pageMap.put("1002", "pay/wxwap");
     pageMap.put("1003", "pay/zfbsm");
     pageMap.put("1004", "pay/zfbwap");
   }
   @RequestMapping(value={"/gateway"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
   public ModelAndView pay(@RequestParam Map<String, String> map, HttpServletRequest request) throws Exception {
     ModelAndView model = new ModelAndView((String)pageMap.get(map.get("pay_type")));
     synchronized (this) {
       String ip = HttpUtil.getIp(request);
       String dtime = DateUtil.parseDateToStr(new Date(), "yyyy-MM-dd HH:mm:ss");
 
       logger.info("用户请求IP:" + ip + "进入方法时间" + dtime + "，接收参数" + mapper.writeValueAsString(map));
 
       String receiptType = "";
       if (("1001".equals(map.get("pay_type"))) || ("1002".equals(map.get("pay_type"))))
         receiptType = "1001";
       else if (("1003".equals(map.get("pay_type"))) || ("1004".equals(map.get("pay_type")))) {
         receiptType = "1002";
       }
       String order_amount = (String)map.get("order_amount");
       String message = verification(map);
       if (StringUtils.isNotBlank(message)) {
         model.setViewName("pay/error");
         model.addObject("errorMessage", message);
         return model;
       }
       List depositList = null;
       UserDeposit userDeposit = null;
 
//       Map sysParamMap = new HashMap();
// 
//       sysParamMap.put("category", map.get("pay_type"));
//       sysParamMap.put("code", "2000");
//       sysParamMap.put("flag", "Y");
 
//       if (Integer.parseInt(order_amount) >= 20000) {
//    	 SSystemParameter systemParameter = this.systemParameterService.get(sysParamMap);
//         if (systemParameter != null) {
//           String value = systemParameter.getValue();
// 
//           String[] arr = value.split("#");
//           for (String username : arr) {
//             Map depositMap = new HashMap();
// 
//             depositMap.put("username", username);
//             depositMap.put("receiptType", receiptType);
//             depositMap.put("flag", "Y");
//             depositMap.put("reviewStatus", "3");
//             depositMap.put("status", "2");
// 
//             depositList = this.userDepositService.findList(depositMap);
//             if ((depositList != null) && (!depositList.isEmpty())) {
//               userDeposit = (UserDeposit)depositList.get(0);
//               break;
//             }
//           }
//         }
//       }
       String columnName = "";
       if ("1001".equals(receiptType))
         columnName = "wechat_receipt_times";
       else if ("1002".equals(receiptType)) {
         columnName = "alipay_receipt_times";
       }
       Map receiptMap = new HashMap();

       receiptMap.put("columnName", columnName);

       List<Map<String, Object>> miniList = this.userReceiptService.minimumTimes(receiptMap);
       
       for (Map miniMap : miniList) {
         Object value = miniMap.get("receiptTimes");

         receiptMap.put("receiptTimes", Long.valueOf(value.toString()));

         List userReceiptList = this.userReceiptService.findList(receiptMap);

         Map depositMap = new HashMap();

         depositMap.put("receiptType", receiptType);
         depositMap.put("reviewStatus", "3");
         depositMap.put("flag", "Y");
         depositMap.put("status", "2");
         depositMap.put("orderAmount", Long.valueOf(Long.parseLong(order_amount)));
         depositMap.put("userReceiptList", userReceiptList);

         depositList = this.userDepositService.available(depositMap);
         if ((depositList != null) && (!depositList.isEmpty())) {
           break;
         }
       }
       if ((depositList == null) || (depositList.isEmpty())) {
         model.setViewName("pay/error");
         model.addObject("errorMessage", "未获取到二维码，请联系在线客服处理");

         return model;
       }
       Collections.shuffle(depositList);

       userDeposit = (UserDeposit)depositList.get(randomValue(depositList.size()));
       if (userDeposit == null) {
         model.setViewName("pay/error");
         model.addObject("errorMessage", "请上传收款码");
 
         return model;
       }
 
       Map paramsMap = new HashMap();
       paramsMap.put("username", userDeposit.getUsername());
       paramsMap.put("receiptType", String.valueOf(map.get("pay_type")));
       BUserQrCodeone uco = this.userQRCodeOneService.get(paramsMap);
       if (uco == null) {
         model.setViewName("pay/error");
         model.addObject("errorMessage", "未找到相应的存款二维码，请联系在线客服");
 
         return model;
       }
 
       map.put("depositId", String.valueOf(userDeposit.getId()));
       map.put("username", userDeposit.getUsername());
       map.put("payAmount", formatAmount(order_amount));
 
       Map resultMap = saveData(map);
       StringUtils.isNotEmpty((CharSequence)resultMap.get("sysOrderNo"));
 
       model.addObject("orderAmount", order_amount);
       model.addObject("sysOrderNo", resultMap.get("sysOrderNo"));
       model.addObject("productName", map.get("product_name"));
       model.addObject("url", uco.getReceiptQrcodeCode());
       model.addObject("remark", resultMap.get("remark"));
 
       return model;
     }
   }
 
//   public ModelAndView pay_bak(@RequestParam Map<String, String> map, HttpServletRequest request) throws Exception {
//     ModelAndView model = new ModelAndView((String)pageMap.get(map.get("pay_type")));
//     synchronized (this) {
//       String ip = HttpUtil.getIp(request);
//       String dtime = DateUtil.parseDateToStr(new Date(), "yyyy-MM-dd HH:mm:ss");
// 
//       logger.info("用户请求IP:" + ip + "进入方法时间" + dtime + "，接收参数" + mapper.writeValueAsString(map));
// 
//       String receiptType = "";
//       if (("1001".equals(map.get("pay_type"))) || ("1002".equals(map.get("pay_type"))))
//         receiptType = "1001";
//       else if (("1003".equals(map.get("pay_type"))) || ("1004".equals(map.get("pay_type")))) {
//         receiptType = "1002";
//       }
//       String message = verification(map);
//       if (StringUtils.isNotBlank(message)) {
//         model.setViewName("pay/error");
//         model.addObject("errorMessage", message);
// 
//         return model;
//       }
//       List depositList = null;
//       UserDeposit userDeposit = null;
// 
//       Map sysParamMap = new HashMap();
// 
//       sysParamMap.put("category", map.get("pay_type"));
//       sysParamMap.put("code", map.get("order_amount"));
//       sysParamMap.put("flag", "Y");
// 
//       SSystemParameter systemParameter = this.systemParameterService.get(sysParamMap);
//       if (systemParameter != null) {
//         String value = systemParameter.getValue();
// 
//         String[] arr = value.split("#");
//         for (String username : arr) {
//           Map depositMap = new HashMap();
// 
//           depositMap.put("username", username);
//           depositMap.put("receiptType", receiptType);
//           depositMap.put("reviewStatus", "3");
//           depositMap.put("status", "2");
// 
//           depositList = this.userDepositService.findList(depositMap);
//           if ((depositList != null) && (!depositList.isEmpty())) {
//             userDeposit = (UserDeposit)depositList.get(0);
// 
//             break;
//           }
//         }
//       }
// 
//       if (userDeposit == null) {
//         String columnName = "";
//         if ("1001".equals(receiptType))
//           columnName = "wechat_receipt_times";
//         else if ("1002".equals(receiptType)) {
//           columnName = "alipay_receipt_times";
//         }
//         Map receiptMap = new HashMap();
// 
//         receiptMap.put("columnName", columnName);
// 
//         Object miniList = this.userReceiptService.minimumTimes(receiptMap);
//         for (Iterator localIterator = ((List)miniList).iterator(); localIterator.hasNext(); ) { Object miniMap = localIterator.next();
//           Object value = ((Map)miniMap).get("receiptTimes");
// 
//           receiptMap.put("receiptTimes", Long.valueOf(Long.parseLong(String.valueOf(value))));
// 
//           List userReceiptList = this.userReceiptService.findList(receiptMap);
// 
//           Map depositMap = new HashMap();
// 
//           depositMap.put("receiptType", receiptType);
//           depositMap.put("reviewStatus", "3");
//           depositMap.put("flag", "Y");
//           depositMap.put("status", "2");
//           depositMap.put("orderAmount", Long.valueOf(Long.parseLong((String)map.get("order_amount"))));
//           depositMap.put("userReceiptList", userReceiptList);
// 
//           depositList = this.userDepositService.available(depositMap);
//           if ((depositList != null) && (!depositList.isEmpty())) {
//             break;
//           }
//         }
//         if ((depositList == null) || (depositList.isEmpty())) {
//           model.setViewName("pay/error");
//           model.addObject("errorMessage", "未获取到二维码，请联系在线客服处理");
// 
//           return model;
//         }
//         Collections.shuffle(depositList);
// 
//         userDeposit = (UserDeposit)depositList.get(randomValue(depositList.size()));
//       }
//       if (userDeposit == null) {
//         model.setViewName("pay/error");
//         model.addObject("errorMessage", "请上传收款码");
// 
//         return model;
//       }
//       BUserQrCode userQRCode = null;
// 
//       Map paramsMap = new HashMap();
// 
//       paramsMap.put("username", userDeposit.getUsername());
//       paramsMap.put("receiptType", userDeposit.getReceiptType());
//       paramsMap.put("receiptAmount", Long.valueOf(Long.parseLong((String)map.get("order_amount"))));
// 
//       Object minMap = this.userQRCodeService.minimumTimes(paramsMap);
// 
//       paramsMap.put("matchTimes", Long.valueOf(Long.parseLong(String.valueOf(((Map)minMap).get("matchTimes")))));
// 
//       Object qrList = this.userQRCodeService.findList(paramsMap);
//       if ((qrList == null) || (((List)qrList).isEmpty())) {
//         model.setViewName("pay/error");
//         model.addObject("errorMessage", "未找到相应的存款金额二维码，请联系在线客服");
// 
//         return model;
//       }
//       userQRCode = (BUserQrCode)((List)qrList).get(randomValue(((List)qrList).size()));
// 
//       BUserQrCode qr = new BUserQrCode();
// 
//       qr.setId(userQRCode.getId());
//       qr.setMatchTimes(Long.valueOf(userQRCode.getMatchTimes().longValue() + 1L));
// 
//       this.userQRCodeService.updateBUserQrCode(qr);
// 
//       map.put("depositId", String.valueOf(userDeposit.getId()));
//       map.put("username", userDeposit.getUsername());
//       map.put("payAmount", formatAmount(String.valueOf(userQRCode.getReceiptQrcodeAmount())));
// 
//       Map resultMap = saveData(map);
//       if (StringUtils.isNotEmpty((CharSequence)resultMap.get("sysOrderNo"))) {
//         BUser user = this.userService.get(userDeposit.getUsername());
//         if (StringUtils.isNotBlank(user.getPhoneNumber())) {
//           sysParamMap = new HashMap();
// 
//           sysParamMap.put("category", "9999");
//           sysParamMap.put("code", "SMS");
//           sysParamMap.put("flag", "Y");
// 
//           SSystemParameter tempParameter = this.systemParameterService.get(sysParamMap);
//           if (tempParameter != null) {
//             sysParamMap = new HashMap();
// 
//             sysParamMap.put("category", "8888");
//             sysParamMap.put("code", "SMS_PARAM");
//             sysParamMap.put("flag", "Y");
// 
//             tempParameter = this.systemParameterService.get(sysParamMap);
// 
//             String value = tempParameter.getValue();
// 
//             //SMSUtil.send(value.split("#")[0], value.split("#")[1], user.getPhoneNumber(), null);
//           } else {
//             Map sendMap = new HashMap();
// 
//             sendMap.put("username", user.getUsername());
//             sendMap.put("type", receiptType);
//             sendMap.put("phoneNumber", user.getPhoneNumber());
// 
//             //SMSYXUtil.send(sendMap);
//           }
//         }
//       }
//       String receiptQrcodeUrl = decode(userQRCode.getReceiptQrcodeUrl());
// 
//       model.addObject("orderAmount", formatAmount(String.valueOf(userQRCode.getReceiptQrcodeAmount())));
//       model.addObject("sysOrderNo", resultMap.get("sysOrderNo"));
//       model.addObject("productName", map.get("product_name"));
//       model.addObject("url", receiptQrcodeUrl);
//       model.addObject("remark", resultMap.get("remark"));
// 
//       return model;
//     }
//   }
 
   private String verification(Map<String, String> valuesMap) {
	 BMerchant merchant = this.merchantService.get((String)valuesMap.get("merchant_no"));
     if (merchant == null) {
       return "商户信息不存在，请核实后在操作";
     }
 
     String amounts = (String)valuesMap.get("order_amount");
     String regEx1 = "\\d+";
     Pattern p = Pattern.compile(regEx1);
     Matcher m = p.matcher(amounts);
     if (!m.matches()) {
       return "下单金额只能为500-8000的正整数";
     }
 
     StringBuilder sb = new StringBuilder();
 
     sb.append((String)valuesMap.get("mer_order_no"));
     sb.append((String)valuesMap.get("merchant_no"));
     sb.append((String)valuesMap.get("notify_url"));
     sb.append((String)valuesMap.get("order_amount"));
     sb.append((String)valuesMap.get("pay_type"));
     sb.append((String)valuesMap.get("product_name"));
     sb.append((String)valuesMap.get("remark"));
     sb.append((String)valuesMap.get("return_url"));
     sb.append(merchant.getMerchantSecret());
 
     String signature = MD5Util.string2MD5(sb.toString()).toUpperCase();
     if (!signature.equals(valuesMap.get("sign"))) {
       return "商户验签失败";
     }
     return null;
   }
 
   private int randomValue(int len) {
     Random random = new Random();
 
     int index = random.nextInt(len);
 
     return index;
   }
 
   private String decode(String qrCodeUrl) throws Exception {
     URL url = new URL(qrCodeUrl);
 
     HttpURLConnection conn = (HttpURLConnection)url.openConnection();
 
     conn.setRequestMethod("GET");
 
     conn.setConnectTimeout(5000);
 
     InputStream inStream = conn.getInputStream();
 
     BufferedImage image = ImageIO.read(inStream);
 
     LuminanceSource source = new BufferedImageLuminanceSource(image);
 
     BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
 
     Hashtable hints = new Hashtable();
 
     hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");
 
     Result result = new MultiFormatReader().decode(bitmap, hints);
 
     return result.getText();
   }
 
   private Map<String, String> saveData(Map<String, String> valuesMap) {
     Date currentDate = new Date();
     Double fee = Double.valueOf(0.035D);
 
     String sysOrderNo = GenerateOrderUtil.getInstance().GenerateOrder();
     String orderRemark = getRandomChar(4);
 
     Map sysParamMap = new HashMap();
 
     sysParamMap.put("category", valuesMap.get("merchant_no"));
     sysParamMap.put("code", valuesMap.get("pay_type"));
     sysParamMap.put("flag", "Y");
 
     SSystemParameter systemParameter = this.systemParameterService.get(sysParamMap);
     if (systemParameter != null) {
       fee = Double.valueOf(Double.parseDouble(systemParameter.getValue()));
     }
     MerchantOrder merchantOrder = new MerchantOrder();
 
     merchantOrder.setSysOrderNo(sysOrderNo);
     merchantOrder.setMerchantNo((String)valuesMap.get("merchant_no"));
     merchantOrder.setMerOrderNo((String)valuesMap.get("mer_order_no"));
     merchantOrder.setPayType((String)valuesMap.get("pay_type"));
     merchantOrder.setOrderAmount(Long.valueOf(Long.parseLong((String)valuesMap.get("order_amount"))));
     merchantOrder.setOrderFeeAmount(
       Double.valueOf(Long.parseLong((String)valuesMap.get("order_amount")) * fee.doubleValue()));
     merchantOrder.setOrderStatus("1");
     merchantOrder.setReturnUrl((String)valuesMap.get("return_url"));
     merchantOrder.setNotifyUrl((String)valuesMap.get("notify_url"));
     merchantOrder.setNotifyStatus("1");
     merchantOrder.setNotifyNum(Long.valueOf(0L));
     merchantOrder.setProductName((String)valuesMap.get("product_name"));
     merchantOrder.setRemark((String)valuesMap.get("remark"));
     merchantOrder.setCreateTime(currentDate);
     merchantOrder.setUpdateTime(currentDate);
 
     this.merchantOrderService.insertMerchantOrder((merchantOrder));
 
     BUserOrder userOrder = new BUserOrder();
 
     userOrder.setDepositId(Long.valueOf(Long.parseLong((String)valuesMap.get("depositId"))));
     userOrder.setUsername((String)valuesMap.get("username"));
     userOrder.setMerchantNo((String)valuesMap.get("merchant_no"));
     userOrder.setSysOrderNo(sysOrderNo);
     userOrder.setOrderType((String)valuesMap.get("pay_type"));
     userOrder.setOrderAmount(Long.valueOf(Long.parseLong((String)valuesMap.get("order_amount"))));
     userOrder.setPayAmount(Double.valueOf(Double.parseDouble((String)valuesMap.get("payAmount"))));
     userOrder.setOrderStatus("1");
     userOrder.setOrderRemark(orderRemark);
     userOrder.setCreateTime(currentDate);
 
     this.userOrderService.insertBUserOrder(userOrder);
 
     BUserDeposit userDeposit = new BUserDeposit();
 
     userDeposit.setId(Long.valueOf(Long.parseLong((String)valuesMap.get("depositId"))));
     userDeposit.setStatus("3");
 
     this.userDepositService.updateBUserDeposit(userDeposit);
 
     Map resultMap = new HashMap();
 
     resultMap.put("sysOrderNo", sysOrderNo);
     resultMap.put("remark", orderRemark);
 
     return resultMap;
   }
 
   private String formatAmount(String orderAmount) {
     DecimalFormat df = new DecimalFormat(".00");
 
     return df.format(Double.parseDouble(orderAmount));
   }
 
   public String getRandomChar(int length) {
     char[] chr = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 
       'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
 
     StringBuffer buffer = new StringBuffer();
 
     Random random = new Random();
     for (int i = 0; i < length; i++) {
       buffer.append(chr[random.nextInt(36)]);
     }
     return buffer.toString();
   }
 
   public static void main(String[] args) throws Exception {
     String url1 = "http://mfzfmer.com/img/1.png";
 
     System.out.println(new PayOrderController().decode(url1));
   }
 }
