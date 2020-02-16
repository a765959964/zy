package com.ruoyi.web.controller.zy;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.web.util.MD5Utils;
import com.ruoyi.zy.domain.BMerchant;
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.domain.BUserReceipt;
import com.ruoyi.zy.service.IBMerchantService;
import com.ruoyi.zy.service.IBUserOrderService;
import com.ruoyi.zy.service.IBUserReceiptService;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * 用户订单记录Controller
 * 
 * @author zy
 * @date 2020-02-02
 */
@Controller
@RequestMapping("/zy/userorder")
public class BUserOrderController extends BaseController
{
	
	private static ObjectMapper mapper = new ObjectMapper();
	private final Logger logger = LoggerFactory.getLogger(BUserOrderController.class);
	
    private String prefix = "zy/userorder";

    @Autowired
    private IBUserOrderService bUserOrderService;
    
    @Autowired
    private IBMerchantService bMerchantService;
    
    @Autowired
    private IBUserReceiptService bUserReceiptService;

    @RequiresPermissions("zy:userorder:view")
    @GetMapping()
    public String userorder()
    {
        return prefix + "/userorder";
    }


    /**
     * 收款金额
     * @return
     */
    @RequiresPermissions("zy:userorder:view")
    @GetMapping("/ordermoney")
    public String ordermoney()
    {
        return prefix + "/ordermoney";
    }


    /**
     * 查询用户订单记录列表
     */
    @RequiresPermissions("zy:userorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserOrder bUserOrder)
    {
        startPage();
        SysUser sysUser =  ShiroUtils.getSysUser();
        if(!sysUser.isAdmin()){
        	bUserOrder.setAgent(sysUser.getLoginName());
        }
        List<BUserOrder> list = bUserOrderService.selectBUserOrderList(bUserOrder);
        return getDataTable(list);
    }


    /**
     * 查询当日收款记录
     */
    @RequiresPermissions("zy:userorder:list")
    @PostMapping("/getOrderMoneyList")
    @ResponseBody
    public TableDataInfo getOrderMoneyList(BUserOrder bUserOrder)
    {
        Map<String, String> params = new HashMap<String, String>();

        if(bUserOrder.getUsername() !=null ){
            params.put("username",bUserOrder.getUsername());
        }

        if(bUserOrder.getPayType() != null){
            params.put("payType",bUserOrder.getPayType());
        }
        SysUser sysUser =  ShiroUtils.getSysUser();
        if(!sysUser.isAdmin()){
            params.put("agent" , sysUser.getLoginName());
        }
        startPage();
        List<Map<String, String>> list = bUserOrderService.getOrderMoneyList(params);
        return getDataTable(list);
    }



    /**
     * 导出用户订单记录列表
     */
    @RequiresPermissions("zy:userorder:export")
    @Log(title = "用户订单记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserOrder bUserOrder)
    {
        List<BUserOrder> list = bUserOrderService.selectBUserOrderList(bUserOrder);
        ExcelUtil<BUserOrder> util = new ExcelUtil<BUserOrder>(BUserOrder.class);
        return util.exportExcel(list, "userorder");
    }

    /**
     * 新增用户订单记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户订单记录
     */
    @RequiresPermissions("zy:userorder:add")
    @Log(title = "用户订单记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUserOrder bUserOrder)
    {
        return toAjax(bUserOrderService.insertBUserOrder(bUserOrder));
    }

    /**
     * 修改用户订单记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserOrder bUserOrder = bUserOrderService.selectBUserOrderById(id);
        mmap.put("bUserOrder", bUserOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户订单记录
     */
    @RequiresPermissions("zy:userorder:edit")
    @Log(title = "用户订单记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUserOrder bUserOrder)
    {
        return toAjax(bUserOrderService.updateBUserOrder(bUserOrder));
    }

    /**
     * 删除用户订单记录
     */
    @RequiresPermissions("zy:userorder:remove")
    @Log(title = "用户订单记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserOrderService.deleteBUserOrderByIds(ids));
    }
    
    /**
     * 订单回调
     */
    @RequiresPermissions("zy:userorder:callback")
    @Log(title = "订单回调", businessType = BusinessType.OTHER)
    @PostMapping("/callback")
    @ResponseBody
    public AjaxResult callback(String notifyUrl,String merOrderNo)
    {
    	synchronized (this) {
    		try {
    			BUserOrder userOrder = bUserOrderService.selectBUserOrderByOrderNo(merOrderNo);
        		if(userOrder == null) {
        			logger.info("商户回调参数：订单记录不存在");
        			return error();
        		}
    			BMerchant merchant = bMerchantService.selectByMerchatNo(userOrder.getMerchantNo());
        		if(merchant == null) {
        			logger.info("商户回调参数：商户信息不存在");
        			return error();
        		}
        		
        		TreeMap<String, String> valuesMap = new TreeMap<String,String>();
        		valuesMap.put("pay_type",userOrder.getPayType());
        		valuesMap.put("merchant_no", userOrder.getMerchantNo());
        		valuesMap.put("amount",String.valueOf(userOrder.getOrderAmount()));
        		valuesMap.put("merOrderNo",merOrderNo);
        		String signature = MD5Utils.getDigest(valuesMap, merchant.getMerchantSecret(), "utf-8");
        		valuesMap.put("sign", signature);
    			String params = mapper.writeValueAsString(valuesMap);
    			logger.info("商户回调参数："+params);
    			String response = doPost(notifyUrl, params);
    			if(StringUtils.isBlank(response)) {
    				logger.info("商户回调参数：商户回调返回异常");
    				return error();
    			}
    			//returnCode 示例值：SUCCESS/FAIL
    			//returnMsg  示例值：签名失败/订单号不存在/订单金额有误
    			JSONObject jsonObject = JSONObject.parseObject(response);
    			String returnCode = jsonObject.getString("return_code");
    			String returnMsg = jsonObject.getString("return_msg");
    			if("SUCCESS".equals(returnCode)) {
    				userOrder.setOrderStatus("1");
    				userOrder.setNotifyStatus("2");
    				userOrder.setNotifyNum(userOrder.getNotifyNum() + 1);
    				userOrder.setConfirmTime(new Date());
    				userOrder.setConfirmUser(ShiroUtils.getSysUser().getLoginName());
    				bUserOrderService.updateBUserOrder(userOrder);
    				
    				BUserReceipt userReceipt = bUserReceiptService.selectBUserReceiptByUserName(userOrder.getUsername());
    				if("1001".equals(userOrder.getPayType()) || "1002".equals(userOrder.getPayType())) {
    					userReceipt.setWechatReceiptTimes(userReceipt.getWechatReceiptTimes() + 1);
    				}else if("1003".equals(userOrder.getPayType()) || "1004".equals(userOrder.getPayType())) {
    					userReceipt.setAlipayReceiptTimes(userReceipt.getAlipayReceiptTimes() + 1);
    				}
    				userReceipt.setUpdateTime(new Date());
    				bUserReceiptService.updateBUserReceipt(userReceipt);
    				return success();
    			}else {
    				userOrder.setNotifyStatus("1");
    				userOrder.setNotifyNum(userOrder.getNotifyNum() + 1);
    				userOrder.setConfirmTime(new Date());
    				userOrder.setConfirmUser(ShiroUtils.getSysUser().getLoginName());
    				userOrder.setFailureReason(returnMsg);
    				bUserOrderService.updateBUserOrder(userOrder);
    				return error();
    			}
    		} catch (Exception e) {
    			logger.info("商户回调参数：系统异常"+e.getMessage());
    			e.printStackTrace();
    		}
    	}
    	return null;
    }
    
    /**
     * 订单取消
     */
    @RequiresPermissions("zy:userorder:cancel")
    @Log(title = "订单取消", businessType = BusinessType.OTHER)
    @PostMapping("/cancel")
    @ResponseBody
    public AjaxResult cancel(String merOrderNo)
    {
    	synchronized (this) {
    		try {
    			BUserOrder userOrder = bUserOrderService.selectBUserOrderByOrderNo(merOrderNo);
        		if(userOrder == null) {
        			logger.info("订单取消参数：订单记录不存在");
        			return error();
        		}
        		userOrder.setOrderStatus("0");
				userOrder.setConfirmTime(new Date());
				userOrder.setConfirmUser(ShiroUtils.getSysUser().getLoginName());
				bUserOrderService.updateBUserOrder(userOrder);
				return success();
    		} catch (Exception e) {
    			logger.info("订单取消参数：系统异常"+e.getMessage());
    			e.printStackTrace();
    		}
    	}
    	return null;
    }
    
    /**
     * 订单恢复
     */
    @RequiresPermissions("zy:userorder:resume")
    @Log(title = "订单恢复", businessType = BusinessType.OTHER)
    @PostMapping("/resume")
    @ResponseBody
    public AjaxResult resume(String merOrderNo)
    {
    	synchronized (this) {
    		try {
    			BUserOrder userOrder = bUserOrderService.selectBUserOrderByOrderNo(merOrderNo);
        		if(userOrder == null) {
        			logger.info("订单恢复参数：订单记录不存在");
        			return error();
        		}
        		
        		userOrder.setOrderStatus("1");
				userOrder.setConfirmTime(new Date());
				userOrder.setConfirmUser(ShiroUtils.getSysUser().getLoginName());
				bUserOrderService.updateBUserOrder(userOrder);
				return success();
    			
    		} catch (Exception e) {
    			logger.info("订单恢复参数：系统异常"+e.getMessage());
    			e.printStackTrace();
    		}
    	}
    	return null;
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
