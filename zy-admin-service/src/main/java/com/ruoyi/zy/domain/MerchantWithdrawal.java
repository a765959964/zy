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
 * @date 2020-02-04
 */
public class MerchantWithdrawal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 提现金额 */
    @Excel(name = "提现金额")
    private Double amount;

    /** 手续费 */
    @Excel(name = "手续费")
    private Double fee;

    /** 收款人 */
    @Excel(name = "收款人")
    private String accountName;

    /** 收款账号 */
    @Excel(name = "收款账号")
    private String accountNo;

    /** 收款银行 */
    @Excel(name = "收款银行")
    private String bankName;

    /** 收款支行地址 */
    @Excel(name = "收款支行地址")
    private String accountAddress;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 支付时间 */
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date paymentTime;

    /** 创建人 */
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
    public void setAccountName(String accountName) 
    {
        this.accountName = accountName;
    }

    public String getAccountName() 
    {
        return accountName;
    }
    public void setAccountNo(String accountNo) 
    {
        this.accountNo = accountNo;
    }

    public String getAccountNo() 
    {
        return accountNo;
    }
    public void setBankName(String bankName) 
    {
        this.bankName = bankName;
    }

    public String getBankName() 
    {
        return bankName;
    }
    public void setAccountAddress(String accountAddress) 
    {
        this.accountAddress = accountAddress;
    }

    public String getAccountAddress() 
    {
        return accountAddress;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("amount", getAmount())
            .append("fee", getFee())
            .append("accountName", getAccountName())
            .append("accountNo", getAccountNo())
            .append("bankName", getBankName())
            .append("accountAddress", getAccountAddress())
            .append("status", getStatus())
            .append("paymentTime", getPaymentTime())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .toString();
    }
}
