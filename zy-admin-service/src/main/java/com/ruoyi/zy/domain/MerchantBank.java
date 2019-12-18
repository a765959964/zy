package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商户银行卡对象 b_merchant_bank
 * 
 * @author zy
 * @date 2019-12-18
 */
public class MerchantBank extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 收款人 */
    @Excel(name = "收款人")
    private String accountName;

    /** 收款账户 */
    @Excel(name = "收款账户")
    private String accountNo;

    /** 收款银行 */
    @Excel(name = "收款银行")
    private String bankName;

    /** 收款支行地址 */
    @Excel(name = "收款支行地址")
    private String accountAddress;

    /** 删除标志 */
    @Excel(name = "删除标志")
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
    public void setMerchantNo(String merchantNo) 
    {
        this.merchantNo = merchantNo;
    }

    public String getMerchantNo() 
    {
        return merchantNo;
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
            .append("merchantNo", getMerchantNo())
            .append("accountName", getAccountName())
            .append("accountNo", getAccountNo())
            .append("bankName", getBankName())
            .append("accountAddress", getAccountAddress())
            .append("flag", getFlag())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .toString();
    }
}
