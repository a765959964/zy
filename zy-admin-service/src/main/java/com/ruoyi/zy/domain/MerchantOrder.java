package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 商户订单记录对象 b_merchant_order
 * 
 * @author zy
 * @date 2019-11-20
 */
public class MerchantOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 系统订单号 */
    @Excel(name = "系统订单号")
    private String sysOrderNo;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 商户订单号 */
    @Excel(name = "商户订单号")
    private String merOrderNo;

    /** 支付方式 */
    @Excel(name = "支付方式")
    private String payType;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private Long orderAmount;

    /** 订单手续费金额 */
    @Excel(name = "订单手续费金额")
    private Double orderFeeAmount;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String orderStatus;

    /** 订单支付时间 */
    @Excel(name = "订单支付时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 同步地址 */
    @Excel(name = "同步地址")
    private String returnUrl;

    /** 回调地址 */
    @Excel(name = "回调地址")
    private String notifyUrl;

    /** 回调状态 */
    @Excel(name = "回调状态")
    private String notifyStatus;

    /** 回调次数 */
    @Excel(name = "回调次数")
    private Long notifyNum;

    /** 回调失败原因 */
    @Excel(name = "回调失败原因")
    private String failureReason;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String productName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSysOrderNo(String sysOrderNo) 
    {
        this.sysOrderNo = sysOrderNo;
    }

    public String getSysOrderNo() 
    {
        return sysOrderNo;
    }
    public void setMerchantNo(String merchantNo) 
    {
        this.merchantNo = merchantNo;
    }

    public String getMerchantNo() 
    {
        return merchantNo;
    }
    public void setMerOrderNo(String merOrderNo) 
    {
        this.merOrderNo = merOrderNo;
    }

    public String getMerOrderNo() 
    {
        return merOrderNo;
    }
    public void setPayType(String payType) 
    {
        this.payType = payType;
    }

    public String getPayType() 
    {
        return payType;
    }
    public void setOrderAmount(Long orderAmount) 
    {
        this.orderAmount = orderAmount;
    }

    public Long getOrderAmount() 
    {
        return orderAmount;
    }
    public void setOrderFeeAmount(Double orderFeeAmount) 
    {
        this.orderFeeAmount = orderFeeAmount;
    }

    public Double getOrderFeeAmount() 
    {
        return orderFeeAmount;
    }
    public void setOrderStatus(String orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus() 
    {
        return orderStatus;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }
    public void setReturnUrl(String returnUrl) 
    {
        this.returnUrl = returnUrl;
    }

    public String getReturnUrl() 
    {
        return returnUrl;
    }
    public void setNotifyUrl(String notifyUrl) 
    {
        this.notifyUrl = notifyUrl;
    }

    public String getNotifyUrl() 
    {
        return notifyUrl;
    }
    public void setNotifyStatus(String notifyStatus) 
    {
        this.notifyStatus = notifyStatus;
    }

    public String getNotifyStatus() 
    {
        return notifyStatus;
    }
    public void setNotifyNum(Long notifyNum) 
    {
        this.notifyNum = notifyNum;
    }

    public Long getNotifyNum() 
    {
        return notifyNum;
    }
    public void setFailureReason(String failureReason) 
    {
        this.failureReason = failureReason;
    }

    public String getFailureReason() 
    {
        return failureReason;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("sysOrderNo", getSysOrderNo())
            .append("merchantNo", getMerchantNo())
            .append("merOrderNo", getMerOrderNo())
            .append("payType", getPayType())
            .append("orderAmount", getOrderAmount())
            .append("orderFeeAmount", getOrderFeeAmount())
            .append("orderStatus", getOrderStatus())
            .append("payTime", getPayTime())
            .append("returnUrl", getReturnUrl())
            .append("notifyUrl", getNotifyUrl())
            .append("notifyStatus", getNotifyStatus())
            .append("notifyNum", getNotifyNum())
            .append("failureReason", getFailureReason())
            .append("productName", getProductName())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
