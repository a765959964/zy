package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户收款码表对象 b_user_qr_code
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
public class BUserQrCode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 收款二维码类型 */
    @Excel(name = "收款二维码类型")
    private String receiptType;

    /** 收款金额 */
    @Excel(name = "收款金额")
    private Long receiptAmount;

    /** 收款二维码金额 */
    @Excel(name = "收款二维码金额")
    private Double receiptQrcodeAmount;

    /** 收款二维码地址 */
    @Excel(name = "收款二维码地址")
    private String receiptQrcodeUrl;

    /** 匹配次数 */
    @Excel(name = "匹配次数")
    private Long matchTimes;

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
    public void setReceiptType(String receiptType) 
    {
        this.receiptType = receiptType;
    }

    public String getReceiptType() 
    {
        return receiptType;
    }
    public void setReceiptAmount(Long receiptAmount) 
    {
        this.receiptAmount = receiptAmount;
    }

    public Long getReceiptAmount() 
    {
        return receiptAmount;
    }
    public void setReceiptQrcodeAmount(Double receiptQrcodeAmount) 
    {
        this.receiptQrcodeAmount = receiptQrcodeAmount;
    }

    public Double getReceiptQrcodeAmount() 
    {
        return receiptQrcodeAmount;
    }
    public void setReceiptQrcodeUrl(String receiptQrcodeUrl) 
    {
        this.receiptQrcodeUrl = receiptQrcodeUrl;
    }

    public String getReceiptQrcodeUrl() 
    {
        return receiptQrcodeUrl;
    }
    public void setMatchTimes(Long matchTimes) 
    {
        this.matchTimes = matchTimes;
    }

    public Long getMatchTimes() 
    {
        return matchTimes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("receiptType", getReceiptType())
            .append("receiptAmount", getReceiptAmount())
            .append("receiptQrcodeAmount", getReceiptQrcodeAmount())
            .append("receiptQrcodeUrl", getReceiptQrcodeUrl())
            .append("matchTimes", getMatchTimes())
            .append("createTime", getCreateTime())
            .toString();
    }
}
