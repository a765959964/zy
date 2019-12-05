package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 交易记录对象 b_user_order
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public class BUserOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 存款编号 */
    @Excel(name = "存款编号")
    private Long depositId;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 系统订单号 */
    @Excel(name = "系统订单号")
    private String sysOrderNo;

    /** 订单类型 */
    @Excel(name = "订单类型")
    private String orderType;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private Long orderAmount;

    /** 实际支付金额 */
    @Excel(name = "实际支付金额")
    private Double payAmount;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String orderStatus;

    /** 订单备注 */
    @Excel(name = "订单备注")
    private String orderRemark;

    /** 订单确认时间 */
    @Excel(name = "订单确认时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date confirmTime;

    /** 订单确认人 */
    @Excel(name = "订单确认人")
    private String confirmUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDepositId(Long depositId) 
    {
        this.depositId = depositId;
    }

    public Long getDepositId() 
    {
        return depositId;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
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
    public void setOrderType(String orderType) 
    {
        this.orderType = orderType;
    }

    public String getOrderType() 
    {
        return orderType;
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
    public void setOrderStatus(String orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus() 
    {
        return orderStatus;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("depositId", getDepositId())
            .append("username", getUsername())
            .append("merchantNo", getMerchantNo())
            .append("sysOrderNo", getSysOrderNo())
            .append("orderType", getOrderType())
            .append("orderAmount", getOrderAmount())
            .append("payAmount", getPayAmount())
            .append("orderStatus", getOrderStatus())
            .append("orderRemark", getOrderRemark())
            .append("confirmTime", getConfirmTime())
            .append("confirmUser", getConfirmUser())
            .append("createTime", getCreateTime())
            .toString();
    }
}
