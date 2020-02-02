package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 用户订单记录对象 b_user_order
 * 
 * @author zy
 * @date 2020-02-02
 */
public class BUserOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 所属代理 */
    @Excel(name = "所属代理")
    private String agent;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 系统订单号 */
    @Excel(name = "系统订单号")
    private String sysOrderNo;

    /** 商户订单号 */
    @Excel(name = "商户订单号")
    private String merOrderNo;

    /** 支付方式 */
    @Excel(name = "支付方式")
    private String payType;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private Long orderAmount;

    /** 实际支付金额 */
    @Excel(name = "实际支付金额")
    private Double payAmount;

    /** 订单手续费金额 */
    @Excel(name = "订单手续费金额")
    private Double orderFeeAmount;

    /** 订单佣金金额 */
    @Excel(name = "订单佣金金额")
    private Double orderCommissionAmount;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String orderStatus;

    /** 订单创建时间 */
    @Excel(name = "订单创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 订单备注 */
    @Excel(name = "订单备注")
    private String orderRemark;

    /** 订单确认时间 */
    @Excel(name = "订单确认时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date confirmTime;

    /** 订单确认人 */
    @Excel(name = "订单确认人")
    private String confirmUser;

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

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setAgent(String agent) 
    {
        this.agent = agent;
    }

    public String getAgent() 
    {
        return agent;
    }
    public void setMerchantNo(String merchantNo) 
    {
        this.merchantNo = merchantNo;
    }

    public String getMerchantNo() 
    {
        return merchantNo;
    }
    public void setSysOrderNo(String sysOrderNo) 
    {
        this.sysOrderNo = sysOrderNo;
    }

    public String getSysOrderNo() 
    {
        return sysOrderNo;
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
    public void setPayAmount(Double payAmount) 
    {
        this.payAmount = payAmount;
    }

    public Double getPayAmount() 
    {
        return payAmount;
    }
    public void setOrderFeeAmount(Double orderFeeAmount) 
    {
        this.orderFeeAmount = orderFeeAmount;
    }

    public Double getOrderFeeAmount() 
    {
        return orderFeeAmount;
    }
    public void setOrderCommissionAmount(Double orderCommissionAmount) 
    {
        this.orderCommissionAmount = orderCommissionAmount;
    }

    public Double getOrderCommissionAmount() 
    {
        return orderCommissionAmount;
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
    public void setOrderRemark(String orderRemark) 
    {
        this.orderRemark = orderRemark;
    }

    public String getOrderRemark() 
    {
        return orderRemark;
    }
    public void setConfirmTime(Date confirmTime) 
    {
        this.confirmTime = confirmTime;
    }

    public Date getConfirmTime() 
    {
        return confirmTime;
    }
    public void setConfirmUser(String confirmUser) 
    {
        this.confirmUser = confirmUser;
    }

    public String getConfirmUser() 
    {
        return confirmUser;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("agent", getAgent())
            .append("merchantNo", getMerchantNo())
            .append("sysOrderNo", getSysOrderNo())
            .append("merOrderNo", getMerOrderNo())
            .append("payType", getPayType())
            .append("orderAmount", getOrderAmount())
            .append("payAmount", getPayAmount())
            .append("orderFeeAmount", getOrderFeeAmount())
            .append("orderCommissionAmount", getOrderCommissionAmount())
            .append("orderStatus", getOrderStatus())
            .append("payTime", getPayTime())
            .append("orderRemark", getOrderRemark())
            .append("confirmTime", getConfirmTime())
            .append("confirmUser", getConfirmUser())
            .append("notifyUrl", getNotifyUrl())
            .append("notifyStatus", getNotifyStatus())
            .append("notifyNum", getNotifyNum())
            .append("failureReason", getFailureReason())
            .append("createTime", getCreateTime())
            .toString();
    }
}
