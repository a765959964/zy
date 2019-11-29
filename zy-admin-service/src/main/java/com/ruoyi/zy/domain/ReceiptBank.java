package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 银行收据对象 b_receipt_bank
 * 
 * @author zf
 * @date 2019-11-28
 */
public class ReceiptBank extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 银行编码 */
    @Excel(name = "银行编码")
    private String bankCode;

    /** 银行名称 */
    @Excel(name = "银行名称")
    private String bankName;

    /** 开户名 */
    @Excel(name = "开户名")
    private String accountName;

    /** 开户卡号 */
    @Excel(name = "开户卡号")
    private String accountNo;

    /** 开户地址 */
    @Excel(name = "开户地址")
    private String accountAddress;

    /** 存款金额 */
    @Excel(name = "存款金额")
    private Double amount;

    /** 是否开启使用 */
    @Excel(name = "是否开启使用")
    private String flag;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createUser;

    /** 修改人 */
    @Excel(name = "修改人")
    private String updateUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setBankCode(String bankCode) 
    {
        this.bankCode = bankCode;
    }

    public String getBankCode() 
    {
        return bankCode;
    }
    public void setBankName(String bankName) 
    {
        this.bankName = bankName;
    }

    public String getBankName() 
    {
        return bankName;
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
    public void setAccountAddress(String accountAddress) 
    {
        this.accountAddress = accountAddress;
    }

    public String getAccountAddress() 
    {
        return accountAddress;
    }
    public void setAmount(Double amount) 
    {
        this.amount = amount;
    }

    public Double getAmount() 
    {
        return amount;
    }
    public void setFlag(String flag) 
    {
        this.flag = flag;
    }

    public String getFlag() 
    {
        return flag;
    }
    public void setCreateUser(String createUser) 
    {
        this.createUser = createUser;
    }

    public String getCreateUser() 
    {
        return createUser;
    }
    public void setUpdateUser(String updateUser) 
    {
        this.updateUser = updateUser;
    }

    public String getUpdateUser() 
    {
        return updateUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("bankCode", getBankCode())
            .append("bankName", getBankName())
            .append("accountName", getAccountName())
            .append("accountNo", getAccountNo())
            .append("accountAddress", getAccountAddress())
            .append("amount", getAmount())
            .append("flag", getFlag())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .toString();
    }
}
