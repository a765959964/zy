package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 商户信息对象 b_merchant
 * 
 * @author zy
 * @date 2019-11-21
 */
public class BMerchant extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 商户名称 */
    @Excel(name = "商户名称")
    private String merchantName;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 商户秘钥 */
    @Excel(name = "商户秘钥")
    private String merchantSecret;

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
    public void setMerchantName(String merchantName) 
    {
        this.merchantName = merchantName;
    }

    public String getMerchantName() 
    {
        return merchantName;
    }
    public void setMerchantNo(String merchantNo) 
    {
        this.merchantNo = merchantNo;
    }

    public String getMerchantNo() 
    {
        return merchantNo;
    }
    public void setMerchantSecret(String merchantSecret) 
    {
        this.merchantSecret = merchantSecret;
    }

    public String getMerchantSecret()
    {
        return merchantSecret;
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
            .append("merchantName", getMerchantName())
            .append("merchantNo", getMerchantNo())
            .append("merchantSecret", getMerchantSecret())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .toString();
    }
}
