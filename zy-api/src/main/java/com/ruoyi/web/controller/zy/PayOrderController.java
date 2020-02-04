package com.ruoyi.web.controller.zy;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.ruoyi.web.utils.DateUtil;
import com.ruoyi.web.utils.GenerateOrderUtil;
import com.ruoyi.web.utils.HttpUtil;
import com.ruoyi.web.utils.MD5Utils;
import com.ruoyi.web.zy.common.ErrorCode;
import com.ruoyi.zy.domain.BMerchant;
import com.ruoyi.zy.domain.BUserDeposit;
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.domain.BUserQrCodeone;
import com.ruoyi.zy.domain.BUserReceipt;
import com.ruoyi.zy.domain.SSystemParameter;
import com.ruoyi.zy.service.IBMerchantService;
import com.ruoyi.zy.service.IBUserDepositService;
import com.ruoyi.zy.service.IBUserOrderService;
import com.ruoyi.zy.service.IBUserQrCodeoneService;
import com.ruoyi.zy.service.IBUserReceiptService;
import com.ruoyi.zy.service.ISSystemParameterService;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping({ "/api/pay/order" })
public class PayOrderController {
	private final Logger logger = LoggerFactory.getLogger(PayOrderController.class);
	private static ObjectMapper mapper = new ObjectMapper();

	@Autowired
	private IBMerchantService merchantService;

	@Autowired
	private IBUserDepositService userDepositService;

	@Autowired
	private IBUserOrderService userOrderService;

	@Autowired
	private ISSystemParameterService systemParameterService;

	@Autowired
	private IBUserQrCodeoneService userQRCodeOneService;

	@Autowired
	private IBUserReceiptService userReceiptService;

    @RequestMapping(value = "/gateway", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String gateway(@RequestBody Map<String, String> map, HttpServletRequest request) throws Exception {
		synchronized (this) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			String ip = HttpUtil.getIp(request);
			String dtime = DateUtil.parseDateToStr(new Date(), "yyyy-MM-dd HH:mm:ss");

			logger.info("用户请求IP:" + ip + "进入方法时间" + dtime + "，接收参数" + mapper.writeValueAsString(map));

			String receiptType = "";
			if (("1001".equals(map.get("pay_type"))) || ("1002".equals(map.get("pay_type"))))
				receiptType = "1001";
			else if (("1003".equals(map.get("pay_type"))) || ("1004".equals(map.get("pay_type")))) {
				receiptType = "1002";
			}
			String amount = (String) map.get("amount");
			String message = verification(map);
			if (StringUtils.isNotBlank(message)) {
				return message;
			}
			List<BUserDeposit> depositList = null;

			String columnName = "";
			if ("1001".equals(receiptType))
				columnName = "wechat_receipt_times";
			else if ("1002".equals(receiptType)) {
				columnName = "alipay_receipt_times";
			}
			Map<String, Object> receiptMap = new HashMap<String, Object>();

			receiptMap.put("columnName", columnName);

			//获取收款次数最少的用户
			List<Map<String, Object>> miniList = this.userReceiptService.minimumTimes(receiptMap);
			String userName = "";
			for (Map<String, Object> miniMap : miniList) {
				Object value = miniMap.get("receiptTimes");
				//根据收款次数查询所有符合的用户
				receiptMap.put("receiptTimes", Long.valueOf(value.toString()));
				List<BUserReceipt> userReceiptList = this.userReceiptService.findList(receiptMap);
				//查询用户对应的代理 保证金额度是否达到上限，如果未达到 则直接break  返回用户名
				for (Iterator<BUserReceipt> iterator = userReceiptList.iterator(); iterator.hasNext();) {
					BUserReceipt bUserReceipt = (BUserReceipt) iterator.next();
					String agent = bUserReceipt.getAgent();
					Map<String, Object> depositMap = new HashMap<String, Object>();
					depositMap.put("receiptType", receiptType);
					depositMap.put("reviewStatus", "3");
					depositMap.put("flag", "Y");
					depositMap.put("status", "2");
					depositMap.put("orderAmount", Long.valueOf(Long.parseLong(amount)));
					depositMap.put("agent", agent);
					depositList = this.userDepositService.available(depositMap);
					if ((depositList != null) && (!depositList.isEmpty())) {
						userName = bUserReceipt.getUsername();
						break;
					}
				}
				if(StringUtils.isNotBlank(userName)) {
					break;
				}
			}
			
			if(StringUtils.isBlank(userName)) {
				// 没有可用的二维码
				resultMap.put("code", ErrorCode.SC_20005.getCode());
				resultMap.put("message", ErrorCode.SC_20005.getMessage());
				return mapper.writeValueAsString(resultMap);
			}

			//根据用户名去查询对应的二维码
			Map<String, Object> paramsMap = new HashMap<String, Object>();
			paramsMap.put("username", userName);
			paramsMap.put("receiptType", String.valueOf(map.get("pay_type")));
			BUserQrCodeone uco = this.userQRCodeOneService.get(paramsMap);
			if (uco == null) {
				// 未找到相应的存款二维码，请联系在线客服
				resultMap.put("code", ErrorCode.SC_20005.getCode());
				resultMap.put("message", ErrorCode.SC_20005.getMessage());
				return mapper.writeValueAsString(resultMap);
			}
			map.put("agent", uco.getAgent());
			map.put("username", userName);
			map.put("payAmount", formatAmount(amount));

			Map<String, Object> saveResultMap = saveData(map);
			if (saveResultMap.get("code").equals(ErrorCode.SC_10000.getCode())) {
				resultMap.put("code", ErrorCode.SC_10000.getCode());
				resultMap.put("message", ErrorCode.SC_10000.getMessage());
				
				Map<String, Object> returnMap = new HashMap<String, Object>();
				returnMap.put("qrcode", uco.getReceiptQrcodeCode());
				returnMap.put("amount", saveResultMap.get("amount"));
				returnMap.put("merOrderNo", saveResultMap.get("merOrderNo"));
				returnMap.put("remark", saveResultMap.get("remark"));
				
				resultMap.put("data", returnMap);
				return mapper.writeValueAsString(resultMap);
			} else {
				resultMap.put("code", ErrorCode.SC_10001.getCode());
				resultMap.put("message", ErrorCode.SC_10001.getMessage());
				return mapper.writeValueAsString(resultMap);
			}

		}
	}

	private String verification(Map<String, String> valuesMap) throws JsonProcessingException {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String payType = (String)valuesMap.get("pay_type");
			String merchantNo = (String)valuesMap.get("merchant_no");
			String amount = (String)valuesMap.get("amount");
			String merOrderNo = (String)valuesMap.get("merOrderNo");
			String notifyUrl = (String)valuesMap.get("notify_url");
			String remark = (String)valuesMap.get("remark");
			if(StringUtils.isBlank(payType)||StringUtils.isBlank(merchantNo)||StringUtils.isBlank(amount)||StringUtils.isBlank(merOrderNo)
					||StringUtils.isBlank(notifyUrl)) {
				//请求参数不能为空
				resultMap.put("code", ErrorCode.SC_20007.getCode());
				resultMap.put("message", ErrorCode.SC_20007.getMessage());
				return mapper.writeValueAsString(resultMap); 
			}
			
			BMerchant merchant = this.merchantService.selectByMerchatNo(merchantNo);
			if (merchant == null) { 
				// 商户不存在
				resultMap.put("code", ErrorCode.SC_20000.getCode());
				resultMap.put("message", ErrorCode.SC_20000.getMessage());
				return mapper.writeValueAsString(resultMap); 
			}
			BUserOrder userOrder = new BUserOrder();
			userOrder.setMerOrderNo(merOrderNo);
			List<BUserOrder> listOrder = this.userOrderService.selectBUserOrderList(userOrder);
			if(listOrder != null && listOrder.size() > 0) {
				resultMap.put("code", ErrorCode.SC_20006.getCode());
				resultMap.put("message", ErrorCode.SC_20006.getMessage());
				return mapper.writeValueAsString(resultMap);
			}
			

			String regEx1 = "\\d+";
			Pattern p = Pattern.compile(regEx1);
			Matcher m = p.matcher(amount);
			if (!m.matches()) {
				// 下单金额错误
				resultMap.put("code", ErrorCode.SC_20001.getCode());
				resultMap.put("message", ErrorCode.SC_20001.getMessage());
				return mapper.writeValueAsString(resultMap);
			}

			TreeMap<String, String> signMap = new TreeMap<String, String>();
			signMap.put("pay_type", payType);
			signMap.put("merchant_no", merchantNo);
			signMap.put("amount", amount);
			signMap.put("merOrderNo", merOrderNo);
			signMap.put("notify_url", notifyUrl);
			signMap.put("remark", remark);
			String signature = MD5Utils.getDigest(signMap, merchant.getMerchantSecret(), "utf-8");
			if (!signature.equals(valuesMap.get("sign"))) {
				// 商户验签失败
				resultMap.put("code", ErrorCode.SC_20002.getCode());
				resultMap.put("message", ErrorCode.SC_20002.getMessage());
				return mapper.writeValueAsString(resultMap);
			}
			return null;
		} catch (Exception e) {
			resultMap.put("code", ErrorCode.SC_10001.getCode());
			resultMap.put("message", ErrorCode.SC_10001.getMessage());
			return mapper.writeValueAsString(resultMap);
		}

	}

	private Map<String, Object> saveData(Map<String, String> valuesMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Date currentDate = new Date();
			Double fee = Double.valueOf(0.035D);

			String sysOrderNo = GenerateOrderUtil.getInstance().GenerateOrder();

			Map<String, Object> sysParamMap = new HashMap<String, Object>();

			sysParamMap.put("category", valuesMap.get("merchant_no"));
			sysParamMap.put("code", valuesMap.get("pay_type"));
			sysParamMap.put("flag", "Y");

			SSystemParameter systemParameter = this.systemParameterService.get(sysParamMap);
			if (systemParameter != null) {
				fee = Double.valueOf(Double.parseDouble(systemParameter.getValue()));
			}

			BUserOrder userOrder = new BUserOrder();
			userOrder.setAgent((String)valuesMap.get("agent"));
			userOrder.setUsername((String) valuesMap.get("username"));
			userOrder.setMerchantNo((String) valuesMap.get("merchant_no"));
			userOrder.setSysOrderNo(sysOrderNo);
			userOrder.setMerOrderNo((String) valuesMap.get("merOrderNo"));
			userOrder.setPayType((String) valuesMap.get("pay_type"));
			userOrder.setOrderAmount(Long.valueOf(Long.parseLong((String) valuesMap.get("amount"))));
			userOrder.setPayAmount(Double.valueOf(Double.parseDouble((String) valuesMap.get("payAmount"))));
			userOrder.setOrderFeeAmount(Double.valueOf(Long.parseLong((String) valuesMap.get("amount")) * fee.doubleValue()));
			userOrder.setOrderCommissionAmount(Double.valueOf(Long.parseLong((String) valuesMap.get("amount")) * 0.01));
			userOrder.setPayTime(currentDate);
			userOrder.setNotifyUrl((String) valuesMap.get("notify_url"));
			userOrder.setNotifyStatus("0");
			userOrder.setNotifyNum(Long.valueOf(0L));
			userOrder.setOrderStatus("1");
			userOrder.setOrderRemark((String) valuesMap.get("remark"));
			userOrder.setCreateTime(currentDate);

			this.userOrderService.insertBUserOrder(userOrder);
			resultMap.put("code", ErrorCode.SC_10000.getCode());
			resultMap.put("message", ErrorCode.SC_10000.getMessage());
			resultMap.put("amount", (String) valuesMap.get("amount"));
			resultMap.put("merOrderNo", (String) valuesMap.get("merOrderNo"));
			resultMap.put("remark", (String) valuesMap.get("remark"));
			
		} catch (Exception e) {
			resultMap.put("code", ErrorCode.SC_10001.getCode());
			resultMap.put("message", ErrorCode.SC_10001.getMessage());
		}

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
	
}
