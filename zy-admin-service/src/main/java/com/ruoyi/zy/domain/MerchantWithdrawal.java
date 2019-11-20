package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 提款记录对象 b_merchant_withdrawal
 * 
 * @author zy
 * @date 2019-11-20
 */
public class MerchantWithdrawal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 商户收款银行编号 */
    @Excel(name = "商户收款银行编号")
    private Long merchantBankId;

    /** 提现金额 */
    @Excel(name = "提现金额")
    private Double amount;

    /** 手续费 */
    @Excel(name = "手续费")
    private Double fee;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 支付凭证 */
    @Excel(name = "支付凭证")
    private String paymentUrl;

    /** 支付时间 */
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date paymentTime;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMerchantNo(String merchantNo) 
    {
        this.merchantNo = merchantNo;
    }

    public String getMerchantNo() 
    {
        return merchantNo;
    }
    public void setMerchantBankId(Long merchantBankId) 
    {
        this.merchantBankId = merchantBankId;
    }

    public Long getMerchantBankId() 
    {
        return merchantBankId;
    }
    public void setAmount(Double amount) 
    {
        this.amount = amount;
    }

    public Double getAmount() 
    {
        return amount;
    }
    public void setFee(Double fee) 
    {
        this.fee = fee;
    }

    public Double getFee() 
    {
        return fee;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
    public void setCreateUser(String createUser) 
    {
        this.createUser = createUser;
    }

    public String getCreateUser() 
    {
        return createUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("merchantNo", getMerchantNo())
            .append("merchantBankId", getMerchantBankId())
            .append("amount", getAmount())
            .append("fee", getFee())
            .append("status", getStatus())
            .append("paymentUrl", getPaymentUrl())
            .append("paymentTime", getPaymentTime())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .toString();
    }
}
