package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 用户提款记录对象 b_user_withdrawal
 * 
 * @author zf
 * @date 2019-11-28
 */
public class UserWithdrawal extends BaseEntity
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

    /** 佣金金额 */
    @Excel(name = "佣金金额")
    private Double commissionAmount;

    /** 收款二维码地址 */
    @Excel(name = "收款二维码地址")
    private String receiptQrcodeUrl;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String orderStatus;

    /** 打款凭证地址 */
    @Excel(name = "打款凭证地址")
    private String paymentUrl;

    /** 打款时间 */
    @Excel(name = "打款时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date paymentTime;

    /** 确认时间 */
    @Excel(name = "确认时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date confirmTime;

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
    public void setCommissionAmount(Double commissionAmount) 
    {
        this.commissionAmount = commissionAmount;
    }

    public Double getCommissionAmount() 
    {
        return commissionAmount;
    }
    public void setReceiptQrcodeUrl(String receiptQrcodeUrl) 
    {
        this.receiptQrcodeUrl = receiptQrcodeUrl;
    }

    public String getReceiptQrcodeUrl() 
    {
        return receiptQrcodeUrl;
    }
    public void setOrderStatus(String orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatus() 
    {
        return orderStatus;
    }
    public void setPaymentUrl(String paymentUrl) 
    {
        this.paymentUrl = paymentUrl;
    }

    public String getPaymentUrl() 
    {
        return paymentUrl;
    }
    public void setPaymentTime(Date paymentTime) 
    {
        this.paymentTime = paymentTime;
    }

    public Date getPaymentTime() 
    {
        return paymentTime;
    }
    public void setConfirmTime(Date confirmTime) 
    {
        this.confirmTime = confirmTime;
    }

    public Date getConfirmTime() 
    {
        return confirmTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("depositId", getDepositId())
            .append("username", getUsername())
            .append("commissionAmount", getCommissionAmount())
            .append("receiptQrcodeUrl", getReceiptQrcodeUrl())
            .append("orderStatus", getOrderStatus())
            .append("createTime", getCreateTime())
            .append("paymentUrl", getPaymentUrl())
            .append("paymentTime", getPaymentTime())
            .append("confirmTime", getConfirmTime())
            .toString();
    }
}
